import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import { handle } from "hono/vercel";
import farms from "./farms";
import { getCookie } from "hono/cookie";
import { SuperVisor } from "@/constants/types";
import { createMiddleware } from "hono/factory";
import { User } from "@supabase/supabase-js";
export const runtime = "edge";

///TODO add a middleware to check roles of user
export type Env = {
  Variables: {
    user: User | any;
  };
};
const authUserMiddleware = createMiddleware<Env>(async (c, next) => {
  // console.log("in auth middleware 1");

  let ruser = {};
  try {
    const supabase = createClient();
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
    }
    ruser = user;
    //return user;
  } catch (e) {
    console.log("error in get user", e);
    throw e;
  }
  c.set("user", ruser);

  await next();
});
const app = new Hono<Env>().basePath("/api");

app.notFound((c) => {
  return c.text("Not Found API", 404);
});
app.use(authUserMiddleware);

// app.use("*", async (c, next) => {
//   console.log("in hono check auth middleware");
//   const supabase = createClient();

//   try {
//     let cookie = getCookie(c);
//     let token = "";
//     for (let a in cookie) {
//       token = cookie[a].split(",")[0];
//     }
//     token = token.substring(17, token.length - 1);

//     const {
//       data: { user },
//     } = await supabase.auth.getUser(token);

//     if (!user) {
//       console.log("user not authenticated");
//       return c.redirect(`/login`);
//       // return c.json(
//       //   {
//       //     error: "not authenticated",
//       //   },
//       //   401
//       // );
//     }
//   } catch (e) {
//     console.log("error in get user", e);
//     throw e;
//   }

//   await next();
// });

app.get("/supervisors", async (c) => {
  const supabase = createClient();

  let schema = c.var.user?.user_metadata.schema;
  let farmId: number = c.var.user?.user_metadata.farm_id;
  console.log(c.var.user.role);
  console.log(farmId);
  const { data, error } = await supabase
    .schema(schema)
    .from("supervisors")
    .select("*");
  //.eq("farm_id", farmId);
  console.log(data);
  console.log(error);
  return c.json({ data });
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
