import { z } from "zod";
export const FarmType = z.enum([" بياض", " لاحم", " امهات"]);

// export const Farms = z.object({
//   id:z.optional(z.string()),
//   created_at: z.optional(z.date()),
//   farm_name: z.string({
//     required_error: "ضروري اضافة الاسم",
//   }),
//   farm_type: FarmType,
//   no_of_ambers: z.coerce.number({
//     required_error: "قم بتحديد عدد العنابر",
//   }),
//   farm_start_date: z.optional(z.string()),
//   farm_end_date: z.optional(z.string()),
//   is_running: z.boolean(),
//   farm_supervisor: z.optional(z.string()),
// });
export const farmSchema = z.object({
  id:z.optional(z.number()),
  farm_name: z.string({
    required_error: "ضروري اضافة الاسم",
  }),
  farm_type:z.enum(['بياض',"لاحم","امهات"]),
  no_of_ambers: z.coerce.number({
    required_error: "قم بتحديد عدد العنابر",
  }),
  created_at: z.optional(z.string()),
  farm_start_date: z.coerce.date(),
  farm_end_date: z.string().optional(),
  is_running: z.boolean(),
  farm_supervisor: z.string().optional(),
})
export type Farms= z.infer<typeof farmSchema>;

export type Users = {
  id: string; // '4d9a2917-38f7-4fe9-8a0a-224503355caa',
  aud: string; // 'authenticated',
  role: string; // 'al_watania_users',
  email: string; //'sad.2000@outlook.com',
  email_confirmed_at: string; // '2023-10-04T18:54:03.229835Z',
  phone: string; // '',

  last_sign_in_at: string; // '2024-06-08T18:27:40.761928Z',
  app_metadata: any; // { provider: 'email', providers: [ 'email' ] },
  user_metadata: any; //{ farm_id: 1, schema: 'al_watania' },
};

export type SuperVisor = {
  name: string;
  id:string;
  full_name:string;
  email:string;
  uuid?: string;
  phone_numbers: number;
  details: string;
  u_id:string;
};
export const superVisorSchema = z.object({
  name: z.string().min(6, "Name is required"), // Ensures name is a non-empty string
  //id: z.string().min(1, "ID is required"), // Ensures id is a non-empty string
  phone_numbers: z.number().int().positive("Phone number must be a positive integer"), // Ensures phone_numbers is a positive integer
  details: z.string().optional(), // Ensures details is a string and is optional
});
