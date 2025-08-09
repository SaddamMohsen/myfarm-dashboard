import React, { useState, useEffect } from 'react';
import { Card, CardContent, CardTitle } from '@/components/ui/card';
import { useFetchAllFarmsQuery, useGetMonthlyReportMutation } from "@/lib/services/farms-api";
import MonthlyReportTable from './MonthlyReportTable';
import MedicationVaccinationTable from './MedicationVaccinationTable';
import { DatePicker } from '@/components/date-picker';
import ProductionRepHeader from './ProductionRepHeader';
import InventoryReportTable from './InventoryReportTable';

interface ReportTabsProps {
  onTabChange: (tab: string, id: Number) => void;
  onFarmChange?: (farmId: string) => void;
  onDateChange?:(date:Date)=>void;
}

interface Farm {
  id: string;
  farm_name: string;
}

const ReportTabs: React.FC<ReportTabsProps> = ({ onTabChange, onFarmChange}) => {
  const [activeTab, setActiveTab] = useState("production");
  const [selectedFarm, setSelectedFarm] = useState<Farm | null>(null);

  const { data: farms, isLoading } = useFetchAllFarmsQuery();

  const handleTabChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const tab = e.target.value;
    setActiveTab(tab);
    onTabChange(tab, Number(selectedFarm?.id || 0));
  };

  const handleFarmChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const farmId = e.target.value;
  console.log("Selected Farm ID:", farmId);
    
    if (farmId === "") {
      setSelectedFarm(null);
      onFarmChange?.("");
    } else {
      const selectedFarmData = farms?.find((farm: any) => farm.id === Number(farmId));
      if (selectedFarmData) {
        setSelectedFarm({
          id:selectedFarmData.id?.toString()??'',
          farm_name:selectedFarmData.farm_name});
        onFarmChange?.(farmId);
      }
    }
  };

  const renderContent = () => {
    switch (activeTab) {
      case "production":
        return (
        
          <ProductionRepHeader farmId={selectedFarm?.id??'all'} farmName={selectedFarm?.farm_name??"الكل"}/>
        );
      case "daily":
        return (
          <InventoryReportTable
      farmId={selectedFarm?.id || ""}
      farmName={selectedFarm?.farm_name || "الكل"}
    />
        );
      case "medication":
        return (
          <MedicationVaccinationTable 
            farmId={selectedFarm?.id || ""} 
            farmName={selectedFarm?.farm_name || ""}
          />
        );
      default:
        return null;
    }
  };

  return (
    <div className="flex flex-col gap-4 w-full" dir="rtl">
      <Card className="flex flex-col items-center h-full">
        <CardTitle className='w-full p-4'>
          خيارات التقرير
        </CardTitle>
        <CardContent className='flex flex-col w-full md:flex-row'>
          <div className="flex flex-col justify-center items-start p-4 mx-4 w-full">
            <label htmlFor="farm-select" className="font-light text-slate-600 text-xs">اختر المزرعة:</label>
            <select
              id="farm-select"
              className="border rounded px-2 py-2 w-full"
              value={selectedFarm?.id}
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
            <label htmlFor="report-type-select" className="font-light text-slate-600 text-xs">نوع التقرير:</label>
            <select
              id="report-type-select"
              className="border rounded px-2 py-2 w-full"
              value={activeTab}
              onChange={handleTabChange}
            >
              <option value="production">تقرير الانتاج</option>
              <option value="daily">تقرير المخزون</option>
              <option value="medication">تقرير العلاجات واللقاحات</option>
            </select>
          </div>
{/* 
          <div className="flex flex-col justify-center items-start p-4 mx-1 w-full">
            <label htmlFor="start-date" className="font-light text-slate-600 text-xs">تاريخ البداية:</label>
            <DatePicker 
              date={startDate} 
              onSelect={(newDate) => newDate && setStartDate(newDate)} 
            />
          </div>

          <div className="flex flex-col justify-center items-start p-4 mx-4 w-full">
            <label htmlFor="end-date" className="font-light text-slate-600 text-xs">تاريخ النهاية:</label>
            <DatePicker 
              date={endDate} 
              onSelect={(newDate) => newDate && setEndDate(newDate)} 
            />
          </div> */}
        </CardContent>
      </Card>

      {/* Report Content */}
      <div className="w-full">
        {renderContent()}
      </div>
    </div>
  );
};

export default ReportTabs; 