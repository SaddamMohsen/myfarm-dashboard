"use client";

import * as React from "react"
import { format } from "date-fns"
import { ar } from "date-fns/locale"
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Calendar } from "@/components/ui/calendar"
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover"
import { CalendarIcon } from "lucide-react"
import { ProductionChartComponent } from "@/components/charts/ProductionChart"
import { useGetProductionByDateMutation, useGetFeedConsumptionByDateMutation, useGetSummaryByDateMutation, useGetDailyReportMutation } from "@/lib/services/farms-api"
import { SummaryTable } from "@/components/tables/SummaryTable"
import { AmberDailyReport } from "@/components/tables/AmberDailyReport"
import {DatePicker} from "@/components/date-picker";

interface DatePickerProps {
  date: Date
  onSelect: (date: Date | undefined) => void
}


export default function DashboardContent() {
  const [date, setDate] = React.useState<Date>(new Date())
  const [getProduction] = useGetProductionByDateMutation()
  const [getFeedConsumption] = useGetFeedConsumptionByDateMutation()
  const [getSummary, { isLoading: isSummaryLoading }] = useGetSummaryByDateMutation()
  const [summaryData, setSummaryData] = React.useState<any[]>([])
  const [selectedFarmId, setSelectedFarmId] = React.useState<number | null>(null)
  const [dailyReportData, setDailyReportData] = React.useState<any[]>([])
  const [getDailyReport, { isLoading: isDailyReportLoading }] = useGetDailyReportMutation()

  const handleDateSelect = async (newDate: Date | undefined) => {
    if (!newDate) return
    setDate(newDate)
    try {
      const formattedDate = format(newDate, 'yyyy-MM-dd')
      const result = await getSummary({ date: formattedDate }).unwrap()
      if (result?.summary) {
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
        const formattedDate = format(date, 'yyyy-MM-dd')
        const result = await getDailyReport({ 
          date: formattedDate,
          farmId: farmId 
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

  return (
    <div className="flex-1 w-full flex flex-col gap-8 items-center">
      <div className="w-full">
        <div className="py-6 font-bold text-center">
          التقارير الرئيسية
        </div>
        <div className="flex justify-end px-4 py-2">
          <DatePicker date={date} onSelect={handleDateSelect} />
        </div>
        <div className="flex flex-row gap-4 w-full">
          <div className="w-full">
          <ProductionChartComponent
            key='2'
            title="استهلاك العلف"
            description="عرض استهلاك العلف الشهري"
            totalLabel="إجمالي العلف"
            date={date}
            color={`hsl(${Math.random() * 360}, 70%, 50%)`}
            getData={async (date) => {
              const result = await getFeedConsumption({ date }).unwrap()
              return result.feed_consumption
            }}
          />
          </div>
          <div className="w-full">
          <ProductionChartComponent
            key='1'
            title="الإنتاج"
            description="عرض الإنتاج الشهري"
            totalLabel="إجمالي الإنتاج"
             color={`hsl(${Math.random() * 360}, 30%, 50%)`}
            date={date}
            getData={async (date) => {
              const result = await getProduction({ date }).unwrap()
              return result.productions
            }}
          />
          </div>
         
        </div>
        <div className="px-4 mt-8">
          <SummaryTable 
            data={summaryData}
            isLoading={isSummaryLoading}
            onFarmSelect={handleFarmSelect}
          />
        </div>
      </div>

      {selectedFarmId && (
        <div className="px-4 mt-8 w-full">
          <AmberDailyReport 
            data={dailyReportData}
            isLoading={isDailyReportLoading}
            farmId={selectedFarmId}
            date={format(date, 'yyyy-MM-dd')}
          />
        </div>
      )}

      <footer className="w-full border-t border-t-foreground/10 p-8 flex justify-center text-center text-xs">
        <p>
          Powered by{" "}
          <a
            href="https://supabase.com/?utm_source=create-next-app&utm_medium=template&utm_term=nextjs"
            target="_blank"
            className="font-bold hover:underline"
            rel="noreferrer"
          >
            Saddam Escape
          </a>
        </p>
      </footer>
    </div>
  )
}