'use client'

import { Dispatch, SetStateAction, useState } from 'react'
import { zodResolver } from '@hookform/resolvers/zod'
import { useForm } from 'react-hook-form'
import * as z from 'zod'
import { CalendarIcon } from 'lucide-react'
import { format } from 'date-fns'
import { Button } from '@/components/ui/button'
import { Calendar } from '@/components/ui/calendar'
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form'
import { Input } from '@/components/ui/input'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { Switch } from '@/components/ui/switch'
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from '@/components/ui/sheet'
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from '@/components/ui/popover'
import { cn } from '@/lib/utils'

// Assuming FarmType is an enum, we'll define it here
const FarmType = z.enum(['بياض', 'لاحم', 'امهات'])

const farmSchema = z.object({
  farm_name: z.string({
    required_error: "ضروري اضافة الاسم",
  }),
  farm_type: FarmType,
  no_of_ambers: z.coerce.number({
    required_error: "قم بتحديد عدد العنابر",
  }),
  farm_start_date: z.date().optional(),
  farm_end_date: z.date().optional(),
  is_running: z.boolean(),
  farm_supervisor: z.string().optional(),
})



export default function FarmInputForm() {
 const [isOpen,setIsOpen]=useState(false);

  const form = useForm<z.infer<typeof farmSchema>>({
    resolver: zodResolver(farmSchema),
    defaultValues: {
      farm_name: '',
      no_of_ambers: 0,
      is_running: false,
      farm_supervisor: '',
    },
  })

  function onSubmit(values: z.infer<typeof farmSchema>) {
    console.log(values)
    setIsOpen(false)
  }

  return (
    <Sheet open={isOpen} onOpenChange={setIsOpen}>
      <SheetTrigger asChild>
        <Button variant="outline">Add New Farm</Button>
      </SheetTrigger>
      <SheetContent  className="sm:max-w-[425px] overflow-auto " >
        <SheetHeader>
          <SheetTitle>اضافة مزرعة جديدة</SheetTitle>
          <SheetDescription>
           قم بأدخال كافة البيانات المطلوبه , ثم قم بضفط زر الحفظ 
          </SheetDescription>
        </SheetHeader>
        <Form {...form}>
          <form dir='rtl' onSubmit={form.handleSubmit(onSubmit)} className="space-y-8 text-right justify-end  flex flex-col">
            <div className="text-right">
            <FormField
              control={form.control}
              name="farm_name"
              render={({ field }) => (
                <FormItem>
                  <FormLabel className='text-right'>اسم المزرعة</FormLabel>
                  <FormControl>
                    <Input dir='rtl' placeholder="اكتب اسم المزرعة" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            </div>
            <FormField
              control={form.control}
              name="farm_type"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>نوع المزرعة</FormLabel>
                  <Select onValueChange={field.onChange} defaultValue={field.value}>
                    <FormControl>
                      <SelectTrigger>
                        <SelectValue placeholder="حدد نوع المزرعة"  />
                      </SelectTrigger>
                    </FormControl>
                    <SelectContent dir='rtl' className='bg-slate-50'>
                      <SelectItem value="بياض">بياض</SelectItem>
                      <SelectItem value="لاحم">لاحم</SelectItem>
                      <SelectItem value="امهات">امهات</SelectItem>
                    </SelectContent>
                  </Select>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="no_of_ambers"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>عدد العنابر</FormLabel>
                  <FormControl>
                    <Input type="number" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="farm_start_date"
              render={({ field }) => (
                <FormItem className="flex flex-col">
                  <FormLabel>تاريخ البداية</FormLabel>
                  <Popover>
                    <PopoverTrigger asChild>
                      <FormControl>
                        <Button
                          variant={"outline"}
                          className={`w-[240px] pl-3 text-left font-normal ${!field.value && "text-muted-foreground"}`}
                        >
                          {field.value ? (
                            format(field.value, "PPPP")
                          ) : (
                            <span>حدد تاريخ البداية</span>
                          )}
                          <CalendarIcon className="ml-auto h-4 w-4 opacity-50" />
                        </Button>
                
                      </FormControl>
                    </PopoverTrigger>
                    <PopoverContent className="w-auto p-0" align="start">
                      <Calendar
                      className='bg-slate-100'
                        mode="single"
                        selected={field.value}
                        onSelect={field.onChange}
                       
                        initialFocus
                      />
                    </PopoverContent>
                  </Popover>
                  <FormDescription className='text-slate-200/20 text-xs' >بناء على هذا التاريخ سوف يتم حساب عمر الدجاج</FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />
            {/* <FormField
              control={form.control}
              name="farm_end_date"
              render={({ field }) => (
                <FormItem className="flex flex-col">
                  <FormLabel>End Date</FormLabel>
                  <Popover>
                    <PopoverTrigger asChild>
                      <FormControl>
                        <Button
                          variant={"outline"}
                          className={`w-[240px] pl-3 text-left font-normal ${!field.value && "text-muted-foreground"}`}
                        >
                          {field.value ? (
                            format(field.value, "PPP")
                          ) : (
                            <span>Pick a date</span>
                          )}
                          <CalendarIcon className="ml-auto h-4 w-4 opacity-50" />
                        </Button>
                      </FormControl>
                    </PopoverTrigger>
                    <PopoverContent className="w-auto p-0" align="end">
                      <Calendar
                       className='bg-slate-100'
                        mode="single"
                        selected={field.value}
                        onSelect={field.onChange}
                        disabled={(date) =>
                          date < new Date("1900-01-01")
                        }
                        initialFocus
                      />
                    </PopoverContent>
                  </Popover>
                  <FormMessage />
                </FormItem>
              )}
            /> */}
            <FormField
              control={form.control}
              name="is_running"
              render={({ field }) => (
                <FormItem dir='ltr' className="flex flex-row-reverse items-center justify-between rounded-lg border p-8">
                  <div className="space-y-0.5">
                    <FormLabel className="text-base">حالة المزرعة</FormLabel>
                    <FormDescription>
                     هل المزرعة شغاله حالياً
                    </FormDescription>
                  </div>
                  <FormControl>
                    <Switch
                   
                     className={cn('bg-slate-400 ',
                     field.value &&   'bg-blue-400 ' )}
                      checked={field.value}
                      onCheckedChange={field.onChange}
                    />
                  </FormControl>
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="farm_supervisor"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>مشرف المزرعة</FormLabel>
                  <FormControl>
                    <Input placeholder="Enter supervisor name" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <Button type="submit" variant='secondary' className="w-full mx-auto lg:w-auto bg-gradient-to-b from-blue-500 to to-blue-700 font-semibold text-xl justify-between  hover:bg-[#E7422C]/20 hover:text-white
        border-none focus-visible:ring-offset-0 focus-visible:ring-transparent outline-none
        text-white focus:bg-[#E7422C]/70 transition-all">حفظ بيانات المزرعة</Button>
          </form>
        </Form>
      </SheetContent>
    </Sheet>
  )
}