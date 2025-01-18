import React from 'react';

interface DailyReportData {
  farmName: string;
  eggProductionCarton: number;
  eggProductionTray: number;
  remainingEggsCarton: number;
  remainingEggsTray: number;
  outEggsCarton: number;
  outEggsTray: number;
  feedConsumption: number;
  feedRemaining: number;
}

interface DailyReportTableProps {
  data: DailyReportData[];
  isLoading: boolean;
}

export function DailyReportTable({ data, isLoading }: DailyReportTableProps) {
  return (
    <div className="card bg-white/50">
      <div className="card-header">
        <h2 className="text-center">تقرير الإنتاج اليومي</h2>
      </div>
      <div className="card-content">
        <table className="table">
          <thead className="bg-bone text-anti-flash_white-900">
            <tr>
              <th className="text-right">المزرعة</th>
              <th className="text-center">إنتاج البيض (كرتون)</th>
              <th className="text-center">إنتاج البيض (صينية)</th>
              <th className="text-center">المتبقي من البيض (كرتون)</th>
              <th className="text-center">المتبقي من البيض (صينية)</th>
              <th className="text-center">البيض الخارج (كرتون)</th>
              <th className="text-center">البيض الخارج (صينية)</th>
              <th className="text-center">استهلاك العلف</th>
              <th className="text-center">المتبقي من العلف</th>
            </tr>
          </thead>
          <tbody>
            {isLoading ? (
              <tr>
                <td colSpan={9} className="text-center">
                  جاري التحميل...
                </td>
              </tr>
            ) : data.length === 0 ? (
              <tr>
                <td colSpan={9} className="text-center">
                  لا توجد بيانات
                </td>
              </tr>
            ) : (
              data.map((row, index) => (
                <tr key={index}>
                  <td className="font-medium">{row.farmName}</td>
                  <td className="text-center">{row.eggProductionCarton.toLocaleString()}</td>
                  <td className="text-center">{row.eggProductionTray.toLocaleString()}</td>
                  <td className="text-center">{row.remainingEggsCarton.toLocaleString()}</td>
                  <td className="text-center">{row.remainingEggsTray.toLocaleString()}</td>
                  <td className="text-center">{row.outEggsCarton.toLocaleString()}</td>
                  <td className="text-center">{row.outEggsTray.toLocaleString()}</td>
                  <td className="text-center">{row.feedConsumption.toLocaleString()}</td>
                  <td className="text-center">{row.feedRemaining.toLocaleString()}</td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
} 