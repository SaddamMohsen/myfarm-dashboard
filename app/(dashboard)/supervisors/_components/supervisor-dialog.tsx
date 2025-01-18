"use client"

import { Button } from "@/components/ui/button"
import {
  Dialog,
  DialogContent,
  DialogTrigger,
} from "@/components/ui/dialog"
import { SupervisorForm } from "./supervisor-form"
import { Plus } from "lucide-react"

export function SupervisorDialog() {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button className="btn-myfarm font-extrabold w-48" type="button">
          <Plus className="ml-2 h-4 w-4 bg-blue-500/10" />
          إضافة مشرف جديد
        </Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-[500px]">
        <SupervisorForm />
      </DialogContent>
    </Dialog>
  )
} 