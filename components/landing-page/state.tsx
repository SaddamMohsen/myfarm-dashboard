const stats = [
    { number: "98%", label: "الدقة" },
    { number: "50%", label: "توفير الوقت" },
    { number: "2x", label: "زيادة الانتاجية" },
    { number: "24/7", label: "مراقبة مستمرة" },
  ]
  
  export default function Stats() {
    return (
      <section className="py-20 bg-highlight text-highlight-foreground">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {stats.map((stat, index) => (
              <div key={index} className="text-center">
                <div className="text-4xl md:text-5xl font-bold mb-2">{stat.number}</div>
                <div className="text-green-500 font-semibold text-xl">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>
    )
  }
  