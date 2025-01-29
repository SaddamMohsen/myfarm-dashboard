import { createServerClient, parseCookieHeader } from '@supabase/ssr'
import { SupabaseClient } from '@supabase/supabase-js'
import type { Context, MiddlewareHandler } from 'hono'
import { env } from 'hono/adapter'
import { setCookie } from 'hono/cookie'

declare module 'hono' {
  interface ContextVariableMap {
    supabase: SupabaseClient
  }
}

export const getSupabase = (c: Context) => {
  return c.get('supabase')
}
export const getUser =async (c: Context) => {
    //return c.get('user')
    const supabase = getSupabase(c)
    const { data, error } = await supabase.auth.getUser()
  
    if (error) console.log('error in get user', error)
  
    if (!data?.user) {
      return {error:'You are not logged in.'};
      
    }
  
    return {user:data.user};

}
export const setUser=(c: Context,user:any)=>{
    console.log('setting user');
  return  c.set('user',user);
}
type SupabaseEnv = {
  SUPABASE_URL: string
  SUPABASE_ANON_KEY: string
}

export const supabaseMiddleware = (): MiddlewareHandler => {

  return async (c, next) => {
    const supabaseEnv = env<SupabaseEnv>(c)
    const supabaseUrl = supabaseEnv.SUPABASE_URL
    const supabaseAnonKey = supabaseEnv.SUPABASE_ANON_KEY

    if (!supabaseUrl) {
      throw new Error('SUPABASE_URL missing!')
    }

    if (!supabaseAnonKey) {
      throw new Error('SUPABASE_ANON_KEY missing!')
    }

    const supabase = createServerClient(supabaseUrl, supabaseAnonKey, {
      cookies: {
        getAll() {
           // console.log('in supabase middleware',(c.req.header('Cookie') ?? ''));
          return parseCookieHeader(c.req.header('Cookie') ?? '')
        },
        setAll(cookiesToSet) {
            //@ts-ignore
          cookiesToSet.forEach(({ name, value, options }) => setCookie(c, name, value, options))
        },
      },
    })
     
    c.set('supabase', supabase)
    
    await next()
  }
}