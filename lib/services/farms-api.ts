import {
  FetchBaseQueryError,
  createApi,
  fetchBaseQuery,
} from "@reduxjs/toolkit/query/react";
import { Farms } from "@/constants/types";
import { client } from "../hono-client";
import { z } from "zod";
import { InferRequestType, InferResponseType } from "hono";


// type FarmsResponse = {
//   farms?: z.infer<typeof Farms>[];
//   error?: string;
// };
type FarmsResponse = InferResponseType<
  typeof client.api.farms.$get
>;

type FarmPostRequsetType=InferRequestType<typeof client.api.farms.$post>['json'];
export const farmsApi = createApi({
  reducerPath: "farmsApi",
  tagTypes: ["Farms"],
  baseQuery: fetchBaseQuery({ baseUrl: "/" }),
  endpoints: (builder) => ({
    fetchAllFarms: builder.query<Farms[], void>({
      async queryFn(_arg, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.farms.$get();
          //@ts-ignore
          const {farms} = await res.json();
          
          console.log(farms);

          // Return the result in an object with a `data` field
          return { data: farms };
        } catch (error: any) {
          console.log(error);
          return {
            error: {
              status: 500,
              statusText: `Internal Server Error ${error}`,
              data: error,
            },
        };
      }
      },
    }),
    addNewFarm: builder.mutation<Farms|any, FarmPostRequsetType>({
      //query:({...body})=>({url:'farm',method:"POST",body:body})
      async queryFn(arg, _queryApi, _extraOptions, _baseQuery) {
        try {
          console.log(arg);
          const res = await client.api.farms.$post({ json: arg });
          const response = await res.json();
          // console.log(farms);
          // Return the result in an object with a `data` field
          return { data: response };
        } catch (error: any) {
          console.log(error);
          return {
            error: {
              status: 500,
              statusText: `Internal Server Error ${error}`,
              data: error,
            },
        };
        }
      },
    }),
  }),
});

export const { useFetchAllFarmsQuery, useAddNewFarmMutation } = farmsApi;
