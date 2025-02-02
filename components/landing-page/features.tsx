import { BarChartIcon as ChartBar, ClipboardList, TrendingUp, Truck } from "lucide-react"

const features = [
  {
    icon: <ChartBar className="h-8 w-8" />,
    title: "متابعة الانتاج",
    description: "مراقبة الانتاج اليومي و عدد الطيور ومراقبة الوارد والمنصرف ",
  },
  {
    icon: <ClipboardList className="h-8 w-8" />,
    title: "إدارة المخزون",
    description: "متابعة العلف والعلاجات والكراتين والاطباق بشكل يومي.",
  },
  {
    icon: <TrendingUp className="h-8 w-8" />,
    title: "تحليل الاداء",
    description: "تحليل الانتاج وعرض النسب والمراقبة اليومية مما يتيح لك اتخاذ القرارات.",
  },
  // {
  //   icon: <Truck className="h-8 w-8" />,
  //   title: "Supply Chain Tracking",
  //   description: "Monitor movement of products from farm to market with detailed logistics.",
  // },
]

export default function Features() {
  return (
    <section id="features" className="py-20  rounded-md">
      <div className="container mx-auto px-4">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-bold mb-4">ادارة مزرعتك بشكل كامل</h2>
          <p className="text-gray-600 max-w-2xl font-semibold mx-auto">
            كل ما تحتاجة لإدارة مزارعك بكفاءة.
          </p>
        </div>
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {features.map((feature, index) => (
            <div key={index} className="p-6 rounded-lg border border-gray-200 hover:border-primary transition-colors">
              <div className="text-primary mb-4">{feature.icon}</div>
              <h3 className="text-xl font-semibold mb-2">{feature.title}</h3>
              <p className="text-bittersweet-400 font-bold text-2xl">{feature.description}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

