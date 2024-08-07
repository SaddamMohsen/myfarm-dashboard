import {
  FetchBaseQueryError,
  createApi,
  fetchBaseQuery,
} from "@reduxjs/toolkit/query/react";
import { Farms } from "@/constants/types";
import { client } from "../hono-client";
import { z } from "zod";

type FarmsResponse = {
  farms?: z.infer<typeof Farms>[];
  error?: string;
};

export const farmsApi = createApi({
  reducerPath: "farmsApi",
  tagTypes: ["Farms"],
  baseQuery: fetchBaseQuery({ baseUrl: "/" }),
  endpoints: (builder) => ({
    fetchAllFarms: builder.query<FarmsResponse, void>({
      async queryFn(_arg, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.farms.$get();
          const { farms }: { farms: FarmsResponse } = await res.json();
          // Return the result in an object with a `data` field
          return { data: farms };
        } catch (error: any) {
          console.log(error);
          // Catch any errors and return them as an object with an `error` field
          return { error };
        }
      },
    }),
    addNewFarm: builder.mutation<FarmsResponse, z.infer<typeof Farms>>({
      //query:({...body})=>({url:'farm',method:"POST",body:body})
      async queryFn(arg, _queryApi, _extraOptions, _baseQuery) {
        try {
          console.log(arg);
          const res = await client.api.farms.$post({ json: arg });
          const { farms }: { farms: FarmsResponse | any } = await res.json();
          console.log(farms);
          // Return the result in an object with a `data` field
          return { data: farms };
        } catch (error: any) {
          console.log(error);
          // Catch any errors and return them as an object with an `error` field
          return { error };
        }
      },
    }),
  }),
});

export const { useFetchAllFarmsQuery, useAddNewFarmMutation } = farmsApi;
