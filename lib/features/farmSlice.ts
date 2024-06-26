import { Farms } from "@/constants/types";
import { createClient } from "@/utils/supabase/client";
import { PayloadAction, createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import { redirect } from "next/navigation";
import { z } from "zod";
import { client } from "../hono-client";

export interface farmsState {
  hasError: boolean;
  errorMessage: string;
  farmsList: z.infer<typeof Farms>[];
  isLoading: boolean;
}
const initialState: farmsState = {
  farmsList: [],
  isLoading: true,
  hasError: false,
  errorMessage: "",
};
export const getFarms = createAsyncThunk<any>(
  "farms/getFarms",
  async (data: any, { dispatch }) => {
    try {
      // const supabase = createClient();
      // const {
      //   data: { user },
      // } = await supabase.auth.getUser();

      // if (!user) {
      //   redirect("/login");
      //   throw "you must logged in";
      // }
      // const { data: farms } = await supabase
      //   .schema(user?.user_metadata.schema)
      //   .from("farms")
      //   .select();
      // return farms;
      const res = await client.api.farms.$get();
      const { farms } = await res.json();
      console.log(farms);
      return farms;
    } catch (e) {
      console.log(e);
      throw e;
    }
  }
);

export const farmsSlice = createSlice({
  name: "farms",
  initialState,
  reducers: {},
  extraReducers(builder) {
    builder.addCase(getFarms.rejected, (state: farmsState) => {
      state.hasError = true;
    });
    builder.addCase(
      getFarms.fulfilled,
      (state: farmsState, action: PayloadAction<z.infer<typeof Farms>[]>) => {
        state.isLoading = false;
        state.farmsList = action.payload;
      }
    );
  },
});

//export const { farmsState } = farmsSlice.actions;

export const farmsReducer = farmsSlice.reducer;
