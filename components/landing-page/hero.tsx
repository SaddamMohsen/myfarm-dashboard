import { Button } from "@/components/ui/button"
import Image from "next/image"

export default function Hero() {
  return (
    <section className=" text-office_green-400">
      <div className="container mx-auto px-4 py-20">
        <div className="grid lg:grid-cols-3 gap-12 items-center justify-items-end">
          <div className="space-y-6 col-span-2">
            <h1 className="text-4xl md:text-6xl font-bold "> مزرعتي</h1>
            <p className="text-xl md:text-3xl text-primary-foreground/90 font-extrabold ">
            تتبّع الإنتاج، وراقب المخزون، وحسّن عمليات مزرعة الدواجن الخاصة بك من خلال تطبيق  مزرعتي الخاص بنا.
            </p>
            <div className="flex flex-col sm:flex-row gap-4">
              <Button size="lg" className="bg-secondary hover:bg-secondary/90 font-extrabold text-2xl">
                ابدا تجربتك المجانية لمدة 30 يومًا
              </Button>
              <Button size="lg" variant="outline" className="bg-white/10 font-extrabold text-2xl hover:bg-white/20">
                شاهد الفيديو التوضيحي
              </Button>
            </div>
          </div>
          <div className="relative max-h-full  rounded-lg overflow-hidden">
            <Image
              src={`/img/mag8.jpg`}
              height={500}
              alt="Poultry Farm Management"
              width={500}
              className="object-cover opacity-80"
            />
          </div>
        </div>
      </div>
    </section>
  )
}

