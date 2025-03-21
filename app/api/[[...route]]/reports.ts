import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import { Env } from "./route";
import { zValidator } from "@hono/zod-validator";
import { z } from "zod";
import { getSupabase, getUser } from "@/utils/supabase/auth.middleware";
const supabase = createClient();

const app = new Hono<Env>()
  .get("/monthly/:id",zValidator("query",
          z.object({
              date: z.string(),
          })), async (c) => {
    try {
      const {user,error:userError} =await getUser(c);  
          const schema = user?.user_metadata.schema??'public';
           const supabase = getSupabase(c); 
      const farmId = c.req.param('id');
      const date = c.req.query('date');

      if (!date) {
        return c.json({ error: "التاريخ مطلوب" }, 400);
      }

      const parsedDate = new Date(date);
      const month = parsedDate.getMonth() + 1;
      const year = parsedDate.getFullYear();
      
      const {data,error} = await supabase.schema(schema).rpc('get_farm_month_report',{
        f_id:parseInt(farmId),
        rep_date:date
      });
      if (error) throw error;
      const {data:farmData,error:farmError} = await supabase
      .schema(schema).from('farms')
      .select('farm_name').eq('id',parseInt(farmId)).single();
      if(farmError) throw farmError;
      //   const { data, error } = await supabase
    //     .schema(schema)
    //     .from('production')
    //     .select(`
    //       prodDate,
    //       prodCarton,
    //       prodTray,
    //       outCarton,
    //       outTray,
    //       death,
    //       incom_feed,
    //       intak_feed,
    //       remain_feed,
    //       farms!inner (
    //         farm_name
    //       )
    //     `)
    //     .eq('farm_id', farmId)
    //     .gte('prodDate', `${year}-${month.toString().padStart(2, '0')}-01`)
    //     .lte('prodDate', `${year}-${month.toString().padStart(2, '0')}-31`)
    //     .order('prodDate', { ascending: true });

   
  //console.log('data',data);
  const report = data.map((item:any) => ({
    ...item,
    farm_name: farmData?.farm_name
  }));
  console.log('report',report);
      return c.json({ 
        farmId,
        month: `${year}-${month}`,
        report: [...report]
      });

    } catch (error: any) {
      console.error("خطأ في جلب التقرير الشهري:", error);
      return c.json({ error: error.message }, 400);
    }
  }).get("/daily/:id",zValidator("query",
    z.object({
        date: z.string(),
    })), async (c) => {
try {
const {user,error:userError} =await getUser(c);  
    const schema = user?.user_metadata.schema??'public';
     const supabase = getSupabase(c); 
const farmId = c.req.param('id');
const date = c.req.query('date');

if (!date) {
  return c.json({ error: "التاريخ مطلوب" }, 400);
}

const parsedDate = new Date(date);
const month = parsedDate.getMonth() + 1;
const year = parsedDate.getFullYear();

const {data,error} = await supabase.schema(schema).rpc('get_daily_report',{
  f_id:parseInt(farmId),
  amb_id:0,
  rep_date:date
});
if (error) throw error;
const {data:farmData,error:farmError} = await supabase
.schema(schema).from('farms')
.select('farm_name').eq('id',parseInt(farmId)).single();
if(farmError) throw farmError; const report = data.map((item:any) => ({
  ...item,
  farm_name: farmData?.farm_name
}));
console.log('daily report',report);
    return c.json({ 
      farmId,
      month: `${year}-${month}`,
      report: [...report]
    });

  } catch (error: any) {
    console.error("خطأ في جلب التقرير الشهري:", error);
    return c.json({ error: error.message }, 400);
  }
});

export default app;
[{
    prod_date: '2025-01-14',
    death: 5,
    income_feed: 30,
    intak_feed: 22,
    remain_feed: 14,
    prod_egg: [ 5, 15 ],
    out_egg: [ 0, 110 ],
    remain_egg: [ 7, 36 ],
    farm_name: 'farm_name'
}]