'use client';
//import { createClient } from "@/utils/supabase/server";

import Link from "next/link";
import { redirect } from "next/navigation";
import { cookies } from "next/headers";
import {
  DropdownMenu,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuTrigger,
  DropdownMenuContent,
  DropdownMenuSeparator,
} from "@/components/ui/dropdown-menu";
import { Avatar, AvatarFallback, AvatarImage } from "./ui/avatar";
import { UserCircle, UserCircle2 } from "lucide-react";
import { LogoutButton } from "./logout-button";
import { useGetUserInfoQuery } from "@/lib/services/farms-api";
import { Users } from "@/constants/types";

export default  function AuthButton() {
  const {data:user, isLoading}=useGetUserInfoQuery()
//  const {
//     data: { user },
//   } = (await supabase.auth?.getUser()) ?? { data: { user: null } };

  // useEffect(() => {
  // console.log(user);
  // }, [user]);

  return user ? (
    <div className="flex flex-col items-center justify-center">
      <DropdownMenu>
        <DropdownMenuTrigger>
          <Avatar className=" rounded-full hover:animate-spin-1 border-none focus-visible:bg-transparent  focus-visible:border-none">
            <UserCircle2 className="w-auto h-auto text-white" />
            {/* <AvatarImage src="/img/logo.png" /> */}
            <AvatarFallback>
              <UserCircle className="w-8 h-8 text-white" />
            </AvatarFallback>
          </Avatar>
        </DropdownMenuTrigger>
        <DropdownMenuContent className="w-30 bg-white" align="start">
        <DropdownMenuLabel>مرحبا {user.email}</DropdownMenuLabel>
         
          
          <DropdownMenuSeparator /> 
          <DropdownMenuItem className="flex flex-row items-center justify-stretch w-full bg-white  hover:bg-blue-500/20">
            <Link href="/profile" className="flex flex-row items-center justify-stretch w-full gap-2 ">
              <UserCircle className="w-8 h-8 text-blue-500" />
              <span className="text-black">الملف الشخصي</span>
            </Link>
          </DropdownMenuItem>
          <DropdownMenuSeparator />
          <DropdownMenuItem className="flex items-center justify-stretch w-full  hover:bg-blue-500/20">
            <LogoutButton />
          </DropdownMenuItem>
        </DropdownMenuContent>
      </DropdownMenu>
      <span className="sr-only text-wrap">{user?.email}</span>
    </div>
  ) : (
    //   <div className="flex items-center gap-4">
    //     مرحبا, {user.email}!
    //     <form action={signOut}>
    //       <button className="py-2 px-4 rounded-md no-underline bg-white   hover:bg-white/40">
    //         خروج
    //       </button>
    //     </form>
    //   </div>
    <Link
      href="/login"
      className="py-2 px-3 flex rounded-md no-underline  bg-white hover:bg-white/40">
      دخول
    </Link>
  );
}
