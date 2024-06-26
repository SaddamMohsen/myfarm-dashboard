import { configureStore } from "@reduxjs/toolkit";
import { farmsReducer } from "./features/farmSlice";
import { farmsApi } from "./services/farms-api";
export const makeStore = () => {
  return configureStore({
    reducer: {
      farms: farmsReducer,
      [farmsApi.reducerPath]: farmsApi.reducer,
    },
    middleware: (getDefaultMiddleware) =>
      getDefaultMiddleware().concat(farmsApi.middleware),
  });
};

// Infer the type of makeStore
export type AppStore = ReturnType<typeof makeStore>;
// Infer the `RootState` and `AppDispatch` types from the store itself
export type RootState = ReturnType<AppStore["getState"]>;
export type AppDispatch = AppStore["dispatch"];
