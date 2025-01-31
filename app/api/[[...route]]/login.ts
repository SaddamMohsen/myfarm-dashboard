import { createClient } from "@/utils/supabase/client";
import { zValidator } from "@hono/zod-validator";

import {getSupabase, setUser} from '@/utils/supabase/auth.middleware';

import { Hono } from "hono";
import { getCookie, setCookie } from "hono/cookie";
import { HTTPException } from "hono/http-exception";
import { z } from "zod";

//const supabase=createClient();
const app = new Hono()
.get('/user', async (c) => {
    console.log('in get user hono endpoint');
    const supabase = getSupabase(c)
    const { data, error } = await supabase.auth.getUser()
  
    if (error) console.log('error in get user', error)
  
    if (!data?.user) {
      return c.json({
        message: 'You are not logged in.',
      })
    }
  
    return c.json({
     
    data: data.user,
    })
  })
.post(
    "/sign-in",
    zValidator(
        "json",
        z.object({
            email: z.string(),
            password: z.string().min(5),
        }),
    ),
    async (c) => {
        const { email, password } = c.req.valid("json");
           const supabase = getSupabase(c);
        const { data, error } = await supabase.auth.signInWithPassword({ email, password });

        if (error) {
            console.error("Error while signing in", error);
            return c.json({ error: error },200);
        }

        setCookie(c, "access_token", data?.session.access_token, {
            ...(data?.session.expires_at && { expires: new Date(data.session.expires_at) }),
            httpOnly: true,
            path: "/",
            secure: true,
        });

        setCookie(c, "refresh_token", data?.session.refresh_token, {
            ...(data?.session.expires_at && { expires: new Date(data.session.expires_at) }),
            httpOnly: true,
            path: "/",
            secure: true,
        });
        setUser(c, data.user);
        return c.json(data.user);
    },
)
.get('/sign-out', async (c) => {
   
    const supabase = getSupabase(c)
     await supabase.auth.signOut
  
   
      return c.json({
        data: 'You are not logged in.',
      })
    
  
  });

export default app;