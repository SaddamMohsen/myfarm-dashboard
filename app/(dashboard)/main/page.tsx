"use client"
import { redirect } from "next/navigation";
import DashboardContent from "@/components/pages/dashboard-page";
import { useGetUserInfoQuery } from "@/lib/services/farms-api";

export default function ProtectedPage() {
  // Fetch user information using the custom hook
  const { data: user, isLoading } = useGetUserInfoQuery();

  // Log the user information for debugging purposes
  console.log('User information on the main page:', user);

  // Redirect to the login page if the user is not authenticated and loading is complete
  if (!user && !isLoading) {
    return redirect("/login");
  }

  // Render the dashboard content if the user is authenticated
  return <DashboardContent />;
}


  
