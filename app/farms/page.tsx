"use client";

import { useAppDispatch, useAppSelector } from "@/lib/hooks";
import { getFarms } from "@/lib/features/farmSlice";
import { useEffect } from "react";

import { Table } from "@/components/table";
import { Dialog, DialogContent, DialogTrigger } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { AddNewFarm } from "@/components/add-new-farm-modal";
import { FarmsDataTable } from "./_components/data-table";
import { columns } from "./_components/columns";
export default function Page() {
  const { farmsList, errorMessage, hasError, isLoading } = useAppSelector(
    (state) => state.farms
  );
  const dispatch = useAppDispatch();
  useEffect(() => {
    dispatch(getFarms());
  }, []);
  return (
    <div className="flex flex-col items-center justify-center mt-4">
      <div className="flex flex-row items-center justify-between w-full p-6">
        <h1 className="text-2xl font-bold ">قائمة المزارع</h1>
        <div>
          <Dialog>
            <DialogTrigger asChild>
              <Button
                className="w-full lg:w-auto bg-[#E7422C] font-semibold text-xl justify-between  hover:bg-[#E7422C]/20 hover:text-white
        border-none focus-visible:ring-offset-0 focus-visible:ring-transparent outline-none
        text-white focus:bg-[#E7422C]/70 transition-all">
                اضافة مزرعة
              </Button>
            </DialogTrigger>
            <DialogContent
              onInteractOutside={(e) => {
                e.preventDefault();
              }}>
              <AddNewFarm />
            </DialogContent>
          </Dialog>
        </div>
      </div>
      <FarmsDataTable columns={columns} data={farmsList} />
    </div>
  );
}
