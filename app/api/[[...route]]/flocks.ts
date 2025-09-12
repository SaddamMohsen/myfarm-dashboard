import { Hono } from "hono";
import { Env } from "./route";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { FlockBatch, flockBatchSchema } from "@/constants/types";
import { getSupabase, getUser } from "@/utils/supabase/auth.middleware";

const app = new Hono<Env>()
  // Get all flocks or specific flock by ID
  .get("/", async (c) => {
    try {
      const { user } = await getUser(c);
      const schema = user?.user_metadata.schema ?? 'public';
      const supabase = getSupabase(c);
      const id = c.req.query('id');
      
      if (id) {
        // Get specific flock by ID
        const { data, error } = await supabase
          .schema(schema)
          .from("flock_batches")
          .select(`
            *,
            farms!inner(farm_name)
          `)
          .eq('id', id)
          .returns<FlockBatch>();
        
        if (error) throw error;
        return c.json({ flock: data });
      }
      
      // Get all flocks
      const { data, error } = await supabase
        .schema(schema)
        .from("flock_batches")
        .select(`
          *,
          farms!inner(farm_name)
        
        `)
        .returns<FlockBatch>();
      
      if (error) throw error;
      return c.json({ flocks: data });
    } catch (error: any) {
      console.log('error in get flocks', error);
      return c.json({ error: 'error in get flocks' }, 400);
    }
  })

  // Get flocks by farm ID
  .get("/farm/:farmId", async (c) => {
    try {
      const { user } = await getUser(c);
      const schema = user?.user_metadata.schema ?? 'public';
      const supabase = getSupabase(c);
      const farmId = c.req.param('farmId');
      
      const { data, error } = await supabase
        .schema(schema)
        .from("flock_batches")
        .select(`
          *,
          farms!inner(farm_name)
         
        `)
        .eq('farm_id', farmId)
        .returns<FlockBatch>();
      
      if (error) throw error;
      return c.json({ flocks: data });
    } catch (error: any) {
      console.log('error in get flocks by farm', error);
      return c.json({ error: 'error in get flocks by farm' }, 400);
    }
  })

  // Add new flock
  .post(
    "/",
    zValidator("json", flockBatchSchema, (result, c) => {
      if (!result.success) {
        console.log("invalid flock values", result.error);
        return c.text("Invalid Flock Values!", 400);
      }
    }),
    async (c) => {
      try {
        const { user } = await getUser(c);
        const schema = user?.user_metadata.schema ?? 'public';
        const supabase = getSupabase(c);
        const flock = c.req.valid("json");
        
        console.log("in post flock", flock);
        
        const { data, error } = await supabase
          .schema(schema)
          .from("flock_batches")
          .insert(flock)
          .returns();
        
        if (error) throw error;
        console.log('response from insert flock', data);
        
        return c.json({ success: true, flock: data });
      } catch (error: any) {
        console.log("error in post flock", error);
        return c.json({ error: "error in post flock" }, 400);
      }
    }
  )

  // Update existing flock
  .put(
    "/:id",
    zValidator("json", flockBatchSchema.partial(), (result, c) => {
      if (!result.success) {
        console.log("invalid flock update values", result.error);
        return c.text("Invalid Flock Update Values!", 400);
      }
    }),
    async (c) => {
      try {
        const { user } = await getUser(c);
        const schema = user?.user_metadata.schema ?? 'public';
        const supabase = getSupabase(c);
        const id = c.req.param('id');
        const flockUpdates = c.req.valid("json");
        
        console.log("in put flock", { id, flockUpdates });
        
        const { data, error } = await supabase
          .schema(schema)
          .from("flock_batches")
          .update(flockUpdates)
          .eq('id', id)
          .returns();
        
        if (error) throw error;
        console.log('response from update flock', data);
        
        return c.json({ success: true, flock: data });
      } catch (error: any) {
        console.log("error in put flock", error);
        return c.json({ error: "error in put flock" }, 400);
      }
    }
  )

  // Delete flock
  .delete("/:id", async (c) => {
    try {
      const { user } = await getUser(c);
      const schema = user?.user_metadata.schema ?? 'public';
      const supabase = getSupabase(c);
      const id = c.req.param('id');
      
      console.log("in delete flock", { id });
      
      const { data, error } = await supabase
        .schema(schema)
        .from("flock_batches")
        .delete()
        .eq('id', id)
        .returns();
      
      if (error) throw error;
      console.log('response from delete flock', data);
      
      return c.json({ success: true, message: "Flock deleted successfully" });
    } catch (error: any) {
      console.log("error in delete flock", error);
      return c.json({ error: "error in delete flock" }, 400);
    }
  });

export default app;