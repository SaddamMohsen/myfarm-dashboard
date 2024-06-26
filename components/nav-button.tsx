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
        "w-full lg:w-auto font-semibold text-xl justify-between hover:bg-white/20 hover:text-white",
        " border-none focus-visible:ring-offset-0 focus-visible:ring-transparent outline-none",
        "text-white focus:bg-white/30 transition-all",
        {
          "bg-white/10 text-white": isActive,
          "bg-transparent": !isActive,
        }
      )}>
      <Link href={href}>{label}</Link>
    </Button>
  );
};
