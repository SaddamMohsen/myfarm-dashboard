import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import { Farms } from "@/constants/types";
import { z } from "zod";
import { UserResponse } from "@supabase/supabase-js";
import { getCookie } from "hono/cookie";
import { RequestCookies } from "next/dist/compiled/@edge-runtime/cookies";
//import { cookies } from "next/headers";

const supabase = createClient();

const app = new Hono().get("/", async (c) => {
  // let cookie = c.req.header("cookie");
  let cookie = getCookie(c);
  let token = "";
  for (let a in cookie) {
    token = cookie[a].split(",")[0];
  }
  token = token.substring(17, token.length - 1);

  const {
    data: { user },
  } = await supabase.auth.getUser(token);

  console.log("role", user?.user_metadata.role);

  const { data: farms }: { data: z.infer<typeof Farms>[] | any } =
    // const farms =
    await supabase.schema(user?.user_metadata.schema).from("farms").select(); //.returns<z.infer<typeof Farms>[]>;
  // console.log(farms);
  return c.json({ farms });
});

export default app;
