"use client";

import { DatePicker } from "@/components/date-picker";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Label } from "@/components/ui/label";
import { Button } from "@/components/ui/button";
import { useGetProductionReportMutation, useGetProductionByAmberReportMutation } from "@/lib/services/farms-api";
import { format } from "date-fns";
import { Loader2, AlertTriangle, BarChart3, Building2, CalendarDays } from "lucide-react";
import { useState } from "react";
import { FarmSummaryTable } from "./FarmSummaryTable";
import { AmberSummaryTable, AmberProductionSummary } from "./AmberSummaryTable";

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

export default function ProductionRepHeader({ farmId, farmName }: ProductionRepHeaderProps) {
  const [startDate, setStartDate] = useState<Date>(() => {
    const date = new Date();
    date.setMonth(date.getMonth() - 1);
    return date;
  });
  const [endDate, setEndDate] = useState<Date>(new Date());
  const [reportType, setReportType] = useState<"monthly" | "daily">("monthly");

  const [getSummaryReport, { data: summaryData, isLoading: summaryLoading }] =
    useGetProductionReportMutation();

  const [getAmberReport, { data: amberData, isLoading: amberLoading }] =
    useGetProductionByAmberReportMutation();

  const isLoading = summaryLoading || amberLoading;

  const handleGenerateReport = async () => {
    if (!startDate || !endDate) {
      alert("يرجى تحديد تاريخ البداية والنهاية");
      return;
    }

    const startDateStr = format(startDate, "yyyy-MM-dd");
    const endDateStr = format(endDate, "yyyy-MM-dd");

    if (reportType === "monthly") {
      await getSummaryReport({
        farmId: farmId !== "all" ? farmId : undefined,
        start_date: startDateStr,
        end_date: endDateStr,
      });
    } else if (reportType === "daily") {
      if (farmId === "all") {
        alert("يرجى اختيار مزرعة محددة للتقرير التحليلي");
        return;
      }
      await getAmberReport({
        farmId: farmId,
        start_date: startDateStr,
        end_date: endDateStr,
      });
    }
  };

  return (
    <Card className="w-full" dir="rtl">
      <CardHeader className="pb-4">
        <CardTitle className="text-right flex items-center gap-2">
          <BarChart3 className="h-6 w-6 text-blue-600" />
          تقرير العلف والانتاج - {farmName}
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-6">
        {/* Controls Section */}
        <div className="bg-gradient-to-l from-slate-50 to-slate-100 rounded-xl p-6 border border-slate-200">
          <div className="flex flex-wrap gap-6 items-end justify-center">
            {/* Report Type Selector */}
            <div className="flex flex-col space-y-2 min-w-[160px]">
              <Label htmlFor="report-type" className="text-sm font-medium text-slate-700">
                نوع التقرير
              </Label>
              <select
                id="report-type"
                value={reportType}
                onChange={(e) => setReportType(e.target.value as "monthly" | "daily")}
                className="border border-slate-300 rounded-lg px-4 py-2.5 bg-white text-slate-700 
                         focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all
                         shadow-sm hover:border-slate-400"
              >
                <option value="monthly">اجمالي (حسب المزرعة)</option>
                <option value="daily">تحليلي (حسب العنبر)</option>
              </select>
            </div>

            {/* Start Date Picker */}
            <div className="flex flex-col space-y-2">
              <Label className="text-sm font-medium text-slate-700 flex items-center gap-1">
                <CalendarDays className="h-4 w-4" />
                تاريخ البداية
              </Label>
              <DatePicker
                date={startDate}
                onSelect={(newDate) => newDate && setStartDate(newDate)}
              />
            </div>

            {/* End Date Picker */}
            <div className="flex flex-col space-y-2">
              <Label className="text-sm font-medium text-slate-700 flex items-center gap-1">
                <CalendarDays className="h-4 w-4" />
                تاريخ النهاية
              </Label>
              <DatePicker
                date={endDate}
                onSelect={(newDate) => newDate && setEndDate(newDate)}
              />
            </div>

            {/* Generate Report Button */}
            <Button
              onClick={handleGenerateReport}
              disabled={!startDate || !endDate || isLoading}
              className="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2.5 rounded-lg
                       shadow-md hover:shadow-lg transition-all duration-200 
                       disabled:opacity-50 disabled:cursor-not-allowed min-w-[140px]"
            >
              {isLoading ? (
                <span className="flex items-center gap-2">
                  <Loader2 className="h-4 w-4 animate-spin" />
                  جاري التحميل...
                </span>
              ) : (
                "عرض التقرير"
              )}
            </Button>
          </div>
        </div>

        {/* Warning for analytical report when no farm selected */}
        {reportType === "daily" && farmId === "all" && (
          <div
            className="bg-amber-50 border-r-4 border-amber-400 text-amber-800 px-6 py-4 rounded-lg 
                       flex items-center gap-3 shadow-sm"
            role="alert"
          >
            <AlertTriangle className="h-6 w-6 text-amber-500 flex-shrink-0" />
            <div>
              <p className="font-bold">تنبيه</p>
              <p className="text-sm">
                يجب اختيار مزرعة محددة لعرض التقرير التحليلي حسب العنبر.
              </p>
            </div>
          </div>
        )}

        {/* Report Summary for Monthly (اجمالي) */}
        {reportType === "monthly" && summaryData && (
          <div className="space-y-4">
            {/* Summary Header Card */}
            <div className="bg-gradient-to-l from-blue-50 to-indigo-50 rounded-xl p-5 border border-blue-100 shadow-sm">
              <h3 className="font-bold text-lg text-blue-900 mb-4 flex items-center gap-2">
                <Building2 className="h-5 w-5" />
                ملخص التقرير
              </h3>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div className="bg-white rounded-lg p-4 shadow-sm border border-blue-100">
                  <span className="text-sm text-slate-500">المزرعة</span>
                  <p className="font-bold text-lg text-slate-800 mt-1">
                    {summaryData.farm_name || farmName || "جميع المزارع"}
                  </p>
                </div>
                <div className="bg-white rounded-lg p-4 shadow-sm border border-blue-100">
                  <span className="text-sm text-slate-500">الفترة</span>
                  <p className="font-bold text-lg text-slate-800 mt-1 text-sm">
                    من {summaryData.period?.start_date} إلى {summaryData.period?.end_date}
                  </p>
                </div>
                <div className="bg-white rounded-lg p-4 shadow-sm border border-blue-100">
                  <span className="text-sm text-slate-500">عدد السجلات</span>
                  <p className="font-bold text-lg text-blue-600 mt-1">
                    {summaryData.report?.length || 0}
                  </p>
                </div>
              </div>
            </div>

            {/* Farm Summary Table */}
            {summaryData.farm_summaries && summaryData.farm_summaries.length > 0 && (
              <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
                <div className="overflow-x-auto">
                  <FarmSummaryTable summaryData={summaryData.farm_summaries} />
                </div>
              </div>
            )}

            {/* No data message */}
            {summaryData.farm_summaries && summaryData.farm_summaries.length === 0 && (
              <div className="text-center py-12 bg-slate-50 rounded-xl border border-dashed border-slate-300">
                <p className="text-slate-500 text-lg">لا توجد بيانات للفترة المحددة</p>
              </div>
            )}
          </div>
        )}

        {/* Report Summary for Daily/Analytical (تحليلي) - Per Amber */}
        {reportType === "daily" && amberData && (
          <div className="space-y-4">
            {/* Summary Header Card */}
            <div className="bg-gradient-to-l from-emerald-50 to-teal-50 rounded-xl p-5 border border-emerald-100 shadow-sm">
              <h3 className="font-bold text-lg text-emerald-900 mb-4 flex items-center gap-2">
                <BarChart3 className="h-5 w-5" />
                ملخص التقرير التحليلي حسب العنبر
              </h3>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div className="bg-white rounded-lg p-4 shadow-sm border border-emerald-100">
                  <span className="text-sm text-slate-500">المزرعة</span>
                  <p className="font-bold text-lg text-slate-800 mt-1">
                    {amberData.farm_name || farmName}
                  </p>
                </div>
                <div className="bg-white rounded-lg p-4 shadow-sm border border-emerald-100">
                  <span className="text-sm text-slate-500">الفترة</span>
                  <p className="font-bold text-lg text-slate-800 mt-1 text-sm">
                    من {amberData.period?.start_date} إلى {amberData.period?.end_date}
                  </p>
                </div>
                <div className="bg-white rounded-lg p-4 shadow-sm border border-emerald-100">
                  <span className="text-sm text-slate-500">عدد العنابر</span>
                  <p className="font-bold text-lg text-emerald-600 mt-1">
                    {amberData.amber_summaries?.length || 0}
                  </p>
                </div>
              </div>
            </div>

            {/* Amber Summary Table */}
            {amberData.amber_summaries && amberData.amber_summaries.length > 0 && (
              <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
                <div className="overflow-x-auto">
                  <AmberSummaryTable
                    summaryData={amberData.amber_summaries as AmberProductionSummary[]}
                    overallSummary={amberData.overall_summary}
                  />
                </div>
              </div>
            )}

            {/* No data message */}
            {amberData.amber_summaries && amberData.amber_summaries.length === 0 && (
              <div className="text-center py-12 bg-slate-50 rounded-xl border border-dashed border-slate-300">
                <p className="text-slate-500 text-lg">لا توجد بيانات للفترة المحددة</p>
              </div>
            )}
          </div>
        )}
      </CardContent>
    </Card>
  );
}