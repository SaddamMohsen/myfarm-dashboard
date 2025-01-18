"use client";

import { Dialog, DialogContent, DialogTrigger } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { AddNewFarm } from "@/components/add-new-farm-modal";
import { FarmsDataTable } from "./_components/data-table";
import { columns } from "./_components/columns";
import { useFetchAllFarmsQuery } from "@/lib/services/farms-api";
import Loader from "@/components/loader";
import { createClient } from "@/utils/supabase/client";
import { Loader2 } from "lucide-react";
import { useState } from "react";
import FarmInputForm from './_components/farm-input-form';
import { Farms } from "@/constants/types";
export default function Page() {
 
  const [open, setIsOpen] = useState(false);
  const supabase = createClient();
  const user = supabase.auth.getUser();
  //console.log({ user });
  const { data, isLoading, error } = useFetchAllFarmsQuery();
  if (isLoading) {
    return (
      <div className="flex justify-center items-center border-radius my-6  md:w-full  py-4 md:px-[0.25rem] p-6 rounded-md  ">
        <p className="text"> تحميــــــل....</p>
        <Loader2 className="w-4" />
      </div>
    );
  }
  if (error) {
    return (
      <div dir="rtl" className="flex flex-col items-center justify-center mt-4">
      <div className="flex flex-row items-center justify-between w-full p-6">
      <p className="text-center bg-red-500 p-3 rounded-md flex justify-center items-center text-white  text-sm text-destructive">
        حطأ في عملية الحصول على البيانات
      </p>
     
      </div>
      </div>
    );
  }
  return (
    <div dir="rtl" className="flex flex-col items-center justify-center mt-4">
      <div className="flex flex-row items-center justify-between w-full p-6">
        <h1 className="text-2xl font-bold ">قائمة المزارع</h1>
        <div>
         
       
            <FarmInputForm open={open} onClose={() => setIsOpen(false)} />
          
        </div>
      </div>
      {data && <FarmsDataTable columns={columns} data={data} />}
    </div>
  );
}
