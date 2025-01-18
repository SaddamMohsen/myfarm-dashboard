import { NextResponse, type NextRequest } from "next/server";
import { updateSession } from "@/utils/supabase/middleware";
import { createClient } from "./utils/supabase/server";
import { cookies } from "next/headers";
const protectedRoutes = ["/farms",'/supervisors','/main','/reports','/profile'];
export async function middleware(request: NextRequest) {
  const cookieStore = cookies();
  const cookie = cookieStore.get("sb-flkmhzdiztimgzoshqpx-auth-token");
  //console.log("myCookie", cookie?.value);
  const nextUrl = request.nextUrl;
  // const supabase = createClient();
  // const {
  //   data: { user },
  // } = await supabase.auth.getUser();

  if (protectedRoutes.includes(nextUrl.pathname) && !cookie) {
    let callbackUrl = nextUrl.pathname;

    if (nextUrl.search) {
      callbackUrl += nextUrl.search;
    }

    const encodedCallbackUrl = encodeURIComponent(callbackUrl);

    return NextResponse.rewrite(
      new URL(`/login?callbackUrl=${encodedCallbackUrl}`, nextUrl)
    );
  }
  console.log("in middleware", request.nextUrl.pathname);
  return await updateSession(request);
}

export const config = {
  matcher: [
    /*
     * Match all request paths except:
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     * - images - .svg, .png, .jpg, .jpeg, .gif, .webp
     * Feel free to modify this pattern to include more paths.
     */
    "/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)",
  ],
};
