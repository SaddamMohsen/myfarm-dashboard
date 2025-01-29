import { createServerClient } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

export async function updateSession(request: NextRequest) {
  let supabaseResponse = NextResponse.next({
    request,
  })

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll()
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) => request.cookies.set(name, value))
          supabaseResponse = NextResponse.next({
            request,
          })
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          )
        },
      },
    }
  )

  // IMPORTANT: Avoid writing any logic between createServerClient and
  // supabase.auth.getUser(). A simple mistake could make it very hard to debug
  // issues with users being randomly logged out.

  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (
    !user &&
    !request.nextUrl.pathname.startsWith('/login') &&
    !request.nextUrl.pathname.startsWith('/auth')
  ) {
    // no user, potentially respond by redirecting the user to the login page
    const url = request.nextUrl.clone()
    url.pathname = '/login'
    return NextResponse.redirect(url)
  }

  // IMPORTANT: You *must* return the supabaseResponse object as it is. If you're
  // creating a new response object with NextResponse.next() make sure to:
  // 1. Pass the request in it, like so:
  //    const myNewResponse = NextResponse.next({ request })
  // 2. Copy over the cookies, like so:
  //    myNewResponse.cookies.setAll(supabaseResponse.cookies.getAll())
  // 3. Change the myNewResponse object to fit your needs, but avoid changing
  //    the cookies!
  // 4. Finally:
  //    return myNewResponse
  // If this is not done, you may be causing the browser and server to go out
  // of sync and terminate the user's session prematurely!

  return supabaseResponse
}
/*
//import { createServerClient, type CookieOptions } from "@supabase/ssr";
import { createServerClient, parseCookieHeader } from '@supabase/ssr'
import { redirect } from "next/navigation";
import { type NextRequest, NextResponse } from "next/server";

export const updateSession = async (request: NextRequest) => {
  // This `try/catch` block is only here for the interactive tutorial.
  // Feel free to remove once you have Supabase connected.
  try {
    // Create an unmodified response
    let response = NextResponse.next({
      request: {
        headers: request.headers,
      },
    });

    const supabase = createServerClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
      {
        cookies: {
           getAll() {
                     // console.log('in  middleware',(request.headers.get('Cookie') ?? ''));
                    return parseCookieHeader(request.headers.get('Cookie') ?? '')
                  },
                  setAll(cookiesToSet) {
                      //@ts-ignore
                    cookiesToSet.forEach(({ name, value, options }) => setCookie(c, name, value, options))
                  },
        }
      }
      //     get(name: string) {
      //       return request.cookies.get(name)?.value;
      //     },
      //     set(name: string, value: string, options: CookieOptions) {
      //       // If the cookie is updated, update the cookies for the request and response
      //       request.cookies.set({
      //         name,
      //         value,
      //         ...options,
      //       });
      //       response = NextResponse.next({
      //         request: {
      //           headers: request.headers,
      //         },
      //       });
      //       response.cookies.set({
      //         name,
      //         value,
      //         ...options,
      //       });
      //     },
      //     remove(name: string, options: CookieOptions) {
      //       // If the cookie is removed, update the cookies for the request and response
      //       request.cookies.set({
      //         name,
      //         value: "",
      //         ...options,
      //       });
      //       response = NextResponse.next({
      //         request: {
      //           headers: request.headers,
      //         },
      //       });
      //       response.cookies.set({
      //         name,
      //         value: "",
      //         ...options,
      //       });
      //     },
      //   },
      // }
    );

    // This will refresh session if expired - required for Server Components
    // https://supabase.com/docs/guides/auth/server-side/nextjs
    // const user = await supabase.auth.getUser();
    // if (!user) redirect("/login");
    return response;
  } catch (e) {
    // If you are here, a Supabase client could not be created!
    // This is likely because you have not set up environment variables.
    // Check out http://localhost:3000 for Next Steps.
    return NextResponse.next({
      request: {
        headers: request.headers,
      },
    });
  }
};
*/
