import { FarmDetails } from '@/components/farm-details'

export default function FarmDetailsPage({ params }: { params: { id: number } }) {
  return (
    <div className="container mx-auto py-10">
      <h1 className="text-2xl font-bold mb-5 text-center">تفاصيل المزرعة</h1>
      <FarmDetails farmId={params.id} />
    </div>
  )
}