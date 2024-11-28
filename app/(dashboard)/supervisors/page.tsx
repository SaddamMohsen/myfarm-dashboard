'use client';
import { Loader2 } from "lucide-react";
import { SupervisorTable } from "./_components/supervisors_table"
import { SuperVisor } from "@/constants/types"
import { useFetchSupervisorsQuery } from "@/lib/services/farms-api";
const sampleData: SuperVisor[] = [
  {
    name: "John Doe",
    id: "JD001",
    uuid: "550e8400-e29b-41d4-a716-446655440000",
    phone_numbers: 2,
    details: "Senior Supervisor",
  },
  {
    name: "Jane Smith",
    id: "JS002",
    uuid: "6ba7b810-9dad-11d1-80b4-00c04fd430c8",
    phone_numbers: 1,
    details: "Regional Manager",
  },
  // Add more sample data as needed
]

export default function SupervisorsPage() {
    const { data, isLoading, error } = useFetchSupervisorsQuery();
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
      المشرفين
      </div>
      </div>
    );
}
  return (
    <div className="container mx-auto py-10" dir="rtl">
      <h1 className="text-2xl font-bold mb-5">قائمة المشرفين</h1>
      <SupervisorTable data={data||[]} />
    </div>
  )
}