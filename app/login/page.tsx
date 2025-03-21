'use client';
import Link from "next/link";
import { headers } from "next/headers";
import { createClient } from "@/utils/supabase/server";
import { redirect } from "next/navigation";
import { SubmitButton } from "./submit-button";
import { useState, useTransition } from "react";
import { Loader2 } from "lucide-react";
import {ErrorMessage} from "@/components/ErrorMessage";
import MyFarmLogo from "@/components/myfarm-logo";
import { useGetUserInfoQuery, useLoginUserMutation } from "@/lib/services/farms-api";
import { set } from "date-fns";

export default function Login({
  searchParams,
}: {
  searchParams: { message: string };
}) {
  const { data: user, isLoading:isFetchingUser } = useGetUserInfoQuery();

  // Log the user information for debugging purposes
  

  // Redirect to the login page if the user is not authenticated and loading is complete
  if (user && !isFetchingUser) {
    return redirect("/main");
  }
 const [login,{isLoading}]=useLoginUserMutation();
 const [error,setError]=useState<string|null>(null);
  const signIn = async (formData: FormData) => {
   

    const email = formData.get("email") as string;
    const password = formData.get("password") as string;
   
    const result = await login({
      email:email,
      password:password,
    }).unwrap();
     console.log('data',result);
     //redirect('/main');
    if (result?.error) {
      console.log('in login error',result?.error.code);
      setError(result?.error.code);
     setTimeout(() => {
      setError(null);
      }
     ,5000);
    
      //return redirect("/login");
    }
    else{
    return redirect("/main");
    }
  
  };

  // const signUp = async (formData: FormData) => {
  //   "use server";

  //   const origin = headers().get("origin");
  //   const email = formData.get("email") as string;
  //   const password = formData.get("password") as string;
  //   const supabase = createClient();

  //   const { error } = await supabase.auth.signUp({
  //     email,
  //     password,
  //     options: {
  //       emailRedirectTo: `${origin}/auth/callback`,
  //     },
  //   });

  //   if (error) {
  //     console.log('error', error);
  //     return redirect("/login?message=Could not authenticate user");
  //   }

  //   return redirect("/login?message=Check email to continue sign in process");
  // };

  return (
    <div className=" flex flex-col w-full min-h-screen px-8 lg:max-w-screen-lg  justify-center items-center gap-2" dir="rtl">
      <Link
        href="/"
        className="absolute left-8 top-8 py-2 px-4 rounded-md no-underline text-foreground bg-btn-background hover:bg-btn-background-hover flex items-center group text-sm">
        رجــــوع
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="2"
          strokeLinecap="round"
          strokeLinejoin="round"
          className="mr-2 h-4 w-4 transition-transform group-hover:-translate-x-1">
          <polyline points="15 18 9 12 15 6" />
        </svg>{" "}
      </Link>

      <form className="animate-in flex flex-col border w-full p-4 rounded-md shadow-md bg-fuchsia-50 justify-center gap-2 text-black">
      <div className="flex items-center lg:gap-x-16">
            <MyFarmLogo />
            
          </div>
      <h2 className="text-center font-bold text-2xl  text-black  rounded-lg" >تسجيل الدخول</h2>
        <label className="text-md font-semibold antialiased" htmlFor="email">
          البريد الالكتروني
        </label>
        <input
          className="rounded-md  px-4 py-2 bg-inherit border mb-6"
          name="email"
          placeholder="you@example.com"
          required
        />
        <label className="font-semibold text-md" htmlFor="password">
          كلمة المرور
        </label>
        <input
          className="rounded-md px-4 py-2 bg-inherit border mb-6"
          type="password"
          name="password"
          placeholder="******"
          required
        />
       <SubmitButton
          formAction={signIn}
          className="bg-gradient-to-b from-blue-500/20 to to-blue-700/40
 rounded-md px-4 py-2 font-semibold antialiased text-foreground mb-2"
          pendingText=" جاري تسجيل الدخول....."
          >
          دخــــــــول
        </SubmitButton>
        {/* <SubmitButton
          formAction={signUp}
          className="border border-foreground/20 bg-gradient-to-b from-blue-500/20 to to-blue-700/40 antialiased rounded-md px-4 py-2 font-semibold text-foreground mb-2"
          pendingText="جاري تسجيل الحساب..... ">
          إنشاء حساب
        </SubmitButton> */}
        {error && (
          <div className="bg-red-600/90 rounded-lg text-center text-white p-2">
          {/* <ErrorMessage message={error} /> */}
          {error}
          </div>
        )}
      </form>
     
    </div>
  );
}
