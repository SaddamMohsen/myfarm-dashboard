'use client';
import React, { useEffect, useMemo, useState } from "react";
import { useGetMonthlyReportMutation, useGetAmberReportMutation } from "@/lib/services/farms-api";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { DatePicker } from "@/components/date-picker";
import MonthlyReportTable from "./_components/MonthlyReportTable";
import ReportTabs from "./_components/ReportTabs";
import { se } from "date-fns/locale";
import Loader from "@/components/loader";

export default function MonthlyReportPage({ params }: { params: { id: string } }) {
  const [date, setDate] = useState<Date>(new Date());
  const [reportData, setReportData] = useState<any[]>([]);
  const [reportType, setReportType] = useState<string>("monthly");
  const [selectedFarmId, setSelectedFarmId] = useState<string>("");
  const [getMonthlyReport, isLoading] = useGetMonthlyReportMutation();
  const [getAmberReport] = useGetAmberReportMutation();

  const fetchReport = async (selectedDate: Date, id: Number) => {
    try {
      console.log(`in page report getMonthlyRepo:${id}--${selectedDate}`);
      const result = await getMonthlyReport({
        farmId: id,
        date: selectedDate.toISOString().split('T')[0],
      }).unwrap();
      console.log(`result in report page`);
      console.log(result);
      if (result?.report) {
        setReportData(result.report);
      }
    } catch (error) {
      console.error("خطأ في جلب التقرير:", error);
    }
  };

  useEffect(() => {
    if (selectedFarmId) {
      fetchReport(date, Number(selectedFarmId));
    }
  }, [date, selectedFarmId]);

  const handleRowClick = async (row: any) => {
    try {
      const result = await getAmberReport({ 
        date: row.prod_date,
        farmId: params.id 
      }).unwrap();
      console.log("تقرير Amber:", result);
    } catch (error) {
      console.error("خطأ في جلب تقرير Amber:", error);
    }
  };

  const handleTabChange = (tab: string, id: Number) => {
    setReportType(tab);
    if (tab === "monthly" && id) {
      fetchReport(date, id);
    }
  };

  const handleFarmChange = (farmId: string) => {
    setSelectedFarmId(farmId);
  };

  return (
    <div className="container mx-auto py-10" dir="rtl">
      <ReportTabs 
        onTabChange={handleTabChange} 
        onFarmChange={handleFarmChange}
       // selectedDate={date}
      />
      {/* <Card className="bg-white/90">
        <CardHeader className="flex flex-row items-center justify-between">
          <CardTitle>التقرير - {reportData[0]?.farm_name}</CardTitle>
          <DatePicker 
            date={date} 
            onSelect={(newDate) => newDate && setDate(newDate)} 
          />
        </CardHeader>
       
      </Card> */}
    </div>
  );
}