"use client"

import { useState } from "react"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { toast } from "@/components/hooks/use-toast"
import { createClient } from "@/utils/supabase/client"
import { DialogClose } from "@/components/ui/dialog"
import bcrypt from "bcryptjs"
import jwt from "jsonwebtoken"

interface SupervisorFormData {
  full_name: string
  phone: string
  email: string
  password: string
}

export function SupervisorForm() {
  const [isLoading, setIsLoading] = useState(false)
  const [formData, setFormData] = useState<SupervisorFormData>({
    full_name: '',
    phone: '',
    email: '',
    password: ''
  })
  const supabase = createClient()

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)

    try {
      const accessToken = supabase.realtime.accessToken
      if (!accessToken) throw new Error('لم يتم العثور على رمز الوصول')

      // فك تشفير الـ token للحصول على user_metadata
      const decoded = jwt.decode(accessToken)
      if (!decoded || typeof decoded !== 'object') {
        throw new Error('خطأ في فك تشفير رمز الوصول')
      }
  
      const schema = decoded.user_metadata?.schema
      const userSchema = decoded.user_metadata?.user_schema
      if (!schema) throw new Error('لم يتم العثور على المخطط')
        console.log('schema',schema,userSchema)
      // تشفير كلمة المرور
      const salt = await bcrypt.genSalt(10)
      const hashedPassword = await bcrypt.hash(formData.password, salt)

      // إنشاء مستخدم جديد في Supabase Auth
      const { data: authData, error: authError } = await supabase.auth.signUp({
        email: formData.email,
        password: formData.password,
       
        options: {
          data: {
            full_name: formData.full_name,
            role:userSchema,
            user_schema:userSchema,
            schema: schema
          }
        }
      })

      if (authError){
        console.log('authError',authError);
        throw authError
      }

      // إضافة بيانات المشرف في جدول المشرفين
      const { error: dbError } = await supabase
        .schema(schema)
        .from('supervisors')
        .insert({
        
          name: formData.full_name,
          phone_numbers: formData.phone,
          details:'غير مضاف لاي مزرعة',
          u_id: authData.user?.id,
        })

      if (dbError) {
        console.log('dbError',dbError); 
        throw dbError
      }

      toast({
        title: "تم إضافة المشرف بنجاح",
        description: "تم إرسال رابط تأكيد البريد الإلكتروني",
      })

      const closeButton = document.querySelector('[data-dialog-close]') as HTMLButtonElement
      closeButton?.click()

    } catch (error: any) {
      toast({
        title: "خطأ في إضافة المشرف",
        description: error.message,
        variant: "destructive",
      })
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className="space-y-4 py-4 pb-4" dir="rtl">
      <div className="space-y-2">
        <h2 className="text-lg font-semibold text-center">إضافة مشرف جديد</h2>
      </div>
      <form onSubmit={handleSubmit} className="space-y-4">
        <div className="space-y-2">
          <Label htmlFor="full_name">الاسم الكامل</Label>
          <Input
            id="full_name"
            value={formData.full_name}
            onChange={(e) => setFormData(prev => ({
              ...prev,
              full_name: e.target.value
            }))}
            required
          />
        </div>

        <div className="space-y-2">
          <Label htmlFor="phone">رقم الهاتف</Label>
          <Input
            id="phone"
            type="tel"
            value={formData.phone}
            onChange={(e) => setFormData(prev => ({
              ...prev,
              phone: e.target.value
            }))}
            required
          />
        </div>

        <div className="space-y-2">
          <Label htmlFor="email">البريد الإلكتروني</Label>
          <Input
            id="email"
            type="email"
            value={formData.email}
            onChange={(e) => setFormData(prev => ({
              ...prev,
              email: e.target.value
            }))}
            required
          />
        </div>

        <div className="space-y-2">
          <Label htmlFor="password">كلمة المرور</Label>
          <Input
            id="password"
            type="password"
            value={formData.password}
            onChange={(e) => setFormData(prev => ({
              ...prev,
              password: e.target.value
            }))}
            required
          />
        </div>

        <div className="flex flex-row justify-center items-center gap-3">
          <DialogClose asChild>
            <Button type="button" className="btn--secondary" variant="default">
              إلغاء
            </Button>
          </DialogClose>
          <Button 
          className="btn-myfarm"
            type="submit" 
            disabled={isLoading}
          >
            {isLoading ? 'جاري الإضافة...' : 'إضافة مشرف'}
          </Button>
        </div>
      </form>
    </div>
  )
} 