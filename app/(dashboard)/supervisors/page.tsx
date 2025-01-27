'use client';
import { Loader2 } from "lucide-react";
import { SupervisorTable } from "./_components/supervisors_table"
import { SupervisorDialog } from "./_components/supervisor-dialog"
import { useFetchSupervisorsQuery } from "@/lib/services/farms-api";


export default function SupervisorsPage() {
  const { data, isLoading, error } = useFetchSupervisorsQuery();
  
  return (
    <div className="container mx-auto py-10" dir="rtl">
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-2xl font-bold">قائمة المشرفين</h1>
        <SupervisorDialog />
      </div>

      {isLoading ? (
        <div className="flex justify-center items-center p-4">
          <Loader2 className="w-4 animate-spin ml-2" />
          <p>تحميل...</p>
        </div>
      ) : error ? (
        <p className="text-center bg-red-500 p-3 rounded-md text-white">
          خطأ في عملية الحصول على البيانات
        </p>
      ) : (
        <SupervisorTable data={data || []} />
      )}
    </div>
  )
}