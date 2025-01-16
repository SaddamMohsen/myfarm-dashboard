'use client'

import { useEffect, useState } from 'react'
import { useForm, Controller } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { z } from 'zod'
import { Button } from './ui/button'
import { Input } from './ui/input'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from './ui/select'
import { Checkbox } from './ui/checkbox'
import { Label } from './ui/label'
import { useToast } from "@/hooks/use-toast"
import { farmSchema } from '@/constants/types'
import { useFetchFarmByIdMutation } from '@/lib/services/farms-api'


type FarmData = z.infer<typeof farmSchema>

// Mock function to fetch farm data
const fetchFarmData = async (id: number): Promise<FarmData> => {
  // In a real application, you would fetch this data from your API
  return {
    id: id,
    farm_name: "مزرعة نموذجية",
    farm_type: "بياض",
    no_of_ambers: 5,
    created_at: new Date().toISOString(),
    farm_start_date: new Date(),
    is_running: true,
    farm_supervisor: "أحمد محمد",
  }
}

// Mock function to save farm data
const saveFarmData = async (data: FarmData): Promise<void> => {
  // In a real application, you would send this data to your API
  console.log('Saving farm data:', data)
  // Simulate API delay
  await new Promise(resolve => setTimeout(resolve, 1000))
}

export function FarmDetails({ farmId }: { farmId: number }) {
  const [isEditing, setIsEditing] = useState(false)
  const [fetchData,isLoading] =useFetchFarmByIdMutation()
  const { toast } = useToast()
  const { register, handleSubmit, control, reset } = useForm<FarmData>({
    resolver: zodResolver(farmSchema),
  })

  const onSubmit = async (data: FarmData) => {
    try {
      await saveFarmData(data)
      setIsEditing(false)
      toast({
        title: "تم الحفظ بنجاح",
        description: "تم تحديث بيانات المزرعة",
      })
    } catch (error) {
      toast({
        title: "حدث خطأ",
        description: "لم يتم حفظ البيانات. يرجى المحاولة مرة أخرى.",
        variant: "destructive",
      })
    }
  }

  useEffect(() => {
    fetchData({"id":farmId}).then(data => {
      reset(data.data)
    })
  }, [farmId, reset])

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-6 bg-white/5 border-solid border-blue-500 p-4 border-2  rounded-md shadow-md" dir="rtl">
      <div className='flex flex-col gap-4 flex-1 bg-white/10  items-stretch font-bold justify-stretch w-full text-nowrap border-solid border-blue-500 p-4 rounder-md shadow-md'>
        <div className='flex flex-col md:flex-row gap-4 flex-1   items-stretch font-bold justify-stretch w-full text-nowrap border-solid border-blue-500 p-4 rounder-md '>
        <div className='flex flex-row items-center justify-between gap-2 font-bold flex-1  '>
        <Label className='font-bold text-3xl/2 flex-1' htmlFor="farm_name">اسم المزرعة</Label>
        <Input id="farm_name" {...register('farm_name')} disabled={!isEditing} />
      </div>

      <div  className='flex flex-row items-center gap-2 justify-between font-bold flex-1 '>
        
        <Label  className='font-bold text-3xl/2 flex-1' htmlFor="farm_type">نوع المزرعة</Label>
        <Controller
          name="farm_type"
          control={control}
          render={({ field }) => (
            <Select onValueChange={field.onChange} value={field.value} disabled={!isEditing}>
              <SelectTrigger>
                <SelectValue placeholder="اختر نوع المزرعة" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="بياض">بياض</SelectItem>
                <SelectItem value="لاحم">لاحم</SelectItem>
                <SelectItem value="امهات">امهات</SelectItem>
              </SelectContent>
            </Select>
          )}
        />
      </div>

      <div className='flex flex-row items-center gap-2 justify-between font-bold flex-1 '>
        <Label  className='font-bold flex-1 text-3xl/2' htmlFor="no_of_ambers">عدد العنابر</Label>
        <Input id="no_of_ambers" type="number" {...register('no_of_ambers')} disabled={!isEditing} />
      </div>
      </div>
      <div className='flex flex-col gap-4   items-stretch font-bold justify-stretch w-full md:text-nowrap text-wrap md:flex-row '>
      <div className='flex flex-row items-center justify-between gap-2 font-bold flex-1  '>
        <Label className='font-bold text-3xl/2' htmlFor="farm_start_date">تاريخ بدء المزرعة</Label>
        <Input id="farm_start_date" type="date" {...register('farm_start_date')} disabled={!isEditing} />
      </div>

      <div className='flex flex-row items-center justify-between gap-2 font-bold flex-1  '>
        <Label className='font-bold text-3xl/2' htmlFor="farm_end_date">تاريخ انتهاء المزرعة</Label>
        <Input id="farm_end_date" type="date" {...register('farm_end_date')} disabled={!isEditing} />
      </div>

      <div className="flex items-center gap-2 justify-evenly content-evenly space-x-2">
        <Controller
          name="is_running"
          control={control}
          render={({ field }) => (
            <Checkbox
              id="is_running"
              className='text-blue-600'
              checked={field.value}
              onCheckedChange={field.onChange}
              disabled={!isEditing}
            />
          )}
        />
        <Label className='font-bold text-3xl/2' htmlFor="is_running">المزرعة نشطة</Label>
      </div>

      <div className='flex flex-row items-center justify-between gap-2 font-bold flex-1  '>
        <Label className='font-bold text-3xl/2' htmlFor="farm_supervisor">مشرف المزرعة</Label>
        <Input id="farm_supervisor" {...register('farm_supervisor')} disabled={!isEditing} />
      </div>
</div>
      {isEditing ? (
        <div className="flex space-x-2 justify-center items-center gap-4">
          <Button className='btn btn--primary' type="submit">حفظ التغييرات</Button>
          <Button className='btn btn--secondary' type="button" variant={'default'} onClick={() => setIsEditing(false)}>إلغاء</Button>
        </div>
      ) : (
        <Button className='btn btn--primary' type="button" onClick={() => setIsEditing(true)}>تعديل</Button>
      )}
      </div>
    </form>
  )
}

