import { Hono } from "hono";
import { Env } from "./route";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { Tables } from "@/constants/supabase-types";
import {getSupabase, getUser} from '@/utils/supabase/auth.middleware';

//const supabase = createClient();
type SuperVisors = Tables<"supervisors">;
const app = new Hono<Env>()

.get("/free_sup", async (c) => {
  try {
    const {user,error:userError} =await getUser(c);  
      const schema = user?.user_metadata.schema??'public';
    console.log('schema',schema);
    const supabase = getSupabase(c); 
   //This will return all supervisors who assigned to a farms
    const { data,error } = await supabase
      .schema(schema)
      .from('supervisors')
      .select(`name,u_id,
         farms!inner(
         farm_supervisor)`).not('farms.farm_supervisor','is',null)
      .returns<SuperVisors[]>();
   if(error){
    return c.json({error:`error in get supervisor ${error}`},200);
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
    return c.json({ error: "error in  get free supervisors" }, 200);
  }
})
  .get("/", async (c) => {
    try {
      const {user,error:userError} =await getUser(c);  
      const schema = user?.user_metadata.schema??'public';
      console.log('schema',schema);
      const supabase = getSupabase(c);    //getAuthenticatedSupabase(token);
      
      const { data,error } = await supabase
        .schema(schema)
        .from("supervisors")
        .select(`name,phone_numbers,u_id,details,farms(
          farm_name,
          farm_supervisor)`)
        .returns<SuperVisors>();
     
        if(error){
          return c.json({error:`error in get supervisor ${error}`},200);
         }
      //console.log(data);
      return c.json({ supervisors: data });
    } catch (error: any) {
      console.log("error in get supervisors", error);
      return c.json({ error: "error in get supervisors " }, 400);
    }
  })
  .get("/:id", async (c) => {
    try {
      const id = c.req.param("id");
    
      const {user, error: userError} = await getUser(c);  
      const schema = user?.user_metadata.schema ?? 'public';
      
      const supabase = getSupabase(c);
      
      const { data, error } = await supabase
        .schema(schema)
        .from("supervisors")
        .select(`
          name,
          phone_numbers,
          u_id,
          details,
          farms(
            farm_name,
            farm_supervisor
          )
        `)
        .eq('u_id', id)
        .single();
     
      if (error) {
        console.log('error in get one supervisor',error);
        return c.json({
          error: `خطأ في جلب بيانات المشرف: ${error.message}`
        }, 200);
      }

      if (!data) {
        return c.json({
          error: "لم يتم العثور على المشرف"
        }, 404);
      }

      return c.json({ supervisor: data });
      
    } catch (error: any) {
      console.log("خطأ في جلب بيانات المشرف", error);
      return c.json({ 
        error: "خطأ في جلب بيانات المشرف",
        details: error.message 
      }, 400);
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
      const {user:loggedUser,error} =await getUser(c);  
          const schema = loggedUser?.user_metadata.schema??'public';
      const supabase = getSupabase(c); 
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
              user_schema: `${schema}_users`
            }
          }
        })

        if (authError) {
          console.log('authError', authError);
          throw authError;
        }
           // console.log('authData', authData);
            //console.log('user', user);
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
          return c.json({error:dbError.details},400);
          

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