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
    farmName:string;
    eggProductionCarton:number;
    eggProductionTray:number;
    remainingEggsCarton:number;
    remainingEggsTray:number;
    outEggsCarton:number;
    outEggsTray:number;
    incomFeed:number;
    feedConsumption:number;
    feedRemaining:number;
}

interface SummaryTableProps {
  data: SummaryData[];
  isLoading?: boolean;
}

export function SummaryTable({ data, isLoading }: SummaryTableProps) {
  return (
    <Card>
      <CardHeader>
        <CardTitle className="text-center">ملخص الإنتاج والاستهلاك</CardTitle>
      </CardHeader>
      <CardContent>
        <Table dir="rtl">
          <TableHeader>
            <TableRow>
            <TableHead className="text-right">المزرعة</TableHead>
              <TableHead className="text-center">إنتاج البيض (كرتون)</TableHead>
              <TableHead className="text-center">إنتاج البيض (صينية)</TableHead>
              <TableHead className="text-center">المتبقي من البيض (كرتون)</TableHead>
              <TableHead className="text-center">المتبقي من البيض (صينية)</TableHead>
              <TableHead className="text-center">البيض الخارج (كرتون)</TableHead>
              <TableHead className="text-center">البيض الخارج (صينية)</TableHead>
             <TableHead className="text-center">العلف الوارد</TableHead>
              <TableHead className="text-center">استهلاك العلف</TableHead>
              <TableHead className="text-center">المتبقي من العلف</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {isLoading ? (
              <TableRow>
                <TableCell colSpan={5} className="text-center">
                  جاري التحميل...
                </TableCell>
              </TableRow>
            ) : data.length === 0 ? (
              <TableRow>
                <TableCell colSpan={5} className="text-center">
                  لا توجد بيانات
                </TableCell>
              </TableRow>
            ) : (
              data.map((row, index) => (
                <TableRow key={index}>
                  <TableCell className="font-medium">{row.farmName}</TableCell>
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