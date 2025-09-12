"use client"

import React, { useEffect, useMemo, useState } from "react"
import { format } from "date-fns"
import { ar } from "date-fns/locale"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { DatePicker } from "@/components/date-picker"
import { useGetMonthlyReportMutation, useGetAmberReportMutation, useGetDailyReportMutation } from "@/lib/services/farms-api"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import { ArrowUpDown, Loader2 } from "lucide-react"
import {
  ColumnDef,
  flexRender,
  getCoreRowModel,
  useReactTable,
  getSortedRowModel,
  SortingState,
} from "@tanstack/react-table"
import { Button } from "@/components/ui/button"
import { AmberDailyReport } from "@/components/tables/AmberDailyReport"
import MonthlyReportTable from "../../_components/MonthlyReportTable"
import Loader from "@/components/loader"
import { DateRangePicker } from "@/components/date-range-picker"
import { DateRange } from "@/constants/types"
//import { DateRange } from "react-day-picker"

 


interface MonthlyReport {
//   prodDate: string
//   prodCarton: number
//   prodTray: number
//   outCarton: number
//   outTray: number
//   death: number
//   incom_feed: number
//   intak_feed: number
//   remain_feed: number
//   farms: {
//     farm_name: string
//   }
prod_date: string
  death: number
  income_feed: number
  intak_feed: number
  remain_feed: number
  prod_egg: number[]
  out_egg: number[]
  remain_egg: number[]
  farm_name: string
}

export default function MonthlyReportPage({ params }: { params: { id: string } }) {
  const [date, setDate] = useState<Date>(new Date())
  const [reportData, setReportData] = useState<MonthlyReport[]>([])
  const [sorting, setSorting] = useState<SortingState>([])
  const [getMonthlyReport, { isLoading }] = useGetMonthlyReportMutation()
  const [selectedRow,setSelectedRow] = useState<MonthlyReport|any>();
  // const [getAmberReport,{isLoading:isDailyReportLoading}] = useGetAmberReportMutation()
  // const [dailyReportData,setDailyReportData]=useState<any[]>([]);
  const [dailyReportData, setDailyReportData] = useState<any[]>([])
  const [getDailyReport, { isLoading: isDailyReportLoading }] = useGetDailyReportMutation()
  const columns = useMemo<ColumnDef<MonthlyReport>[]>(
    () => [
      {
        accessorKey: "prod_date",
        header: ({ column }) => {
            return (
              <Button
              className="border-1 border-slate-500 text-base antialiased text-center font-semibold text-black"
                variant="ghost"
                onClick={() => column.toggleSorting(column.getIsSorted() === "desc")}
              >
                التاريخ
                <ArrowUpDown className="ml-2 h-4 w-4" />
              </Button>
            )
          },
        cell: ({ row }) => format(new Date(row.getValue("prod_date")), 'dd/MM/yyyy'),
        
      },
      {
        accessorKey: "death",
        header: "النافق",
        cell: ({ row }) => <div className="text-center">{row.getValue("death")}</div>,
      },
      {
        accessorKey: "prod_egg",
        header:`إنتاج البيض (طبق)`,
        cell: ({ row }) => <div className="text-center flex flex-row items-center justify-center">
        <img src='/img/tray.ico' alt='egg' className='w-12 h-12' />
        {row.getValue<number[]>("prod_egg")[0]}
        </div>,
      },
      {
        accessorKey: "prod_egg_carton",
        header: "إنتاج البيض (كرتون)",
        cell: ({ row }) => <div className="text-center">{row.getValue<number[]>("prod_egg")[1]}</div>,
      },
      {
        accessorKey: "out_egg",
        header: "البيض الخارج (طبق)",
        cell: ({ row }) => <div className="text-center">{row.getValue<number[]>("out_egg")[0]}</div>,
      },
      {
        accessorKey: "out_egg_carton",
        header: "البيض الخارج (كرتون)",
        cell: ({ row }) => <div className="text-center">{row.getValue<number[]>("out_egg")[1]}</div>,
      },
      {
        accessorKey: "remain_egg",
        header: "البيض المتبقي (طبق)",
        cell: ({ row }) => <div className="text-center">{row.getValue<number[]>("remain_egg")[0]}</div>,
      },
      {
        accessorKey: "remain_egg_carton",
        header: "البيض المتبقي (كرتون)",
        cell: ({ row }) => <div className="text-center">{row.getValue<number[]>("remain_egg")[1]}</div>,
      },
      {
        accessorKey: "income_feed",
        header: "العلف الوارد",
        cell: ({ row }) => <div className="text-center">{row.getValue("income_feed")}</div>,
      },
      {
        accessorKey: "intak_feed",
        header: "استهلاك العلف",
        cell: ({ row }) => <div className="text-center">{row.getValue("intak_feed")}</div>,
      },
      {
        accessorKey: "remain_feed",
        header: "المتبقي من العلف",
        cell: ({ row }) => <div className="text-center">{row.getValue("remain_feed")}</div>,
      },
    ],
    []
  )

  const table = useReactTable({
    data: reportData,
    columns,
    onSortingChange: setSorting,
       
   
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
    state: {
      sorting,
    },
  })

  const fetchReport = async (selectedDate: Date) => {
    try {
      const result = await getMonthlyReport({
        farmId: params.id,
        date: format(selectedDate, 'yyyy-MM-dd')
      }).unwrap()

      if (result?.report) {
        setReportData(result.report)
      }
    } catch (error) {
      console.error("خطأ في جلب التقرير:", error)
    }
  }

  const [fdate, setRangeDate] = useState<DateRange | undefined>({
    from: new Date("01-2-2024"),
    to: new Date(),
});

  useEffect(() => {
    fetchReport(date)
  }, [date])

  const totals = useMemo(() => {
    if (reportData.length === 0) return null
    return {
      death: reportData.reduce((sum, row) => sum + row.death, 0),
      prod_egg_0: reportData.reduce((sum, row) => sum + row.prod_egg[0], 0),
      prod_egg_1: reportData.reduce((sum, row) => sum + row.prod_egg[1], 0),
      out_egg_0: reportData.reduce((sum, row) => sum + row.out_egg[0], 0),
      out_egg_1: reportData.reduce((sum, row) => sum + row.out_egg[1], 0),
      remain_egg_0: reportData.reduce((sum, row) => 0 + row.remain_egg[0], 0),
      remain_egg_1: reportData.reduce((sum, row) => 0 + row.remain_egg[1], 0),
      income_feed: reportData.reduce((sum, row) => sum + row.income_feed, 0),
      intak_feed: reportData.reduce((sum, row) => sum + row.intak_feed, 0),
      remain_feed: reportData.reduce((sum, row) => 0 + row.remain_feed, 0),
    }
  }, [reportData])

  const handleRowClick = async (row: MonthlyReport) => {
    if (selectedRow &&( selectedRow.prod_date === row.prod_date)) {
      setSelectedRow(null)
      setDailyReportData([])
      return;
    }
    try {
      setSelectedRow(row);
      const result = await await getDailyReport({ 
        date: row.prod_date,
        farmId: Number(params.id) 
      }).unwrap()
      console.log("تقرير Amber:", result);
      if (result?.ambers) {
        console.log(result);
        setDailyReportData(result.ambers)
      }
    } catch (error) {
      console.error("خطأ في جلب تقرير Amber:", error);
    }
  };

  return (
    <div className="container mx-auto gap-4 py-10" dir="rtl">
      <Card className="bg-white/90">
        <CardHeader className="flex flex-row items-center justify-between">
          <CardTitle>التقرير الشهري - {reportData[0]?.farm_name}</CardTitle>
          <DateRangePicker
                                onUpdate={(values) => {
                                    setRangeDate(values.range);
                                    setDate(values.range?.from ?? new Date());
                                    // if (values.range?.to !== undefined) {
                                    //     table.getColumn("start")?.setFilterValue(values.range);
                                    // }
                                }}
                                initialDateFrom={fdate?.from}
                                initialDateTo={fdate?.to ?? ""}
                                align="start"
                                locale="en-US"
                                showCompare={false}
                            />
          {/* <DatePicker date={date} onSelect={(newDate) => newDate && setDate(newDate)} /> */}
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <div className="flex justify-center items-center p-8">
              <Loader  />
            </div>
          ) : (
            <div className="flex flex-col gap-4 items-center justify-center">
            <div className="rounded-md border">
              <MonthlyReportTable table={table} reportData={reportData} onRowClick={handleRowClick} />
            </div>
            
            </div>
          )}
        </CardContent>
      </Card>
      <div className="rounded-md border mt-4">
            {dailyReportData &&selectedRow &&
           
          <AmberDailyReport 
            data={dailyReportData}
            isLoading={isDailyReportLoading}
            farmId={parseInt(params.id)}
            date={format(selectedRow?.prod_date, 'yyyy-MM-dd')}
          />
       
}
        </div>
    </div>
  )
}
