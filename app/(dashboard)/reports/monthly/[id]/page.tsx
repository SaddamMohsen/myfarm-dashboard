"use client"

import { useEffect, useState, useMemo } from "react"
import { format } from "date-fns"
import { ar } from "date-fns/locale"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { DatePicker } from "@/components/date-picker"
import { useGetMonthlyReportMutation } from "@/lib/services/farms-api"
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

  return (
    <div className="container mx-auto py-10" dir="rtl">
      <Card className="bg-white/90">
        <CardHeader className="flex flex-row items-center justify-between">
          <CardTitle>التقرير الشهري - {reportData[0]?.farm_name}</CardTitle>
          <DatePicker date={date} onSelect={(newDate) => newDate && setDate(newDate)} />
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <div className="flex justify-center items-center p-8">
              <Loader2 className="h-8 w-8 animate-spin" />
            </div>
          ) : (
            <div className="rounded-md border">
              <Table>
                <TableHeader>
                  {table.getHeaderGroups().map((headerGroup) => (
                    <TableRow key={headerGroup.id} className="bg-melon-400">
                      {headerGroup.headers.map((header) => (
                        <TableHead key={header.id} className="text-center font-bold font-sans">
                          {header.isPlaceholder
                            ? null
                            : flexRender(
                                header.column.columnDef.header,
                                header.getContext()
                              )}
                        </TableHead>
                      ))}
                    </TableRow>
                  ))}
                </TableHeader>
                <TableBody>
                  {table.getRowModel().rows?.length ? (
                    <>
                      {table.getRowModel().rows.map((row) => (
                        <TableRow
                          key={row.id}
                          data-state={row.getIsSelected() && "selected"}
                          className="text-center font-sans hover:bg-white/50 hover:cursor-pointer hover:font-bold"
                        >
                          {row.getVisibleCells().map((cell) => (
                            <TableCell key={cell.id}>
                              {flexRender(cell.column.columnDef.cell, cell.getContext())}
                            </TableCell>
                          ))}
                        </TableRow>
                      ))}
                      {totals && (
                        <TableRow className="font-bold bg-muted/50">
                          <TableCell>الإجمالي</TableCell>
                          <TableCell className="text-center">{totals.death}</TableCell>
                          <TableCell className="text-center">{totals.prod_egg_0}</TableCell>
                          <TableCell className="text-center">{totals.prod_egg_1}</TableCell>
                          <TableCell className="text-center">{totals.out_egg_0}</TableCell>
                          <TableCell className="text-center">{totals.out_egg_1}</TableCell>
                          <TableCell className="text-center">{totals.remain_egg_0}</TableCell>
                          <TableCell className="text-center">{totals.remain_egg_1}</TableCell>
                          <TableCell className="text-center">{totals.income_feed}</TableCell>
                          <TableCell className="text-center">{totals.intak_feed}</TableCell>
                          <TableCell className="text-center">{totals.remain_feed}</TableCell>
                        </TableRow>
                      )}
                    </>
                  ) : (
                    <TableRow>
                      <TableCell colSpan={columns.length} className="h-24 text-center">
                        لا توجد نتائج.
                      </TableCell>
                    </TableRow>
                  )}
                </TableBody>
              </Table>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
