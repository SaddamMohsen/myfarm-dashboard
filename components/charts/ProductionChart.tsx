"use client"

import * as React from "react"
import {  Loader2 } from "lucide-react"
import { Label, Pie, PieChart } from "recharts"
import { format } from "date-fns"
import { useRouter } from "next/navigation";
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import {
  ChartConfig,
  ChartContainer,
  ChartLegend,
  ChartLegendContent,
  ChartTooltip,
  ChartTooltipContent,
} from "@/components/ui/chart"
import { DatePicker } from "@/components/date-picker";

interface ChartProps {
  title: string;
  description: string;
  totalLabel: string;
  getData: (date: string) => Promise<any>;
  color?: string;
  date: Date;
}

export function ProductionChartComponent({
  title,
  description,
  totalLabel,
  getData,
  color,
  date
}: ChartProps) {
  const [chartData, setChartData] = React.useState<any[]>([])
  const [isLoading, setIsLoading] = React.useState(false)
  const router = useRouter();

  const chartConfig = {
    'استهلاك العلف': {
      label: chartData.map((item: any) => item.farmName),
      color: color,
      
    },
  } satisfies ChartConfig

  const handleClick = (farmId: any) => {
    console.log(farmId);
    console.log('date',date);
    router.push(`/reports/monthly/${farmId}?date=${date}`);
  }

  const fetchData = async () => {
    try {
      setIsLoading(true)
      const formattedDate = format(date, 'yyyy-MM-dd')
      const result = await getData(formattedDate)
      
      if (result) {
        const newChartData = result.map((item: any) => ({
          farmName: item.farmName,
          farmId: item.farmId,
          amount: item.amount,
          fill: `hsl(${Math.random() * 360}, 70%, 50%)`
        }))
        setChartData(newChartData)
      }
    } catch (error) {
      console.error("خطأ في جلب البيانات:", error)
    } finally {
      setIsLoading(false)
    }
  }

  React.useEffect(() => {
    fetchData()
  }, [date])

  const totalAmount = React.useMemo(() => {
    return chartData.reduce((acc, curr) => acc + curr.amount, 0)
  }, [chartData])

  return (
    <Card className="flex flex-col">
      <CardHeader className="flex flex-row items-center justify-center pb-2">
        <div className="space-y-1 text-center">
          <CardTitle>{title}</CardTitle>
          <CardDescription>{description}</CardDescription>
        </div>
      </CardHeader>
      <CardContent className="flex-1 pb-0 relative">
        {isLoading && (
          <div className="absolute inset-0 flex items-center justify-center bg-background/80 z-50">
            <Loader2 className="h-8 w-8 animate-spin text-primary" />
          </div>
        )}
        <ChartContainer
          config={chartConfig}
          className="mx-auto aspect-square max-h-[250px]"
        >
          <PieChart>
            <ChartTooltip
              cursor={false}
              content={<ChartTooltipContent />}
            />
            <Pie
              data={chartData}
              dataKey="amount"
              nameKey="farmName"
              innerRadius={60}
              outerRadius={100}
              cursor="pointer"
              strokeWidth={5}
              onClick={(_, index) => handleClick(chartData[index]?.farmId)}
              >
              <Label
                content={({ viewBox }) => {
                  if (viewBox && "cx" in viewBox && "cy" in viewBox) {
                    return (
                      <text
                        x={viewBox.cx}
                        y={viewBox.cy}
                        textAnchor="middle"
                        dominantBaseline="middle"
                      >
                        <tspan
                          x={viewBox.cx}
                          y={viewBox.cy}
                          className="fill-foreground text-3xl font-bold"
                        >
                          {totalAmount.toLocaleString()}
                        </tspan>
                        <tspan
                          x={viewBox.cx}
                          y={(viewBox.cy || 0) + 24}
                          className="fill-muted-foreground"
                        >
                          {totalLabel}
                        </tspan>
                      </text>
                    )
                  }
                }}
              />
            </Pie>
            <ChartLegend
              content={<ChartLegendContent payload={chartData} nameKey="farmName" />}
              className="-translate-y-2 flex-wrap gap-2 [&>*]:basis-1/4 [&>*]:justify-center"
            />
          </PieChart>
          
        </ChartContainer>
      </CardContent>
      <CardFooter className="flex-col gap-2 text-sm">
        <div className="flex items-center gap-2 font-medium leading-none">
        
          <span className="text-muted-foreground">إجمالي {title} للشهر الحالي</span>
        </div>
      </CardFooter>
    </Card>
  )
}

