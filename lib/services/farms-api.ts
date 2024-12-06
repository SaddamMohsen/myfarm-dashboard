import {
  FetchBaseQueryError,
  createApi,
  fetchBaseQuery,
} from "@reduxjs/toolkit/query/react";
import { Farms, SuperVisor } from "@/constants/types";
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
type SuperVisorResponse=InferResponseType<
typeof client.api.supervisors.$get
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
    addNewFarm: builder.mutation<Farms|any,{newFarm: FarmPostRequsetType}>({
      //query:({...body})=>({url:'farm',method:"POST",body:body})
      async queryFn(newFarm, _queryApi, _extraOptions, _baseQuery) {
        try {
          const data = newFarm.newFarm
          console.log(newFarm);
          const res = await client.api.farms.$post( {json:data} );
          const response = await res.json();
           console.log(response);
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
    fetchSupervisors:builder.query<SuperVisor[],void>({
      async queryFn(_arg, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.supervisors.$get();
          //@ts-ignore
          const {supervisors} = await res.json();
          console.log('supervisors',supervisors);
          return { data: supervisors };
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
    //Get the supervisors who are not assigned to any farm
    fetchFreeSupervisors:builder.query<SuperVisor[],void>({
      async queryFn(_arg, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.supervisors.free_sup.$get();
          //@ts-ignore
          const {supervisors} = await res.json();
          console.log(supervisors);
          return { data: supervisors };
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
    })
  }),
});

export const { useFetchAllFarmsQuery, useAddNewFarmMutation,useFetchSupervisorsQuery,useFetchFreeSupervisorsQuery } = farmsApi;
