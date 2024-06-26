import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import { handle } from "hono/vercel";
import farms from "./farms";
import { getCookie } from "hono/cookie";

export const runtime = "edge";

const app = new Hono().basePath("/api");

app.notFound((c) => {
  return c.text("Not Found API", 404);
});
///TODO add a middleware to check roles of user
app.use("*", async (c, next) => {
  console.log("in hono check auth middleware");
  const supabase = createClient();

  try {
    let cookie = getCookie(c);
    let token = "";
    for (let a in cookie) {
      token = cookie[a].split(",")[0];
    }
    token = token.substring(17, token.length - 1);

    const {
      data: { user },
    } = await supabase.auth.getUser(token);

    if (!user) {
      console.log("user not authenticated");
      return c.redirect(`/login`);
      return c.json(
        {
          error: "not authenticated",
        },
        401
      );
    }
  } catch (e) {
    console.log("error in get user", e);
    throw e;
  }
  await next();
});

const routes = app.route("/farms", farms);
// app.get("/hello", (c) => {
//   return c.json({
//     message: "Hello Next.js! from Hono",
//   });
// });

export const GET = handle(app);
export const POST = handle(app);
//export default app;
export type AppType = typeof routes;
