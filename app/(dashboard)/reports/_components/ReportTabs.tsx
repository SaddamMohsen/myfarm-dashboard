import React, { useState } from 'react';
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"; // تأكد من أن لديك مكونات علامات التبويب
import { Card } from '@/components/ui/card';

interface ReportTabsProps {
  onTabChange: (tab: string) => void; // دالة عند تغيير علامة التبويب
}

const ReportTabs: React.FC<ReportTabsProps> = ({ onTabChange }) => {
  const [activeTab, setActiveTab] = useState("monthly");

  const handleTabChange = (tab: string) => {
    setActiveTab(tab);
    onTabChange(tab);
  };

  return (
    <div className="flex items_start justify-start font-bold text-xl">
    <Tabs defaultValue="monthly" className='text-black' value={activeTab} onValueChange={handleTabChange}>
      <TabsList>
        <TabsTrigger className='font-bold text-black-100 text-xl focus:p-18 group-active:outline-2 group-focus:outline-offset-2 focus:outline-violet-500 active:bg-violet-700' value="monthly">تقرير شهري</TabsTrigger>
        <TabsTrigger className='font-bold text-xl focus:outline-2 group-activ:outline-offset-2 focus:outline-violet-500 active:bg-violet-700' value="daily">تقرير يومي</TabsTrigger>
        <TabsTrigger className='font-bold text-xl focus:outline-2 focus:outline-offset-2 focus:outline-violet-500 active:bg-violet-700' value="amber">تقرير عن Amber</TabsTrigger>
      </TabsList>
      <TabsContent value="monthly">
        {/* محتوى التقرير الشهري يمكن أن يظهر هنا إذا لزم الأمر */}
      </TabsContent>
      <TabsContent value="daily">
        {/* محتوى التقرير اليومي يمكن أن يظهر هنا إذا لزم الأمر */}
      </TabsContent>
      <TabsContent value="amber">
        {/* محتوى تقرير Amber يمكن أن يظهر هنا إذا لزم الأمر */}
      </TabsContent>
    </Tabs>
    </div>
  );
};

export default ReportTabs; 