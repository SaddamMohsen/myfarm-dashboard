import { useForm } from "react-hook-form";
import { FarmType, Farms } from "@/constants/types";
import { zodResolver } from "@hookform/resolvers/zod";
import { Input } from "@/components/ui/input";
import * as z from "zod";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "./ui/form";
import { useTransition } from "react";
import { Button } from "./ui/button";
import { useAddNewFarmMutation } from "@/lib/services/farms-api";
import { toNamespacedPath } from "path";
export const AddNewFarm = () => {
  const [isPending, setTransation] = useTransition();
  const [addFarm, { isLoading }] = useAddNewFarmMutation();
  const form = useForm<z.infer<typeof Farms>>({
    resolver: zodResolver(Farms),
    defaultValues: {
      farm_name: "",
      created_at: new Date(),
      farm_type: FarmType.Enum[" بياض"],
      farm_end_date: new Date().toLocaleDateString(),
      farm_start_date: new Date().toLocaleDateString(),
      is_running: true,
      no_of_ambers: 1,
      farm_supervisor: "",
    },
  });
  const onInvalid = (invErrors: any) => {
    console.error(invErrors);
  };

  const onSubmit = async (values: z.infer<typeof Farms>) => {
    console.log("in submit handler");
    try {
      addFarm(values).unwrap();
    } catch (e: any) {
      console.log("error in submit", e);
    }
  };
  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit, onInvalid)}>
        <div className="inline-grid grid-cols-3 justify-between p-4 space-x-8 w-full items-center">
          <div className="mx-2  col-span-2">
            <FormField
              control={form.control}
              name="farm_name"
              render={({ field }) => (
                <FormItem>
                  <FormLabel className="text-xl font-semibold">
                    اسم المزرعة
                  </FormLabel>
                  <FormControl>
                    <Input
                      {...field}
                      disabled={isPending}
                      placeholder="اسم المزرعة"
                      type="text"
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
          </div>
          <div className="">
            <FormField
              control={form.control}
              name="no_of_ambers"
              render={({ field }) => (
                <FormItem>
                  <FormLabel className="text-xl font-medium">
                    عدد العنابر
                  </FormLabel>
                  <FormControl>
                    <Input
                      {...field}
                      disabled={isPending}
                      placeholder="0"
                      type="number"
                    />
                  </FormControl>

                  <FormMessage />
                </FormItem>
              )}
            />
          </div>
          {/* <FormField
            control={form.control}
            name="farm_supervisor"
            render={({ field }) => (
              <FormItem>
                <FormLabel className="text-xl font-medium">
                  عدد العنابر
                </FormLabel>
                <FormControl>
                  <select
                    {...field}
                    disabled={isPending}
                    defaultValue={["ali", "saddam"]}
                  />
                </FormControl>

                <FormMessage />
              </FormItem>
            )}
          /> */}
          <Button type="submit" variant="default">
            Save
          </Button>
        </div>
      </form>
    </Form>
  );
};
