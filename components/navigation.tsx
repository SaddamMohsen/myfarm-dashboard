"use client";
import { usePathname, useRouter } from "next/navigation";
import { NavButton } from "@/components/nav-button";
import { useMedia } from "react-use";
import { Sheet, SheetTrigger, SheetContent } from "@/components/ui/sheet";
import { useState } from "react";
import { Button } from "./ui/button";
import { cn } from "@/lib/utils";
import { Menu } from "lucide-react";
const routes = [
  {
    href: "/main",
    label: "الرئيسية",
  },
  {
    href: "/farms",
    label: "المزارع",
  },
  {
    href: "/flocks",
    label: "القطعان",
  },
  {
    href: "/supervisors",
    label: "المشرفين",
  },
  {
    href: "/reports",
    label: "التقارير",
  },{
    href: "/profile",
    label: "الاعدادات",
  },
];
export const Navigation = () => {
  const [isOpen, setIsOpen] = useState(false);
  const pathName = usePathname();
  const router = useRouter();
  const isMobile = useMedia("(max-width:1024px)", false);
  const handleClick = (href: string) => {
    router.push(href);
    setIsOpen(false);
  };
  if (isMobile) {
    return (
      <Sheet open={isOpen} onOpenChange={setIsOpen}>
        <SheetTrigger>
          <Button
            size="sm"
            variant="outline"
            className={cn(
              "font-semibold text-xl bg-white/10  hover:bg-white/20 hover:text-white",
              " border-none focus-visible:ring-offset-0 focus-visible:ring-transparent outline-none",
              " text-white focus:bg-white/30 transition-all",
              {}
            )}>
            <Menu className="size-6" />
          </Button>
        </SheetTrigger>
        <SheetContent side="right" className="">
          <nav className="flex flex-col gap-y-2 pt-4 ">
            {routes.map((route) => (
              <Button
                key={route.href}
                variant={route.href === pathName ? "secondary" : "ghost"}
                className="w-full justify-start hover:font-semibold text-xl "
                onClick={() => handleClick(route.href)}>
                {route.label}
              </Button>
            ))}
          </nav>
        </SheetContent>
      </Sheet>
    );
  }
  return (
    <nav className="hidden lg:flex items-center gap-x-2 overflow-x-auto ">
      {routes.map((route) => (
        <NavButton
          key={route.href}
          href={route.href}
          label={route.label}
          isActive={pathName === route.href}
        />
      ))}
    </nav>
  );
};
