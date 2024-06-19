import Image from "next/image";
import Link from "next/link";

export default function MyFarmLogo() {
  return (
    <Link href="/">
      <div className="items-center pt-12 hidden lg:flex">
        <Image src="/img/logo.png" alt="logo" height={98} width={98} />
        <p className="font-semibold text-white text-2xl mr-2.5">مزرعتي</p>
      </div>
    </Link>
  );
}
