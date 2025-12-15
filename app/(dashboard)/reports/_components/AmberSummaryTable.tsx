import React, { useMemo } from "react";
import { ColumnDef, flexRender, getCoreRowModel, getSortedRowModel, useReactTable } from "@tanstack/react-table";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
  TableFooter,
} from "@/components/ui/table";
import { Button } from "@/components/ui/button";
import { ArrowUpDown } from "lucide-react";

export interface AmberProductionSummary {
  amber_id: number;
  total_prod_carton: number;
  total_prod_tray: number;
  total_out_carton: number;
  total_out_tray: number;
  total_death: number;
  total_incom_feed: number;
  total_intak_feed: number;
  total_remain_feed: number;
  days_count: number;
  remaining_hens: number;
}

interface AmberSummaryTableProps {
  summaryData: AmberProductionSummary[];
  overallSummary?: {
    total_prod_carton: number;
    total_prod_tray: number;
    total_out_carton: number;
    total_out_tray: number;
    total_death: number;
    total_incom_feed: number;
    total_intak_feed: number;
    total_remain_feed: number;
    total_remaining_hens: number;
    days_count: number;
  };
}

export const AmberSummaryTable: React.FC<AmberSummaryTableProps> = ({ summaryData, overallSummary }) => {
  const columns = useMemo<ColumnDef<AmberProductionSummary>[]>(
    () => [
      {
        accessorKey: "amber_id",
        header: ({ column }) => {
          return (
            <Button
              className="border border-slate-500 text-base antialiased text-center font-semibold text-black"
              variant="ghost"
              onClick={() => column.toggleSorting(column.getIsSorted() === "desc")}
            >
              العنبر
              <ArrowUpDown className="ml-2 h-4 w-4" />
            </Button>
          );
        },
        cell: ({ row }) => <div className="text-center font-medium">عنبر {row.getValue("amber_id")}</div>,
      },
      {
        accessorKey: "total_death",
        header: "النافق",
        cell: ({ row }) => <div className="text-center">{row.getValue("total_death")}</div>,
      },
      {
        accessorKey: "remaining_hens",
        header: "عدد الدجاج",
        cell: ({ row }) => <div className="text-center">{row.getValue("remaining_hens")}</div>,
      },
      {
        accessorKey: "total_prod_tray",
        header: "إنتاج البيض (طبق)",
        cell: ({ row }) => (
          <div className="text-center flex flex-row items-center justify-center gap-1">
            <img src="/img/tray.ico" alt="egg" className="w-8 h-8" />
            {row.getValue<number>("total_prod_tray")}
          </div>
        ),
      },
      {
        accessorKey: "total_prod_carton",
        header: "إنتاج البيض (كرتون)",
        cell: ({ row }) => <div className="text-center">{row.getValue("total_prod_carton")}</div>,
      },
      {
        accessorKey: "total_out_tray",
        header: "البيض الخارج (طبق)",
        cell: ({ row }) => <div className="text-center">{row.getValue("total_out_tray")}</div>,
      },
      {
        accessorKey: "total_out_carton",
        header: "البيض الخارج (كرتون)",
        cell: ({ row }) => <div className="text-center">{row.getValue("total_out_carton")}</div>,
      },
      {
        accessorKey: "total_incom_feed",
        header: "العلف الوارد",
        cell: ({ row }) => <div className="text-center">{row.getValue("total_incom_feed")}</div>,
      },
      {
        accessorKey: "total_intak_feed",
        header: "استهلاك العلف",
        cell: ({ row }) => <div className="text-center">{row.getValue("total_intak_feed")}</div>,
      },
      {
        accessorKey: "total_remain_feed",
        header: "المتبقي من العلف",
        cell: ({ row }) => <div className="text-center">{row.getValue("total_remain_feed")}</div>,
      },
    ],
    []
  );

  const summaryTable = useReactTable({
    data: summaryData,
    columns,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
  });

  return (
    <Table dir="rtl">
      <TableHeader>
        {summaryTable.getHeaderGroups().map((headerGroup) => (
          <TableRow key={headerGroup.id} className="bg-gray-500 hover:bg-gray-600">
            {headerGroup.headers.map((header) => (
              <TableHead key={header.id} className="text-center text-slate-50 font-bold font-sans">
                {header.isPlaceholder
                  ? null
                  : flexRender(header.column.columnDef.header, header.getContext())}
              </TableHead>
            ))}
          </TableRow>
        ))}
      </TableHeader>
      <TableBody>
        {summaryTable.getRowModel().rows.map((row) => (
          <TableRow
            key={row.id}
            data-state={row.getIsSelected() && "selected"}
            className="text-center font-sans hover:bg-gray-100/50 hover:cursor-pointer"
          >
            {row.getVisibleCells().map((cell) => (
              <TableCell key={cell.id}>
                {flexRender(cell.column.columnDef.cell, cell.getContext())}
              </TableCell>
            ))}
          </TableRow>
        ))}
        {/* Totals Row */}
        {overallSummary && (
          <TableRow className="bg-emerald-100 font-bold border-t-2 border-emerald-400 hover:bg-emerald-200">
            <TableCell className="text-center font-bold bg-emerald-200">اجماليات</TableCell>
            <TableCell className="text-center font-bold">{overallSummary.total_death || 0}</TableCell>
            <TableCell className="text-center font-bold">{overallSummary.total_remaining_hens || 0}</TableCell>
            <TableCell className="text-center font-bold">
              <div className="flex items-center justify-center gap-1">
                <img src="/img/tray.ico" alt="egg" className="w-8 h-8" />
                {overallSummary.total_prod_tray || 0}
              </div>
            </TableCell>
            <TableCell className="text-center font-bold">{overallSummary.total_prod_carton || 0}</TableCell>
            <TableCell className="text-center font-bold">{overallSummary.total_out_tray || 0}</TableCell>
            <TableCell className="text-center font-bold">{overallSummary.total_out_carton || 0}</TableCell>
            <TableCell className="text-center font-bold">{overallSummary.total_incom_feed || 0}</TableCell>
            <TableCell className="text-center font-bold">{overallSummary.total_intak_feed || 0}</TableCell>
            <TableCell className="text-center font-bold">{overallSummary.total_remain_feed || 0}</TableCell>
          </TableRow>
        )}
      </TableBody>
    </Table>
  );
};
