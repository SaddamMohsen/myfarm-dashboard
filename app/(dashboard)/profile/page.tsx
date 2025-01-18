"use client"

import { useEffect, useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Label } from "@/components/ui/label"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { createClient } from "@/utils/supabase/client"
import { toast } from "@/components/hooks/use-toast"
import { ChangePasswordDialog } from "./_components/change-password-dialog"
import { Loader2 } from "lucide-react"

interface UserProfile {
  id: string;
  email: string;
  full_name?: string;
  avatar_url?: string;
  role?: string;
  created_at: string;
  schema?: string;
}

interface PasswordForm {
  currentPassword: string;
  newPassword: string;
  confirmPassword: string;
}

export default function ProfilePage() {
  const [profile, setProfile] = useState<UserProfile | null>(null)
  const [isLoading, setIsLoading] = useState(true)
  
  const supabase = createClient()

  useEffect(() => {
    async function getProfile() {
      try {
        const { data: { user } } = await supabase.auth.getUser()
        if (user) {
          setProfile({
            id: user.id,
            email: user.email || '',
            full_name: user.user_metadata?.full_name,
            avatar_url: user.user_metadata?.avatar_url,
            role: user.user_metadata?.role,
            schema: user.user_metadata?.schema,
            created_at: new Date(user.created_at).toLocaleDateString('ar-EG')
          })
        }
      } catch (error) {
        console.error('Error loading user data:', error)
      } finally {
        setIsLoading(false)
      }
    }

    getProfile()
  }, [])


  if (isLoading) {
    return (
      <div className="flex justify-center items-center min-h-screen">
        <Loader2 className="h-4 w-4 animate-spin" />
        جاري التحميل...
      </div>
    )
  }

  return (
    <div className="container mx-auto py-10">
      <Card className="max-w-2xl mx-auto">
        <CardHeader className="flex justify-center items-center">
          <CardTitle className="text-center">الملف الشخصي</CardTitle>
          
        </CardHeader>
        <CardContent className="space-y-6">
          <div className="flex justify-center">
            <Avatar className="h-24 w-24">
              <AvatarImage src={profile?.avatar_url} />
              <AvatarFallback>
                {profile?.full_name?.split(' ').map(n => n[0]).join('') || profile?.email[0].toUpperCase()}
              </AvatarFallback>
            </Avatar>
          </div>

          <div className="grid grid-cols-2 gap-4 text-right">
            <div className="space-y-2">
              <Label>الاسم الكامل</Label>
              <div className="font-medium">{profile?.full_name || 'غير محدد'}</div>
            </div>

            <div className="space-y-2">
              <Label>البريد الإلكتروني</Label>
              <div className="font-medium">{profile?.email}</div>
            </div>

            <div className="space-y-2">
              <Label>الدور</Label>
              <div className="font-medium">{profile?.role || 'غير محدد'}</div>
            </div>

            <div className="space-y-2">
              <Label>الشركة</Label>
              <div className="font-medium">{profile?.schema || 'غير محدد'}</div>
            </div>

            <div className="space-y-2">
              <Label>تاريخ الإنشاء</Label>
              <div className="font-medium">{profile?.created_at}</div>
            </div>

            <div className="space-y-2">
              <Label>معرف المستخدم</Label>
              <div className="font-medium text-sm text-muted-foreground">
                {profile?.id}
              </div>
            </div>
          </div>

          <div className="border-t pt-6 mt-6">
          <ChangePasswordDialog />
          </div>
        </CardContent>
      </Card>
    </div>
  )
} 