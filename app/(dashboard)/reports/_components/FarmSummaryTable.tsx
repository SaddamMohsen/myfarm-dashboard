
import React,{useMemo} from "react";
import { ColumnDef, flexRender, getCoreRowModel, getSortedRowModel, useReactTable } from "@tanstack/react-table";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Button } from "@/components/ui/button";
import { ArrowUpDown } from "lucide-react";


export interface ProductionSummary {
    farm_name: string;
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

interface FarmSummaryTableProps {
    summaryData: ProductionSummary[];
}

// const fieldLabels: { [K in keyof ProductionSummary]: string } = {
//     total_prod_carton: "Total Production (Carton)",
//     total_prod_tray: "Total Production (Tray)",
//     total_out_carton: "Total Out (Carton)",
//     total_out_tray: "Total Out (Tray)",
//     total_death: "Total Death",
//     total_incom_feed: "Total Incoming Feed",
//     total_intak_feed: "Total Intake Feed",
//     total_remain_feed: "Total Remaining Feed",
//     days_count: "Days Count",
//     remaining_hens: "Remaining Hens",
// };

export const FarmSummaryTable: React.FC<FarmSummaryTableProps> = ({ summaryData }) => {
  
    const columns = useMemo<ColumnDef<ProductionSummary>[]>(
    () => [
      {
        accessorKey: "farm_name",
        header: ({ column }) => {
            return (
              <Button
              className="border-1 border-slate-500 text-base antialiased text-center font-semibold text-black"
                variant="ghost"
                onClick={() => column.toggleSorting(column.getIsSorted() === "desc")}
              >
                المزرعة
                <ArrowUpDown className="ml-2 h-4 w-4" />
              </Button>
            )
          },
        cell: ({ row }) => row.getValue("farm_name")
        
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
        header:`إنتاج البيض (طبق)`,
        cell: ({ row }) => <div className="text-center flex flex-row items-center justify-center">
        <img src='/img/tray.ico' alt='egg' className='w-12 h-12' />
        {row.getValue<number>("total_prod_tray")}
        </div>,
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
    //   {
    //     accessorKey: "remain_egg",
    //     header: "البيض المتبقي (طبق)",
    //     cell: ({ row }) => <div className="text-center">{row.getValue<number[]>("remain_egg")[0]}</div>,
    //   },
    //   {
    //     accessorKey: "remain_egg_carton",
    //     header: "البيض المتبقي (كرتون)",
    //     cell: ({ row }) => <div className="text-center">{row.getValue<number[]>("remain_egg")[1]}</div>,
    //   },
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
  )
    const summaryTable = useReactTable({
      data: summaryData,
      columns,
    // onSortingChange: setSorting,
         
     
      getCoreRowModel: getCoreRowModel(),
      getSortedRowModel: getSortedRowModel(),
      // state: {
      //   sorting,
      // },
    })
    return(
   <Table dir='rtl' className='bg-white'>
         <TableHeader>
           {summaryTable.getHeaderGroups().map((headerGroup: { id: React.Key | null | undefined; headers: any[]; }) => (
             <TableRow key={headerGroup.id} className="bg-gray-500 hover:bg-black-600">
               {headerGroup.headers.map((header: { id: React.Key | null | undefined; isPlaceholder: any; column: { columnDef: { header: string | number | boolean  }; }; getContext: () => any; }) => (
                 <TableHead key={header.id} className="text-center text-slate-50 font-bold font-sans">
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
           {summaryTable.getRowModel().rows.map((row: { id: React.Key | null | undefined; 
           getIsSelected: () => any; original: any; getVisibleCells: () => any[]; }) => (
             <TableRow
               key={row.id}
               data-state={row.getIsSelected() && "selected"}
               className="text-center font-sans hover:bg-gray-100/50 hover:cursor-pointer hover:font-bold"
               //onClick={() => onRowClick(row.original)} // استدعاء الدالة عند النقر على الصف
             >
               {row.getVisibleCells().map((cell: { id: React.Key | null | undefined; column: { columnDef: { cell: string | number | boolean | React.ReactElement<any, string | React.JSXElementConstructor<any>> | Iterable<React.ReactNode> | React.ReactPortal | React.PromiseLikeOfReactNode | React.ComponentType<any> | null | undefined; }; }; getContext: () => any; }) => (
                 <TableCell key={cell.id}>
                   {flexRender(cell.column.columnDef.cell, cell.getContext())}
                 </TableCell>
               ))}
             </TableRow>
             
           ))} </TableBody>
                 </Table>
);
}