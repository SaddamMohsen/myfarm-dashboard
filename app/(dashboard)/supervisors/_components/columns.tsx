"use client"

import { ColumnDef } from "@tanstack/react-table"
import { ArrowUpDown, MoreHorizontal } from 'lucide-react'
import { Button } from "@/components/ui/button"

export type SuperVisor = {
  name: string;
  id: string;
  uuid: string;
  phone_numbers: number;
  details: string;
  farms:[];
}

export const columns: ColumnDef<SuperVisor>[] = [
  {
    accessorKey: "name",
    header: ({ column }) => {
      return (
        <Button
        className="border border-slate-500 text-base antialiased bg-slate-50 text-center font-semibold text-black"
          variant="ghost"
          onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
        >
          الاسم
          <ArrowUpDown className="ml-2 h-4 w-4" />
        </Button>
      )
    },
  },
//   {
//     accessorKey: "id",
//     header: "الرقم",
//   },
  {
    accessorKey: "u_id",
    header: "معرف المستخدم",
  },
  {
    accessorKey: "phone_numbers",
    header: "رقم التلفون",
  },
//   {
//     accessorKey: "details",
//     header: "تفاصيل ",
//   },
    {
    accessorKey: "farms",
    header:"تفاصيل ",
    cell:({row})=>{
        const farms=row.getValue('farms') as Record<string,any>;
      //  console.log(farms[0].farm_name);
      if(farms){
        const farm=farms[0];
        if(farm)
         return <div className="text-xl text-amber-800 font-normal">{` مشرف مزرعة ${farm.farm_name}`}</div>
      }
      return <div className="text-xl text-red-500 font-normal">{` غير مضاف لأي مزرعة`}</div>
    }  
  },
]

