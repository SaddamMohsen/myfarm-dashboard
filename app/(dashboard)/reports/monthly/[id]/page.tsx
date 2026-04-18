"use client"

import React, { useEffect, useMemo, useState } from "react"
import { format } from "date-fns"
import { ar } from "date-fns/locale"
import { useGetMonthlyReportMutation, useGetDailyReportMutation } from "@/lib/services/farms-api"
import { ArrowUpDown } from "lucide-react"
import {
  ColumnDef,
  getCoreRowModel,
  useReactTable,
  getSortedRowModel,
  SortingState,
} from "@tanstack/react-table"
import { Button } from "@/components/ui/button"
import { AmberDailyReport } from "@/components/tables/AmberDailyReport"
import MonthlyReportTable from "../../_components/MonthlyReportTable"
import Loader from "@/components/loader"
import { Calendar } from "@/components/ui/calendar"

 


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
  const [date, setDate] = React.useState<Date | undefined>(new Date())
  const [reportData, setReportData] = useState<MonthlyReport[]>([])
  const [sorting, setSorting] = useState<SortingState>([])
  const [getMonthlyReport, { isLoading }] = useGetMonthlyReportMutation()
  const [selectedRow, setSelectedRow] = useState<MonthlyReport | null>(null)
  const [dailyReportData, setDailyReportData] = useState<any[]>([])
  const [getDailyReport, { isLoading: isDailyReportLoading }] = useGetDailyReportMutation()
  const columns = useMemo<ColumnDef<MonthlyReport>[]>(
    () => [
      {
        accessorKey: "prod_date",
        header: ({ column }) => {
            return (
              <Button
              className="border border-slate-500 text-base antialiased text-center font-semibold text-black"
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

  const fetchReport = async (selectedDate: Date|undefined) => {
    try {
      const result = await getMonthlyReport({
        farmId: params.id,
        date: format(selectedDate??new Date(), 'yyyy-MM-dd')
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

  const monthLabel = useMemo(() => {
    if (!date) return ""
    return format(date, "MMMM yyyy")
  }, [date])

  const kpiCards = useMemo(() => {
    const totalEggs = (totals?.prod_egg_0??0)/12 + (totals?.prod_egg_1 ?? 0)
    const totalOut = (totals?.out_egg_0 ?? 0) + (totals?.out_egg_1 ?? 0)
    const totalRemain = (totals?.remain_egg_0 ?? 0)/12 + (totals?.remain_egg_1 ?? 0)
    const avgDailyYield = reportData.length ? Math.round(totalEggs / reportData.length) : 0
   //TODO replace total eggs with total hens
    const lossRate = totalEggs ? ((totals?.death ?? 0) / totalEggs) * 100 : 0

    return [
      {
        label: "إجمالي البيض",
        value: totalEggs.toLocaleString(),
        hint: "شهري",
        trend: "+4.2%",
        tone: "text-[#006E2D] bg-[#EAF7EE]",
      },
      {
        label: "متوسط الإنتاج اليومي",
        value: avgDailyYield.toLocaleString(),
        hint: "بيضة / يوم",
        trend: "+2.1%",
        tone: "text-[#006E2D] bg-[#EAF7EE]",
      },
      {
        label: "الفاقد / النافق",
        value: `${lossRate.toFixed(2)}%`,
        hint: "مقارنة بالإنتاج",
        trend: "-0.8%",
        tone: "text-[#AE0010] bg-[#FDECEF]",
      },
      {
        label: "المخزون المتبقي",
        value: totalRemain.toLocaleString(),
        hint: "جاهز للتوزيع",
        trend: `${totalOut.toLocaleString()} خارج`,
        tone: "text-[#004AC6] bg-[#EAF0FF]",
      },
    ]
  }, [reportData.length, totals?.death, totals?.out_egg_0, totals?.out_egg_1, totals?.prod_egg_0, totals?.prod_egg_1, totals?.remain_egg_0, totals?.remain_egg_1])

  return (
    <div className="min-h-screen bg-[#F8F9FF] px-4 py-8 md:px-8" dir="rtl">
      <div className="mx-auto max-w-7xl space-y-8">
        <section className="rounded-3xl bg-[#EEF4FF] p-6 md:p-8">
          <div className="flex flex-col gap-6">
            <div className="flex flex-col justify-between gap-4 md:flex-row md:items-start">
              <div className="space-y-2">
                <p className="font-inter text-xs uppercase tracking-[0.12em] text-slate-500">EGG PRODUCTION REPORTS</p>
                <h1 className="font-manrope text-3xl font-extrabold text-[#121C28] md:text-4xl">
                  التقرير الشهري - {reportData[0]?.farm_name || "المزرعة"}
                </h1>
                <p className="font-inter text-sm text-slate-600">تحليل الإنتاج والمخزون بشكل لحظي وفق نموذج.</p>
              </div>
              <div className="flex flex-wrap gap-3">
                <Button
                  variant="outline"
                  className="h-11 rounded-xl border-0 bg-white/70 px-5 font-inter text-sm text-[#004AC6] backdrop-blur-sm hover:bg-white"
                >
                  طباعة التقرير
                </Button>
                <Button className="h-11 rounded-xl bg-linear-to-r from-[#004AC6] to-[#2563EB] px-5 font-inter text-sm text-white hover:opacity-95">
                  تصدير CSV
                </Button>
              </div>
            </div>

            <div className="grid gap-4 md:grid-cols-2">
              <div className="rounded-2xl bg-white p-4">
                <p className="mb-2 font-inter text-[11px] uppercase tracking-widest text-slate-500">Farm / Location</p>
                <p className="font-inter text-sm font-semibold text-[#121C28]">{reportData[0]?.farm_name }</p>
              </div>
              <div className="rounded-2xl bg-white p-4">
                <p className="mb-2 font-inter text-[11px] uppercase tracking-widest text-slate-500">Reporting Period</p>
                <div className="flex items-center justify-between gap-3">
                  <p className="font-inter text-sm font-semibold text-[#121C28]">{monthLabel}</p>
                  <Calendar
                    mode="single"
                    selected={date}
                    onSelect={(newDate) => newDate && setDate(newDate)}
                    onMonthChange={(newDate) => newDate && setDate(newDate)}
                    locale={ar}
                    captionLayout="dropdown-months"
                    className="rounded-xl bg-[#F8F9FF] p-1 [&_.rdp-day]:hidden [&_.rdp-week]:hidden [&_.rdp-weekdays]:hidden"
                  />
                </div>
              </div>
            </div>

            <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
              {kpiCards.map((kpi) => (
                <article key={kpi.label} className="rounded-2xl bg-white p-5">
                  <div className="mb-4 flex items-center justify-between">
                    <p className="font-inter text-[11px] uppercase tracking-widest text-slate-500">{kpi.label}</p>
                    <span className={`rounded-full px-2.5 py-1 text-xs font-semibold ${kpi.tone}`}>{kpi.trend}</span>
                  </div>
                  <p className="font-manrope text-3xl font-extrabold leading-none text-[#121C28]">{kpi.value}</p>
                  <p className="mt-2 font-inter text-xs text-slate-500">{kpi.hint}</p>
                </article>
              ))}
            </div>
          </div>
        </section>

        <section className="rounded-3xl bg-[#EEF4FF] p-4 md:p-6">
          {isLoading ? (
            <div className="flex items-center justify-center p-10">
              <Loader />
            </div>
          ) : (
            <div className="rounded-2xl bg-white p-3 md:p-4">
              <MonthlyReportTable table={table} reportData={reportData} onRowClick={handleRowClick} />
            </div>
          )}
        </section>

        {dailyReportData && selectedRow && (
          <section className="rounded-3xl bg-[#EEF4FF] p-4 md:p-6">
            <div className="rounded-2xl bg-white p-3 md:p-4">
              <AmberDailyReport
                data={dailyReportData}
                isLoading={isDailyReportLoading}
                farmId={parseInt(params.id)}
                date={format(new Date(selectedRow?.prod_date), "yyyy-MM-dd")}
              />
            </div>
          </section>
        )}
      </div>
    </div>
  )
}
