"use client";

import { Dialog, DialogContent, DialogTrigger } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { AddNewFarm } from "@/components/add-new-farm-modal";
import { FarmsDataTable } from "./_components/data-table";
import { columns } from "./_components/columns";
import { useFetchAllFarmsQuery } from "@/lib/services/farms-api";
import Loader from "@/components/loader";
import { createClient } from "@/utils/supabase/client";
export default function Page() {
  // const { farmsList, errorMessage, hasError, isLoading } = useAppSelector(
  //   (state) => state.farms
  // );
  // const dispatch = useAppDispatch();
  // useEffect(() => {
  //   dispatch(getFarms());
  // }, [isLoading]);
  const supabase = createClient();
  const user = supabase.auth.getUser();
  //console.log({ user });
  const { data, isLoading, error } = useFetchAllFarmsQuery();
  if (isLoading) {
    return (
      <div className="flex justify-center items-center border-radius my-6  md:w-full  py-4 md:px-[0.25rem] p-6 rounded-md  ">
        <p className="text"> تحميــــــل....</p>
        <Loader />
      </div>
    );
  }
  if (error) {
    return (
      <p className="text-center bg-red-500 p-3 rounded-md flex justify-center items-center text-white  text-sm text-destructive">
        حطأ في عملية الحصول على البيانات
      </p>
    );
  }
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

      <FarmsDataTable columns={columns} data={data || []} />
    </div>
  );
}
