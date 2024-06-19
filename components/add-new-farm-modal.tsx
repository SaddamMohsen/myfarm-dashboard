import { useForm } from "react-hook-form";
import { FarmType, Farms } from "@/constants/types";
import { zodResolver } from "@hookform/resolvers/zod";
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
import { Input } from "postcss";
export const AddNewFarm = () => {
  const [isPending, setTransation] = useTransition();
  const form = useForm<z.infer<typeof Farms>>({
    resolver: zodResolver(Farms),
    defaultValues: {
      farm_name: "",
      created_at: new Date(),
      farm_type: FarmType.Enum[" بياض"],
      farm_end_date: new Date(),
      farm_start_date: new Date(),
      is_running: true,
      no_of_ambers: 1,
    },
  });
  const onInvalid = (invErrors: any) => {
    console.error(invErrors);
  };

  const onSubmit = (values: z.infer<typeof Farms>) => {
    console.log(values);
  };
  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit, onInvalid)}>
        <div className="  space-y-4 ">
          {/* <div className="flex flex-row justify-center items-center"> */}
          <FormField
            control={form.control}
            name="farm_name"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Code</FormLabel>
                <FormControl>
                  <input
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
          <FormField
            control={form.control}
            name="no_of_ambers"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Description</FormLabel>
                <FormControl>
                  <input
                    {...field}
                    disabled={isPending}
                    placeholder="عدد العنابر"
                    type="number"
                  />
                </FormControl>

                <FormMessage />
              </FormItem>
            )}
          />
        </div>
      </form>
    </Form>
  );
};
