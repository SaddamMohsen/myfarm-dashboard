import React, { useState, useEffect } from 'react';
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Card, CardContent, CardTitle } from '@/components/ui/card';
import { useFetchAllFarmsQuery, useGetMonthlyReportMutation } from "@/lib/services/farms-api";
import MonthlyReportTable from './MonthlyReportTable';
import MedicationVaccinationTable from './MedicationVaccinationTable';
import { DatePicker } from '@/components/date-picker';

interface ReportTabsProps {
  onTabChange: (tab: string, id: Number) => void;
  onFarmChange?: (farmId: string) => void;
  onDateChange?:(date:Date)=>void;
  
}

const ReportTabs: React.FC<ReportTabsProps> = ({ onTabChange, onFarmChange}) => {
  const [activeTab, setActiveTab] = useState("monthly");
  const [selectedFarm, setSelectedFarm] = useState<string>("");
  const [date, setDate] = useState<Date>(new Date());
  //const [selectedDate,setSelectedDate]=useState<String>("")
  const { data: farms, isLoading } = useFetchAllFarmsQuery();

  // Monthly report state
  const [getMonthlyReport, { isLoading: isMonthlyLoading }] = useGetMonthlyReportMutation();
  const [monthlyReport, setMonthlyReport] = useState<any[]>([]);

  // Fetch monthly report when farm or tab changes
  useEffect(() => {
    const fetchReport = async () => {
      if (selectedFarm && activeTab === "monthly") {
        try {
          const result = await getMonthlyReport({
            farmId: selectedFarm,
            date: date.toISOString().slice(0, 10), // اليوم الحالي (يمكنك تعديله)
          }).unwrap();
          setMonthlyReport(result?.report || []);
        } catch (error) {
          setMonthlyReport([]);
        }
      }
    };
    fetchReport();
  }, [selectedFarm, activeTab, getMonthlyReport,date]);

  const handleTabChange = (tab: string) => {
    setActiveTab(tab);
    onTabChange(tab, Number(selectedFarm));
  };

  const handleFarmChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setSelectedFarm(e.target.value);
    onFarmChange?.(e.target.value);
  };
  // const handleDateChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
  //   setSelectedDate(e.target.value);
  //   const dateValue = new Date(e.target.value);
  //  // onDateChange(dateValue);
  // };

  return (
    <div className="flex flex-col gap-4 w-full" dir="rtl">
      <Card className="flex flex-col items-center  h-full">
      
        <CardTitle className='w-full p-4'>
          خيارات التقرير
        </CardTitle>
      <CardContent className='flex flex-col w-full md:flex-row'>
        <div className="flex flex-col justify-center items-start p-4 mx-4  w-full">
        <label htmlFor="farm-select" className="font-light text-slate-600 text-xs">اختر المزرعة  :</label>
        <select
          id="farm-select"
          className="border rounded px-2 py-2 w-full"
          value={selectedFarm}
          onChange={handleFarmChange}
          disabled={isLoading}
        >
          <option value="">كل المزارع</option>
          {farms && farms.map((farm: any) => (
            <option key={farm.id} value={farm.id}>{farm.farm_name}</option>
          ))}
        </select>
        </div>
        <div className="flex flex-col justify-center items-start p-4 mx-1 w-full">
        <label htmlFor="date-select" className="font-light text-slate-600 text-xs">تاريخ البداية:</label>
       
      
        <DatePicker 
             
            date={date} 
            onSelect={(newDate) => newDate && setDate(newDate)} 
          />
        
          </div>
          <div className="flex flex-col justify-center items-start p-4 mx-4 w-full">
        <label htmlFor="date-select" className="font-light text-slate-600 text-xs">تاريخ النهاية:</label>
       
        <DatePicker 
            
            date={date} 
            onSelect={(newDate) => newDate && setDate(newDate)} 
          />
          </div>
          </CardContent>
      </Card>
      <div className="flex justify-start font-bold text-xl">
        <Tabs defaultValue="monthly" className='text-black w-full'
         value={activeTab} onValueChange={handleTabChange}>
          <TabsList>
            <TabsTrigger
           className='font-bold text-black-100 text-xl focus:p-18 group-active:outline-2 group-focus:outline-offset-2 focus:outline-violet-500 active:bg-violet-700' value="monthly">
            تقرير الانتاج
              </TabsTrigger>
            <TabsTrigger className='font-bold text-xl focus:outline-2 group-activ:outline-offset-2 focus:outline-violet-500 active:bg-violet-700' value="daily">
              تقرير المخزون
              </TabsTrigger>
            <TabsTrigger className='font-bold text-xl focus:outline-2 focus:outline-offset-2 focus:outline-violet-500 active:bg-violet-700' value="amber">
              تقرير العلاجات واللقاحات
            </TabsTrigger>
          </TabsList>
          <TabsContent value="monthly">
             
              <MonthlyReportTable
               table="Monthly" 
              reportData={monthlyReport} 
              isLoading={isMonthlyLoading} 
              onRowClick={()=>{}} />
          {/* 
            // : (
            //   <div className="text-gray-500 text-center py-4">يرجى اختيار مزرعة لعرض التقرير الشهري</div>
            // )
            } */}
          </TabsContent>
          <TabsContent value="daily">
            {/* محتوى التقرير اليومي يمكن أن يظهر هنا إذا لزم الأمر */}
          </TabsContent>
          <TabsContent value="amber">
          <MedicationVaccinationTable 
  farmId={selectedFarm} 
  farmName={selectedFarm}
/>
          </TabsContent>
        </Tabs>
      </div>
    </div>
  );
};

export default ReportTabs; 