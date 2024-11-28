"use client";
import { Farms } from "@/constants/types";
import { ColumnDef } from "@tanstack/react-table";
import { format } from "date-fns";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Button } from "@/components/ui/button";
import { Link, EyeIcon, ArrowDownRightIcon } from "lucide-react";

export const columns: ColumnDef<Farms, any>[] = [
  {
    accessorKey: "farm_name",
    header: "اسم المزرعة",
  },
  {
    accessorKey: "farm_type",
    header: "نوع المزرعة",
  },
  {
    accessorKey: "no_of_ambers",
    header: "عدد العنابر",
  },

  {
    accessorKey: "is_running",
    header: "الحالة",
    cell: ({ row }) => {
      let status = row.getValue("is_running");
      let formatted = status == true ? "شغاله" : "متوقفه";
      return <div className="text-center font-sm ">{formatted}</div>;
    },
    filterFn: (row, id, value) => {
      return value.includes(row.getValue(id));
    },
  },

  {
    accessorKey: "farm_start_date",
    header: "تاريخ بداية الدفعة",
    cell: ({ row }) => {
      let newDate = new Date(row.getValue("farm_start_date"));
      let formatted = format(newDate, "PPP");
      return <div className="text-center font-sm ">{formatted}</div>;
    },
    filterFn: (row, columnId, value) => {
      const date = new Date(row.getValue(columnId));

      if (!(date instanceof Date)) {
        console.error(
          `Value of column "${columnId}" is expected to be a date, but got ${date}`
        );
        return false;
      }

      const start = value.from;
      const end = value.to;

      if (
        !(start instanceof Date || start === undefined) ||
        !(end instanceof Date || end === undefined)
      ) {
        console.error(
          `Filter value of column "${columnId}" is expected to be an array of two dates, but got ${value}`
        );
        return false;
      }

      // If one filter defined and date is undefined, filter it
      if ((start || end) && !date) {
        return false;
      }

      if (start && !end) {
        return date.getTime() >= start.getTime();
      } else if (!start && end) {
        return date.getTime() <= end.getTime();
      } else if (start && end) {
        return (
          date.getTime() >= start.getTime() && date.getTime() <= end.getTime()
        );
      }

      return true;
    },
  },

  {
    accessorKey: "farm_end_date",
    header: "تاريخ نهاية الدفعه",
    cell: ({ row }) => {
      let newDate = new Date(row.getValue("farm_end_date"));
      let formatted = format(newDate, "PPP");
      return <div className="text-center font-semibold">{formatted}</div>;
    },
  },
  {
    id: "actions",
    header: "تعديل",
    cell: ({ row }) => {
      const report = row.original;

      return (
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button variant="ghost" className="h-8 w-8 p-0">
              <span className="sr-only">Open menu</span>
              <ArrowDownRightIcon className="h-6 w-6" />
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent
            align="center"
            className="w-[150px] bg-white text-muted p-0 ">
            <DropdownMenuLabel className="text-center">
              قائمة التعديل
            </DropdownMenuLabel>
            <DropdownMenuSeparator />
            <DropdownMenuItem className="flex flex-row-reverse space-y-4  gap-2 items-center justify-center hover:bg-slate-200 text-right cursor-pointer">
              <span className="flex flex-row space-y-4  gap-2 items-center justify-center">
                {" "}
                عرض التفاصيل
                <EyeIcon className="w-6 h-6" />{" "}
              </span>
            </DropdownMenuItem>
            {/* <DropdownMenuSeparator /> */}
            {/* <DropdownMenuItem>View Report</DropdownMenuItem>
        <DropdownMenuItem>Delete Report</DropdownMenuItem> */}
          </DropdownMenuContent>
        </DropdownMenu>
      );
    },
  },
];
