import { DatePicker } from "@/components/date-picker";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Label } from "@/components/ui/label";
import { Button } from "@/components/ui/button";
import { useGetProductionReportMutation } from "@/lib/services/farms-api";
import { format } from "date-fns";
import { Loader } from "lucide-react";
import { useState } from "react";
import MonthlyReportTable from "./MonthlyReportTable";
import { FarmSummaryTable } from "./FarmSummaryTable"
interface ProductionRepHeaderProps {
    farmId: string;
    farmName?: string;
  }

export interface ProductionSummary {
  total_prod_carton: number;
  total_prod_tray: number;
  total_out_carton: number;
  total_out_tray: number;
  total_death: number;
  total_incom_feed: number;
  total_intak_feed: number;
  total_remain_feed: number;
  days_count: number;
  remaining_hens: number;
}
export interface ProductionReport {
  farmId: string;
  period: {
    start_date: string;
    end_date: string;
  };
  report: ProductionSummary[];
}
export default function ProductionRepHeader({farmId, farmName}:ProductionRepHeaderProps){
    const [startDate, setStartDate] = useState<Date>(() => {
        const date = new Date();
        date.setMonth(date.getMonth() - 1);
        return date;
      });
  const [endDate, setEndDate] = useState<Date>(new Date());
  const [reportType, setReportType] = useState<'monthly'|'daily'>('monthly')
  const [getSummaryReport, { data: summaryData, isLoading: summaryLoading }] =
  useGetProductionReportMutation();

  var isLoading = summaryLoading
 
  const handleGenerateReport = async () => {
    if (!startDate || !endDate) {
      alert("يرجى تحديد تاريخ البداية والنهاية");
      return;
    }
console.log(summaryData);
    const startDateStr = format(startDate, 'yyyy-MM-dd');
    const endDateStr = format(endDate, 'yyyy-MM-dd');

    if (reportType === 'monthly') {
      await getSummaryReport({
       farmId: farmId !=='all'?farmId:undefined,
        start_date: startDateStr,
        end_date: endDateStr
      });
    } else {
      console.log('there is nothing to fetch')
    }
}

    return(
        <Card className="w-full !important " dir="rtl">
        <CardHeader>
          <CardTitle className="text-right">
            تقرير العلف والانتاج - {farmName}
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {/* Controls */}
            <div className="flex flex-wrap gap-4 items-end justify-center">
              <div className="flex flex-col space-y-2">
                <Label htmlFor="report-type">نوع التقرير</Label>
                <select
                  id="report-type"
                  value={reportType}
                  onChange={(e) => setReportType(e.target.value as 'monthly' | 'daily')}
                  className="border rounded-md px-3 py-2"
                >
                  <option value="monthly">اجمالي</option>
                  <option value="daily">تحليلي</option>
                </select>
              </div>
  
              <div className="flex flex-col space-y-2">
                <Label>تاريخ البداية</Label>
                <DatePicker
                  date={startDate}
                  onSelect={(newDate) => newDate && setStartDate(newDate)}
                  // placeholder prop removed because it does not exist on DatePickerProps
                />
              </div>
  
              <div className="flex flex-col space-y-2">
                <Label>تاريخ النهاية</Label>
                <DatePicker
                  date={endDate}
                  onSelect={(newDate) => newDate && setEndDate(newDate)}
                 
                />
              </div>
  
              <Button 
                onClick={handleGenerateReport}
                disabled={!startDate || !endDate || isLoading}
                className="bg-blue-600 hover:bg-blue-700"
              >
                {isLoading ? <Loader/>: "عرض التقرير"}
              </Button>
            </div>
  </div>
            {/* Report Summary */}
            {summaryData && (
             
              <div className="bg-gray-200 p-4 rounded-lg">
                <h3 className="font-semibold text-right mb-2">ملخص التقرير</h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-right">
                  <div>
                    <span className="font-medium">المزرعة:</span> {summaryData.farm_name}
                  </div>
                  <div className="text-xs">
                    <span className="font-xs">الفترة:</span>من 
                     {summaryData.period?.start_date} - الى {summaryData.period?.end_date}
                  </div>
                  <div className="text-sm">
                    <span className="font-medium">عدد السجلات:</span> {summaryData.report?.length || 0}
                  </div>
                </div>
              </div>
             
            )}
            
            
              {summaryData && summaryData.farm_summaries && (
                <div>
                <FarmSummaryTable summaryData={summaryData.farm_summaries} />
                </div>
              )
             
              }
          
  
          
            
            </CardContent>
        </Card>
  
    );
}