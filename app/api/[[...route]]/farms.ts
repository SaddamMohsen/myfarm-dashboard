import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import { Env } from "./route";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { Farms,farmSchema } from "@/constants/types";
import { getAuthenticatedSupabase } from "@/utils/supabase/supabase-auth-helper";
import { getSupabase, getUser } from "@/utils/supabase/auth.middleware";

//import { cookies } from "next/headers";

//const supabase = createClient();

const app = new Hono<Env>()
  .get("/", async (c) => {
    try{

    //const token = c.var.jwt;
          const {user,error} =await getUser(c);  
          const schema = user?.user_metadata.schema??'public';
          console.log('schema',schema);
          const supabase = getSupabase(c); // getAuthenticatedSupabase(token);
      const id = c.req.query('id');
    if(id){
    const {data}= await supabase
      .schema(schema)
      .from("farms")
      .select()
      .filter('id','eq',id)
      .returns<Farms>();
  
      return c.json({farm: data });
    }
    
    const {data}= await supabase
      .schema(schema)
      .from("farms")
      .select()
      .returns<Farms>();
    
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
     
    
      try {
        const {user,error} =await getUser(c);  
          const schema = user?.user_metadata.schema??'public';
        console.log('schema',schema);
        const supabase = getSupabase(c); 
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
