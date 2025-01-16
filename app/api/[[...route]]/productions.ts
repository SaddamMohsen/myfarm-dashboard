import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import { Env } from "./route";
import { Farms } from "@/constants/types";

const supabase = createClient();

// تعريف نوع البيانات المتوقعة من الاستعلام
type ProductionRecord = {
  farm_id: number;
  farms: { farm_name: any; }[];
  prodCarton: number;
  prodTray: number;
  prodDate: string;
}

const app = new Hono<Env>()
  .get("/", async (c) => {
    try {
      const schema = c.var.user?.user_metadata.schema;
      const date = c.req.query('date');
      console.log('schema', schema);

      if (date) {
        const parsedDate = new Date(date);
        const month = parsedDate.getMonth() + 1;
        const year = parsedDate.getFullYear();
        
        const startDate = `${year}-${month.toString().padStart(2, '0')}-01`;
        const lastDay = new Date(year, month, 0).getDate();
        const endDate = `${year}-${month.toString().padStart(2, '0')}-${lastDay}`;

        const { data: productionData, error } = await supabase
          .schema(schema)
          .from('production')
          .select(`
            farm_id,
            farms!inner (
              farm_name
            ),
            prodCarton,
            prodTray,
            prodDate
          `)
          .gte('prodDate', startDate)
          .lte('prodDate', endDate)
          .then(({ data, error }: { data: ProductionRecord[] | null, error: any }) => {
            // console.log('data', data);
            // console.log('error', error);
            if (error) throw error;

            const aggregatedData = data?.reduce((acc: any, curr) => {
               
              const farmId = curr.farm_id;
              if (!acc[farmId]) {
                acc[farmId] = {
                  farm_id: farmId,
                  // @ts-ignore
                  farm_name: curr.farms.farm_name,
                  total_cartons: 0,
                  total_trays: 0,
                  month: month
                };
              }
              
              acc[farmId].total_cartons += curr.prodCarton || 0;
              acc[farmId].total_trays += curr.prodTray || 0;
              
              return acc;
            }, {});

            const finalResults = Object.values(aggregatedData).map((farm: any) => {
              const totalTrays = farm.total_trays;
              const extraCartons = Math.floor(totalTrays / 12);
              const remainingTrays = totalTrays % 12;

              return {
                farmName: farm.farm_name,
                farmId: farm.farm_id,
                amount: farm.total_cartons + extraCartons,
                trays: remainingTrays,
                month: farm.month
              };
            });
            console.log('finalResults', finalResults);

            return { data: finalResults, error: null };
          });

        if (error) {
          throw error;
        }

        return c.json({ productions: productionData });
      }

      const { data: farms } = await supabase
        .schema(schema)
        .from("farms")
        .select()
        .returns<Farms>();

      return c.json({ farms });
    } catch (error: any) {
      console.log('error in get productions', error);
      return c.json({ error: 'error in get productions' }, 400);
    }
  })
  .get("/feed", async (c) => {
    try {
      const schema = c.var.user?.user_metadata.schema;
      const date = c.req.query('date');
      
      if (date) {
        const parsedDate = new Date(date);
        const month = parsedDate.getMonth() + 1;
        const year = parsedDate.getFullYear();
        
        const startDate = `${year}-${month.toString().padStart(2, '0')}-01`;
        const lastDay = new Date(year, month, 0).getDate();
        const endDate = `${year}-${month.toString().padStart(2, '0')}-${lastDay}`;

        const { data: feedData, error } = await supabase
          .schema(schema)
          .from('production')
          .select(`
            farm_id,
            farms!inner (
              farm_name
            ),
            intak_feed,
            prodDate
          `)
          .gte('prodDate', startDate)
          .lte('prodDate', endDate)
          .then(({ data, error }) => {
            if (error) throw error;

            const aggregatedData = data?.reduce((acc: any, curr) => {
              const farmId = curr.farm_id;
              if (!acc[farmId]) {
                acc[farmId] = {
                  farm_id: farmId,
                  // @ts-ignore
                  farm_name: curr.farms.farm_name,
                  total_feed: 0,
                  month: month
                };
              }
              
              acc[farmId].total_feed += curr.intak_feed || 0;
              return acc;
            }, {});

            const finalResults = Object.values(aggregatedData).map((farm: any) => ({
              farmName: farm.farm_name,
              farmId: farm.farm_id,
              amount: farm.total_feed,
              month: farm.month
            }));

            return { data: finalResults, error: null };
          });

        if (error) {
          throw error;
        }
        console.log('feedData', feedData);

        return c.json({ feed_consumption: feedData });
      }

      return c.json({ error: 'Date is required' }, 400);
    } catch (error: any) {
      console.log('error in get feed consumption', error);
      return c.json({ error: 'error in get feed consumption' }, 400);
    }
  })
  .get("/summary", async (c) => {
    try {
      const schema = c.var.user?.user_metadata.schema;
      const date = c.req.query('date');
      
      if (date) {
        const parsedDate = new Date(date);
        const month = parsedDate.getMonth() + 1;
        const year = parsedDate.getFullYear();
        
        const startDate = `${year}-${month.toString().padStart(2, '0')}-01`;

        // أولاً نحصل على قائمة المزارع
        const { data: farms, error: farmsError } = await supabase
          .schema(schema)
          .from('farms')
          .select('id, farm_name');

        if (farmsError) throw farmsError;

        // نجمع التقارير لكل مزرعة
        const farmReports = await Promise.all(
          farms.map(async (farm) => {
            const { data, error } = await supabase
             
              .rpc('get_farm_month_report', {
                f_id: farm.id,
                rep_date: startDate
              });

            if (error) { console.log('error', error); throw error; }
            console.log('data',farm.id, data);
            // نستخدم أول سجل من التقرير لأنه يحتوي على أحدث البيانات
            const report = data.reduce((acc:any, curr:any) => {
              acc.death += curr.death || 0;
              acc.income_feed += curr.income_feed || 0;
              acc.intak_feed += curr.intak_feed || 0;
              acc.prod_egg[0] += curr.prod_egg[0] || 0;
              acc.prod_egg[1] += curr.prod_egg[1] || 0;
              acc.out_egg[0] += curr.out_egg[0] || 0;
              acc.out_egg[1] += curr.out_egg[1] || 0;
              acc.remain_egg = curr.remain_egg;
              acc.remain_feed = curr.remain_feed;
              return acc;
            }, {
              death: 0,
              income_feed: 0,
              intak_feed: 0,
              prod_egg: [0, 0],
              out_egg: [0, 0],
              remain_egg: [0, 0],
              remain_feed: 0
            });
            
           // console.log('report:',farm.id,report);
            return {
              farmName: farm.farm_name,
              eggProductionCarton: (report.prod_egg[1] || 0),
              eggProductionTray: report.prod_egg[0] || 0,
              remainingEggsCarton: report.remain_egg[1] || 0,
              remainingEggsTray: report.remain_egg[0] || 0,
              outEggsCarton: report.out_egg[1] || 0,
              outEggsTray: report.out_egg[0] || 0,
              incomFeed:report.income_feed||0,
              feedConsumption: report.intak_feed || 0,
              feedRemaining: report.remain_feed || 0
            };
          })
        );
       // console.log('farmReports', farmReports);
        return c.json({ summary: farmReports });
      }

      return c.json({ error: 'Date is required' }, 400);
    } catch (error: any) {
      console.log('error in get summary', error);
      return c.json({ error: 'error in get summary' }, 400);
    }
  });

export default app;