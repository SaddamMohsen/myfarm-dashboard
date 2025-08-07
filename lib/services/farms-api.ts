import {
  FetchBaseQueryError,
  createApi,
  fetchBaseQuery,
} from "@reduxjs/toolkit/query/react";
import { Farms, SuperVisor } from "@/constants/types";
import { client } from "../hono-client";
import { z } from "zod";
import { InferRequestType, InferResponseType } from "hono";
import { ClientResponse } from "hono/client";

// type FarmsResponse = {
//   farms?: z.infer<typeof Farms>[];
//   error?: string;
// };
type FarmsResponse = InferResponseType<typeof client.api.farms.$get>;
type SuperVisorResponse = InferResponseType<typeof client.api.supervisors.$get>;
type FarmPostRequsetType = InferRequestType<
  typeof client.api.farms.$post
>["json"];
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
          const { farms } = await res.json();
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
    fetchFarmById: builder.mutation<Farms, { id: number }>({
      async queryFn(id, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.farms.$get({
            query: {
              id: id.id,
            },
          });

          //@ts-ignore
          const { farm } = await res.json();

          return { data: farm[0] };
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

      // transformResponse: (response)=>response.data
    }),
    addNewFarm: builder.mutation<Farms | any, { newFarm: FarmPostRequsetType }>(
      {
        //query:({...body})=>({url:'farm',method:"POST",body:body})
        async queryFn(newFarm, _queryApi, _extraOptions, _baseQuery) {
          try {
            const data = newFarm.newFarm;
            console.log(newFarm);
            const res = await client.api.farms.$post({ json: data });
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
      }
    ),
    fetchSupervisors: builder.query<SuperVisor[], void>({
      async queryFn(_arg, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.supervisors.$get();
          //@ts-ignore
          const { supervisors } = await res.json();

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
    fetchFreeSupervisors: builder.query<SuperVisor[], void>({
      async queryFn(_arg, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.supervisors.free_sup.$get();
          //@ts-ignore
          const { supervisors } = await res.json();
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
    }),
    //add new supervisor
    addNewSupervisor: builder.mutation<
      any,
      { full_name: string; phone: string; email: string; password: string }
    >({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.supervisors.$post({
            json: params,
          });
          const data = await res.json();

          return { data };
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
    getProductionByDate: builder.mutation<any, { date: string }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.productions.$get({
            query: {
              date: params.date,
            },
          });
          const data = await res.json();

          return { data };
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
    getFeedConsumptionByDate: builder.mutation<any, { date: string }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.productions.feed.$get({
            query: {
              date: params.date,
            },
          });
          const data = await res.json();

          return { data };
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
    getSummaryByDate: builder.mutation<any, { date: string }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.productions.summary.$get({
            query: {
              date: params.date,
            },
          });
          const data = await res.json();

          return { data };
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
    getDailyReport: builder.mutation<any, { date: string; farmId: number }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.productions["daily-report"].$get({
            query: {
              date: params.date,
              farmId: params.farmId,
            },
          });
          const data = await res.json();

          return { data };
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
    getMonthlyReport: builder.mutation<any, { farmId: any; date: string }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          console.log(`id in api get monthlyReport ${params.farmId}:${params.date}`)
          const res = await client.api.reports.monthly[":id"].$get({
            param: {
              id: params.farmId.toString(),
            },
            query: {
              date: params.date,
            },
          });
          const data = await res.json();
          console.log(`data from getMonthlyRep ${data}`)
          return { data };
        } catch (error: any) {
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
    getAmberReport: builder.mutation<any, { farmId: string; date: string }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.reports.daily[":id"].$get({
            param: {
              id: params.farmId,
            },
            query: {
              date: params.date,
            },
          });
          const data = await res.json();
          return { data };
        } catch (error: any) {
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
    loginUser: builder.mutation<any, { email: string; password: string }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.auth["sign-in"].$post({
            json: {
              email: params.email,
              password: params.password,
            },
          });
          const data = await res.json();
          console.log("data in login api", data);
          return { data };
        } catch (error: any) {
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
    getUserInfo: builder.query<any, void>({
      async queryFn(_arg, _api, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.auth["user"].$get();
          const data = await res.json();

          return { data };
        } catch (error: any) {
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
    fetchOneSupervisor: builder.mutation<SuperVisor, { id: string }>({
       // @ts-expect-error
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.supervisors[":id"].$get({
            param: {
              id: params.id,
            },
          });
          const response = await res.json();
          if ("error" in response) 
            return {error:response.error};
            //throw new Error(response.error);
          
          return { data: response.supervisor };
        } catch (error: any) {
          console.log(error);
          return {
            error: {
              status: 500,
              statusText: `خطأ في جلب بيانات المشرف ${error}`,
              data: error,
            },
          };
        }
      },
    }),
    getMedicationReport: builder.mutation<any, { 
      farmId: string; 
      start_date: string; 
      end_date: string 
    }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.reports.medication[":id"].$get({
            param: {
              id: params.farmId,
            },
            query: {
              start_date: params.start_date,
              end_date: params.end_date,
            },
          });
          const data = await res.json();
          return { data };
        } catch (error: any) {
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
    getVaccinationReport: builder.mutation<any, { 
      farmId: string; 
      start_date: string; 
      end_date: string 
    }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          const res = await client.api.reports.vaccination[":id"].$get({
            param: {
              id: params.farmId,
            },
            query: {
              start_date: params.start_date,
              end_date: params.end_date,
            },
          });
          const data = await res.json();
          return { data };
        } catch (error: any) {
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
    getProductionReport: builder.mutation<any, { 
      farmId?: string; 
      start_date: string; 
      end_date: string 
    }>({
      async queryFn(params, _queryApi, _extraOptions, _baseQuery) {
        try {
          console.log(` in api ${params.start_date}:${params.end_date}`)
          console.log(typeof params.start_date)
        
          const url =
           // @ts-expect-error
            client.api.reports.production[':id'].$get({
              param:
              {
                id:params.farmId||''
              },
              query:{
                start_date: params.start_date,
                end_date: params.end_date,
              }
            })
            // :  client.api.reports.production.$get({
            //   query:{
            //     start_date: params.start_date,
            //     end_date: params.end_date,
            //   }
            // });
          
          const res = await url
          // fetch(url, {
          //   method: 'GET',
          //   headers: {
          //     'Content-Type': 'application/json',
          //   },
          //   body: JSON.stringify({
          //     start_date: params.start_date,
          //     end_date: params.end_date,
          //     farm_id: params.farmId,
          //   }),
          // });
          const data = await res.json();
          console.log(data)
          return  {data} ;
        } catch (error: any) {
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

export const {
  useFetchAllFarmsQuery,
  useAddNewFarmMutation,
  useFetchSupervisorsQuery,
  useFetchFreeSupervisorsQuery,
  useFetchFarmByIdMutation,
  useGetProductionByDateMutation,
  useGetFeedConsumptionByDateMutation,
  useGetSummaryByDateMutation,
  useGetDailyReportMutation,
  useAddNewSupervisorMutation,
  useGetMonthlyReportMutation,
  useLoginUserMutation,
  useGetUserInfoQuery,
  useGetAmberReportMutation,
  useFetchOneSupervisorMutation,
  useGetMedicationReportMutation,
  useGetVaccinationReportMutation,
  useGetProductionReportMutation,
} = farmsApi;
