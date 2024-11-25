import AuthButton from "@/components/AuthButton";
import NextLogo from "./NextLogo";
import MyFarmLogo from "./myfarm-logo";
import { Navigation } from "./navigation";

export default function Header() {
  return (
    <header dir="rtl" className="w-full pb-16 px-4 py-8 lg:px-14 bg-gradient-to-b from-blue-700 to to-blue-500/40 obacity-40 ">
      <div className="max-w-screen-2xl mx-auto">
        <div className="flex items-center justify-between w-full pb-4">
          <div className="flex items-center lg:gap-x-16">
            <MyFarmLogo />
            <Navigation />
          </div>
          <AuthButton />
        </div>
      </div>
    </header>
  );
}
