import { Button } from "@/components/ui/button"
import Link from "next/link"

export default function CTA() {
  return (
    <section className="py-20 bg-gradient-to-r from-secondary to-accent">
      <div className="container mx-auto px-4 text-center">
        <h2 className="text-3xl md:text-4xl font-bold text-melon-200 mb-6">هل انت مستعد لتحسين كفاءة مراقبة مزارعك ؟</h2>
        <p className="text-xl text-melon-200 mb-8 max-w-2xl mx-auto">
          انضم الينا الان وابدا تجربتك المجانية لمدة 30 يومًا.
        </p>
        <Button size="lg" className="bg-white text-secondary hover:bg-white/90">
          
          <Link href='/login' >
         ابدا تجربتك المجانية
          </Link>
        </Button>
      </div>
    </section>
  )
}

