"use client";

import {
  ColumnDef,
  ColumnFiltersState,
  flexRender,
  getCoreRowModel,
  getFilteredRowModel,
  getPaginationRowModel,
  useReactTable,
} from "@tanstack/react-table";

import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import React from "react";

interface DataTableProps<TData, TValue> {
  columns: ColumnDef<TData, TValue>[];
  data: TData[]|any;
}

export function FarmsDataTable<TData, TValue>({
  columns,
  data,
}: DataTableProps<TData, TValue>) {
  const [columnFilters, setColumnFilters] = React.useState<ColumnFiltersState>(
    []
  );
  const table = useReactTable({
    data,
    columns,
    state: {
      columnFilters,
    },
    getFilteredRowModel: getFilteredRowModel(),
    onColumnFiltersChange: setColumnFilters,
    getCoreRowModel: getCoreRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
  });

  return (
    <div className="  flex w-full flex-col   md:p-4">
      <h1 className={` mb-8 text-xl md:text-2xl`}>قائمة المزارع</h1>
      <div className=" mt-6  flow-root md:w-full w-auto">
        <div className="overflow-x-auto">
          <div className="inline-grid md:min-w-full w-auto align-middle">
            <div className="relative overflow-hidden w-full border-2 ring-1 ring-slate-500 border-slate-300 rounded-lg bg-gray-400  md:pt-0">
              <Table className="relative border-2 ring-1 ring-slate-500 border-slate-300 md:w-full rounded-md bg-white px-0">
                <TableHeader className="relative md:contents md:content-stretch w-auto  justify-stretch md:min-w-fit border-b  hover:bg-slate-100">
                  {table.getHeaderGroups().map((headerGroup) => (
                    <TableRow
                      className="flex-none border border-slate-700 justify-center justify-self-center hover:p-5"
                      key={headerGroup.id}>
                      {headerGroup.headers.map((header) => {
                        return (
                          <TableHead
                            className="border border-slate-500 text-base antialiased bg-slate-50 text-center font-semibold text-black"
                            key={header.id}>
                            {header.isPlaceholder
                              ? null
                              : flexRender(
                                  header.column.columnDef.header,
                                  header.getContext()
                                )}
                          </TableHead>
                        );
                      })}
                    </TableRow>
                  ))}
                </TableHeader>
                <TableBody>
                  {table.getRowModel().rows?.length ? (
                    table.getRowModel().rows.map((row) => (
                      <TableRow
                        className="border cursor-pointer content-center self-center font-semibold border-black items-center hover:ring-2 hover:ring-blue"
                        key={row.id}
                        data-state={row.getIsSelected() && "selected"}>
                        {row.getVisibleCells().map((cell) => (
                          <TableCell
                            className=" flex-row items-center text-center justify-between border-b border-black py-3 mx-2 hover:py-4"
                            key={cell.id}>
                            {flexRender(
                              cell.column.columnDef.cell,
                              cell.getContext()
                            )}
                          </TableCell>
                        ))}
                      </TableRow>
                    ))
                  ) : (
                    <TableRow>
                      <TableCell
                        colSpan={columns.length}
                        className="h-24 text-center">
                        No results.
                      </TableCell>
                    </TableRow>
                  )}
                </TableBody>
              </Table>
            </div>
            {/* <DataTablePagination table={table} /> */}
          </div>
        </div>
      </div>
    </div>
  );
}
