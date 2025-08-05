"use client";

import React, { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { useGetMedicationReportMutation, useGetVaccinationReportMutation } from "@/lib/services/farms-api";
import { DatePicker } from "@/components/date-picker";
import { format } from "date-fns";
import { ar } from "date-fns/locale";
import Loader from "@/components/loader";

interface MedicationVaccinationTableProps {
  farmId: string;
  farmName?: string;
}

interface ReportItem {
  id: number;
  medication_date: string;
  medication_name: string;
  medication_type: string;
  quantity: string;
  medicated_by:string;
  notes?: string;
  farm_name: string;
}

export default function MedicationVaccinationTable({ farmId, farmName }: MedicationVaccinationTableProps) {
  const [startDate, setStartDate] = useState<Date>(new Date());
  const [endDate, setEndDate] = useState<Date>(new Date());
  const [reportType, setReportType] = useState<'medication' | 'vaccination'>('medication');

  const [getMedicationReport, { data: medicationData, isLoading: medicationLoading }] = useGetMedicationReportMutation();
  const [getVaccinationReport, { data: vaccinationData, isLoading: vaccinationLoading }] = useGetVaccinationReportMutation();

  const handleGenerateReport = async () => {
    if (!startDate || !endDate) {
      alert("يرجى تحديد تاريخ البداية والنهاية");
      return;
    }

    const startDateStr = format(startDate, 'yyyy-MM-dd');
    const endDateStr = format(endDate, 'yyyy-MM-dd');

    if (reportType === 'medication') {
      await getMedicationReport({
        farmId,
        start_date: startDateStr,
        end_date: endDateStr
      });
    } else {
      await getVaccinationReport({
        farmId,
        start_date: startDateStr,
        end_date: endDateStr
      });
    }
  };

  const currentData = reportType === 'medication' ? medicationData : vaccinationData;
  const isLoading = reportType === 'medication' ? medicationLoading : vaccinationLoading;

  const formatDate = (dateString: string) => {
    return format(new Date(dateString), 'dd/MM/yyyy', { locale: ar });
  };

  return (
    <Card className="w-full !important " dir="rtl">
      <CardHeader>
        <CardTitle className="text-right">
          تقرير الأدوية واللقاحات - {farmName}
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          {/* Controls */}
          <div className="flex flex-wrap gap-4 items-end">
            <div className="flex flex-col space-y-2">
              <Label htmlFor="report-type">نوع التقرير</Label>
              <select
                id="report-type"
                value={reportType}
                onChange={(e) => setReportType(e.target.value as 'medication' | 'vaccination')}
                className="border rounded-md px-3 py-2"
              >
                <option value="medication">الأدوية</option>
                <option value="vaccination">اللقاحات</option>
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

          {/* Report Summary */}
          {currentData && (
            <div className="bg-gray-50 p-4 rounded-lg">
              <h3 className="font-semibold text-right mb-2">ملخص التقرير</h3>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-right">
                <div>
                  <span className="font-medium">المزرعة:</span> {currentData.farmId}
                </div>
                <div className="text-xs">
                  <span className="font-small">الفترة:</span>من  {currentData.period?.start_date} - الى {currentData.period?.end_date}
                </div>
                <div className="text-sm">
                  <span className="font-medium">عدد السجلات:</span> {currentData.report?.length || 0}
                </div>
              </div>
            </div>
          )}

          {/* Table */}
          {currentData && currentData.report && currentData.report.length > 0 && (
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead className="text-right">التاريخ</TableHead>
                    <TableHead className="text-right">اسم الدواء/اللقاح</TableHead>
                    <TableHead className="text-right">النوع</TableHead>
                    <TableHead className="text-right">الجرعة</TableHead>
                    <TableHead className="text-right">تم بواسطة</TableHead>
                    <TableHead className="text-right">ملاحظات</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {currentData.report.map((item: ReportItem) => (
                    <TableRow key={item.id}>
                      <TableCell className="text-right">
                        {formatDate(item.medication_date)}
                      </TableCell>
                      <TableCell className="text-right font-medium">
                        {item.medication_name}
                      </TableCell>
                      <TableCell className="text-right">
                        <span className={`px-2 py-1 rounded-full text-xs ${
                          item.medication_type === 'medication' 
                            ? 'bg-blue-100 text-blue-800' 
                            : 'bg-green-100 text-green-800'
                        }`}>
                          {item.medication_type === 'medication' ? 'دواء' : 'لقاح'}
                        </span>
                      </TableCell>
                      <TableCell className="text-right">
                        {item.quantity}
                      </TableCell>
                      <TableCell className="text-right">
                        {item.medicated_by}
                      </TableCell>
                      <TableCell className="text-right">
                        {item.notes || '-'}
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          )}

          {/* No Data Message */}
          {currentData && (!currentData.report || currentData.report.length === 0) && (
            <div className="text-center py-8 text-gray-500">
              لا توجد بيانات للفترة المحددة
            </div>
          )}

          {/* Error Message */}
          {currentData && currentData.error && (
            <div className="text-center py-4 text-red-500">
              {currentData.error}
            </div>
          )}
        </div>
      </CardContent>
    </Card>
  );
}
