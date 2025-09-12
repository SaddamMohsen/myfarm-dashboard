'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { Edit, Trash2, Eye } from 'lucide-react'
import { FlockBatch } from '@/constants/types'
import { 
  useDeleteFlockBatchMutation,
  useFetchAllFlockBatchesQuery 
} from '@/lib/services/farms-api'
import { format } from 'date-fns'

interface FlocksTableProps {
  flocks: FlockBatch[]
  onEdit?: (flock: FlockBatch) => void
  onView?: (flock: FlockBatch) => void
}

export default function FlocksTable({ flocks, onEdit, onView }: FlocksTableProps) {
  const [deleteFlock] = useDeleteFlockBatchMutation()
  const [deletingId, setDeletingId] = useState<number | null>(null)

  const handleDelete = async (id: number) => {
    if (!confirm('هل أنت متأكد من حذف هذا القطيع؟')) {
      return
    }

    setDeletingId(id)
    try {
      await deleteFlock({ id }).unwrap()
      console.log('تم حذف القطيع بنجاح')
    } catch (error) {
      console.error('خطأ في حذف القطيع:', error)
      alert('حدث خطأ أثناء حذف القطيع')
    } finally {
      setDeletingId(null)
    }
  }

  const handleEdit = (flock: FlockBatch) => {
    if (onEdit) {
      onEdit(flock)
    }
  }

  const handleView = (flock: FlockBatch) => {
    if (onView) {
      onView(flock)
    }
  }

  return (
    <div className="w-full">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>المزرعة</TableHead>
            <TableHead>العنبر</TableHead>
            <TableHead>الكمية</TableHead>
            <TableHead>العمر</TableHead>
            <TableHead>رقم الدفعة</TableHead>
            <TableHead>تاريخ الحصول</TableHead>
            <TableHead>رقم الفاتورة</TableHead>
            <TableHead>التفاصيل</TableHead>
            <TableHead>الإجراءات</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {flocks?.map((flock) => (
            <TableRow key={flock.id}>
              <TableCell>
                {(flock as any).farms?.farm_name || `Farm ${flock.farm_id}`}
              </TableCell>
              <TableCell>
                {(flock as any).ambers?.amber_name || `Amber ${flock.amber_id}`}
              </TableCell>
              <TableCell>{flock.quantity}</TableCell>
              <TableCell>{flock.age} يوم</TableCell>
              <TableCell>{flock.batch_no}</TableCell>
              <TableCell>
                {flock.date_of_acquisition 
                  ? format(new Date(flock.date_of_acquisition), 'yyyy-MM-dd')
                  : '-'
                }
              </TableCell>
              <TableCell>{flock.invoice_no || '-'}</TableCell>
              <TableCell className="max-w-xs truncate">
                {flock.details || '-'}
              </TableCell>
              <TableCell>
                <div className="flex gap-2">
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => handleView(flock)}
                    title="عرض التفاصيل"
                  >
                    <Eye className="h-4 w-4" />
                  </Button>
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => handleEdit(flock)}
                    title="تعديل"
                  >
                    <Edit className="h-4 w-4" />
                  </Button>
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => handleDelete(flock.id!)}
                    disabled={deletingId === flock.id}
                    title="حذف"
                    className="text-red-600 hover:text-red-700"
                  >
                    <Trash2 className="h-4 w-4" />
                  </Button>
                </div>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
      
      {flocks?.length === 0 && (
        <div className="text-center py-8 text-gray-500">
          لا توجد قطعان مسجلة
        </div>
      )}
    </div>
  )
}
