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
}).get("/medication/:id", zValidator("query",
  z.object({
    start_date: z.string(),
    end_date: z.string(),
  })), async (c) => {
  try {
    const {user, error:userError} = await getUser(c);  
    const schema = user?.user_metadata.schema ?? 'public';
    const supabase = getSupabase(c); 
    const farmId = c.req.param('id');
    const startDate = c.req.query('start_date');
    const endDate = c.req.query('end_date');

    if (!startDate || !endDate) {
      return c.json({ error: "تاريخ البداية والنهاية مطلوبان" }, 400);
    }

    // Validate dates
    const startParsed = new Date(startDate);
    const endParsed = new Date(endDate);
    
    if (isNaN(startParsed.getTime()) || isNaN(endParsed.getTime())) {
      return c.json({ error: "تنسيق التاريخ غير صحيح" }, 400);
    }

    if (startParsed > endParsed) {
      return c.json({ error: "تاريخ البداية يجب أن يكون قبل تاريخ النهاية" }, 400);
    }

    // Get medication data for the specified period
    const { data, error } = await supabase
      .schema(schema)
      .from('medication')
      .select(`
        *,
        farms!inner (
          farm_name
        )
      `)
      .eq('farm_id', parseInt(farmId))
      .eq('medication_type', 'medication')
      .gte('medication_date', startDate)
      .lte('medication_date', endDate)
      .order('medication_date', { ascending: true });

    if (error) throw error;

    // Get farm data
    const { data: farmData, error: farmError } = await supabase
      .schema(schema)
      .from('farms')
      .select('farm_name')
      .eq('id', parseInt(farmId))
      .single();

    if (farmError) throw farmError;

    // Format the report
    const report = data.map((item: any) => ({
      ...item,
      farm_name: farmData?.farm_name
    }));

    console.log('medication report', report);

    return c.json({ 
      farmId,
      period: {
        start_date: startDate,
        end_date: endDate
      },
      report: [...report]
    });

  } catch (error: any) {
    console.error("خطأ في جلب تقرير الأدوية:", error);
    return c.json({ error: error.message }, 400);
  }
}).get("/vaccination/:id", zValidator("query",
  z.object({
    start_date: z.string(),
    end_date: z.string(),
  })), async (c) => {
  try {
    const {user, error:userError} = await getUser(c);  
    const schema = user?.user_metadata.schema ?? 'public';
    const supabase = getSupabase(c); 
    const farmId = c.req.param('id');
    const startDate = c.req.query('start_date');
    const endDate = c.req.query('end_date');

    if (!startDate || !endDate) {
      return c.json({ error: "تاريخ البداية والنهاية مطلوبان" }, 400);
    }

    // Validate dates
    const startParsed = new Date(startDate);
    const endParsed = new Date(endDate);
    
    if (isNaN(startParsed.getTime()) || isNaN(endParsed.getTime())) {
      return c.json({ error: "تنسيق التاريخ غير صحيح" }, 400);
    }

    if (startParsed > endParsed) {
      return c.json({ error: "تاريخ البداية يجب أن يكون قبل تاريخ النهاية" }, 400);
    }

    // Get medication data for the specified period
    const { data, error } = await supabase
      .schema(schema)
      .from('medication')
      .select(`
        *
      `)
      .eq('farm_id', parseInt(farmId))
      .eq('medication_type', 'vaccination')
      .gte('medication_date', startDate)
      .lte('medication_date', endDate)
      .order('medication_date', { ascending: true });

    if (error) throw error;

    // Get farm data
    const { data: farmData, error: farmError } = await supabase
      .schema(schema)
      .from('farms')
      .select('farm_name')
      .eq('id', parseInt(farmId))
      .single();

    if (farmError) throw farmError;

    // Format the report
    const report = data.map((item: any) => ({
      ...item,
      farm_name: farmData?.farm_name
    }));

    console.log('vaccination report', report);

    return c.json({ 
      farmId,
      period: {
        start_date: startDate,
        end_date: endDate
      },
      report: [...report]
    });

  } catch (error: any) {
    console.error("خطأ في جلب تقرير الأدوية:", error);
    return c.json({ error: error.message }, 400);
  }
}).get("/production/:id?", zValidator("query",
  z.object({
    start_date: z.string(),
    end_date: z.string(),
    farm_id: z.string().optional()}),
    (result, c) => {
      console.log(result.data);
      if (!result.success) {
        console.log("invalid values",result.error);
        return c.text("Invalid Values!", 400);
      }
  }), async (c) => {
  try {
    console.log(`in get prod repo ${c.req.param('id')}`)
    const {user, error:userError} = await getUser(c);  
    const schema = user?.user_metadata.schema ?? 'public';
    const supabase = getSupabase(c); 
    const farmId = c.req.param('id');
    const startDate = c.req.query('start_date');
    const endDate = c.req.query('end_date');
    const queryFarmId = c.req.query('farm_id');

    if (!startDate || !endDate) {
      return c.json({ error: "تاريخ البداية والنهاية مطلوبان" }, 400);
    }

    // Validate dates
    const startParsed = new Date(startDate);
    const endParsed = new Date(endDate);
    
    if (isNaN(startParsed.getTime()) || isNaN(endParsed.getTime())) {
      return c.json({ error: "تنسيق التاريخ غير صحيح" }, 400);
    }

    if (startParsed > endParsed) {
      return c.json({ error: "تاريخ البداية يجب أن يكون قبل تاريخ النهاية" }, 400);
    }

    // Determine which farm ID to use
    const targetFarmId = queryFarmId || farmId;

    // Build the query
    let query = supabase
      .schema(schema)
      .from('production')
      .select(`
        *,
        farms!inner (
          farm_name
        )
      `)
      .gte('prodDate', startDate)
      .eq('amber_id',2)
      .lte('prodDate', endDate)
      .order('prodDate', { ascending: true });

    // Add farm filter if farm ID is provided
    if (targetFarmId) {
      query = query.eq('farm_id', parseInt(targetFarmId));
    }

    const { data, error } = await query;

    if (error) throw error;

    // Calculate summary statistics
    const summary = data.reduce((acc: any, item: any) => {
   
      return {
        total_prod_carton: (acc.total_prod_carton || 0) + (item.prodCarton || 0),
        total_prod_tray: (acc.total_prod_tray || 0) + (item.prodTray||0),
        total_out_carton: (acc.total_out_carton || 0) + (item.outCarton || 0),
        total_out_tray: (acc.total_out_tray || 0) + (item.outTray || 0),
        total_death: (acc.total_death || 0) + (item.death || 0),
        total_incom_feed: (acc.total_incom_feed || 0) + (item.incom_feed || 0),
        total_intak_feed: (acc.total_intak_feed || 0) + (item.intak_feed || 0),
        total_remain_feed: (acc.total_remain_feed || 0) + (item.remain_feed || 0),
        days_count: (acc.days_count || 0) + 1
      };
    }, {});
// Get remaining hens count from inventory
let remainingHens = 0;
try {
  let invQuery=supabase
  .schema(schema)
  .from('inventory')
  .select('quantity')
  .eq('item_code', '001-001')
  if (targetFarmId) {
    invQuery = query.eq('farm_id', parseInt(targetFarmId));
  }


  const { data: inventoryData, error: inventoryError } = await invQuery
   
  


  if (!inventoryError && Array.isArray(inventoryData)) {
    remainingHens = inventoryData.reduce((acc: number, item: { quantity: any }) => {
      return acc + (Number(item.quantity) || 0);
    }, 0);
  }
} catch (error) {
  console.log('No inventory data found for hens or error occurred:', error);
  remainingHens = 0;
}
    //Get the Carton from tray
    const trayCount = summary.total_prod_tray;
      const cartonFromTray = Math.floor(trayCount / 12);
      const remainderTray = trayCount % 12;
     const newSummary ={
      ...summary,
      total_prod_carton:summary.total_prod_carton+cartonFromTray,
      total_prod_tray:remainderTray,
      remaining_hens:remainingHens
      }
 

    // Format the report
    const report = data.map((item: any) => ({
      ...item,
      farm_name: item.farms?.farm_name
    }));
    return c.json({ 
      farmId: targetFarmId || 'all',
      period: {
        start_date: startDate,
        end_date: endDate
      },
      newSummary,
      report: [...report]
    });

  } catch (error: any) {
    console.error("خطأ في جلب تقرير الإنتاج:", error);
    return c.json({ error: error.message }, 400);
  }
});

export default app;