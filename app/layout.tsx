import { GeistSans } from "geist/font/sans";
import "./globals.css";
import StoreProvider from "./providerStore";
import { Toaster } from "@/components/ui/toaster"

const defaultUrl = process.env.VERCEL_URL
  ? `https://${process.env.VERCEL_URL}`
  : "http://localhost:3000";

export const metadata = {
  metadataBase: new URL(defaultUrl),
  title: "MyFarm Dashboard Application",
  description: "The fastest way to build apps with Next.js and Supabase",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <StoreProvider>
      <html lang="en"  className={GeistSans.className}>
        <body>
          <main className="min-h-screen flex flex-col w-full items-center">
            {children}
          </main>
          <Toaster />
        </body>
      </html>
    </StoreProvider>
  );
}
