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

interface AmberReport {
  amberId: number;
  totalBirds: number;
  death: number;
  prodEggs: {
    carton: number;
    tray: number;
  };
  outEggs: {
    carton: number;
    tray: number;
  };
  remainingEggs: {
    carton: number;
    tray: number;
  };
  incomeFeed: number;
  feedConsumption: number;
  feedRemaining: number;
  notes: string;
  prodDate: string;
}

interface AmberDailyReportProps {
  data: AmberReport[];
  isLoading?: boolean;
  farmId: number;
  date: string;
}

export function AmberDailyReport({ data, isLoading, farmId, date }: AmberDailyReportProps) {
  return (
    <Card >
      <CardHeader>
        <CardTitle className="text-center">التقرير اليومي للعنابر - مزرعة {farmId}</CardTitle>
        <div className="text-center text-muted-foreground">{date}</div>
      </CardHeader>
      <CardContent>
        <Table dir="rtl" >
          <TableHeader className="">
            <TableRow className="bg-ebony-900 text-black-200 border-1 border-melon-400 text-center">
              <TableHead className="text-right">رقم العنبر</TableHead>
              <TableHead className="text-right">عدد الدجاج</TableHead>
              <TableHead className="text-center">النافق</TableHead>
              <TableHead className="text-center">إنتاج البيض (طبق)</TableHead>
              <TableHead className="text-center">إنتاج البيض (كرتون)</TableHead>
              <TableHead className="text-center">البيض الخارج (كرتون)</TableHead>
              <TableHead className="text-center">البيض الخارج (طبق)</TableHead>
              <TableHead className="text-center">المتبقي من البيض (كرتون)</TableHead>
              <TableHead className="text-center">المتبقي من البيض (طبق)</TableHead>
              <TableHead className="text-center">الوارد من العلف</TableHead>
              <TableHead className="text-center">استهلاك العلف</TableHead>
              <TableHead className="text-center">المتبقي من العلف</TableHead>
              <TableHead className="text-center">ملاحظات</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {isLoading ? (
              <TableRow>
                <TableCell colSpan={11} className="text-center">
                  جاري التحميل...
                </TableCell>
              </TableRow>
            ) : data.length === 0 ? (
              <TableRow>
                <TableCell colSpan={11} className="text-center">
                  لا توجد بيانات
                </TableCell>
              </TableRow>
            ) : (
              data.map((amber) => (
                <TableRow key={amber.amberId}>
                  <TableCell className="font-medium">{amber.amberId}</TableCell>
                  <TableCell className="text-center">{amber.totalBirds}</TableCell>
                  <TableCell className="text-center">{amber.death}</TableCell>
                  <TableCell className="text-center">{amber.prodEggs.carton}</TableCell>
                  <TableCell className="text-center">{amber.prodEggs.tray}</TableCell>
                  <TableCell className="text-center">{amber.outEggs.carton}</TableCell>
                  <TableCell className="text-center">{amber.outEggs.tray}</TableCell>
                  <TableCell className="text-center">{amber.remainingEggs.carton}</TableCell>
                  <TableCell className="text-center">{amber.remainingEggs.tray}</TableCell>
                  <TableCell className="text-center">{amber.incomeFeed}</TableCell>
                  <TableCell className="text-center">{amber.feedConsumption}</TableCell>
                  <TableCell className="text-center">{amber.feedRemaining}</TableCell>
                  <TableCell className="text-center">{amber.notes}</TableCell>
                </TableRow>
              ))
            )}
            {data.length > 0 && (
              <TableRow className="font-bold">
                <TableCell>الإجمالي</TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.totalBirds, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.death, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.prodEggs.carton, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.prodEggs.tray, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.outEggs.carton, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.outEggs.tray, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.remainingEggs.carton, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.remainingEggs.tray, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.incomeFeed, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.feedConsumption, 0)}
                </TableCell>
                <TableCell className="text-center">
                  {data.reduce((sum, amber) => sum + amber.feedRemaining, 0)}
                </TableCell>
                <TableCell />
              </TableRow>
            )}
          </TableBody>
        </Table>
      </CardContent>
    </Card>
  )
} 