import { createClient } from "@/utils/supabase/server";
import { Hono } from "hono";
import { handle } from "hono/vercel";

export const runtime = "edge";

const app = new Hono().basePath("/api");

app.notFound((c) => {
  return c.text("Not Found API", 404);
});
///TODO add a middleware to check roles of user
app.use("*", async (c, next) => {
  console.log("in check auth middleware");
  const supabase = createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return c.json(
      {
        error: "not authenticated",
      },
      401
    );
  }
  next();
});
app.get("/hello", (c) => {
  return c.json({
    message: "Hello Next.js! from Hono",
  });
});

export const GET = handle(app);
export const POST = handle(app);
