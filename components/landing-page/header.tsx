import Link from "next/link"
import { Button } from "@/components/ui/button"

export default function Header() {
  return (
    <header className="bg-white shadow-sm text-2xl font-bold text-gray-800">
      <div className="container mx-auto px-4 py-4 flex items-center justify-between">
       
        <nav className="hidden md:grid md:grid-cols-3 space-x-8 items-center justify-between"> 
          <Link href="#features" className="text-gray-600 hover:text-blue-600">
            الميزات
          </Link>
         
          <Link href="#pricing" className="text-gray-600 hover:text-blue-600">
            الاسعار
          </Link>
        </nav>
        <Button variant="outline">
            <Link href='/login' className="text-xl font-semibold" >
            تسجيل الدخول
            </Link>
            </Button>
      </div>
    </header>
  )
}