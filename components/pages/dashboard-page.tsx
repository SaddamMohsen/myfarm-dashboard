"use client"

import * as React from "react"
import { format } from "date-fns"
import { Bell, Droplets, EyeIcon, Flame, Plus, ShieldAlert } from "lucide-react"
import { Button } from "@/components/ui/button"
import { useGetSummaryByDateMutation, useGetDailyReportMutation } from "@/lib/services/farms-api"
import { AmberDailyReport } from "@/components/tables/AmberDailyReport"
import { DatePicker } from "@/components/date-picker"
import { useRouter } from "next/navigation";

interface SummaryData {
  farmId: number
  farmName: string
  eggProductionCarton: number
  eggProductionTray: number
  remainingEggsCarton: number
  remainingEggsTray: number
  outEggsCarton: number
  outEggsTray: number
  incomFeed: number
  feedConsumption: number
  feedRemaining: number
}

export default function DashboardContent() {
  const [date, setDate] = React.useState<Date>(new Date())
  const [getSummary, { isLoading: isSummaryLoading }] = useGetSummaryByDateMutation()
  const [summaryData, setSummaryData] = React.useState<SummaryData[]>([])
  const [selectedFarmId, setSelectedFarmId] = React.useState<number | null>(null)
  const [dailyReportData, setDailyReportData] = React.useState<any[]>([])
  const [getDailyReport, { isLoading: isDailyReportLoading }] = useGetDailyReportMutation()
  const router = useRouter();

  const handleDateSelect = async (newDate: Date | undefined) => {
    if (!newDate) return
    setDate(newDate)
    try {
      const formattedDate = format(newDate, "yyyy-MM-dd")
      const result = await getSummary({ date: formattedDate }).unwrap()
      if (result?.summary) {
        console.log("Summary data for selected date:", result.summary)
        setSummaryData(result.summary)
      }
    } catch (error) {
      console.error("خطأ في جلب بيانات الملخص:", error)
    }
  }

  const handleFarmSelect = async (farmId: number) => {
    if (selectedFarmId === farmId) {
      setSelectedFarmId(null)
      setDailyReportData([])
      return
    }

    setSelectedFarmId(farmId)
    if (date && farmId) {
      try {
        const formattedDate = format(date, "yyyy-MM-dd")
        const result = await getDailyReport({
          date: formattedDate,
          farmId,
        }).unwrap()
        if (result?.ambers) {
          setDailyReportData(result.ambers)
        }
      } catch (error) {
        console.error("خطأ في جلب التقرير اليومي:", error)
      }
    }
  }

  React.useEffect(() => {
    handleDateSelect(date)
  }, [])

  const totals = React.useMemo(() => {
    return summaryData.reduce(
      (acc, row) => {
        acc.totalEggYield += row.eggProductionTray/12 + row.eggProductionCarton
        acc.feedOnHand += row.feedRemaining
        acc.feedConsumption += row.feedConsumption
        acc.remainingEggs += row.remainingEggsTray + row.remainingEggsCarton * 30
        return acc
      },
      { totalEggYield: 0, feedOnHand: 0, feedConsumption: 0, remainingEggs: 0 }
    )
  }, [summaryData])

  const weeklyBars = React.useMemo(() => {
    const base = totals.totalEggYield || 700
    return [0.62, 0.74, 0.66, 0.86, 0.7, 0.8, 0.94].map((ratio, index) => ({
      day: ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"][index],
      value: Math.max(120, Math.round((base / 7) * ratio)),
      active: index === 3,
    }))
  }, [totals.totalEggYield])

  const maxBarValue = React.useMemo(() => {
    return weeklyBars.reduce((max, item) => Math.max(max, item.value), 1)
  }, [weeklyBars])

  const stockRows = React.useMemo(() => {
    const totalFeed = totals.feedOnHand + totals.feedConsumption
    const safeTotal = totalFeed > 0 ? totalFeed : 1
    const main = Math.round((totals.feedOnHand / safeTotal) * 100)
    const second = Math.max(8, Math.round((totals.feedConsumption / safeTotal) * 100) - 20)
    const third = Math.max(10, 100 - main)
    return [
      { label: "Silo 01 (Starter Feed)", value: main, color: "bg-[#0E8E3A]", status: "text-[#0E8E3A]" },
      { label: "Silo 02 (Layer Feed)", value: second, color: "bg-[#AE0010]", status: "text-[#AE0010]" },
      { label: "Silo 03 (Organic Mix)", value: third, color: "bg-[#004AC6]", status: "text-[#004AC6]" },
    ]
  }, [totals.feedConsumption, totals.feedOnHand])

  return (
    <div className="min-h-screen w-full bg-[#F8F9FF] px-4 py-6 md:px-8">
      <div className="mx-auto max-w-7xl space-y-6">
        <div className="flex flex-col justify-between gap-4 md:flex-row md:items-center">
          <div>
            <h1 className="font-manrope text-4xl font-extrabold text-[#121C28]">نظرة عامة</h1>
            <p className="mt-2 flex items-center gap-2 font-inter text-sm text-slate-600">
              <span className="inline-flex h-2 w-2 rounded-full bg-[#0E8E3A]" />
              System live: All sensors transmitting normally
            </p>
          </div>
          <div className="flex items-center gap-3">
            <Button size="icon" className="h-10 w-10 rounded-xl border-0 bg-white text-slate-600 hover:bg-white/90">
              <Bell className="h-4 w-4" />
            </Button>
            <DatePicker date={date} onSelect={handleDateSelect} />
          </div>
        </div>

        <section className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
          <article className="rounded-2xl bg-white p-5">
            <p className="font-inter text-xs uppercase tracking-widest text-slate-500">عدد القطعان</p>
            <p className="mt-3 font-manrope text-4xl font-extrabold text-[#004AC6]">{summaryData.length.toLocaleString()}</p>
            <p className="mt-2 font-inter text-sm font-semibold text-[#0E8E3A]">Stable growth</p>
          </article>
          <article className="rounded-2xl bg-white p-5">
            <p className="font-inter text-xs uppercase tracking-widest text-slate-500">الانتاج اليومي</p>
            <p className="mt-3 font-manrope text-4xl font-extrabold text-[#121C28]">{Math.round(totals.totalEggYield ).toLocaleString()}</p>
            <p className="mt-2 font-inter text-sm font-semibold text-[#0E8E3A]">+2% vs yesterday</p>
          </article>
          <article className="rounded-2xl bg-white p-5">
            <p className="font-inter text-xs uppercase tracking-widest text-slate-500">الغذاء الموجود</p>
            <p className="mt-3 font-manrope text-4xl font-extrabold text-[#121C28]">{totals.feedOnHand.toLocaleString()}</p>
            <p className="mt-2 font-inter text-sm font-semibold text-[#AE0010]">إعادة التعبئة في 3 أيام</p>
          </article>
          <article className="rounded-2xl bg-white p-5">
            <p className="font-inter text-xs uppercase tracking-widest text-slate-500">معدل الوفاة</p>
            <p className="mt-3 font-manrope text-4xl font-extrabold text-[#121C28]">0.05%</p>
            <p className="mt-2 font-inter text-sm font-semibold text-[#0E8E3A]">Below threshold</p>
          </article>
        </section>

        <section className="grid gap-4 xl:grid-cols-12">
          <article className="rounded-2xl bg-white p-6 xl:col-span-8">
            <div className="mb-6 flex items-center justify-between">
              <div>
                <h2 className="font-manrope text-3xl font-bold text-[#121C28]">معدلات الانتاج الاسبوعي</h2>
                <p className="font-inter text-sm text-slate-500">كمية الانتاج لكل القطعان</p>
              </div>
              <div className="flex items-center gap-2">
                <span className="rounded-md bg-[#EAF0FF] px-3 py-1 font-inter text-xs font-bold text-[#004AC6]">الاسبوعي</span>
                <span className="px-2 font-inter text-xs font-bold text-slate-400">شهري</span>
              </div>
            </div>
            <div className="grid h-65 grid-cols-7 items-end gap-3">
              {weeklyBars.map((bar) => (
                <div key={bar.day} className="flex h-full flex-col items-center justify-end gap-3">
                  <div
                    className={`w-full rounded-md ${bar.active ? "bg-[#004AC6]" : "bg-[#DCE6F8]"}`}
                    style={{ height: `${Math.max(28, Math.min(100, (bar.value / maxBarValue) * 100))}%` }}
                  />
                  <span className="font-inter text-[11px] font-bold text-slate-400">{bar.day}</span>
                </div>
              ))}
            </div>
          </article>

          <article className="rounded-2xl bg-[#EEF4FF] p-6 xl:col-span-4">
            <h3 className="font-manrope text-3xl font-bold text-[#121C28]">Biosecurity Feed</h3>
            <div className="mt-6 space-y-4">
              <div className="flex gap-3 rounded-xl bg-white p-3">
                <div className="mt-1 rounded-lg bg-[#EAF7EE] p-2 text-[#0E8E3A]"><Droplets className="h-4 w-4" /></div>
                <div>
                  <p className="font-inter font-bold text-[#121C28]">Zone B Sanitized</p>
                  <p className="font-inter text-xs text-slate-500">Automated cleanup complete</p>
                </div>
              </div>
              <div className="flex gap-3 rounded-xl bg-white p-3">
                <div className="mt-1 rounded-lg bg-[#FDECEF] p-2 text-[#AE0010]"><Flame className="h-4 w-4" /></div>
                <div>
                  <p className="font-inter font-bold text-[#121C28]">Temp Anomaly Coop-{selectedFarmId || 4}</p>
                  <p className="font-inter text-xs text-slate-500">Spike of 2.4°C detected</p>
                </div>
              </div>
              <div className="flex gap-3 rounded-xl bg-white p-3">
                <div className="mt-1 rounded-lg bg-[#EAF0FF] p-2 text-[#004AC6]"><ShieldAlert className="h-4 w-4" /></div>
                <div>
                  <p className="font-inter font-bold text-[#121C28]">Shift Change</p>
                  <p className="font-inter text-xs text-slate-500">Supervisor logged in</p>
                </div>
              </div>
            </div>
            <Button variant="outline" className="mt-6 h-11 w-full rounded-xl border-0 bg-white font-inter text-[#004AC6] hover:bg-white/80">
              View All Protocols
            </Button>
          </article>
        </section>

        <section className="grid gap-4 xl:grid-cols-12">
          <article className="rounded-2xl bg-white p-6 xl:col-span-7">
            <div className="mb-5 flex items-center justify-between">
              <h3 className="font-manrope text-3xl font-bold text-[#121C28]">Flock Health Status</h3>
              <span className="font-inter text-xs uppercase tracking-widest text-slate-400">Real-time metrics</span>
            </div>
            <div className="space-y-3">
              <div className="grid grid-cols-5 gap-3 font-inter text-xs font-bold uppercase tracking-widest text-slate-400">
                <span>المزرعة</span>
                <span>الانتاج</span>
                <span>نسبة الانتاج</span>
                <span>الحاله</span>
                <span>الاجراءات</span>
              </div>
              {summaryData.slice(0, 5).map((farm, index) => {
                const score = Math.max(65, 100 - index * 8)
                const status = score > 90 ? "OPTIMAL" : score > 80 ? "OBSERVING" : "REVIEW"
                const tone =
                  status === "OPTIMAL"
                    ? "bg-[#EAF7EE] text-[#0E8E3A]"
                    : status === "OBSERVING"
                      ? "bg-[#EAF0FF] text-[#004AC6]"
                      : "bg-[#FDECEF] text-[#AE0010]"
                return (
                  <button
                    key={farm.farmId}
                    type="button"
                    className="grid w-full grid-cols-5 gap-3 rounded-xl bg-[#F8F9FF] px-3 py-3 text-left font-inter hover:bg-[#EEF4FF]"
                  >
                    <span  onClick={() => handleFarmSelect(farm.farmId)} className="font-bold text-[#121C28] cursor-pointer">{farm.farmName}</span>
                    <span className="text-slate-700">{(farm.eggProductionTray/12 + farm.eggProductionCarton ).toLocaleString()}</span>
                    <span className="text-slate-700">{score}%</span>
                    <span className={`w-fit rounded-full px-2 py-1 text-xs font-bold ${tone}`}>{status}</span>
                    <span className=" text-right text-xs text-slate-500">
                      <Button
                       type="button"
                        className="flex  rounded-2xl cursor-pointer"
                       onClick={()=>  router.push(`/reports/monthly/${farm.farmId}?date=${date}`)}
                       >
                      <EyeIcon className=" h-4 w-4" />
                     
                      </Button>
                      </span>
                  </button>
                )
              })}
            </div>
          </article>

          <article className="rounded-2xl bg-white p-6 xl:col-span-5">
            <h3 className="font-manrope text-3xl font-bold text-[#121C28]">Feed Stock Inventory</h3>
            <div className="mt-6 space-y-5">
              {stockRows.map((row) => (
                <div key={row.label}>
                  <div className="mb-2 flex items-center justify-between font-inter text-sm">
                    <span className="font-semibold text-[#121C28]">{row.label}</span>
                    <span className={`font-bold ${row.status}`}>{row.value}%</span>
                  </div>
                  <div className="h-3 overflow-hidden rounded-full bg-[#DCE6F8]">
                    <div className={`h-full rounded-full ${row.color}`} style={{ width: `${Math.min(100, Math.max(4, row.value))}%` }} />
                  </div>
                </div>
              ))}
            </div>
            <Button className="mt-8 h-12 w-full rounded-xl bg-linear-to-r from-[#004AC6] to-[#2563EB] font-inter text-base text-white hover:opacity-95">
              Order Refill Stock
            </Button>
          </article>
        </section>

        <button
          type="button"
          className="fixed bottom-8 right-8 flex h-14 w-14 items-center justify-center rounded-2xl bg-[#004AC6] text-white shadow-[0_20px_40px_rgba(18,28,40,0.12)]"
        >
          <Plus className="h-7 w-7" />
          اضافة
        </button>

        {isSummaryLoading && (
          <div className="rounded-2xl bg-[#EEF4FF] p-4 font-inter text-sm text-slate-600">
            Loading latest dashboard metrics...
          </div>
        )}

        {selectedFarmId && (
          <div className="rounded-2xl bg-[#EEF4FF] p-4">
            <AmberDailyReport
              data={dailyReportData}
              isLoading={isDailyReportLoading}
              farmId={selectedFarmId}
              date={format(date, "yyyy-MM-dd")}
            />
          </div>
        )}
      </div>
    </div>
  )
}