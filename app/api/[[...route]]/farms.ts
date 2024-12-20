import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import { Env } from "./route";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { Farms,farmSchema } from "@/constants/types";

//import { cookies } from "next/headers";

const supabase = createClient();

const app = new Hono<Env>()
  .get("/", async (c) => {
    try{
    const schema = c.var.user?.user_metadata.schema;

    //const { data: farms, error }: { data: any; error: any } =
    const {data}= await supabase
      .schema(schema)
      .from("farms")
      .select()
      .returns<Farms>();
    
    //console.log(data);
    return c.json({farms: data });
    }catch(error:any){
      console.log('error in get farms',error);
      return c.json({error:'error in get farms'},400);
    }
  })
  .post(
    "/",
    zValidator("json", farmSchema, (result, c) => {
      if (!result.success) {
        console.log("invalid values",result.error);
        return c.text("Invalid Values!", 400);
      }
    }),
    async (c) => {
      const schema = c.var.user?.user_metadata.schema;
    
      try {
        const farm = c.req.valid("json");
        console.log("in post farm",farm);
       const res =await supabase.schema(schema).from("farms").insert(farm).returns();
       console.log('response from insert farm',res);
        return c.json({ farms: "success" });
      } catch (error:any) {
        console.log("error in post farm", error);
        return c.json({ error: "error in post farm" }, 400);
        
      }
    }
  );

export default app;
