"use client"

import { Button } from "@/components/ui/button"
import {
  Dialog,
  DialogContent,
  DialogTrigger,
} from "@/components/ui/dialog"
import { ChangePasswordForm } from "./change-password-form"
import { Key } from "lucide-react"
import { useState } from "react"

export function ChangePasswordDialog() {
    const [open, setOpen] = useState(false);
  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button className="btn-myfarm font-medium">
          <Key className="ml-2 h-4 w-4" />
          تغيير كلمة المرور
        </Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-[500px]">
        <ChangePasswordForm />
      </DialogContent>
    </Dialog>
  )
} 