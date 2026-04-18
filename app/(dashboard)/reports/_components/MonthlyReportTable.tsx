import React, { useMemo } from "react"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import { ArrowLeft, ArrowRight, ArrowUpDown, SlidersHorizontal } from "lucide-react"
import { Button } from "@/components/ui/button"
import { ColumnDef, flexRender, getCoreRowModel, getSortedRowModel, useReactTable } from "@tanstack/react-table"
import { format } from "date-fns"

interface MonthlyReport {
  prod_date: string
  death: number
  income_feed: number
  intak_feed: number
  remain_feed: number
  prod_egg: number[]
  out_egg: number[]
  remain_egg: number[]
  remain_hen:number
  farm_name: string
}

interface MonthlyReportTableProps {
  table: any
  reportData: MonthlyReport[]
  isLoading?: boolean
  onRowClick: (row: any) => void
}

const MonthlyReportTable: React.FC<MonthlyReportTableProps> = ({ table: _table, reportData, onRowClick }) => {
  const columns = useMemo<ColumnDef<MonthlyReport>[]>(
    () => [
      {
        accessorKey: "prod_date",
        header: ({ column }) => (
          <Button
            className="h-auto px-0 text-[11px] font-bold uppercase tracking-widest text-[#8A97B7] hover:bg-transparent"
            variant="ghost"
            onClick={() => column.toggleSorting(column.getIsSorted() === "desc")}
          >
            Date
            <ArrowUpDown className="ml-1 h-3.5 w-3.5" />
          </Button>
        ),
        cell: ({ row }) => (
          <div className="flex flex-col items-start">
            <span className="font-manrope text-lg font-extrabold text-[#0F172A]">
              {format(new Date(row.getValue("prod_date")), "MMM dd, yyyy")}
            </span>
            <span className="font-inter text-xs text-[#8A97B7]">
              {format(new Date(row.getValue("prod_date")), "EEEE")}
            </span>
          </div>
        ),
      },
      {
        id:'total_hen',
        header:"نسبة الوفيات",
        cell:({row})=>{
          const hens= (Number(row.original.death) / Number(row.original.remain_hen));
          return <span className="font-manrope text-2xl font-extrabold text-[#0F172A]">{hens.toLocaleString()}%</span>
        }
      },
      {
        id: "total_collected",
        header: "اجمالي الانتاج",
        cell: ({ row }) => {
          const eggs = (Number(row.original.prod_egg[0]/12) + Number(row.original.prod_egg[1])).toFixed(1)
          return <span className="font-manrope text-2xl font-extrabold text-[#0F172A]">{eggs.toLocaleString()}</span>
        },
      },
      {
        id: "crates_full",
        header: "عدد الكراتين",
        cell: ({ row }) => <span className="font-inter text-lg text-[#334155]">{row.original.prod_egg[1].toLocaleString()}</span>,
      },
      {
        id: "trays_partial",
        header: "عدد الاطباق",
        cell: ({ row }) => <span className="font-inter text-lg text-[#334155]">{row.original.prod_egg[0].toLocaleString()}</span>,
      },
      {
        id: "outbound",
        header: "الخارج",
        cell: ({ row }) => {
          const outbound = (Number(row.original.out_egg[0]/12) + Number(row.original.out_egg[1])).toFixed(1)
          return <span className="font-manrope text-2xl font-extrabold text-[#0E8E3A]">{outbound.toLocaleString()}</span>
        },
      },
      {
        id: "remaining",
        header: "المتبقي",
        cell: ({ row }) => {
          const remaining = (Number(row.original.remain_egg[0]/12) + Number(row.original.remain_egg[1])).toFixed(1)
          return <span className="font-manrope text-2xl font-extrabold text-[#0F172A]">{remaining}</span>
        },
      },
      {
        id: "status",
        header: "الحاله",
        cell: ({ row }) => {
          const outbound = row.original.out_egg[0] + row.original.out_egg[1] * 30
          const verified = outbound > 0
          return (
            <span
              className={`inline-flex items-center rounded-full px-3 py-1 text-xs font-bold uppercase tracking-wide ${
                verified ? "bg-[#EAF7EE] text-[#0E8E3A]" : "bg-[#EAF0FF] text-[#5877A8]"
              }`}
            >
              <span className="mr-1.5 text-[10px]">●</span>
              {verified ? "Verified" : "Pending"}
            </span>
          )
        },
      },
    ],
    []
  )

  const monthTable = useReactTable({
    data: reportData,
    columns,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
  })

  const visibleRows = monthTable.getRowModel().rows
  const monthName = reportData[0] ? format(new Date(reportData[0].prod_date), "MMMM") : "this month"

  return (
    <div className="overflow-hidden rounded-3xl bg-[#F7F9FF]">
      <div className="flex items-center justify-between border-b border-[#E4EAF8] px-7 py-5">
        <div>
          <h3 className="font-manrope text-[32px] font-extrabold uppercase leading-none text-[#0F172A]">Daily Production Log</h3>
          <p className="mt-2 font-inter text-sm text-[#8A97B7]">Detailed breakdown of collection and outbound logistics.</p>
        </div>
        <Button className="h-11 rounded-xl border-0 bg-[#EAF0FF] px-4 font-inter text-xs font-bold uppercase tracking-wider text-[#5877A8] hover:bg-[#DFE8FF]">
          <SlidersHorizontal className="mr-2 h-3.5 w-3.5" />
          Toggle Filters
        </Button>
      </div>

      <Table>
        <TableHeader>
          {monthTable.getHeaderGroups().map((headerGroup) => (
            <TableRow key={headerGroup.id} className="border-b border-[#E4EAF8] bg-[#F2F5FD]">
              {headerGroup.headers.map((header) => (
                <TableHead key={header.id} className="h-10 px-6 text-center font-inter text-[11px] font-bold uppercase tracking-widest text-[#8A97B7]">
                  {header.isPlaceholder ? null : flexRender(header.column.columnDef.header, header.getContext())}
                </TableHead>
              ))}
            </TableRow>
          ))}
        </TableHeader>
        <TableBody>
          {visibleRows.map((row) => (
            <TableRow
              key={row.id}
              className="border-b border-[#E4EAF8] bg-white text-center transition-colors hover:bg-[#F8FAFF] hover:cursor-pointer"
              onClick={() => onRowClick(row.original)}
            >
              {row.getVisibleCells().map((cell) => (
                <TableCell key={cell.id} className="px-6 py-4 align-middle">
                  {flexRender(cell.column.columnDef.cell, cell.getContext())}
                </TableCell>
              ))}
            </TableRow>
          ))}
        </TableBody>
      </Table>

      <div className="flex items-center justify-between px-7 py-5">
        <p className="font-inter text-sm text-[#8A97B7]">
          Showing {visibleRows.length} of {reportData.length} days in {monthName}
        </p>
        <div className="flex items-center gap-3">
          <Button type="button" className="rounded-lg p-1.5 text-[#8A97B7] hover:bg-[#EAF0FF]">
            <ArrowLeft className="h-4 w-4" />
          </Button>
          <Button type="button" className="rounded-lg p-1.5 text-[#8A97B7] hover:bg-[#EAF0FF]">
            <ArrowRight className="h-4 w-4" />
          </Button>
        </div>
      </div>
    </div>
  )
}

export default MonthlyReportTable