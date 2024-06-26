"use server";

import { createClient } from "@/utils/supabase/server";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";
const supabase = createClient();
export const signOut = async () => {
  console.log("in sign ouy");

  await supabase.auth.signOut();
  cookies().delete("sb-flkmhzdiztimgzoshqpx-auth-token");
  return redirect("/login");
};
