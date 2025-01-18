"use client"

import { useState } from "react"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { toast } from "@/components/hooks/use-toast"
import { createClient } from "@/utils/supabase/client"
import { DialogClose } from "@/components/ui/dialog"

interface PasswordForm {
  currentPassword: string;
  newPassword: string;
  confirmPassword: string;
}

export function ChangePasswordForm() {
  const [isLoading, setIsLoading] = useState(false)
  const [passwordForm, setPasswordForm] = useState<PasswordForm>({
    currentPassword: '',
    newPassword: '',
    confirmPassword: ''
  })
  const supabase = createClient()

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)

    try {
      if (passwordForm.newPassword !== passwordForm.confirmPassword) {
        toast({
            title: "كلمات المرور غير متطابقة",
            description: 'كلمات المرور غير متطابقة',
            variant: 'destructive',
            className:'bg-red-500 text-white z-100'
          });
          
        throw new Error('كلمات المرور غير متطابقة')
      }

      const { error: signInError } = await supabase.auth.signInWithPassword({
        email: (await supabase.auth.getUser()).data.user?.email || '',
        password: passwordForm.currentPassword,
      })

      if (signInError) {
        toast({
            title: "كلمة المرور الحالية غير صحيحة",
            description: 'كلمة المرور الحالية غير صحيحة',
            variant: 'destructive',
            className:'bg-red-500 text-white z-100'
          });
        throw new Error('كلمة المرور الحالية غير صحيحة')
      }

      const { error: updateError } = await supabase.auth.updateUser({
        password: passwordForm.newPassword
      })

      if (updateError) throw updateError

      toast({
        title: "تم تغيير كلمة المرور بنجاح",
        description: "تم تحديث كلمة المرور الخاصة بك",
      })

      const closeButton = document.querySelector('[data-dialog-close]') as HTMLButtonElement
      closeButton?.click()

    } catch (error: any) {
      toast({
        title: "خطأ في تغيير كلمة المرور",
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
        <h2 className="text-lg font-semibold text-center">تغيير كلمة المرور</h2>
      </div>
      <form onSubmit={handleSubmit} className="space-y-4">
        <div className="space-y-2">
          <Label htmlFor="currentPassword">كلمة المرور الحالية</Label>
          <Input
            id="currentPassword"
            type="password"
            value={passwordForm.currentPassword}
            onChange={(e) => setPasswordForm(prev => ({
              ...prev,
              currentPassword: e.target.value
            }))}
            required
          />
        </div>

        <div className="space-y-2">
          <Label htmlFor="newPassword">كلمة المرور الجديدة</Label>
          <Input
            id="newPassword"
            type="password"
            value={passwordForm.newPassword}
            onChange={(e) => setPasswordForm(prev => ({
              ...prev,
              newPassword: e.target.value
            }))}
            required
          />
        </div>

        <div className="space-y-2">
          <Label htmlFor="confirmPassword">تأكيد كلمة المرور الجديدة</Label>
          <Input
            id="confirmPassword"
            type="password"
            value={passwordForm.confirmPassword}
            onChange={(e) => setPasswordForm(prev => ({
              ...prev,
              confirmPassword: e.target.value
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
            {isLoading ? 'جاري التغيير...' : 'تغيير كلمة المرور'}
          </Button>
        </div>
      </form>
    </div>
  )
} 