'use client';
// import DeployButton from "../components/DeployButton";
// import AuthButton from "../components/AuthButton";

import { redirect } from "next/navigation";
import { useGetUserInfoQuery } from "@/lib/services/farms-api";
import Hero from "@/components/landing-page/hero";
import CTA from "@/components/landing-page/cti";
import Features from "@/components/landing-page/features";
import Footer from "@/components/landing-page/footer";
import Stats from "@/components/landing-page/state";
import Header from "@/components/landing-page/header";
export default function Index() {
   const {data:user, isLoading}=useGetUserInfoQuery()
  // const canInitSupabaseClient = () => {
  //   // This function is just for the interactive tutorial.
  //   // Feel free to remove it once you have Supabase connected.
  //   try {
  //     createClient();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // };
  // const supabase = createClient();
  // const {
  //   data: { user },
  // } = await supabase.auth.getUser();

  // if (!user) {
  //   console.log("no user");
  //   return redirect("/main");
  // } else {
  //   return redirect("/main");
  // }

  //const isSupabaseConnected = canInitSupabaseClient();

  return (
    <div className="flex flex-col min-h-screen " dir="rtl">
      <main>
        <Header />
        <Hero />
        <Features />
        <Stats />
        <CTA />
      </main>
      <Footer />
    </div>
  );
}
