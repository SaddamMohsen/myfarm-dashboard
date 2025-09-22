'use client'

import { Dispatch, SetStateAction, useEffect, useState, useTransition } from 'react'
import { zodResolver } from '@hookform/resolvers/zod'
import { useForm } from 'react-hook-form'
import * as z from 'zod'
import { CalendarIcon, Plus } from 'lucide-react'
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
import { FlockBatch, flockBatchSchema } from "@/constants/types";
import { 
  useAddNewFlockBatchMutation,
  useFetchAllFarmsQuery,
  useFetchAllFlockBatchesQuery 
} from '@/lib/services/farms-api'

interface FlockInputFormProps {
  open: boolean;
  onClose: () => void;
}

export default function FlockInputForm({ open, onClose }: FlockInputFormProps) {
  const [isOpen, setIsOpen] = useState(open);
  const [error, setError] = useState('');
  const [addFlock, { isLoading }] = useAddNewFlockBatchMutation();
  const { data: farms } = useFetchAllFarmsQuery();
  
  const form = useForm<FlockBatch>({
    resolver: zodResolver(flockBatchSchema),
    defaultValues: {
      farm_id: 0,
      amber_id: 0,
      quantity: 0,
      age: 1,
      date_of_acquisition: new Date(),
      details: "",
      invoice_no: undefined,
      batch_no: 0,
    },
  });

  useEffect(() => {
    setIsOpen(open);
  }, [open]);

  const onInvalid = (invErrors: any) => {
    console.log(invErrors);
    setError(invErrors);
    setTimeout(() => setError(''), 5000);
  };

  const onSubmit = async (values: FlockBatch) => {
    try {
      addFlock({ newFlock: values }).unwrap().then((payload) => {
        if (payload.success) {
          console.log('تم اضافة بيانات القطيع بنجاح');
          onClose();
          form.reset();
        } else {
          console.log('error', payload.error);
          setError(payload.error);
          setTimeout(() => setError(''), 5000);
        }
      });
    } catch (error) {
      console.log('خطا في اضافة بيانات القطيع', error);
      setError('خطأ في إضافة بيانات القطيع');
      setTimeout(() => setError(''), 5000);
    }
  };

  return (
    <Sheet open={isOpen} onOpenChange={setIsOpen}>
      <SheetTrigger asChild>
        <Button className='btn-myfarm !important' onClick={() => setIsOpen(true)}>
          <Plus className="ml-2 h-4 w-4 bg-blue-500/10" />
          إضافة قطيع جديد
        </Button>
      </SheetTrigger>
      <SheetContent className="sm:max-w-[425px] overflow-auto">
        <SheetHeader>
          <SheetTitle>إضافة قطيع جديد</SheetTitle>
          <SheetDescription>
            قم بأدخال كافة البيانات المطلوبة، ثم قم بضغط زر الحفظ
          </SheetDescription>
        </SheetHeader>
        <Form {...form}>
          <form dir='rtl' onSubmit={form.handleSubmit(onSubmit, onInvalid)} className="space-y-8 text-right justify-end flex flex-col">
            
            {/* Farm Selection */}
            <div className="text-right">
              <FormField
                control={form.control}
                name="farm_id"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel className='text-right'>المزرعة</FormLabel>
                    <FormControl>
                      <Select onValueChange={(value) => field.onChange(parseInt(value))} defaultValue={field.value?.toString()}>
                        <SelectTrigger>
                          <SelectValue placeholder="حدد المزرعة" />
                        </SelectTrigger>
                        <SelectContent dir='rtl' className='bg-slate-50'>
                          {farms?.map((farm) => (
                            <SelectItem key={farm.id} value={farm.id?.toString() || ''}>
                              {farm.farm_name}
                            </SelectItem>
                          ))}
                        </SelectContent>
                      </Select>
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
            </div>

            {/* Amber ID */}
            <FormField
              control={form.control}
              name="amber_id"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>رقم العنبر</FormLabel>
                  <FormControl>
                    <Input 
                      type="number" 
                      {...field} 
                      onChange={(e) => field.onChange(parseInt(e.target.value) || 0)}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Quantity */}
            <FormField
              control={form.control}
              name="quantity"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>الكمية</FormLabel>
                  <FormControl>
                    <Input 
                      type="number" 
                      {...field} 
                      onChange={(e) => field.onChange(parseInt(e.target.value) || 0)}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Age */}
            <FormField
              control={form.control}
              name="age"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>العمر (أيام)</FormLabel>
                  <FormControl>
                    <Input 
                      type="number" 
                      {...field} 
                      onChange={(e) => field.onChange(parseInt(e.target.value) || 0)}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Batch Number */}
            <FormField
              control={form.control}
              name="batch_no"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>رقم الدفعة</FormLabel>
                  <FormControl>
                    <Input 
                      type="number" 
                      {...field} 
                      onChange={(e) => field.onChange(parseInt(e.target.value) || 0)}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Date of Acquisition */}
            <FormField
              control={form.control}
              name="date_of_acquisition"
              render={({ field }) => (
                <FormItem className="flex flex-col">
                  <FormLabel>تاريخ الحصول</FormLabel>
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
                            <span>حدد تاريخ الحصول</span>
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
                  <FormDescription className='text-blue-400 text-xs'>
                    تاريخ حصول المزرعة على هذا القطيع
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Invoice Number */}
            <FormField
              control={form.control}
              name="invoice_no"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>رقم الفاتورة (اختياري)</FormLabel>
                  <FormControl>
                    <Input 
                      type="number" 
                      {...field} 
                      onChange={(e) => field.onChange(e.target.value ? parseInt(e.target.value) : undefined)}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Details */}
            <FormField
              control={form.control}
              name="details"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>تفاصيل إضافية (اختياري)</FormLabel>
                  <FormControl>
                    <Input dir='rtl' placeholder="أي تفاصيل إضافية..." {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            <Button type="submit" variant='secondary' className="btn-myfarm" disabled={isLoading}>
              {isLoading ? 'جاري الحفظ...' : 'حفظ بيانات القطيع'}
            </Button>
          </form>
          {error && (
            <div className="text-red-500 text-sm mt-4">{error}</div>
          )}
        </Form>
      </SheetContent>
    </Sheet>
  );
}
