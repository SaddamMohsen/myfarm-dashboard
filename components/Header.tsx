import AuthButton from "@/components/AuthButton";
import NextLogo from "./NextLogo";
import MyFarmLogo from "./myfarm-logo";
import { Navigation } from "./navigation";

export default function Header() {
  return (
    <header
      dir="rtl"
      className="w-full pb-16 px-4 py-8 lg:px-14 bg-linear-to-b from-gray-300 to to-gray-200 obacity-40 "
      style={{
       // backgroundImage: "url('/img/header-bg.jpg') 50%",
        backgroundSize: "cover",
        backgroundPosition: "center",
        backgroundRepeat: "no-repeat",
       
      }}
    >
      <div className="max-w-(--breakpoint-2xl) mx-auto">
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
