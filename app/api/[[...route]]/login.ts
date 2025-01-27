import { createClient } from "@/utils/supabase/client";
import { zValidator } from "@hono/zod-validator";



import { Hono } from "hono";
import { getCookie, setCookie } from "hono/cookie";
import { HTTPException } from "hono/http-exception";
import { endTime, startTime } from "hono/timing";
import { z } from "zod";

const supabase=createClient();
const app = new Hono()
.post(
    "/sign-in",
    zValidator(
        "json",
        z.object({
            email: z.string(),
            password: z.string().min(6),
        }),
    ),
    async (c) => {
        const { email, password } = c.req.valid("json");

        const { data, error } = await supabase.auth.signInWithPassword({ email, password });

        if (error) {
            console.error("Error while signing in", error);
            throw new HTTPException(401, { message: error.message });
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

        return c.json(data.user);
    },
);

export default app;