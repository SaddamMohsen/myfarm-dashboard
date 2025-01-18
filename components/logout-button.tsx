"use client";

import { signOut } from "@/lib/actions/logout";
type Props = {
  handler: React.MouseEventHandler<HTMLButtonElement>;
};
export const LogoutButton = () => {
 
  return (
    <button
      type="submit"
      className="font-semibold rounded-md no-underline w-full"
      onClick={() => signOut()}>
      خروج
    </button>
  );
};
