import { createClient } from "@/utils/supabase/client";
import { Hono } from "hono";
import { Env } from "./route";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { Farms } from "@/constants/types";
//import { cookies } from "next/headers";

const supabase = createClient();

const app = new Hono<Env>()
  .get("/", async (c) => {
    const schema = c.var.user?.user_metadata.schema;

    const { data: farms, error }: { data: any; error: any } = await supabase
      .schema(schema)
      .from("farms")
      .select();
    console.log(farms);
    console.log(error);
    return c.json({ farms });
  })
  .post(
    "/",
    zValidator("json", Farms, (result, c) => {
      if (!result.success) {
        console.log("invalid");
        return c.text("Invalid Values!", 400);
      }
    }),
    async (c) => {
      console.log("in post farm");
      const farm = c.req.valid("json");
      console.log("farm in post", farm);
      return c.json({ farms: "success" });
    }
  );

export default app;
