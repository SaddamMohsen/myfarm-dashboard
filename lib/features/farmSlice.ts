import { Farms } from "@/constants/types";
import { createClient } from "@/utils/supabase/client";
import { PayloadAction, createAsyncThunk, createSlice } from "@reduxjs/toolkit";

export interface farmsState {
  hasError: boolean;
  errorMessage: string;
  farmsList: Farms[];
  isLoading: boolean;
}
const initialState: farmsState = {
  farmsList: [],
  isLoading: false,
  hasError: false,
  errorMessage: "",
};
export const getFarms = createAsyncThunk<any>(
  "farms/getFarms",
  async (data: any, { dispatch }) => {
    try {
      const supabase = createClient();
      const {
        data: { user },
      } = await supabase.auth.getUser();
      console.log(user?.user_metadata);
      if (!user) {
        throw "you must logged in";
      }
      const { data: farms } = await supabase
        .schema(user?.user_metadata.schema)
        .from("farms")
        .select();
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
      (state: farmsState, action: PayloadAction<Farms[]>) => {
        state.farmsList = action.payload;
      }
    );
  },
});

//export const { farmsState } = farmsSlice.actions;

export const farmsReducer = farmsSlice.reducer;
