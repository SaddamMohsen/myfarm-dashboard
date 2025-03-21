'use client';
import React, { useEffect, useMemo, useState } from "react";
import { useGetMonthlyReportMutation, useGetAmberReportMutation } from "@/lib/services/farms-api";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { DatePicker } from "@/components/date-picker";
import MonthlyReportTable from "./_components/MonthlyReportTable"; // استيراد المكون الجديد
import ReportTabs from "./_components/ReportTabs"; // استيراد مكون علامات التبويب

export default function MonthlyReportPage({ params }: { params: { id: string } }) {
  const [date, setDate] = useState<Date>(new Date());
  const [reportData, setReportData] = useState<any[]>([]);
  const [reportType, setReportType] = useState<string>("monthly"); // حالة لتحديد نوع التقرير
  const [getMonthlyReport] = useGetMonthlyReportMutation();
  const [getAmberReport] = useGetAmberReportMutation();

  const fetchReport = async (selectedDate: Date) => {
    try {
      const result = await getMonthlyReport({
        farmId: params.id,
        date: selectedDate.toISOString().split('T')[0], // تنسيق التاريخ
      }).unwrap();

      if (result?.report) {
        setReportData(result.report);
      }
    } catch (error) {
      console.error("خطأ في جلب التقرير:", error);
    }
  };

  useEffect(() => {
    fetchReport(date);
  }, [date]);

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

  const handleTabChange = (tab: string) => {
    setReportType(tab);
    // يمكنك هنا استدعاء دالة لجلب التقرير بناءً على نوع التقرير المحدد
    if (tab === "daily") {
      // استدعاء دالة لجلب التقرير اليومي
    } else if (tab === "amber") {
      // استدعاء دالة لجلب تقرير Amber
    } else {
      fetchReport(date); // استدعاء التقرير الشهري
    }
  };

  return (
    <div className="container mx-auto py-10" dir="rtl">
         <ReportTabs onTabChange={handleTabChange} />
      <Card className="bg-white/90">
        <CardHeader className="flex flex-row items-center justify-between">
          <CardTitle>التقرير - {reportData[0]?.farm_name}</CardTitle>
          <DatePicker date={date} onSelect={(newDate) => newDate && setDate(newDate)} />
        </CardHeader>
        <CardContent>
          {/* استخدام مكون علامات التبويب */}
          {/* <MonthlyReportTable table={[]} reportData={[]} onRowClick={handleRowClick} /> */}
        </CardContent>
      </Card>
    </div>
  );
}