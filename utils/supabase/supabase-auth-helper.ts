import { createClient } from '@supabase/supabase-js'


export function getAuthenticatedSupabase(token: string) {
    //const token = c.req.cookie('sb-token');
    return  createClient(process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
      {
        global: {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        },
      });
  }
  
