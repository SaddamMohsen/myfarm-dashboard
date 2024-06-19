import { createClient } from "@/utils/supabase/server";
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

// import { useEffect } from "react";

export default async function AuthButton() {
  const supabase = createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  const signOut = async () => {
    "use server";

    const supabase = createClient();
    await supabase.auth.signOut();
    cookies().delete("sb-flkmhzdiztimgzoshqpx-auth-token");
    return redirect("/login");
  };
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
          <DropdownMenuLabel>حسابي</DropdownMenuLabel>
          <DropdownMenuSeparator />
          <DropdownMenuItem className="flex items-center justify-stretch w-full bg-white">
            <form action={signOut}>
              <button className="font-semibold rounded-md no-underline bg-white   hover:bg-white/40">
                خروج
              </button>
            </form>
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
