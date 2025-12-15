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

    // Calculate summary statistics for each farm
    const farmSummaries = data.reduce((acc: any, item: any) => {
      const farmId = item.farm_id;
      const farmName = item.farms?.farm_name || 'Unknown Farm';
      
      if (!acc[farmId]) {
        acc[farmId] = {
          farm_id: farmId,
          farm_name: farmName,
          total_prod_carton: 0,
          total_prod_tray: 0,
          total_out_carton: 0,
          total_out_tray: 0,
          total_death: 0,
          total_incom_feed: 0,
          total_intak_feed: 0,
          total_remain_feed: 0,
          days_count: 0
        };
      }
      
      acc[farmId].total_prod_carton += (item.prodCarton || 0);
      acc[farmId].total_prod_tray += (item.prodTray || 0);
      acc[farmId].total_out_carton += (item.outCarton || 0);
      acc[farmId].total_out_tray += (item.outTray || 0);
      acc[farmId].total_death += (item.death || 0);
      acc[farmId].total_incom_feed += (item.incom_feed || 0);
      acc[farmId].total_intak_feed += (item.intak_feed || 0);
      acc[farmId].total_remain_feed += (item.remain_feed || 0);
      acc[farmId].days_count += 1;
      
      return acc;
    }, {});

    // Convert tray to carton for each farm
    const processedFarmSummaries = Object.values(farmSummaries).map((farmSummary: any) => {
      const trayCount = farmSummary.total_prod_tray;
      const cartonFromTray = Math.floor(trayCount / 12);
      const remainderTray = trayCount % 12;
      
      return {
        ...farmSummary,
        total_prod_carton: farmSummary.total_prod_carton + cartonFromTray,
        total_prod_tray: remainderTray
      };
    });

    // Get remaining hens count for each farm
    const farmSummariesWithHens = await Promise.all(
      processedFarmSummaries.map(async (farmSummary: any) => {
        let remainingHens = 0;
        try {
          const { data: inventoryData, error: inventoryError } = await supabase
            .schema(schema)
            .from('inventory')
            .select('quantity')
            .eq('item_code', '001-001')
            .eq('farm_id', farmSummary.farm_id)
            //.single();
          // console.log(inventoryData);
          if (!inventoryError && inventoryData) {
            if (Array.isArray(inventoryData) && inventoryData.length > 0) {
              remainingHens = inventoryData.reduce(
                (acc: number, item: any) => acc + Number(item.quantity), 0
              );
            }
          }
        } catch (error) {
          console.log(`No inventory data found for farm ${farmSummary.farm_id}:`, error);
          remainingHens = 0;
        }
       
        return {
          ...farmSummary,
          remaining_hens: remainingHens
        };
      })
    );

    // Calculate overall totals
    const overallSummary = farmSummariesWithHens.reduce((acc: any, farmSummary: any) => {
      return {
        total_prod_carton: (acc.total_prod_carton || 0) + farmSummary.total_prod_carton,
        total_prod_tray: (acc.total_prod_tray || 0) + farmSummary.total_prod_tray,
        total_out_carton: (acc.total_out_carton || 0) + farmSummary.total_out_carton,
        total_out_tray: (acc.total_out_tray || 0) + farmSummary.total_out_tray,
        total_death: (acc.total_death || 0) + farmSummary.total_death,
        total_incom_feed: (acc.total_incom_feed || 0) + farmSummary.total_incom_feed,
        total_intak_feed: (acc.total_intak_feed || 0) + farmSummary.total_intak_feed,
        total_remain_feed: (acc.total_remain_feed || 0) + farmSummary.total_remain_feed,
        total_remaining_hens: (acc.total_remaining_hens || 0) + farmSummary.remaining_hens,
        days_count: (acc.days_count || 0) + farmSummary.days_count
      };
    }, {});

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
      farm_summaries: farmSummariesWithHens,
      overall_summary: overallSummary,
      report: [...report]
    });

  } catch (error: any) {
    console.error("خطأ في جلب تقرير الإنتاج:", error);
    return c.json({ error: error.message }, 400);
  }
}).get("/production-by-amber/:id", zValidator("query",
  z.object({
    start_date: z.string(),
    end_date: z.string(),
  }),
  (result, c) => {
    if (!result.success) {
      console.log("invalid values", result.error);
      return c.text("Invalid Values!", 400);
    }
  }), async (c) => {
  try {
    const { user } = await getUser(c);
    const schema = user?.user_metadata.schema ?? 'public';
    const supabase = getSupabase(c);
    const farmId = c.req.param('id');
    const startDate = c.req.query('start_date');
    const endDate = c.req.query('end_date');

    if (!farmId) {
      return c.json({ error: "معرف المزرعة مطلوب" }, 400);
    }

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

    // Get production data for the farm
    const { data, error } = await supabase
      .schema(schema)
      .from('production')
      .select(`
        *,
        farms!inner (
          farm_name
        )
      `)
      .eq('farm_id', parseInt(farmId))
      .gte('prodDate', startDate)
      .lte('prodDate', endDate)
      .order('amber_id', { ascending: true })
      .order('prodDate', { ascending: true });

    if (error) throw error;

    // Get farm name
    const { data: farmData, error: farmError } = await supabase
      .schema(schema)
      .from('farms')
      .select('farm_name')
      .eq('id', parseInt(farmId))
      .single();

    if (farmError) throw farmError;

    // Group data by amber_id
    const amberSummaries = data.reduce((acc: any, item: any) => {
      const amberId = item.amber_id || 0;

      if (!acc[amberId]) {
        acc[amberId] = {
          amber_id: amberId,
          total_prod_carton: 0,
          total_prod_tray: 0,
          total_out_carton: 0,
          total_out_tray: 0,
          total_death: 0,
          total_incom_feed: 0,
          total_intak_feed: 0,
          total_remain_feed: 0,
          days_count: 0,
          records: []
        };
      }

      acc[amberId].total_prod_carton += (item.prodCarton || 0);
      acc[amberId].total_prod_tray += (item.prodTray || 0);
      acc[amberId].total_out_carton += (item.outCarton || 0);
      acc[amberId].total_out_tray += (item.outTray || 0);
      acc[amberId].total_death += (item.death || 0);
      acc[amberId].total_incom_feed += (item.incom_feed || 0);
      acc[amberId].total_intak_feed += (item.intak_feed || 0);
      acc[amberId].total_remain_feed += (item.remain_feed || 0);
      acc[amberId].days_count += 1;
      acc[amberId].records.push(item);

      return acc;
    }, {});

    // Convert tray to carton for each amber
    const processedAmberSummaries = Object.values(amberSummaries).map((amberSummary: any) => {
      const trayCount = amberSummary.total_prod_tray;
      const cartonFromTray = Math.floor(trayCount / 12);
      const remainderTray = trayCount % 12;

      return {
        ...amberSummary,
        total_prod_carton: amberSummary.total_prod_carton + cartonFromTray,
        total_prod_tray: remainderTray
      };
    });

    // Get remaining hens count for each amber
    const amberSummariesWithHens = await Promise.all(
      processedAmberSummaries.map(async (amberSummary: any) => {
        let remainingHens = 0;
        try {
          const { data: inventoryData, error: inventoryError } = await supabase
            .schema(schema)
            .from('inventory')
            .select('quantity')
            .eq('item_code', '001-001')
            .eq('farm_id', parseInt(farmId))
            .eq('amber_id', amberSummary.amber_id);

          if (!inventoryError && inventoryData) {
            if (Array.isArray(inventoryData) && inventoryData.length > 0) {
              remainingHens = inventoryData.reduce(
                (acc: number, item: any) => acc + Number(item.quantity), 0
              );
            }
          }
        } catch (error) {
          console.log(`No inventory data found for amber ${amberSummary.amber_id}:`, error);
          remainingHens = 0;
        }

        // Remove the records array to keep response size small
        const { records, ...summaryWithoutRecords } = amberSummary;
        return {
          ...summaryWithoutRecords,
          remaining_hens: remainingHens
        };
      })
    );

    // Sort by amber_id
    amberSummariesWithHens.sort((a: any, b: any) => a.amber_id - b.amber_id);

    // Calculate overall totals
    const overallSummary = amberSummariesWithHens.reduce((acc: any, amberSummary: any) => {
      return {
        total_prod_carton: (acc.total_prod_carton || 0) + amberSummary.total_prod_carton,
        total_prod_tray: (acc.total_prod_tray || 0) + amberSummary.total_prod_tray,
        total_out_carton: (acc.total_out_carton || 0) + amberSummary.total_out_carton,
        total_out_tray: (acc.total_out_tray || 0) + amberSummary.total_out_tray,
        total_death: (acc.total_death || 0) + amberSummary.total_death,
        total_incom_feed: (acc.total_incom_feed || 0) + amberSummary.total_incom_feed,
        total_intak_feed: (acc.total_intak_feed || 0) + amberSummary.total_intak_feed,
        total_remain_feed: (acc.total_remain_feed || 0) + amberSummary.total_remain_feed,
        total_remaining_hens: (acc.total_remaining_hens || 0) + amberSummary.remaining_hens,
        days_count: (acc.days_count || 0) + amberSummary.days_count
      };
    }, {});

    return c.json({
      farmId,
      farm_name: farmData?.farm_name,
      period: {
        start_date: startDate,
        end_date: endDate
      },
      amber_summaries: amberSummariesWithHens,
      overall_summary: overallSummary
    });

  } catch (error: any) {
    console.error("خطأ في جلب تقرير الإنتاج حسب العنبر:", error);
    return c.json({ error: error.message }, 400);
  }
}).get("/inventory/:id?", zValidator("query",
  z.object({
    item_code: z.string().optional(),
    amber_id: z.string().optional(),
    farm_id: z.string().optional(),
  }),
  (result, c) => {
    console.log(result.data);
    if (!result.success) {
      console.log("invalid values", result.error);
      return c.text("Invalid Values!", 400);
    }
  }
), async (c) => {
  try {
    const { user } = await getUser(c);
    const schema = user?.user_metadata.schema ?? 'public';
    const supabase = getSupabase(c);

    const pathFarmId = c.req.param('id');
    const queryFarmId = c.req.query('farm_id');
    const itemCode = c.req.query('item_code') || undefined;
    const amberIdStr = c.req.query('amber_id') || undefined;

    const targetFarmId = queryFarmId || pathFarmId;

    let query = supabase
      .schema(schema)
      .from('inventory')
      .select(`
        *,
        
        items!inner (
          item_name
        ),
        farms!inner (
          farm_name
        )
      `)
      .order('updated_at', { ascending: false });

    if (targetFarmId) {
      query = query.eq('farm_id', parseInt(targetFarmId));
    }
    if (itemCode) {
      query = query.eq('item_code', itemCode);
    }
    if (amberIdStr) {
      const amberId = parseInt(amberIdStr);
      if (!Number.isNaN(amberId)) {
        query = query.eq('amber_id', amberId);
      }
    }

    const { data, error } = await query;
    if (error) throw error;

    // Per-farm aggregation by item_name
    const farmSummariesMap: Record<string, any> = {};
    const overallItemsMap: Record<
      string,
      { item_name: string; total_quantity: number; total_small_quantity: number; records_count: number }
    > = {};

    for (const item of (data || [])) {
      const fId = item.farm_id;
      const fName = item.farms?.farm_name || 'Unknown Farm';
      const name = (item.items && item.items.item_name) ? item.items.item_name : item.item_code;

      if (!farmSummariesMap[fId]) {
        farmSummariesMap[fId] = {
          farm_id: fId,
          farm_name: fName,
          items: {} as Record<string, { item_name: string; total_quantity: number; total_small_quantity: number; records_count: number }>,
        };
      }
      if (!farmSummariesMap[fId].items[name]) {
        farmSummariesMap[fId].items[name] = { item_name: name, total_quantity: 0, total_small_quantity: 0, records_count: 0 };
      }
      farmSummariesMap[fId].items[name].total_quantity += Number(item.quantity || 0);
      farmSummariesMap[fId].items[name].total_small_quantity += Number(item.small_quantity || 0);
      farmSummariesMap[fId].items[name].records_count += 1;

      if (!overallItemsMap[name]) {
        overallItemsMap[name] = { item_name: name, total_quantity: 0, total_small_quantity: 0, records_count: 0 };
      }
      overallItemsMap[name].total_quantity += Number(item.quantity || 0);
      overallItemsMap[name].total_small_quantity += Number(item.small_quantity || 0);
      overallItemsMap[name].records_count += 1;
    }

    const farm_summaries = Object.values(farmSummariesMap).map((s: any) => ({
      farm_id: s.farm_id,
      farm_name: s.farm_name,
      items: Object.values(s.items),
    }));

    const overall_summary = {
      items: Object.values(overallItemsMap),
    };

    const report = (data || []).map((item: any) => ({
      ...item,
      farm_name: item.farms?.farm_name,
    }));

    return c.json({
      farmId: targetFarmId || 'all',
      filters: {
        item_code: itemCode ?? null,
        amber_id: amberIdStr ? parseInt(amberIdStr) : null,
      },
      farm_summaries,
      overall_summary,
      report,
    });
  } catch (error: any) {
    console.error("خطأ في جلب تقرير المخزون:", error);
    return c.json({ error: error.message }, 400);
  }
}).get("/items", async (c) => {
  try {
    const { user } = await getUser(c);
    const schema = user?.user_metadata.schema ?? 'public';
    const supabase = getSupabase(c);

    const {data, error} = await supabase
      .schema(schema)
      .from('items')
      .select(`
        *
      `)
      if (error) throw error;
      
      const report = (data || []).map((item: any) => ({
        ...item}));
       
      return c.json(report)
      
  }catch (error: any) {
    console.error("خطأ في جلب بيانات الاصناف:", error);
    return c.json({ error: error.message }, 400);
  }
});

export default app;