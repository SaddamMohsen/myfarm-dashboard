import React, { useMemo } from 'react';
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { ArrowUpDown } from "lucide-react";
import { Button } from "@/components/ui/button";
import { ColumnDef, flexRender, getCoreRowModel, getSortedRowModel, useReactTable } from "@tanstack/react-table";
import { format } from 'date-fns';

interface MonthlyReport {
   
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

interface MonthlyReportTableProps {
  table: any; // يمكنك تحديد نوع الجدول بشكل أكثر دقة إذا كان لديك نوع محدد
  reportData:MonthlyReport[],
  isLoading?:Boolean,
  onRowClick: (row: any) => void; // دالة عند النقر على الصف
}

const MonthlyReportTable: React.FC<MonthlyReportTableProps> = 
({ table,reportData,isLoading, onRowClick }) => {


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
  const monthTable = useReactTable({
    data: reportData,
    columns,
  // onSortingChange: setSorting,
       
   
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
    // state: {
    //   sorting,
    // },
  })

    const totals = useMemo(() => {
        if (reportData.length === 0) return null
        return {
          death: reportData.reduce((sum, row) => sum + row.death, 0),
          
          prod_egg_1: reportData.reduce((sum, row) => sum + row.prod_egg[1], 0),
          prod_egg_0: reportData.reduce((sum, row) => sum + row.prod_egg[0], 0),
         
          out_egg_1: reportData.reduce((sum, row) => sum + row.out_egg[1], 0),
          out_egg_0: reportData.reduce((sum, row) => sum + row.out_egg[0], 0),
         
          remain_egg_1: reportData.reduce((sum, row) => 0 + row.remain_egg[1], 0),
          remain_egg_0: reportData.reduce((sum, row) => 0 + row.remain_egg[0], 0),
          income_feed: reportData.reduce((sum, row) => sum + row.income_feed, 0),
          intak_feed: reportData.reduce((sum, row) => sum + row.intak_feed, 0),
          remain_feed: reportData.reduce((sum, row) => 0 + row.remain_feed, 0),
        }
      }, [reportData])
  return (
    <Table dir='rtl' >
      <TableHeader>
        {monthTable.getHeaderGroups().map((headerGroup: { id: React.Key | null | undefined; headers: any[]; }) => (
          <TableRow key={headerGroup.id} className="bg-gray-200">
            {headerGroup.headers.map((header: { id: React.Key | null | undefined; isPlaceholder: any; column: { columnDef: { header: string | number | boolean | React.ReactElement<any, string | React.JSXElementConstructor<any>> | Iterable<React.ReactNode> | React.ReactPortal | React.PromiseLikeOfReactNode | React.ComponentType<any> | null | undefined; }; }; getContext: () => any; }) => (
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
        {monthTable.getRowModel().rows.map((row: { id: React.Key | null | undefined; 
        getIsSelected: () => any; original: any; getVisibleCells: () => any[]; }) => (
          <TableRow
            key={row.id}
            data-state={row.getIsSelected() && "selected"}
            className="text-center font-sans hover:bg-gray-300/50 hover:cursor-pointer hover:font-bold"
            onClick={() => onRowClick(row.original)} // استدعاء الدالة عند النقر على الصف
          >
            {row.getVisibleCells().map((cell: { id: React.Key | null | undefined; column: { columnDef: { cell: string | number | boolean | React.ReactElement<any, string | React.JSXElementConstructor<any>> | Iterable<React.ReactNode> | React.ReactPortal | React.PromiseLikeOfReactNode | React.ComponentType<any> | null | undefined; }; }; getContext: () => any; }) => (
              <TableCell key={cell.id}>
                {flexRender(cell.column.columnDef.cell, cell.getContext())}
              </TableCell>
            ))}
          </TableRow>
        ))}
         {totals && (
                        <TableRow className="font-bold ">
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
      </TableBody>
    </Table>
  );
};

export default MonthlyReportTable; 