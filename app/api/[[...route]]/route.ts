import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import {cors} from "hono/cors"
import { handle } from "hono/vercel";
import farms from "./farms";
import supervisors from "./supervisors";
import productions from "./productions";
import auth from "./login";
import reports from "./reports";
import flocks from "./flocks";
import { getCookie,setCookie } from "hono/cookie";
import { SuperVisor } from "@/constants/types";
import { createMiddleware } from "hono/factory";
import {getSupabase, getUser, supabaseMiddleware} from '@/utils/supabase/auth.middleware';
export const runtime = "edge";

///TODO add a middleware to check roles of user
export type Env = {
  Variables: {
    user:  any;
    //jwt: string;
  };
};

const authUserMiddleware = createMiddleware<Env>(async (c, next) => {
  
    const url = c.req.url;

    if (
      !url.includes('/api/auth/sign-in')
    ){
      const {user,error:userError} =await getUser(c);  
      if (!user) {
      console.log("user not authenticated");
      return c.redirect(`/login`);
      }
    }
    await next();
});
const app = new Hono<Env>().basePath("/api");
app.use('/api/*', cors())
app.notFound((c) => {
  return c.text("Not Found API", 404);
});


app.use(supabaseMiddleware());
app.use(authUserMiddleware);


const routes = app.route("/farms", farms)
 .route('supervisors',supervisors)
 .route('productions',productions)
 .route('reports',reports)
 .route('auth',auth)
 .route('flocks',flocks);


export const GET = handle(app);
export const POST = handle(app);
//export default app;
export type AppType = typeof routes;
