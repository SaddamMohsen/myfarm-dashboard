import Header from "@/components/Header";
import { Toaster } from "@/components/ui/toaster"

const defaultUrl = process.env.VERCEL_URL
  ? `https://${process.env.VERCEL_URL}`
  : "http://localhost:3000";

export const metadata = {
  metadataBase: new URL(defaultUrl),
  title: "MyFarm Dashboard ",
  description: "The fastest way to build apps with Next.js and Supabase",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <main className="min-h-screen w-full flex-1  bg-gradient-to-b from-[#ffffff] to-[#efe6e6]/50 obacity-40 ">
      <Header />
      {children}
      <Toaster />
    </main>
  );
}
