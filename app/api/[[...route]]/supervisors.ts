//import { createClient } from "@/utils/supabase/client";
import { createClient } from '@supabase/supabase-js'
import { Hono } from "hono";
import { Env } from "./route";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { Tables } from "@/constants/supabase-types";
import {getAuthenticatedSupabase} from '@/utils/supabase/supabase-auth-helper';


//const supabase = createClient();
type SuperVisors = Tables<"supervisors">;
const app = new Hono<Env>()
.get("/free_sup", async (c) => {
  try {
    const token = c.var.jwt;
      const schema = c.var.user?.user_metadata.schema??'public'; 
      const supabase = getAuthenticatedSupabase(token);
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
      const token = c.var.jwt;
      const schema = c.var.user?.user_metadata.schema??'public'; 
      const supabase = getAuthenticatedSupabase(token);
      
      const { data,error } = await supabase
        .schema(schema)
        .from("supervisors")
        .select(`name,phone_numbers,u_id,details,farms(
          farm_name,
          farm_supervisor)`)
        .returns<SuperVisors>();

      //console.log(data);
      return c.json({ supervisors: data });
    } catch (error: any) {
      console.log("error in get supervisors", error);
      return c.json({ error: "error in get supervisors " }, 400);
    }
  })
  .post(
    "/",
    zValidator("json", z.object({
        full_name: z.string(),
        phone: z.string(),
        email: z.string(),
        password: z.string(),
      })
    , (result, c) => {
      if (!result.success) {
        return c.text("Invalid Values!", 400);
      }
    }),
    async (c) => {
      
      const user = c.req.valid("json");
      const token = c.var.jwt;
      const schema = c.var.user?.user_metadata.schema??'public'; 
      const supabase = getAuthenticatedSupabase(token);
      try {
        // إنشاء مستخدم جديد باستخدام createUser
        const { data: authData, error: authError } = await supabase.auth.signUp({
          email: user.email,
          password: user.password,
          options: {
            data: {
              full_name: user.full_name,
              role: 'supervisor',
              schema: schema,
              user_schema: schema
            }
          }
        })

        if (authError) {
          console.log('authError', authError);
          throw authError;
        }

        // إضافة بيانات المشرف في جدول المشرفين
        const { error: dbError } = await supabase
          .schema(schema)
          .from('supervisors')
          .insert({
            name: user.full_name,
            phone_numbers: user.phone,
            details: 'غير مضاف لاي مزرعة',
            u_id: authData.user?.id,
          })

        if (dbError) {
          console.log('dbError', dbError);
          throw dbError;
        }

        return c.json({ success: true, user: authData.user });

      } catch (error: any) {
        console.log("error in post supervisor", error);
        return c.json({ 
          error: error.message || "error in post supervisors",
          details: error 
        }, 400);
      }
    }
  );

export default app;

//this function will convert the array of u_id into '(1,2)' this pattern to be used in supabase query result
function convertArrayToPattern(arr: any[]) {
  return `(${arr.join(',')})`;
}