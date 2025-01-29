'use client'
//import { createClient } from "@/utils/supabase/server";
import { redirect } from "next/navigation";
import DashboardContent from "@/components/pages/dashboard-page";
import { useGetUserInfoQuery } from "@/lib/services/farms-api";

export default  function ProtectedPage() {
   const {data:user, isLoading}=useGetUserInfoQuery()
  //const supabase = createClient();

  // const {
  //   data: { user },
  // } = await supabase.auth.getUser();
 console.log('user in main page',user);
  // if (!user) {
  //   return redirect("/login");
  // }

  return <DashboardContent />;
}
