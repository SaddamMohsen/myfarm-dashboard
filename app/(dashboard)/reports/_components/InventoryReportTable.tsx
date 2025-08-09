"use client";

import React, { use, useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Label } from "@/components/ui/label";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import Loader from "@/components/loader";
import { useFetchItemsQuery, useGetInventoryReportMutation } from "@/lib/services/farms-api";
import { get } from "http";
import { Select, SelectContent, SelectGroup, SelectItem, SelectLabel, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Loader2 } from "lucide-react";
import { it } from "date-fns/locale";

interface InventoryReportTableProps {
  farmId: string;
  farmName?: string;
}

type FarmItemSummary = {
  item_name: string;
  total_quantity: number;
  total_small_quantity: number;
  records_count: number;
};

type FarmSummary = {
  farm_id: number;
  farm_name: string;
  items: FarmItemSummary[];
};

type OverallItemSummary = {
  item_name: string;
  total_quantity: number;
  total_small_quantity: number;
  records_count: number;
};

export default function InventoryReportTable({ farmId, farmName }: InventoryReportTableProps) {
  const [itemCode, setItemCode] = useState<string>("");
  const [amberId, setAmberId] = useState<string>("");

  const  { data:itemsData,isLoading: isItemsLoading } = useFetchItemsQuery();
  const [getInventoryReport, { data, isLoading }] = useGetInventoryReportMutation();

  const handleGenerateReport = async () => {
    console.log(farmId, itemCode, amberId);
    await getInventoryReport({
      farmId: farmId || undefined,
      item_code: itemCode || undefined,
      amber_id: amberId ? Number(amberId) : undefined,
    });
  };
  // useEffect(() => {
  //   getItems();
  // },[]);
   if (isItemsLoading) {
    return (
      <div className="flex justify-center bg-white items-center 
      border-radius my-6  md:w-full  py-4 md:px-[0.25rem] p-6 rounded-md  ">
        <Loader />
      </div>
    );
  }

  const farmSummaries: FarmSummary[] = data?.farm_summaries || [];
  const overallItems: OverallItemSummary[] = data?.overall_summary?.items || [];
   //console.log("farmSummaries", itemsData);
  return (
    <Card className="w-full !important" dir="rtl">
      <CardHeader>
        <CardTitle className="text-right">تقرير المخزون - {farmName || "الكل"}</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          {/* Controls */}
          <div className="flex flex-wrap gap-4 items-end justify-center">
            <div className="flex flex-col space-y-2">
              <Label>كود الصنف</Label>
              <Select onValueChange={(value) => setItemCode(value)}>
                 <SelectTrigger className="w-[180px]">
        <SelectValue placeholder="حدد الصنف" />
      </SelectTrigger>
       <SelectContent>
        <SelectGroup>
          <SelectLabel>الاصناف</SelectLabel>
          {itemsData && itemsData.length > 0 &&!isItemsLoading ?
                itemsData?.map((item: any) => (
                  <SelectItem key={item.item_code} value={item.item_code}>
                    {item.item_code} - {item.item_name}
                    </SelectItem>)): 
                  <p>لا توجد أصناف متاحة</p>
                     
                    
}
                    
                </SelectGroup>
      </SelectContent>
                
                </Select>
            </div>

            <div className="flex flex-col space-y-2">
              <Label>رقم العنبر (اختياري)</Label>
              <Input
                value={amberId}
                onChange={(e) => setAmberId(e.target.value)}
                placeholder="مثال: 2"
                className="w-48"
                inputMode="numeric"
              />
            </div>

            <div className="flex flex-col space-y-2 pt-5">
              <Button onClick={handleGenerateReport} disabled={isLoading} className="bg-blue-600 hover:bg-blue-700">
                {isLoading ? <Loader /> : "عرض التقرير"}
              </Button>
            </div>
          </div>

          {/* Summary: Overall */}
          {overallItems.length > 0 && (
            <div className="bg-gray-50 p-4 rounded-lg">
              <h3 className="font-semibold text-right mb-2">ملخص إجمالي حسب الصنف</h3>
              <div className="overflow-x-auto">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead className="text-right">الصنف</TableHead>
                      <TableHead className="text-right">الكمية</TableHead>
                      <TableHead className="text-right">الكمية الصغيرة</TableHead>
                      <TableHead className="text-right">عدد السجلات</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {overallItems.map((item, idx) => (
                      <TableRow key={`${item.item_name}-${idx}`}>
                        <TableCell className="text-right">{item.item_name}</TableCell>
                        <TableCell className="text-right">{item.total_quantity}</TableCell>
                        <TableCell className="text-right">{item.total_small_quantity}</TableCell>
                        <TableCell className="text-right">{item.records_count}</TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </div>
          )}

          {/* Table: Per farm + item */}
          {farmSummaries.length > 0 ? (
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead className="text-right">المزرعة</TableHead>
                    <TableHead className="text-right">الصنف</TableHead>
                    <TableHead className="text-right">الكمية</TableHead>
                    <TableHead className="text-right">الكمية الصغيرة</TableHead>
                    <TableHead className="text-right">عدد السجلات</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {farmSummaries.flatMap((farm) =>
                    farm.items.map((it, idx) => (
                      <TableRow key={`${farm.farm_id}-${it.item_name}-${idx}`}>
                        <TableCell className="text-right">{farm.farm_name}</TableCell>
                        <TableCell className="text-right">{it.item_name}</TableCell>
                        <TableCell className="text-right">{it.total_quantity}</TableCell>
                        <TableCell className="text-right">{it.total_small_quantity}</TableCell>
                        <TableCell className="text-right">{it.records_count}</TableCell>
                      </TableRow>
                    ))
                  )}
                </TableBody>
              </Table>
            </div>
          ) : (
            data && (
              <div className="text-center py-8 text-gray-500">
                لا توجد بيانات للمدخلات المحددة
              </div>
            )
          )}
        </div>
      </CardContent>
    </Card>
  );
}
