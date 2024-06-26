"use client";

import { signOut } from "@/lib/actions/logout";
type Props = {
  handler: React.MouseEventHandler<HTMLButtonElement>;
};
export const LogoutButton = () => {
  //   const handleSubmit = async () => {
  //     "use server";

  //     const supabase = createClient();
  //     await supabase.auth.signOut();
  //     // cookies().delete("sb-flkmhzdiztimgzoshqpx-auth-token");
  //     return redirect("/login");
  //   };
  return (
    <button
      type="submit"
      className="font-semibold rounded-md no-underline bg-white   hover:bg-white/40"
      onClick={() => signOut()}>
      خروج
    </button>
  );
};
