import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import Link from "next/link";

type Props = {
  href: string;
  label: string;
  isActive?: boolean;
};

export const NavButton = ({ href, label, isActive }: Props) => {
  return (
    <Button
      asChild
      size="sm"
      variant="outline"
      className={cn(
        "w-full lg:w-auto font-semibold text-xl justify-between hover:bg-white/20 hover:text-blue-300",
        " border-none focus-visible:ring-offset-0 focus-visible:ring-transparent outline-none",
        "text-blue-700 focus:bg-white/30 transition-all",
        {
          "bg-white/10 text-red-500": isActive,
          "bg-transparent": !isActive,
        }
      )}>
      <Link href={href}>{label}</Link>
    </Button>
  );
};
