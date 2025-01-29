import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import {cors} from "hono/cors"
import { handle } from "hono/vercel";
import farms from "./farms";
import supervisors from "./supervisors";
import productions from "./productions";
import auth from "./login";
import reports from "./reports";
import { getCookie,setCookie } from "hono/cookie";
import { SuperVisor } from "@/constants/types";
import { createMiddleware } from "hono/factory";
import {getSupabase, supabaseMiddleware} from '@/utils/supabase/auth.middleware';
export const runtime = "edge";

///TODO add a middleware to check roles of user
export type Env = {
  Variables: {
    user:  any;
    //jwt: string;
  };
};

const authUserMiddleware = createMiddleware<Env>(async (c, next) => {
  // console.log("in auth middleware 1");

  let ruser = {};
  let jwt='';
 

    const url = c.req.url;

    if (
      url.includes('/api/auth/sign-in')
    ){
      console.log('going to sign in');
      await next();
    }
    console.log('user found',c.var.user);
    if(!c.var.user){
    const supabase = getSupabase(c);
    try{
   // console.log('supabase',supabase);
  //   let cookie = getCookie(c);
  //  // console.log('cookie',cookie);
  //   let token = "";
  //   for (let a in cookie) {
  //      token = cookie[a].split(",")[0];
  //    }
  //    token = token.substring(17, token.length - 1);
   //console.log('token',token);
    const {
      data: { user },
    } = await supabase.auth.getUser();
      // console.log('user',user);
    if (!user) {
      console.log("user not authenticated");
      return c.redirect(`/login`);
    }
    ruser = user;
    //jwt=token;
    //return user;
  } catch (e) {
    console.log("error in get user", e);
    throw e;
  }
  c.set("user", ruser);
}
  //c.set("jwt", jwt);
  // next();
});
const app = new Hono<Env>().basePath("/api");
app.use('/api/*', cors())
app.notFound((c) => {
  return c.text("Not Found API", 404);
});


app.use(supabaseMiddleware());
//app.use(authUserMiddleware);
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

const routes = app.route("/farms", farms)
 .route('supervisors',supervisors)
 .route('productions',productions)
 .route('reports',reports)
 .route('auth',auth);


export const GET = handle(app);
export const POST = handle(app);
//export default app;
export type AppType = typeof routes;
