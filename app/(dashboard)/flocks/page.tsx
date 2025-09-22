'use client'

import { useState } from 'react'
import { useFetchAllFlockBatchesQuery } from '@/lib/services/farms-api'
import FlockInputForm from './_components/flock-input-form'
import FlocksTable from './_components/flocks-table'
import { FlockBatch } from '@/constants/types'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'

export default function FlocksPage() {
  const { data: flocks, isLoading, error } = useFetchAllFlockBatchesQuery()
  const [isFormOpen, setIsFormOpen] = useState(false)
  const [selectedFlock, setSelectedFlock] = useState<FlockBatch | null>(null)
  const [isEditing, setIsEditing] = useState(false)

  const handleEdit = (flock: FlockBatch) => {
    setSelectedFlock(flock)
    setIsEditing(true)
    setIsFormOpen(true)
  }

  const handleView = (flock: FlockBatch) => {
    setSelectedFlock(flock)
    setIsEditing(false)
    setIsFormOpen(true)
  }

  const handleCloseForm = () => {
    setIsFormOpen(false)
    setSelectedFlock(null)
    setIsEditing(false)
  }

  if (isLoading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="text-lg">جاري تحميل البيانات...</div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="text-lg text-red-500">حدث خطأ في تحميل البيانات</div>
      </div>
    )
  }

  return (
    <div className="container mx-auto p-6" dir='rtl'>
      <div className="mb-6">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">إدارة القطعان</h1>
        <p className="text-gray-600">إدارة وعرض جميع قطعان الدواجن في المزارع</p>
      </div>

      <Card dir='rtl'>
        <CardHeader>
          <div className="flex justify-between items-center text-xl font-bold">
            <div>
              <CardTitle>قائمة القطعان</CardTitle>
              <CardDescription>
                عرض وإدارة جميع قطعان الدواجن المسجلة
              </CardDescription>
            </div>
            <FlockInputForm 
              open={isFormOpen && !selectedFlock} 
              onClose={handleCloseForm} 
            />
          </div>
        </CardHeader>
        <CardContent>
          <FlocksTable 
            flocks={flocks || []}
            onEdit={handleEdit}
            onView={handleView}
          />
        </CardContent>
      </Card>

      {/* Statistics Cards */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mt-6">
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-600">إجمالي القطعان</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{flocks?.length || 0}</div>
          </CardContent>
        </Card>
        
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-600">إجمالي الطيور</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {flocks?.reduce((sum, flock) => sum + (flock.quantity || 0), 0) || 0}
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-600">متوسط العمر</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {flocks?.length 
                ? Math.round(flocks.reduce((sum, flock) => sum + (flock.age || 0), 0) / flocks.length)
                : 0
              } يوم
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-600">المزارع النشطة</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {new Set(flocks?.map(flock => flock.farm_id)).size || 0}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
