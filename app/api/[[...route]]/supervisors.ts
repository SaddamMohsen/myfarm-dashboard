import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import { Env } from "./route";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { Tables } from "@/constants/supabase-types";
import { superVisorSchema } from "@/constants/types";
//import { cookies } from "next/headers";

const supabase = createClient();
type SuperVisors = Tables<"supervisors">;
const app = new Hono<Env>()
.get("/free_sup", async (c) => {
  try {
    const schema = c.var.user?.user_metadata.schema??'public';
    console.log('schema',schema);
   //This will return all supervisors who assigned to a farms
    const { data,error } = await supabase
      .schema(schema)
      .from('supervisors')
      .select(`name,u_id,
         farms!inner(
         farm_supervisor)`).not('farms.farm_supervisor','is',null)
      .returns<SuperVisors[]>();
   if(error){
    return c.json({error},400);
   }
      //get the u_id from the last query result
let supervisorsArr=data?.map((item)=>item.u_id)

//get the supervisors who are not assigned to any farm
   const {data:free_sub,error:free_err}=await supabase
   .schema(schema)
   .from('supervisors').select().not('u_id','in',convertArrayToPattern(supervisorsArr??[]));

    return c.json({ supervisors: free_sub });
  } catch (error: any) {
    console.log("error in get free supervisors", error);
    return c.json({ error: "error in  get free supervisors" }, 400);
  }
})
  .get("/", async (c) => {
    try {
      const schema = c.var.user?.user_metadata.schema??'public';
       
      
      //const { data: farms, error }: { data: any; error: any } =
      const { data,error } = await supabase
        .schema(schema)
        .from("supervisors")
        .select(`name,phone_numbers,u_id,details,farms(
          farm_name,
          farm_supervisor)`)
        .returns<SuperVisors>();
console.log('data from supervisor',data,error);
      //console.log(data);
      return c.json({ supervisors: data });
    } catch (error: any) {
      console.log("error in get supervisors", error);
      return c.json({ error: "error in get supervisors" }, 400);
    }
  })
  .post(
    "/",
    zValidator("json", superVisorSchema, (result, c) => {
      if (!result.success) {
        console.log("invalid");
        return c.text("Invalid Values!", 400);
      }
    }),
    async (c) => {
      const schema = c.var.user?.user_metadata.schema;
      console.log("in post supervisors");
      const supervisor = c.req.valid("json");
      try {
        await supabase.schema(schema).from("supervisors").insert(supervisor);
        console.log("supervisor in post", supervisor);
        return c.json({ success: "success" });
      } catch (error: any) {
        console.log("error in post supervisor", error);
        return c.json({ error: "error in post supervisors" }, 400);
      }
    }
  );

export default app;

//this function will convert the array of u_id into '(1,2)' this pattern to be used in supabase query result
function convertArrayToPattern(arr: any[]) {
  return `(${arr.join(',')})`;
}