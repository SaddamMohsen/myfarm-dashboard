"use client"

import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"

interface SummaryData {
  farmId: number;
  farmName: string;
  eggProductionCarton: number;
  eggProductionTray: number;
  remainingEggsCarton: number;
  remainingEggsTray: number;
  outEggsCarton: number;
  outEggsTray: number;
  incomFeed: number;
  feedConsumption: number;
  feedRemaining: number;
}

interface SummaryTableProps {
  data: SummaryData[];
  isLoading?: boolean;
  onFarmSelect: (farmId: number) => void;
}

export function SummaryTable({ data, isLoading, onFarmSelect }: SummaryTableProps) {
  return (
    <Card className="bg-white/50">
      <CardHeader>
        <CardTitle className="text-center">ملخص الإنتاج والاستهلاك</CardTitle>
      </CardHeader>
      <CardContent>
        <Table dir="rtl" className="bg-white/10 font-bold">
          <TableHeader>
            <TableRow className="font-bold">
              <TableHead className="text-right font-semibold">المزرعة</TableHead>
              <TableHead className="text-center  font-semibold">إنتاج البيض (كرتون)</TableHead>
              <TableHead className="text-center  font-semibold">إنتاج البيض ('طبق')</TableHead>
              <TableHead className="text-center font-semibold">المتبقي من البيض (كرتون)</TableHead>
              <TableHead className="text-center  font-semibold">المتبقي من البيض ('طبق')</TableHead>
            <TableHead className="text-center  font-semibold">البيض الخارج (كرتون)</TableHead>
              <TableHead className="text-center  font-semibold">البيض الخارج ('طبق')</TableHead>
              <TableHead className="text-center font-semibold">العلف الوارد</TableHead>
              <TableHead className="text-center font-semibold">استهلاك العلف</TableHead>
              <TableHead className="text-center font-semibold">المتبقي من العلف</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {isLoading ? (
              <TableRow>
                <TableCell colSpan={10} className="text-center">
                  جاري التحميل...
                </TableCell>
              </TableRow>
            ) : data.length === 0 ? (
              <TableRow>
                <TableCell colSpan={10} className="text-center">
                  لا توجد بيانات
                </TableCell>
              </TableRow>
            ) : (
              data.map((row, index) => (
                <TableRow 
                  key={index}
                  className="cursor-pointer hover:bg-muted/50"
                  onClick={() => onFarmSelect(row.farmId)}
                >
                  <TableCell className="font-semibold">{row.farmName}</TableCell>
                  <TableCell className="text-center">{row.eggProductionCarton.toLocaleString()}</TableCell>
                  <TableCell className="text-center">{row.eggProductionTray.toLocaleString()}</TableCell>
                  <TableCell className="text-center">{row.remainingEggsCarton.toLocaleString()}</TableCell>
                  <TableCell className="text-center">{row.remainingEggsTray.toLocaleString()}</TableCell>
                  <TableCell className="text-center">{row.outEggsCarton.toLocaleString()}</TableCell>
                  <TableCell className="text-center">{row.outEggsTray.toLocaleString()}</TableCell>
                  <TableCell className="text-center">{row.incomFeed.toLocaleString()}</TableCell>
                  <TableCell className="text-center">{row.feedConsumption.toLocaleString()}</TableCell>
                  <TableCell className="text-center">{row.feedRemaining.toLocaleString()}</TableCell>
                </TableRow>
              ))
            )}
            {data.length > 0 && (
              <TableRow className="font-bold">
                <TableCell>الإجمالي</TableCell>
                <TableCell className="text-center">
                  {(data || data).reduce((sum, row) => sum + row.eggProductionCarton, 0).toLocaleString()}
                </TableCell>
                <TableCell className="text-center">
                  {(data || data).reduce((sum, row) => sum + row.eggProductionTray, 0).toLocaleString()}
                </TableCell>
                <TableCell className="text-center">
                  {(data || data).reduce((sum, row) => sum + row.remainingEggsCarton, 0).toLocaleString()}
                </TableCell>
                <TableCell className="text-center">
                  {(data || data).reduce((sum, row) => sum + row.remainingEggsTray, 0).toLocaleString()}
                </TableCell>
                <TableCell className="text-center">
                  {(data || data).reduce((sum, row) => sum + row.outEggsCarton, 0).toLocaleString()}
                </TableCell>
                <TableCell className="text-center">
                  {(data || data).reduce((sum, row) => sum + row.outEggsTray, 0).toLocaleString()}
                </TableCell>
                <TableCell className="text-center">
                  {(data || data).reduce((sum, row) => sum + row.incomFeed, 0).toLocaleString()}
                </TableCell>
                <TableCell className="text-center">
                  {(data || data).reduce((sum, row) => sum + row.feedConsumption, 0).toLocaleString()}
                </TableCell>
                <TableCell className="text-center">
                  {(data || data).reduce((sum, row) => sum + row.feedRemaining, 0).toLocaleString()}
                </TableCell>
              </TableRow>
            )}
          </TableBody>
        </Table>
      </CardContent>
    </Card>
  )
} 