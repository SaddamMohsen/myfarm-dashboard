PGDMP  )    )                 }            postgres    15.8    16.0 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    29013    postgres    DATABASE     t   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    ACL     2   GRANT ALL ON DATABASE postgres TO dashboard_user;
                   postgres    false    4524                        2615    29014 
   al_watania    SCHEMA        CREATE SCHEMA al_watania;
    DROP SCHEMA al_watania;
                postgres    false            �           0    0    SCHEMA al_watania    ACL     �   GRANT ALL ON SCHEMA al_watania TO al_watania_users;
GRANT USAGE ON SCHEMA al_watania TO saddam;
GRANT USAGE ON SCHEMA al_watania TO anon;
GRANT USAGE ON SCHEMA al_watania TO authenticated;
GRANT USAGE ON SCHEMA al_watania TO service_role;
                   postgres    false    22            !            2615    29015    auth    SCHEMA        CREATE SCHEMA auth;
    DROP SCHEMA auth;
                supabase_admin    false            �           0    0    SCHEMA auth    ACL        GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;
                   supabase_admin    false    33                        2615    29016 
   extensions    SCHEMA        CREATE SCHEMA extensions;
    DROP SCHEMA extensions;
                postgres    false            �           0    0    SCHEMA extensions    ACL     �   GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;
                   postgres    false    29                        2615    29017    graphql    SCHEMA        CREATE SCHEMA graphql;
    DROP SCHEMA graphql;
                supabase_admin    false                        2615    29018    graphql_public    SCHEMA        CREATE SCHEMA graphql_public;
    DROP SCHEMA graphql_public;
                supabase_admin    false            
            3079    29019    pg_net 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;
    DROP EXTENSION pg_net;
                   false    29            �           0    0    EXTENSION pg_net    COMMENT     -   COMMENT ON EXTENSION pg_net IS 'Async HTTP';
                        false    10            �           0    0 
   SCHEMA net    ACL     �   GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;
GRANT USAGE ON SCHEMA net TO postgres;
                   supabase_admin    false    39                        2615    29061 	   pgbouncer    SCHEMA        CREATE SCHEMA pgbouncer;
    DROP SCHEMA pgbouncer;
             	   pgbouncer    false                        2615    29062    pgsodium    SCHEMA        CREATE SCHEMA pgsodium;
    DROP SCHEMA pgsodium;
                supabase_admin    false                        3079    29063    pgsodium 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;
    DROP EXTENSION pgsodium;
                   false    17            �           0    0    EXTENSION pgsodium    COMMENT     \   COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';
                        false    3            �           0    0    SCHEMA public    ACL     �   GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;
                   pg_database_owner    false    40            "            2615    29363    realtime    SCHEMA        CREATE SCHEMA realtime;
    DROP SCHEMA realtime;
                supabase_admin    false            �           0    0    SCHEMA realtime    ACL     �   GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;
                   supabase_admin    false    34                        2615    29364    storage    SCHEMA        CREATE SCHEMA storage;
    DROP SCHEMA storage;
                supabase_admin    false            �           0    0    SCHEMA storage    ACL       GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;
                   supabase_admin    false    30                        2615    29365    supabase_functions    SCHEMA     "   CREATE SCHEMA supabase_functions;
     DROP SCHEMA supabase_functions;
                supabase_admin    false            �           0    0    SCHEMA supabase_functions    ACL     !  GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;
                   supabase_admin    false    26                        2615    29366    vault    SCHEMA        CREATE SCHEMA vault;
    DROP SCHEMA vault;
                supabase_admin    false                        3079    30384 
   pg_graphql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;
    DROP EXTENSION pg_graphql;
                   false    15            �           0    0    EXTENSION pg_graphql    COMMENT     B   COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';
                        false    2            	            3079    29377    pg_stat_statements 	   EXTENSION     J   CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;
 #   DROP EXTENSION pg_stat_statements;
                   false    29            �           0    0    EXTENSION pg_stat_statements    COMMENT     u   COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';
                        false    9                        3079    29408    pgcrypto 	   EXTENSION     @   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;
    DROP EXTENSION pgcrypto;
                   false    29            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    8                        3079    29445    pgjwt 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;
    DROP EXTENSION pgjwt;
                   false    29    8            �           0    0    EXTENSION pgjwt    COMMENT     C   COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';
                        false    7                        3079    44667    plpgsql_check 	   EXTENSION     E   CREATE EXTENSION IF NOT EXISTS plpgsql_check WITH SCHEMA al_watania;
    DROP EXTENSION plpgsql_check;
                   false    22            �           0    0    EXTENSION plpgsql_check    COMMENT     N   COMMENT ON EXTENSION plpgsql_check IS 'extended check for plpgsql functions';
                        false    5                        3079    29452    supabase_vault 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;
    DROP EXTENSION supabase_vault;
                   false    3    19            �           0    0    EXTENSION supabase_vault    COMMENT     C   COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';
                        false    4                        3079    29480 	   uuid-ossp 	   EXTENSION     C   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;
    DROP EXTENSION "uuid-ossp";
                   false    29            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    6                       1247    45560    amber_daily_report    TYPE     7  CREATE TYPE al_watania.amber_daily_report AS (
	amber_id integer,
	death integer,
	incom_feed numeric,
	intak_feed numeric,
	remain_feed numeric,
	"prodCarton" integer,
	"prodTray" integer,
	"outCarton" integer,
	"outTray" integer,
	"outEggsNote" character varying,
	reminegg integer[],
	total_birds integer
);
 )   DROP TYPE al_watania.amber_daily_report;
    
   al_watania          postgres    false    22            �           0    0    TYPE amber_daily_report    ACL       REVOKE ALL ON TYPE al_watania.amber_daily_report FROM PUBLIC;
REVOKE ALL ON TYPE al_watania.amber_daily_report FROM postgres;
GRANT ALL ON TYPE al_watania.amber_daily_report TO postgres WITH GRANT OPTION;
GRANT ALL ON TYPE al_watania.amber_daily_report TO authenticated;
       
   al_watania          postgres    false    1537            �           1247    45624    month_report    TYPE     �   CREATE TYPE al_watania.month_report AS (
	prod_date date,
	death integer,
	income_feed numeric,
	intak_feed numeric,
	remain_feed numeric,
	prod_egg integer[],
	out_egg integer[],
	remain_egg integer[]
);
 #   DROP TYPE al_watania.month_report;
    
   al_watania          postgres    false    22            �           0    0    TYPE month_report    ACL     <   GRANT ALL ON TYPE al_watania.month_report TO authenticated;
       
   al_watania          postgres    false    1532            T           1247    29492 	   aal_level    TYPE     K   CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);
    DROP TYPE auth.aal_level;
       auth          supabase_auth_admin    false    33            W           1247    29500    code_challenge_method    TYPE     L   CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);
 &   DROP TYPE auth.code_challenge_method;
       auth          supabase_auth_admin    false    33            Z           1247    29506    factor_status    TYPE     M   CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);
    DROP TYPE auth.factor_status;
       auth          supabase_auth_admin    false    33            ]           1247    29512    factor_type    TYPE     R   CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);
    DROP TYPE auth.factor_type;
       auth          supabase_auth_admin    false    33            `           1247    29520    one_time_token_type    TYPE     �   CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);
 $   DROP TYPE auth.one_time_token_type;
       auth          supabase_auth_admin    false    33            c           1247    29535    amber_daily_report    TYPE       CREATE TYPE public.amber_daily_report AS (
	amber_id integer,
	death integer,
	incom_feed numeric,
	intak_feed numeric,
	remain_feed numeric,
	"prodCarton" integer,
	"prodTray" integer,
	"outCarton" integer,
	"outTray" integer,
	"outEggsNote" character varying,
	reminegg integer[]
);
 %   DROP TYPE public.amber_daily_report;
       public          postgres    false            f           1247    29538    amber_daily_report2    TYPE     	  CREATE TYPE public.amber_daily_report2 AS (
	prod_date date,
	death integer,
	income_feed numeric,
	intak_feed numeric,
	remain_feed numeric,
	prod_tray integer,
	prod_carton integer,
	out_tray integer,
	out_carton integer,
	out_note text,
	remain_egg integer[]
);
 &   DROP TYPE public.amber_daily_report2;
       public          postgres    false            i           1247    29541    month_report    TYPE     �   CREATE TYPE public.month_report AS (
	prod_date date,
	death integer,
	income_feed numeric,
	intak_feed numeric,
	remain_feed numeric,
	prod_egg integer[],
	out_egg integer[],
	remain_egg integer[]
);
    DROP TYPE public.month_report;
       public          postgres    false            l           1247    29543    type_of_poultry    TYPE     a   CREATE TYPE public.type_of_poultry AS ENUM (
    'بياض',
    'امهات',
    'لاحم'
);
 "   DROP TYPE public.type_of_poultry;
       public          postgres    false            �           0    0    TYPE type_of_poultry    COMMENT     �   COMMENT ON TYPE public.type_of_poultry IS 'يحدد نوع المزرعة هل بياض او امهات او لاحم او تربية بياض';
          public          postgres    false    1388            o           1247    29550    نوع الحركة    TYPE     W   CREATE TYPE public."نوع الحركة" AS ENUM (
    'وارد',
    'منصرف'
);
 (   DROP TYPE public."نوع الحركة";
       public          postgres    false            �           0    0    TYPE "نوع الحركة"    COMMENT     x   COMMENT ON TYPE public."نوع الحركة" IS 'نوع لتحديد نوع حركة المواد وارد منصرف';
          public          postgres    false    1391            r           1247    29556    action    TYPE     o   CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);
    DROP TYPE realtime.action;
       realtime          supabase_admin    false    34            u           1247    29568    equality_op    TYPE     v   CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);
     DROP TYPE realtime.equality_op;
       realtime          supabase_admin    false    34            x           1247    29585    user_defined_filter    TYPE     j   CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);
 (   DROP TYPE realtime.user_defined_filter;
       realtime          supabase_admin    false    34    1397            {           1247    29588 
   wal_column    TYPE     �   CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);
    DROP TYPE realtime.wal_column;
       realtime          supabase_admin    false    34            ~           1247    29591    wal_rls    TYPE     s   CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);
    DROP TYPE realtime.wal_rls;
       realtime          supabase_admin    false    34            Z           1255    29592    calculate_egg(integer, integer)    FUNCTION     �  CREATE FUNCTION al_watania.calculate_egg(tray integer, carton integer) RETURNS integer[]
    LANGUAGE plpgsql
    AS $_$

--language plpgsql as $Body$
DECLARE
   remainTray int;
   remainCar int ;
    var int;
 nums int[] :=ARRAY[]::int[];
  
BEGIN
 -- raise info '%', tray;
   if tray>0
     then
        if tray >11 then
          remainTray := (select MOD(tray,12));
          remainCar := (tray/12)+carton;
        else 
           remainTray :=tray;
           remainCar :=carton;
        end if;
  else 
     if tray = 0 then
       remainTray :=0;
       remainCar :=carton;
    else
      if tray<=-12 then
        remainCar :=tray%12;
         var :=tray/12;
         remainTray :=(12+remainCar);
        remainCar :=carton+var-1;
     else 
         remainCar :=carton -1;
         remainTray :=tray+12;
      end if;
      end if;
  end if;
  select array[remainTray::int,remainCar::int] into nums;
RETURN nums;
END ;
$_$;
 F   DROP FUNCTION al_watania.calculate_egg(tray integer, carton integer);
    
   al_watania          postgres    false    22            �           0    0 4   FUNCTION calculate_egg(tray integer, carton integer)    ACL     u  GRANT ALL ON FUNCTION al_watania.calculate_egg(tray integer, carton integer) TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.calculate_egg(tray integer, carton integer) TO anon;
GRANT ALL ON FUNCTION al_watania.calculate_egg(tray integer, carton integer) TO authenticated;
GRANT ALL ON FUNCTION al_watania.calculate_egg(tray integer, carton integer) TO service_role;
       
   al_watania          postgres    false    602                       1255    29593    calculate_inventory_quantity()    FUNCTION     �  CREATE FUNCTION al_watania.calculate_inventory_quantity() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
in_feed numeric :=New.incom_feed;
out_feed numeric:=New.intak_feed;
prod_carton int :=New."prodCarton";
prod_tray int :=New."prodTray";
--out_carton int :=New."outCarton";
--out_tray int :=New."outTray";
no_death int :=New.death;

feed_amount numeric :=quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-002';
egg_carton_amount int :=quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
egg_try_amount int :=small_quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
no_of_hens int := quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-001';
bags int:=quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-007';
no_of_tray int:=quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-006';
no_of_carton int:=quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-005';

nums int[]=ARRAY[]::int[]; --:=select calculate_eggs(prod_tray,prod_carton);
begin
no_of_hens :=no_of_hens-no_death;
feed_amount :=feed_amount + in_feed - out_feed;
egg_carton_amount :=egg_carton_amount+prod_carton;
egg_try_amount := egg_try_amount+prod_tray;
no_of_tray :=no_of_tray-((prod_carton *14)+prod_tray);
no_of_carton :=no_of_carton-prod_carton;

nums :=array(select al_watania.calculate_egg(egg_try_amount,egg_carton_amount));
egg_carton_amount := elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 2;
egg_try_amount :=elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 1;

update al_watania.inventory set quantity = no_of_hens,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-001';
update al_watania.inventory set quantity = feed_amount,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-002'; 
update al_watania.inventory set quantity = egg_carton_amount,small_quantity=egg_try_amount,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
update al_watania.inventory set quantity = bags+out_feed::INT,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-007';
update al_watania.inventory set quantity = no_of_tray::INT,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-006';
update al_watania.inventory set quantity = no_of_carton::INT,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-005';
return new;
end;    
$$;
 9   DROP FUNCTION al_watania.calculate_inventory_quantity();
    
   al_watania          postgres    false    22            �           0    0 '   FUNCTION calculate_inventory_quantity()    ACL     A  GRANT ALL ON FUNCTION al_watania.calculate_inventory_quantity() TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.calculate_inventory_quantity() TO anon;
GRANT ALL ON FUNCTION al_watania.calculate_inventory_quantity() TO authenticated;
GRANT ALL ON FUNCTION al_watania.calculate_inventory_quantity() TO service_role;
       
   al_watania          postgres    false    534            V           1255    48900 2   calculate_inventory_report(integer, integer, date)    FUNCTION       CREATE FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate date) RETURNS integer[]
    LANGUAGE plpgsql
    SET search_path TO 'al_watania'
    AS $$

declare
egg_arr int[];

begin

--get trays and carton from items_movement
with
  egg_from_items_movs (outTray, outCarton) as (
    select coalesce(
      (
        select
          coalesce(sum(quantity),0)
        from
          items_movement
        where
          item_code = '001-004'
          and type_movement = 'خارج'
          and movement_date <=toDate
          and amber_id = amberid
          and farm_id = farmid
      ),0) as tray,
      coalesce(sum(quantity),0) as carton
    from
      items_movement as i
    where
      i.item_code = '001-003'
      and i.type_movement = 'خارج'
        and i.movement_date <=toDate
      and i.amber_id = amberid
      and i.farm_id = farmId
    -- group by
    --   ( i.farm_id,i.amber_id)
  ),
  tray_carton (remCarton, remTray) as (
    select
      coalesce(sum("prodCarton"),0)  as carton,
      coalesce(sum("prodTray"),0)  as tray
    from
      production
    where
      amber_id = amberid and
      "prodDate" <=toDate and
       farm_id = farmId
  )
  select
  calculate_egg (
    (
      select coalesce(
        (
          (
            select
             coalesce(remTray,0)
            from
              tray_carton
          ) - (
            select
             coalesce(outTray,0)
            from
              egg_from_items_movs
          )
        ),0) as remainEgg
    )::INT,
    (
      select coalesce(
        (
          (
            select
             coalesce(remCarton,0)
            from
              tray_carton
          ) - (
            select
             coalesce(outCarton,0)
            from
              egg_from_items_movs
          )
        ),0) as remainCar
    )::INT
  ) into  egg_arr;
 return egg_arr;
 end;
 
$$;
 c   DROP FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate date);
    
   al_watania          postgres    false    22            �           0    0 Q   FUNCTION calculate_inventory_report(farmid integer, amberid integer, todate date)    ACL     j  GRANT ALL ON FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate date) TO anon;
GRANT ALL ON FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate date) TO authenticated;
GRANT ALL ON FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate date) TO service_role;
       
   al_watania          postgres    false    598                       1255    29594 I   calculate_inventory_report(integer, integer, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone) RETURNS integer[]
    LANGUAGE plpgsql
    SET search_path TO 'al_watania'
    AS $$

declare
egg_arr int[];

begin

--get trays and carton from items_movement
with
  egg_from_items_movs (outTray, outCarton) as (
    select coalesce(
      (
        select
          coalesce(sum(quantity),0)
        from
          items_movement
        where
          item_code = '001-004'
          and type_movement = 'خارج'
          and movement_date <=toDate
          and amber_id = amberid
          and farm_id = farmid
      ),0) as tray,
      coalesce(sum(quantity),0) as carton
    from
      items_movement as i
    where
      i.item_code = '001-003'
      and i.type_movement = 'خارج'
        and i.movement_date <=toDate
      and i.amber_id = amberid
      and i.farm_id = farmId
    -- group by
    --   ( i.farm_id,i.amber_id)
  ),
  tray_carton (remCarton, remTray) as (
    select
      coalesce(sum("prodCarton"),0)  as carton,
      coalesce(sum("prodTray"),0)  as tray
    from
      production
    where
      amber_id = amberid and
      "prodDate" <=toDate and
       farm_id = farmId
  )
  select
  calculate_egg (
    (
      select coalesce(
        (
          (
            select
             coalesce(remTray,0)
            from
              tray_carton
          ) - (
            select
             coalesce(outTray,0)
            from
              egg_from_items_movs
          )
        ),0) as remainEgg
    )::INT,
    (
      select coalesce(
        (
          (
            select
             coalesce(remCarton,0)
            from
              tray_carton
          ) - (
            select
             coalesce(outCarton,0)
            from
              egg_from_items_movs
          )
        ),0) as remainCar
    )::INT
  ) into  egg_arr;
 return egg_arr;
 end;
 
$$;
 z   DROP FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone);
    
   al_watania          postgres    false    22            �           0    0 h   FUNCTION calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone)    ACL     E  GRANT ALL ON FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone) TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone) TO anon;
GRANT ALL ON FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone) TO authenticated;
GRANT ALL ON FUNCTION al_watania.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone) TO service_role;
       
   al_watania          postgres    false    533            �           1255    52326    change_user_role()    FUNCTION     �   CREATE FUNCTION al_watania.change_user_role() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  update auth.users set role=new.raw_user_meta_data->>'user_schema'
 where id =new.id;
 return new;
end;
$$;
 -   DROP FUNCTION al_watania.change_user_role();
    
   al_watania          postgres    false    22            �           0    0    FUNCTION change_user_role()    ACL     �   GRANT ALL ON FUNCTION al_watania.change_user_role() TO anon;
GRANT ALL ON FUNCTION al_watania.change_user_role() TO authenticated;
GRANT ALL ON FUNCTION al_watania.change_user_role() TO service_role;
       
   al_watania          postgres    false    412            [           1255    29595    create_ambers()    FUNCTION     �  CREATE FUNCTION al_watania.create_ambers() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN
 if (TG_OP = 'UPDATE') then
     FOR i IN 1..NEW.no_of_ambers LOOP
  update al_watania.ambers set farm_id=NEW.id where farm_id=Old.id;
  End Loop;
else
  FOR i IN 1..NEW.no_of_ambers LOOP
  INSERT INTO al_watania.ambers(farm_id,amber_id)
values(NEW.id,i);
END LOOP;
end if;
RETURN NEW;
END;
$$;
 *   DROP FUNCTION al_watania.create_ambers();
    
   al_watania          postgres    false    22            �           0    0    FUNCTION create_ambers()    ACL       GRANT ALL ON FUNCTION al_watania.create_ambers() TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.create_ambers() TO anon;
GRANT ALL ON FUNCTION al_watania.create_ambers() TO authenticated;
GRANT ALL ON FUNCTION al_watania.create_ambers() TO service_role;
       
   al_watania          postgres    false    603                       1255    29596    create_inventory()    FUNCTION     �  CREATE FUNCTION al_watania.create_inventory() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

DECLARE
    r varchar;
    myarr varchar[]:=array(select * from get_all_item_code());
BEGIN

  FOR i IN 1..NEW.no_of_ambers LOOP
    ForEach r IN array myarr LOOP
         INSERT INTO al_watania.inventory(farm_id,amber_id,item_code,quantity,small_quantity)
      values(NEW.id,i,r,0,0);
    END LOOP;

 END LOOP;
RETURN NEW;
END;
$$;
 -   DROP FUNCTION al_watania.create_inventory();
    
   al_watania          postgres    false    22            �           0    0    FUNCTION create_inventory()    ACL       GRANT ALL ON FUNCTION al_watania.create_inventory() TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.create_inventory() TO anon;
GRANT ALL ON FUNCTION al_watania.create_inventory() TO authenticated;
GRANT ALL ON FUNCTION al_watania.create_inventory() TO service_role;
       
   al_watania          postgres    false    536            \           1255    29597 *   create_user(text, text, jsonb, text, text)    FUNCTION     �  CREATE FUNCTION al_watania.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text) RETURNS uuid
    LANGUAGE plpgsql
    AS $$declare
  user_id uuid;
  encrypted_pw text;
BEGIN
  user_id := gen_random_uuid();
  encrypted_pw := crypt(password, gen_salt('bf'));
  
  INSERT INTO auth.users
    (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, recovery_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, confirmation_token, email_change, email_change_token_new, recovery_token)
  VALUES
    ('00000000-0000-0000-0000-000000000000', user_id, 'authenticated', schema_user_name, email, encrypted_pw, now(), now(), now(), '{"provider":"email","providers":["email"]}',user_meta, now(), now(), '', '', '', '');
  
  INSERT INTO auth.identities (provider_id,id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
  VALUES
    (user_id,gen_random_uuid(), user_id, format('{"sub":"%s","email":"%s"}', user_id::text, email)::jsonb, 'email', now(), now(), now());
  --EXECUTE 'GRANT '||schema_user_name||' TO ' || user_id;
  --EXECUTE 'GRANT USAGE ON SCHEMA ' || schema_name || ' TO ' || user_id;
  RETURN user_id;
END;$$;
 {   DROP FUNCTION al_watania.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text);
    
   al_watania          postgres    false    22            �           0    0 i   FUNCTION create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text)    ACL     �  GRANT ALL ON FUNCTION al_watania.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text) TO anon;
GRANT ALL ON FUNCTION al_watania.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text) TO authenticated;
GRANT ALL ON FUNCTION al_watania.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text) TO service_role;
       
   al_watania          postgres    false    604                       1255    29598    delete_related_farm_data()    FUNCTION     �  CREATE FUNCTION al_watania.delete_related_farm_data() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
user_schema text:=(select raw_user_meta_data->>'schema'  from auth.users where id=old.farm_supervisor);
BEGIN

--raise exception 'here we go' using hint='before delete';
  DELETE FROM production USING farms f
  WHERE production.farm_id = OLD.id;

  DELETE FROM ambers USING farms f
  WHERE ambers.farm_id = OLD.id;

  DELETE FROM items_movement USING farms f
  WHERE items_movement.farm_id = OLD.id;

  DELETE FROM inventory USING farms f
  WHERE inventory.farm_id = OLD.id;

  delete from supervisors using farms f
  where supervisors.u_id=OLD.farm_supervisor;
  
  
   update auth.users set raw_user_meta_data=jsonb_set('{}',array['schema'],to_jsonb(cast(user_schema as text))) where id=OLD.farm_supervisor;
  -- raise insufficient_privilege  using
  --     message = 'Not allowed to use application'||pg_typeof(user_schema);
  return old;
END;
$$;
 5   DROP FUNCTION al_watania.delete_related_farm_data();
    
   al_watania          postgres    false    22            �           0    0 #   FUNCTION delete_related_farm_data()    ACL     �   GRANT ALL ON FUNCTION al_watania.delete_related_farm_data() TO anon;
GRANT ALL ON FUNCTION al_watania.delete_related_farm_data() TO authenticated;
GRANT ALL ON FUNCTION al_watania.delete_related_farm_data() TO service_role;
       
   al_watania          postgres    false    535            ]           1255    29599 0   get_amber_monthly_report(integer, integer, date)    FUNCTION     �
  CREATE FUNCTION al_watania.get_amber_monthly_report(f_id integer, amb_id integer, into_date date) RETURNS SETOF public.amber_daily_report2
    LANGUAGE plpgsql
    SET search_path TO 'al_watania'
    AS $$

declare
today_report public.amber_daily_report2;
--reportDate date := TO_DATE(repDate,'YYYYMMDD');
begin
for today_report in
 WITH egg_movement AS (
    SELECT
        --item_code,
        farm_id,
        amber_id,
        SUM(CASE WHEN item_code = '001-003' and type_movement='خارج' THEN quantity ELSE 0 END) AS "outCarton",
        SUM(CASE WHEN item_code = '001-004' and type_movement='خارج' THEN quantity ELSE 0 END) AS "outtry",
        SUM(CASE WHEN item_code = '001-002' and type_movement='خارج' THEN quantity ELSE 0 END) AS "out_feed",
        STRING_AGG(case when ((item_code='001-003' or item_code='001-004' or item_code='001-002') and type_movement='خارج')  then quantity || '-' || notes else null end, ',') AS notes,
        movement_date
    FROM items_movement
    WHERE amber_id = amb_id
        AND farm_id = f_id
        AND EXTRACT(MONTH FROM movement_date) = EXTRACT(MONTH FROM into_date)
    GROUP BY ( movement_date, amber_id, farm_id)
),

production_data AS (
    SELECT
        farm_id,
        amber_id,
        "prodDate",
        COALESCE(death, 0) AS death,
        COALESCE(incom_feed, 0) AS incom_feed,
        COALESCE(intak_feed, 0) AS intak_feed,
        COALESCE("prodTray", 0) AS "prod_tray",
        COALESCE("prodCarton", 0) AS "prod_carton"
    FROM production
    WHERE farm_id = f_id
        AND amber_id = amb_id
        AND EXTRACT(MONTH FROM "prodDate") = EXTRACT(MONTH FROM into_date)
        AND EXTRACT(year FROM "prodDate") = EXTRACT(year FROM into_date)
)
 select
    COALESCE(em.movement_date, p."prodDate") AS in_date,
    COALESCE(p.death,0),
    COALESCE(p.incom_feed,0),
    COALESCE(p.intak_feed,0) + COALESCE(em.out_feed, 0) AS out_feed,
    COALESCE(
        (SELECT * FROM get_remaining_feed(f_id::INT, amb_id::INT, em.movement_date)),
        (SELECT * FROM get_remaining_feed(f_id::INT, amb_id::INT, p."prodDate"))
    ) AS remin_feed,
    COALESCE(p.prod_tray,0),
    COALESCE(p.prod_carton,0),
    COALESCE(em.outtry, 0) AS out_tray,
    COALESCE(em."outCarton", 0) AS out_carton,
    COALESCE(em.notes,'لايوجد'),
    (
        SELECT calculate_inventory_report(f_id::INT, amb_id::INT, COALESCE(em.movement_date, p."prodDate"))
    ) AS remin_egg
FROM egg_movement AS em
FULL JOIN production_data AS p ON em.movement_date = p."prodDate"
and  (p.amber_id=amb_id
    AND  p.farm_id=f_id)
      and (EXTRACT(month from p."prodDate") = extract(month from into_date)
  and EXTRACT(year from p."prodDate") = extract(year from into_date))
  order by in_date 
  loop
       return next today_report;
  end loop;
  --end if;
end
$$;
 a   DROP FUNCTION al_watania.get_amber_monthly_report(f_id integer, amb_id integer, into_date date);
    
   al_watania          postgres    false    22    1382            �           0    0 O   FUNCTION get_amber_monthly_report(f_id integer, amb_id integer, into_date date)    ACL     �  GRANT ALL ON FUNCTION al_watania.get_amber_monthly_report(f_id integer, amb_id integer, into_date date) TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.get_amber_monthly_report(f_id integer, amb_id integer, into_date date) TO anon;
GRANT ALL ON FUNCTION al_watania.get_amber_monthly_report(f_id integer, amb_id integer, into_date date) TO authenticated;
GRANT ALL ON FUNCTION al_watania.get_amber_monthly_report(f_id integer, amb_id integer, into_date date) TO service_role;
       
   al_watania          postgres    false    605            "           1255    49642 (   get_daily_report(integer, integer, date)    FUNCTION     �  CREATE FUNCTION al_watania.get_daily_report(f_id integer, amb_id integer, rep_date date) RETURNS SETOF al_watania.amber_daily_report
    LANGUAGE plpgsql
    AS $$declare
today_report al_watania.amber_daily_report;
begin
if amb_id>0 then
for today_report in
  WITH egg_movement AS (
    SELECT
        --item_code,
        farm_id,
        amber_id,
        SUM(CASE WHEN item_code = '001-003' and type_movement='خارج' THEN quantity ELSE 0 END) AS outcarton,
        SUM(CASE WHEN item_code = '001-004' and type_movement='خارج' THEN quantity ELSE 0 END) AS outtray,
        SUM(CASE WHEN item_code = '001-002' and type_movement='خارج' THEN quantity ELSE 0 END) AS "out_feed",
        STRING_AGG(case when ((item_code='001-003' or item_code='001-004' or item_code='001-002') and type_movement='خارج')  then quantity || '-' || notes else null end, ',') AS notes,
        movement_date
    FROM al_watania.items_movement
    WHERE amber_id = amb_id
        AND farm_id = f_id
        AND  movement_date = rep_date
    GROUP BY ( movement_date, amber_id, farm_id)
),

production_data AS (
    SELECT
        farm_id,
        amber_id,
        "prodDate",
        COALESCE(death, 0) AS death,
        COALESCE(incom_feed, 0) AS incom_feed,
        COALESCE(intak_feed, 0) AS intak_feed,
        COALESCE("prodTray", 0) AS "prod_tray",
        COALESCE("prodCarton", 0) AS "prod_carton"
    FROM al_watania.production
    WHERE farm_id = f_id
        AND amber_id = amb_id
        AND "prodDate" =rep_date
        --AND EXTRACT(year FROM "prodDate") = EXTRACT(year FROM '2023-12-20'::date)
)

SELECT
    COALESCE(em.amber_id, p.amber_id) AS amber_id,
   coalesce(p.death,0) as death,
   coalesce(p.incom_feed,0) as incom_feed,
    coalesce(p.intak_feed,0) + COALESCE(em.out_feed, 0) AS out_feed,
    COALESCE(
        (SELECT * FROM al_watania.get_remaining_feed(f_id::INT, amb_id::INT, em.movement_date)),
        (SELECT * FROM al_watania.get_remaining_feed(f_id::INT, amb_id::INT, p."prodDate"))
    ) AS remin_feed,
   coalesce(p.prod_tray,0) as prod_tray,
   coalesce(p.prod_carton,0) as prod_carton,
    
    COALESCE(em.outcarton, 0) AS out_carton,
    COALESCE(em.outtray, 0) AS out_tray,
    em.notes,
    (
        SELECT al_watania.calculate_inventory_report(f_id::INT, amb_id::INT, COALESCE(em.movement_date, p."prodDate"))
    ) AS remin_egg,
    (select quantity from al_watania.inventory where farm_id=f_id and item_code='001-001' and amber_id=amb_id) as total_birds
FROM egg_movement AS em
FULL JOIN production_data AS p ON em.movement_date = p."prodDate"
and  (p.amber_id=amb_id
    AND  p.farm_id=f_id)
      and (p."prodDate" = rep_date OR em.movement_date=rep_date)
       limit 1
  loop

       return next today_report;
  
  end loop;
else
 for today_report in
  WITH egg_movement AS (
    SELECT
       -- item_code,
        farm_id,
        amber_id,
        SUM(CASE WHEN item_code = '001-003'  and type_movement='خارج' THEN quantity ELSE 0 END) AS outcarton,
        SUM(CASE WHEN item_code = '001-004'  and type_movement='خارج' THEN quantity ELSE 0 END) AS outtray,
        SUM(CASE WHEN item_code = '001-002'  and type_movement='خارج' THEN quantity ELSE 0 END) AS "out_feed",
       STRING_AGG(case when ((item_code='001-003' or item_code='001-004' or item_code='001-002') and type_movement='خارج')  then quantity || '-' || notes else null end, ',') AS notes,
        movement_date
    FROM al_watania.items_movement
    WHERE 
     farm_id = f_id
        AND  movement_date = rep_date
    GROUP BY ( movement_date, amber_id, farm_id)
),

production_data AS (
    SELECT
        farm_id,
        amber_id,
        "prodDate",
        COALESCE(death, 0) AS death,
        COALESCE(incom_feed, 0) AS incom_feed,
        COALESCE(intak_feed, 0) AS intak_feed,
        COALESCE("prodTray", 0) AS "prod_tray",
        COALESCE("prodCarton", 0) AS "prod_carton"
    FROM al_watania.production
    WHERE farm_id = f_id
        --AND amber_id = amb_id
        AND "prodDate" =rep_date
        --AND EXTRACT(year FROM "prodDate") = EXTRACT(year FROM '2023-12-20'::date)
)

SELECT 
    COALESCE(p.amber_id, em.amber_id) AS amber_id,
   coalesce(p.death,0) as death,
   coalesce(p.incom_feed,0),
    coalesce(p.intak_feed,0) + COALESCE(em.out_feed, 0) AS out_feed,
    COALESCE(
        (SELECT * FROM al_watania.get_remaining_feed(f_id::INT, em.amber_id::INT, em.movement_date)),
        (SELECT * FROM al_watania.get_remaining_feed(f_id::INT, p.amber_id::INT, p."prodDate"))
    ) AS remin_feed,
   coalesce(p.prod_tray,0),
   coalesce(p.prod_carton,0),
    
    COALESCE(em.outcarton, 0) AS out_carton,
    COALESCE(em.outtray, 0) AS out_tray,
    em.notes,
    (
        SELECT calculate_inventory_report(f_id::INT, COALESCE(em.amber_id, p.amber_id)::INT, COALESCE(em.movement_date, p."prodDate"))
    ) AS remin_egg,
    (select quantity from al_watania.inventory where farm_id=f_id and item_code='001-001' and amber_id= COALESCE(em.amber_id, p.amber_id)::INT ) as total_birds
FROM egg_movement AS em
full JOIN production_data AS p ON em.movement_date = p."prodDate"
and  (
  p.amber_id=em.amber_id and
      p.farm_id=f_id)
       and p."prodDate" =rep_date
  order by (amber_id)
  --limit 1
  loop

       return next today_report;
  
  end loop;
  end if;

end$$;
 X   DROP FUNCTION al_watania.get_daily_report(f_id integer, amb_id integer, rep_date date);
    
   al_watania          postgres    false    22    1537            �           0    0 F   FUNCTION get_daily_report(f_id integer, amb_id integer, rep_date date)    ACL     .  GRANT ALL ON FUNCTION al_watania.get_daily_report(f_id integer, amb_id integer, rep_date date) TO anon;
GRANT ALL ON FUNCTION al_watania.get_daily_report(f_id integer, amb_id integer, rep_date date) TO authenticated;
GRANT ALL ON FUNCTION al_watania.get_daily_report(f_id integer, amb_id integer, rep_date date) TO service_role;
GRANT ALL ON FUNCTION al_watania.get_daily_report(f_id integer, amb_id integer, rep_date date) TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.get_daily_report(f_id integer, amb_id integer, rep_date date) TO authenticator;
       
   al_watania          postgres    false    546            m           1255    29601 $   get_farm_month_report(integer, date)    FUNCTION     �  CREATE FUNCTION al_watania.get_farm_month_report(f_id integer, rep_date date) RETURNS SETOF public.month_report
    LANGUAGE plpgsql
    AS $$declare
farm_month_rep al_watania.month_report;
begin

 for farm_month_rep in select
  p."prodDate",
  sum(p.death) as death,
  sum(incom_feed) as incomFeed,
  sum(intak_feed) as intakFeed
  ,
  (
    select
      *
    from
      al_watania.get_remaining_feed (farm_id::INT, 0::INT, "prodDate")
  ) as reminFeed,
 ( select * from al_watania.calculate_egg(sum("prodTray")::INT, sum("prodCarton")::INT) )as prodEggs,
  --sum("prodCarton") as prodcarton,
  --sum("prodTray") as prodtray,
  (select *from al_watania.calculate_egg((
    coalesce(
    (
      select
       sum( quantity)
      from
        al_watania.items_movement
      where
        item_code = '001-004'
        and farm_id = p.farm_id
        and type_movement='خارج'
        and movement_date = p."prodDate"
    ),
    0
  ))::INT,
    (coalesce(
    (
      select
        sum(quantity)
      from
        al_watania.items_movement
      where
        item_code = '001-003'
        and farm_id = p.farm_id
        and type_movement='خارج'
        and movement_date = p."prodDate"
    ),
    0
  ))::INT))as outEgg,

 (select * from al_watania.get_remain_egg_by_farm(p.farm_id::INT,p."prodDate"::Date)) as remainegg

from
  al_watania.production as p
where
  p.farm_id = f_id
  and extract(
    month
    from
      p."prodDate"
  ) = extract(
    month
    from
     rep_date
  ) and extract(
    year
    from
      p."prodDate"
  ) = extract(
    year
    from
     rep_date
  )
group by
  (p.farm_id, p."prodDate")
order by
  p."prodDate" asc
  loop
  return next farm_month_rep;
  end loop;
end;$$;
 M   DROP FUNCTION al_watania.get_farm_month_report(f_id integer, rep_date date);
    
   al_watania          postgres    false    1385    22            �           0    0 ;   FUNCTION get_farm_month_report(f_id integer, rep_date date)    ACL     �  GRANT ALL ON FUNCTION al_watania.get_farm_month_report(f_id integer, rep_date date) TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.get_farm_month_report(f_id integer, rep_date date) TO anon;
GRANT ALL ON FUNCTION al_watania.get_farm_month_report(f_id integer, rep_date date) TO authenticated;
GRANT ALL ON FUNCTION al_watania.get_farm_month_report(f_id integer, rep_date date) TO service_role;
       
   al_watania          postgres    false    621            6           1255    29642 $   get_monthly_report(integer, integer)    FUNCTION     �  CREATE FUNCTION al_watania.get_monthly_report(f_id integer, month integer) RETURNS SETOF public.amber_daily_report
    LANGUAGE plpgsql
    AS $$declare
today_report amber_daily_report;
--reportDate date := TO_DATE(repDate,'YYYYMMDD');
begin

 for today_report in select
  
  1,
  --amber_id,
  death,
  incom_feed,
  intak_feed,
  (
    select * from
      get_remaining_feed(f_id::INT, p.amber_id::INT, "prodDate")
  )::numeric as remain_feed,
  "prodCarton",
  "prodTray",
  "outCarton"+coalesce((select quantity from items_movement where item_code='001-003' and amber_id=p.amber_id and farm_id=p.farm_id and movement_date=p."prodDate"),0),
  "outTray" + coalesce((select quantity from items_movement where item_code='001-004' and amber_id=p.amber_id and farm_id=p.farm_id and movement_date=p."prodDate"),0),
  "outEggsNote",
  (
    select 
      calculate_inventory_report(f_id::INT, p.amber_id::INT, "prodDate")
  ) as reminEgg
from
  production as p
where
  p.farm_id = f_id
  --and p.amber_id = amb_id
  and EXTRACT(month from p."prodDate") = month
  --limit 1
  loop

       return next today_report;
  
  end loop;
  --end if;



end$$;
 J   DROP FUNCTION al_watania.get_monthly_report(f_id integer, month integer);
    
   al_watania          postgres    false    22    1379            �           0    0 8   FUNCTION get_monthly_report(f_id integer, month integer)    ACL       GRANT ALL ON FUNCTION al_watania.get_monthly_report(f_id integer, month integer) TO anon;
GRANT ALL ON FUNCTION al_watania.get_monthly_report(f_id integer, month integer) TO authenticated;
GRANT ALL ON FUNCTION al_watania.get_monthly_report(f_id integer, month integer) TO service_role;
       
   al_watania          postgres    false    566            (           1259    29602    items_movement    TABLE     �  CREATE TABLE al_watania.items_movement (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    farm_id bigint DEFAULT '1'::bigint,
    amber_id bigint NOT NULL,
    item_code character varying,
    type_movement character varying DEFAULT '{''وارد'',''خارج''}'::character varying,
    movement_date date,
    quantity numeric,
    notes character varying
);
 &   DROP TABLE al_watania.items_movement;
    
   al_watania         heap    postgres    false    22            �           0    0    TABLE items_movement    ACL     �   GRANT ALL ON TABLE al_watania.items_movement TO al_watania_users;
GRANT ALL ON TABLE al_watania.items_movement TO anon;
GRANT ALL ON TABLE al_watania.items_movement TO authenticated;
GRANT ALL ON TABLE al_watania.items_movement TO service_role;
       
   al_watania          postgres    false    296                       1255    29610 [   get_outitems_monthly_by_amber(integer, integer, date, character varying, character varying)    FUNCTION     �  CREATE FUNCTION al_watania.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying) RETURNS SETOF al_watania.items_movement
    LANGUAGE plpgsql
    AS $$

begin
return query
select *  from items_movement where item_code=it_code and amber_id=amb_id and type_movement=move_type
and farm_id=f_id  AND EXTRACT(MONTH FROM movement_date) = EXTRACT(MONTH FROM rep_date)
order by movement_date asc;

end;
$$;
 �   DROP FUNCTION al_watania.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying);
    
   al_watania          postgres    false    22    296            �           0    0 �   FUNCTION get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying)    ACL       GRANT ALL ON FUNCTION al_watania.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying) TO anon;
GRANT ALL ON FUNCTION al_watania.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying) TO authenticated;
GRANT ALL ON FUNCTION al_watania.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying) TO service_role;
       
   al_watania          postgres    false    538                       1255    29611 Q   get_outitems_monthly_by_farm(integer, date, character varying, character varying)    FUNCTION     �  CREATE FUNCTION al_watania.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying) RETURNS TABLE(movement_date date, item_code character varying, quantity numeric, notes text)
    LANGUAGE plpgsql
    AS $$

begin
return query
    WITH out_details AS (
    SELECT
      em.item_code,
        em.movement_date,
        em.type_movement,
        TRIM(em.notes) AS name_of,
        SUM(em.quantity) AS summation
    FROM items_movement as em
    WHERE EXTRACT(MONTH FROM em.movement_date) = EXTRACT(MONTH FROM rep_date)
    and EXTRACT(YEAR FROM em.movement_date) = EXTRACT(YEAR FROM rep_date) and 
    em.item_code=it_code and em.type_movement = move_type
   
    GROUP BY em.movement_date, TRIM(em.notes),em.item_code,em.type_movement
),
from_movement AS (
    SELECT p.farm_id, p.movement_date
    FROM items_movement as p
    WHERE EXTRACT(MONTH FROM p.movement_date) = EXTRACT(MONTH FROM rep_date)
    and    EXTRACT(YEAR FROM p.movement_date) = EXTRACT(Year FROM rep_date)
)
SELECT distinct
    p.movement_date,
    em.item_code,
    em.summation,
    em.name_of
FROM from_movement AS p
LEFT JOIN out_details AS em ON p.movement_date = em.movement_date
WHERE p.farm_id = f_id
    AND EXTRACT(MONTH FROM p.movement_date) = EXTRACT(MONTH FROM rep_date)
    AND EXTRACT(Year FROM p.movement_date) = EXTRACT(YEAR FROM rep_date) 
    and em.item_code=it_code
    and em.type_movement=move_type
order by p.movement_date asc;

end;
$$;
 �   DROP FUNCTION al_watania.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying);
    
   al_watania          postgres    false    22            �           0    0 z   FUNCTION get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying)    ACL     �  GRANT ALL ON FUNCTION al_watania.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying) TO anon;
GRANT ALL ON FUNCTION al_watania.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying) TO authenticated;
GRANT ALL ON FUNCTION al_watania.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying) TO service_role;
       
   al_watania          postgres    false    537            ^           1255    29612 %   get_remain_egg_by_farm(integer, date)    FUNCTION     -  CREATE FUNCTION al_watania.get_remain_egg_by_farm(f_id integer, into_date date) RETURNS integer[]
    LANGUAGE plpgsql
    AS $$

declare
egg_arr int[];
begin

WITH egg_from_items_movs(outtray,outcarton) AS (
    SELECT
        SUM(CASE WHEN i.item_code = '001-004' THEN i.quantity ELSE 0 END) AS outtray,
        SUM(CASE WHEN i.item_code = '001-003' THEN i.quantity ELSE 0 END) AS outcarton
    FROM al_watania.items_movement AS i
    WHERE
        i.type_movement = 'خارج'
        AND i.movement_date <= into_date
        AND farm_id = f_id
    GROUP BY i.farm_id
), tray_carton AS (
    SELECT
        coalesce(SUM("prodCarton"), 0) AS remCarton,
        coalesce(SUM("prodTray"), 0)  AS remTray
    FROM al_watania.production
    WHERE
        production."prodDate" <= into_date AND
        farm_id = f_id
),real_amount as(

SELECT
   coalesce( tray_carton.remTray,0)-(SELECT
   coalesce((select coalesce(outtray,0) as tray from egg_from_items_movs),0)) AS totalTray,
  coalesce( tray_carton.remCarton,0)-(SELECT
   coalesce((select coalesce(outcarton,0) as carton from egg_from_items_movs),0)) AS totalCarton
FROM tray_carton
)
 
  select 
  al_watania.calculate_egg 
    (
      (select totalTray from real_amount)::INT,
       (select totalCarton from real_amount)::INT
  )into  egg_arr;
 return egg_arr;
end
$$;
 O   DROP FUNCTION al_watania.get_remain_egg_by_farm(f_id integer, into_date date);
    
   al_watania          postgres    false    22            �           0    0 =   FUNCTION get_remain_egg_by_farm(f_id integer, into_date date)    ACL     �  GRANT ALL ON FUNCTION al_watania.get_remain_egg_by_farm(f_id integer, into_date date) TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.get_remain_egg_by_farm(f_id integer, into_date date) TO anon;
GRANT ALL ON FUNCTION al_watania.get_remain_egg_by_farm(f_id integer, into_date date) TO authenticated;
GRANT ALL ON FUNCTION al_watania.get_remain_egg_by_farm(f_id integer, into_date date) TO service_role;
       
   al_watania          postgres    false    606                       1255    29613 A   get_remaining_feed(integer, integer, timestamp without time zone)    FUNCTION       CREATE FUNCTION al_watania.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone) RETURNS numeric
    LANGUAGE plpgsql
    AS $$

declare
remain_feed numeric;
begin
--remain_feed :=
if(ambid>0) then
select
 coalesce(sum(incom_feed),0) - coalesce(sum(intak_feed),0) - (
    select
     coalesce(sum(quantity),0)
    from
      al_watania.items_movement
    where
      item_code = '001-002'
      and type_movement = 'خارج'
      and movement_date <=toDate
      and amber_id = pro.amber_id
      and farm_id = pro.farm_id
  ) as remainFeed
from
  al_watania.production as pro
where
  pro."prodDate" <=toDate
  and pro.farm_id = fid
  and pro.amber_id = ambid
group by
  (pro.amber_id, pro.farm_id) into remain_feed;
else
select
 coalesce(sum(incom_feed),0) - coalesce(sum(intak_feed),0) - (
    select
     coalesce(sum(quantity),0)
    from
      al_watania.items_movement
    where
      item_code = '001-002'
      and type_movement = 'خارج'
      and movement_date <=toDate
      --and amber_id = pro.amber_id
      and farm_id = pro.farm_id
  ) as remainFeed
from
  al_watania.production as pro
where
  pro."prodDate" <=toDate
  and pro.farm_id = fid
  --and pro.amber_id = ambid
group by
  ( pro.farm_id) into remain_feed;
  end if;
  
return remain_feed;
end;
$$;
 m   DROP FUNCTION al_watania.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone);
    
   al_watania          postgres    false    22            �           0    0 [   FUNCTION get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone)    ACL     �  GRANT ALL ON FUNCTION al_watania.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone) TO anon;
GRANT ALL ON FUNCTION al_watania.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone) TO authenticated;
GRANT ALL ON FUNCTION al_watania.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone) TO service_role;
       
   al_watania          postgres    false    540                       1255    29614    get_user_metadata(uuid)    FUNCTION     �   CREATE FUNCTION al_watania.get_user_metadata(user_id uuid) RETURNS text
    LANGUAGE sql STABLE SECURITY DEFINER
    AS $_$select raw_user_meta_data->>'user_schema' from auth.users where id = $1$_$;
 :   DROP FUNCTION al_watania.get_user_metadata(user_id uuid);
    
   al_watania          postgres    false    22            �           0    0 (   FUNCTION get_user_metadata(user_id uuid)    ACL     �   GRANT ALL ON FUNCTION al_watania.get_user_metadata(user_id uuid) TO anon;
GRANT ALL ON FUNCTION al_watania.get_user_metadata(user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION al_watania.get_user_metadata(user_id uuid) TO service_role;
       
   al_watania          postgres    false    539                       1255    29615 ,   insert_to_supervisors_table_after_add_farm()    FUNCTION     a  CREATE FUNCTION al_watania.insert_to_supervisors_table_after_add_farm() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
email varchar:=(select email from auth.users where id=new.farm_supervisor);
--schema text:=select raw_user_meta_data->'schema' from auth.users where id=new.farm_supervisor;
begin
insert into al_watania.supervisors(name,details,u_id) values(email,'مشرف مزرعة '||new.farm_name,new.farm_supervisor);
update auth.users set raw_user_meta_data=raw_user_meta_data||jsonb_build_object('farm_id', new.id) where id=new.farm_supervisor;
return new;
end;
$$;
 G   DROP FUNCTION al_watania.insert_to_supervisors_table_after_add_farm();
    
   al_watania          postgres    false    22            �           0    0 5   FUNCTION insert_to_supervisors_table_after_add_farm()    ACL       GRANT ALL ON FUNCTION al_watania.insert_to_supervisors_table_after_add_farm() TO anon;
GRANT ALL ON FUNCTION al_watania.insert_to_supervisors_table_after_add_farm() TO authenticated;
GRANT ALL ON FUNCTION al_watania.insert_to_supervisors_table_after_add_farm() TO service_role;
       
   al_watania          postgres    false    541            `           1255    29616 '   update_inventory_based_items_movement()    FUNCTION     �  CREATE FUNCTION al_watania.update_inventory_based_items_movement() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'al_watania'
    AS $$

declare
in_farm_id int :=New.farm_id;
in_amber_id int :=New.amber_id;
--item_code varchar :=New.item_code;
in_quantity numeric:=New.quantity;
--type_move varchar :=New.type_movement;
itemCode varchar :=item_code from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code=New.item_code;--check if the item in inventory
last_amount numeric :=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code=New.item_code; --get the previous amount from inventory
sub_quantity  int:=small_quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
--used to get the amount of cartoons only if the item_code=001-004
egg_carton_amount int;
egg_try_amount int;

--used to calculate tray and carton if item_code=001-004
nums int[]=ARRAY[]::int[]; --:=select calculate_eggs(prod_tray,prod_carton);
begin

if New.type_movement ='خارج'
 then

--- if the itemcode is طبق so we need to calculata the remaining cartons and tray
if New.item_code ='001-004'
   then
   egg_carton_amount :=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
   --RAISE NOTICE 'Value: (%)', egg_carton_amount;
   sub_quantity :=sub_quantity-in_quantity;
   --RAISE NOTICE 'Value: (%)', sub_quantity;
   nums :=array(select calculate_egg(sub_quantity,egg_carton_amount));
  egg_carton_amount := elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 2;
   egg_try_amount :=elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 1;
      update inventory set quantity = egg_carton_amount,small_quantity=egg_try_amount where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';

 else
      --- if the itemCode so this is the first time insert the item into the inventory
       if itemCode is NULL
            then
           insert into inventory(farm_id,amber_id,item_code,quantity)
            values(New.farm_id,New.amber_id,New.item_code,New.quantity);
         else
        last_amount :=last_amount-in_quantity;
        update inventory set quantity=last_amount  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code=New.item_code;
      end if;
   end if;
--------- so the type movement is وارد ---
  else 
   --- if the itemCode so this is the first time insert the item into the inventory
     if itemCode is NULL then
      insert into inventory(farm_id,amber_id,item_code,quantity) values(New.farm_id,New.amber_id,New.item_code,New.quantity);
      else
      last_amount :=last_amount+in_quantity;
     update inventory set quantity=last_amount  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code=New.item_code;
     end if;
 end if;
 return new;
 end;
$$;
 B   DROP FUNCTION al_watania.update_inventory_based_items_movement();
    
   al_watania          postgres    false    22            �           0    0 0   FUNCTION update_inventory_based_items_movement()    ACL     e  GRANT ALL ON FUNCTION al_watania.update_inventory_based_items_movement() TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.update_inventory_based_items_movement() TO anon;
GRANT ALL ON FUNCTION al_watania.update_inventory_based_items_movement() TO authenticated;
GRANT ALL ON FUNCTION al_watania.update_inventory_based_items_movement() TO service_role;
       
   al_watania          postgres    false    608            a           1255    29617 3   update_inventory_quantity_after_update_production()    FUNCTION     �
  CREATE FUNCTION al_watania.update_inventory_quantity_after_update_production() RETURNS trigger
    LANGUAGE plpgsql
    AS $$


declare
in_feed numeric :=New.incom_feed;
out_feed numeric:=New.intak_feed;
prod_carton int :=New."prodCarton";
prod_tray int :=New."prodTray";
-- out_carton int :=New."outCarton";
-- out_tray int :=New."outTray";
no_death int :=New.death;

feed_amount numeric :=quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-002';
egg_carton_amount int :=quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
egg_try_amount int :=small_quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
no_of_hens int := quantity from al_watania.inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-001';

nums int[]=ARRAY[]::int[]; --:=select calculate_eggs(prod_tray,prod_carton);
--the old row of current update
old_row production%rowtype :=Old;
begin
 --if (TG_OP = 'UPDATE') then
 no_of_hens :=no_of_hens+old_row.death-no_death;
feed_amount :=feed_amount -(old_row.incom_feed-old_row.intak_feed)+(in_feed - out_feed);
egg_carton_amount :=egg_carton_amount-(old_row."prodCarton")+(prod_carton);
egg_try_amount := egg_try_amount-(old_row."prodTray")+(prod_tray);
nums :=array(select al_watania.calculate_egg(egg_try_amount,egg_carton_amount));
egg_carton_amount := elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 2;
egg_try_amount :=elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 1;
-- else
-- no_of_hens :=no_of_hens-no_death;
-- feed_amount :=feed_amount + in_feed - out_feed;
-- egg_carton_amount :=egg_carton_amount+prod_carton-out_carton;
-- egg_try_amount := egg_try_amount+prod_tray-out_tray;
-- nums :=array(select calculate_egg(egg_try_amount,egg_carton_amount));
-- egg_carton_amount := elem from 
--    unnest (nums)
--              with ordinality as a(elem,idx)
--          where idx = 2;
-- egg_try_amount :=elem from 
--    unnest (nums)
--              with ordinality as a(elem,idx)
--          where idx = 1;
-- end if;
update al_watania.inventory set quantity = no_of_hens ,updated_at = current_timestamp  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-001';
update al_watania.inventory set quantity = feed_amount,updated_at = current_timestamp  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-002'; 
update al_watania.inventory set quantity = egg_carton_amount,small_quantity=egg_try_amount,updated_at = current_timestamp  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';


return new;
end;    
$$;
 N   DROP FUNCTION al_watania.update_inventory_quantity_after_update_production();
    
   al_watania          postgres    false    22            �           0    0 <   FUNCTION update_inventory_quantity_after_update_production()    ACL     �  GRANT ALL ON FUNCTION al_watania.update_inventory_quantity_after_update_production() TO al_watania_users;
GRANT ALL ON FUNCTION al_watania.update_inventory_quantity_after_update_production() TO anon;
GRANT ALL ON FUNCTION al_watania.update_inventory_quantity_after_update_production() TO authenticated;
GRANT ALL ON FUNCTION al_watania.update_inventory_quantity_after_update_production() TO service_role;
       
   al_watania          postgres    false    609            #           1255    29618 ,   update_supervisors_table_after_delete_farm()    FUNCTION     �  CREATE FUNCTION al_watania.update_supervisors_table_after_delete_farm() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
--email varchar:=(select email from auth.users where id=new.farm_supervisor);
schema text:=(select raw_user_meta_data->'schema' from auth.users where id=old.farm_supervisor);
begin
--insert into al_watania.supervisors(name,details,u_id) values(email,'مشرف مزرعة '+new.farm_name,new.farm_supervisor);
delete from al_watania.supervisors where u_id=old.farm_supervisor;
update auth.users set raw_user_meta_data=json_build_object('schema',schema) where id=old.farm_supervisor;
return null;
end;
$$;
 G   DROP FUNCTION al_watania.update_supervisors_table_after_delete_farm();
    
   al_watania          postgres    false    22            �           0    0 5   FUNCTION update_supervisors_table_after_delete_farm()    ACL       GRANT ALL ON FUNCTION al_watania.update_supervisors_table_after_delete_farm() TO anon;
GRANT ALL ON FUNCTION al_watania.update_supervisors_table_after_delete_farm() TO authenticated;
GRANT ALL ON FUNCTION al_watania.update_supervisors_table_after_delete_farm() TO service_role;
       
   al_watania          postgres    false    547                        1255    29619    email()    FUNCTION       CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;
    DROP FUNCTION auth.email();
       auth          supabase_auth_admin    false    33            �           0    0    FUNCTION email()    COMMENT     X   COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';
          auth          supabase_auth_admin    false    544            �           0    0    FUNCTION email()    ACL     f   GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
GRANT ALL ON FUNCTION auth.email() TO postgres;
          auth          supabase_auth_admin    false    544            $           1255    29620    jwt()    FUNCTION     �   CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;
    DROP FUNCTION auth.jwt();
       auth          supabase_auth_admin    false    33            �           0    0    FUNCTION jwt()    ACL     b   GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;
          auth          supabase_auth_admin    false    548            %           1255    29621    role()    FUNCTION        CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;
    DROP FUNCTION auth.role();
       auth          supabase_auth_admin    false    33            �           0    0    FUNCTION role()    COMMENT     V   COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';
          auth          supabase_auth_admin    false    549            �           0    0    FUNCTION role()    ACL     d   GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
GRANT ALL ON FUNCTION auth.role() TO postgres;
          auth          supabase_auth_admin    false    549            !           1255    29622    uid()    FUNCTION     �   CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;
    DROP FUNCTION auth.uid();
       auth          supabase_auth_admin    false    33            �           0    0    FUNCTION uid()    COMMENT     T   COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';
          auth          supabase_auth_admin    false    545            �           0    0    FUNCTION uid()    ACL     b   GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
GRANT ALL ON FUNCTION auth.uid() TO postgres;
          auth          supabase_auth_admin    false    545            �           0    0 D   FUNCTION algorithm_sign(signables text, secret text, algorithm text)    ACL     �   GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
       
   extensions          supabase_admin    false    612            �           0    0    FUNCTION armor(bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    607            �           0    0 %   FUNCTION armor(bytea, text[], text[])    ACL     �   GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
       
   extensions          supabase_admin    false    521            �           0    0    FUNCTION crypt(text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    611            �           0    0    FUNCTION dearmor(text)    ACL     �   GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
       
   extensions          supabase_admin    false    522            �           0    0 $   FUNCTION decrypt(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    610            �           0    0 .   FUNCTION decrypt_iv(bytea, bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    532            �           0    0    FUNCTION digest(bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    646            �           0    0    FUNCTION digest(text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    613            �           0    0 $   FUNCTION encrypt(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    401            �           0    0 .   FUNCTION encrypt_iv(bytea, bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    402            �           0    0 "   FUNCTION gen_random_bytes(integer)    ACL     �   GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
       
   extensions          supabase_admin    false    614            �           0    0    FUNCTION gen_random_uuid()    ACL     �   GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
       
   extensions          supabase_admin    false    403            �           0    0    FUNCTION gen_salt(text)    ACL     �   GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
       
   extensions          supabase_admin    false    404            �           0    0     FUNCTION gen_salt(text, integer)    ACL     �   GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
       
   extensions          supabase_admin    false    658            h           1255    29623    grant_pg_cron_access()    FUNCTION     �  CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;
 1   DROP FUNCTION extensions.grant_pg_cron_access();
    
   extensions          postgres    false    29            �           0    0    FUNCTION grant_pg_cron_access()    COMMENT     U   COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';
       
   extensions          postgres    false    616            �           0    0    FUNCTION grant_pg_cron_access()    ACL     �   REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;
       
   extensions          postgres    false    616            �           1255    29624    grant_pg_graphql_access()    FUNCTION     i	  CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;
 4   DROP FUNCTION extensions.grant_pg_graphql_access();
    
   extensions          supabase_admin    false    29            �           0    0 "   FUNCTION grant_pg_graphql_access()    COMMENT     [   COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';
       
   extensions          supabase_admin    false    653            �           0    0 "   FUNCTION grant_pg_graphql_access()    ACL     Z   GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    653            �           1255    29625    grant_pg_net_access()    FUNCTION     D  CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF EXISTS (
      SELECT 1
      FROM pg_event_trigger_ddl_commands() AS ev
      JOIN pg_extension AS ext
      ON ev.objid = ext.oid
      WHERE ext.extname = 'pg_net'
    )
    THEN
      GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END;
  $$;
 0   DROP FUNCTION extensions.grant_pg_net_access();
    
   extensions          postgres    false    29            �           0    0    FUNCTION grant_pg_net_access()    COMMENT     S   COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';
       
   extensions          postgres    false    654            �           0    0    FUNCTION grant_pg_net_access()    ACL     �   REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;
       
   extensions          postgres    false    654            �           0    0 !   FUNCTION hmac(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    615            �           0    0    FUNCTION hmac(text, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    659            �           0    0 U  FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision)    ACL       GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;
       
   extensions          supabase_admin    false    617            �           0    0 ^   FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone)    ACL        GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;
       
   extensions          supabase_admin    false    529            �           0    0 G   FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint)    ACL     �   GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;
       
   extensions          supabase_admin    false    530            �           0    0 >   FUNCTION pgp_armor_headers(text, OUT key text, OUT value text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
       
   extensions          supabase_admin    false    520            �           0    0    FUNCTION pgp_key_id(bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    618            �           0    0 &   FUNCTION pgp_pub_decrypt(bytea, bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    660            �           0    0 ,   FUNCTION pgp_pub_decrypt(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    662            �           0    0 2   FUNCTION pgp_pub_decrypt(bytea, bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    531                        0    0 ,   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    664                       0    0 2   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    663                       0    0 8   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    619                       0    0 %   FUNCTION pgp_pub_encrypt(text, bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    666                       0    0 +   FUNCTION pgp_pub_encrypt(text, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    665                       0    0 ,   FUNCTION pgp_pub_encrypt_bytea(bytea, bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    661                       0    0 2   FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    667                       0    0 %   FUNCTION pgp_sym_decrypt(bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    668                       0    0 +   FUNCTION pgp_sym_decrypt(bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    669            	           0    0 +   FUNCTION pgp_sym_decrypt_bytea(bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    670            
           0    0 1   FUNCTION pgp_sym_decrypt_bytea(bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    671                       0    0 $   FUNCTION pgp_sym_encrypt(text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    672                       0    0 *   FUNCTION pgp_sym_encrypt(text, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    673                       0    0 +   FUNCTION pgp_sym_encrypt_bytea(bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    674                       0    0 1   FUNCTION pgp_sym_encrypt_bytea(bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    675            �           1255    29626    pgrst_ddl_watch()    FUNCTION     >  CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;
 ,   DROP FUNCTION extensions.pgrst_ddl_watch();
    
   extensions          supabase_admin    false    29                       0    0    FUNCTION pgrst_ddl_watch()    ACL     R   GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    655            )           1255    29627    pgrst_drop_watch()    FUNCTION       CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;
 -   DROP FUNCTION extensions.pgrst_drop_watch();
    
   extensions          supabase_admin    false    29                       0    0    FUNCTION pgrst_drop_watch()    ACL     S   GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    553            �           1255    29628    set_graphql_placeholder()    FUNCTION     r  CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;
 4   DROP FUNCTION extensions.set_graphql_placeholder();
    
   extensions          supabase_admin    false    29                       0    0 "   FUNCTION set_graphql_placeholder()    COMMENT     |   COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';
       
   extensions          supabase_admin    false    652                       0    0 "   FUNCTION set_graphql_placeholder()    ACL     Z   GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    652                       0    0 8   FUNCTION sign(payload json, secret text, algorithm text)    ACL     �   GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
       
   extensions          supabase_admin    false    649                       0    0 "   FUNCTION try_cast_double(inp text)    ACL     �   GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
       
   extensions          supabase_admin    false    620                       0    0    FUNCTION url_decode(data text)    ACL     �   GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
       
   extensions          supabase_admin    false    523                       0    0    FUNCTION url_encode(data bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    645                       0    0    FUNCTION uuid_generate_v1()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
       
   extensions          supabase_admin    false    423                       0    0    FUNCTION uuid_generate_v1mc()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
       
   extensions          supabase_admin    false    424                       0    0 4   FUNCTION uuid_generate_v3(namespace uuid, name text)    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
       
   extensions          supabase_admin    false    650                       0    0    FUNCTION uuid_generate_v4()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
       
   extensions          supabase_admin    false    425                       0    0 4   FUNCTION uuid_generate_v5(namespace uuid, name text)    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
       
   extensions          supabase_admin    false    426                       0    0    FUNCTION uuid_nil()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
       
   extensions          supabase_admin    false    427                       0    0    FUNCTION uuid_ns_dns()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
       
   extensions          supabase_admin    false    428                       0    0    FUNCTION uuid_ns_oid()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
       
   extensions          supabase_admin    false    640                       0    0    FUNCTION uuid_ns_url()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
       
   extensions          supabase_admin    false    651                        0    0    FUNCTION uuid_ns_x500()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
       
   extensions          supabase_admin    false    644            !           0    0 8   FUNCTION verify(token text, secret text, algorithm text)    ACL     �   GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
       
   extensions          supabase_admin    false    597            "           0    0 U   FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb)    ACL       GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;
          graphql_public          supabase_admin    false    676            #           0    0 V   FUNCTION http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer)    ACL     �  REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO postgres;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;
          net          supabase_admin    false    622            $           0    0 c   FUNCTION http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer)    ACL     "  REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO postgres;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;
          net          supabase_admin    false    656            (           1255    29629    get_auth(text)    FUNCTION     J  CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;
 2   DROP FUNCTION pgbouncer.get_auth(p_usename text);
    	   pgbouncer          postgres    false    16            %           0    0 !   FUNCTION get_auth(p_usename text)    ACL     �   REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
       	   pgbouncer          postgres    false    552            &           0    0 ]   FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea)    ACL     �   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;
          pgsodium          pgsodium_keymaker    false    527            '           0    0 ]   FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea)    ACL     �   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;
          pgsodium          pgsodium_keymaker    false    657            (           0    0 !   FUNCTION crypto_aead_det_keygen()    ACL     I   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;
          pgsodium          supabase_admin    false    528            &           1255    29630    add_ambers()    FUNCTION     l  CREATE FUNCTION public.add_ambers() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
if (TG_OP = 'UPDATE') then
     FOR i IN 1..NEW.no_of_ambers LOOP
  update public.ambers set farm_id=NEW.id;
  End Loop;
else
  FOR i IN 1..NEW.no_of_ambers LOOP
  INSERT INTO public.ambers(farm_id,amber_id)
values(NEW.id,i);
END LOOP;
end if;
RETURN NEW;
END;$$;
 #   DROP FUNCTION public.add_ambers();
       public          postgres    false            )           0    0    FUNCTION add_ambers()    ACL     �   GRANT ALL ON FUNCTION public.add_ambers() TO anon;
GRANT ALL ON FUNCTION public.add_ambers() TO authenticated;
GRANT ALL ON FUNCTION public.add_ambers() TO service_role;
          public          postgres    false    550            '           1255    29631    calculate_egg(integer, integer)    FUNCTION     �  CREATE FUNCTION public.calculate_egg(tray integer, carton integer) RETURNS integer[]
    LANGUAGE plpgsql
    AS $_$
--language plpgsql as $Body$
DECLARE
   remainTray int;
   remainCar int ;
    var int;
 nums int[] :=ARRAY[]::int[];
  
BEGIN
 -- raise info '%', tray;
   if tray>0
     then
        if tray >11 then
          remainTray := (select MOD(tray,12));
          remainCar := (tray/12)+carton;
        else 
           remainTray :=tray;
           remainCar :=carton;
        end if;
  else 
     if tray = 0 then
       remainTray :=0;
       remainCar :=carton;
    else
      if tray<=-12 then
        remainCar :=tray%12;
         var :=tray/12;
         remainTray :=(12+remainCar);
        remainCar :=carton+var-1;
     else 
         remainCar :=carton -1;
         remainTray :=tray+12;
      end if;
      end if;
  end if;
  select array[remainTray::int,remainCar::int] into nums;
RETURN nums;
END ;
$_$;
 B   DROP FUNCTION public.calculate_egg(tray integer, carton integer);
       public          postgres    false            *           0    0 4   FUNCTION calculate_egg(tray integer, carton integer)    ACL       GRANT ALL ON FUNCTION public.calculate_egg(tray integer, carton integer) TO anon;
GRANT ALL ON FUNCTION public.calculate_egg(tray integer, carton integer) TO authenticated;
GRANT ALL ON FUNCTION public.calculate_egg(tray integer, carton integer) TO service_role;
          public          postgres    false    551            ,           1255    29632    calculate_inventory_quantity()    FUNCTION     W  CREATE FUNCTION public.calculate_inventory_quantity() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
in_feed numeric :=New.incom_feed;
out_feed numeric:=New.intak_feed;
prod_carton int :=New."prodCarton";
prod_tray int :=New."prodTray";
--out_carton int :=New."outCarton";
--out_tray int :=New."outTray";
no_death int :=New.death;

feed_amount numeric :=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-002';
egg_carton_amount int :=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
egg_try_amount int :=small_quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
no_of_hens int := quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-001';
bags int:=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-007';
no_of_tray int:=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-006';
no_of_carton int:=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-005';

nums int[]=ARRAY[]::int[]; --:=select calculate_eggs(prod_tray,prod_carton);
begin
no_of_hens :=no_of_hens-no_death;
feed_amount :=feed_amount + in_feed - out_feed;
egg_carton_amount :=egg_carton_amount+prod_carton;
egg_try_amount := egg_try_amount+prod_tray;
no_of_tray :=no_of_tray-((prod_carton *14)+prod_tray);
no_of_carton :=no_of_carton-prod_carton;

nums :=array(select calculate_egg(egg_try_amount,egg_carton_amount));
egg_carton_amount := elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 2;
egg_try_amount :=elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 1;

update inventory set quantity = no_of_hens,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-001';
update inventory set quantity = feed_amount,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-002'; 
update inventory set quantity = egg_carton_amount,small_quantity=egg_try_amount,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
update inventory set quantity = bags+out_feed::INT,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-007';
update inventory set quantity = no_of_tray::INT,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-006';
update inventory set quantity = no_of_carton::INT,updated_at=current_timestamp where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-005';
return new;
end;    
$$;
 5   DROP FUNCTION public.calculate_inventory_quantity();
       public          postgres    false            +           0    0 '   FUNCTION calculate_inventory_quantity()    ACL     �   GRANT ALL ON FUNCTION public.calculate_inventory_quantity() TO anon;
GRANT ALL ON FUNCTION public.calculate_inventory_quantity() TO authenticated;
GRANT ALL ON FUNCTION public.calculate_inventory_quantity() TO service_role;
          public          postgres    false    556            o           1255    29633 I   calculate_inventory_report(integer, integer, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone) RETURNS integer[]
    LANGUAGE plpgsql
    AS $$
declare
egg_arr int[];

begin

--get trays and carton from items_movement
with
  egg_from_items_movs (outTray, outCarton) as (
    select coalesce(
      (
        select
          coalesce(sum(quantity),0)
        from
          items_movement
        where
          item_code = '001-004'
          and type_movement = 'خارج'
          and movement_date <=toDate
          and amber_id = amberid
          and farm_id = farmid
      ),0) as tray,
      coalesce(sum(quantity),0) as carton
    from
      items_movement as i
    where
      i.item_code = '001-003'
      and i.type_movement = 'خارج'
        and i.movement_date <=toDate
      and i.amber_id = amberid
      and i.farm_id = farmId
    -- group by
    --   ( i.farm_id,i.amber_id)
  ),
  tray_carton (remCarton, remTray) as (
    select
      coalesce(sum("prodCarton"),0)  as carton,
      coalesce(sum("prodTray"),0)  as tray
    from
      production
    where
      amber_id = amberid and
      "prodDate" <=toDate and
       farm_id = farmId
  )
  select
  calculate_egg (
    (
      select coalesce(
        (
          (
            select
             coalesce(remTray,0)
            from
              tray_carton
          ) - (
            select
             coalesce(outTray,0)
            from
              egg_from_items_movs
          )
        ),0) as remainEgg
    )::INT,
    (
      select coalesce(
        (
          (
            select
             coalesce(remCarton,0)
            from
              tray_carton
          ) - (
            select
             coalesce(outCarton,0)
            from
              egg_from_items_movs
          )
        ),0) as remainCar
    )::INT
  ) into  egg_arr;
 return egg_arr;
 end;
 $$;
 v   DROP FUNCTION public.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone);
       public          postgres    false            ,           0    0 h   FUNCTION calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone)    ACL     �  GRANT ALL ON FUNCTION public.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone) TO anon;
GRANT ALL ON FUNCTION public.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone) TO authenticated;
GRANT ALL ON FUNCTION public.calculate_inventory_report(farmid integer, amberid integer, todate timestamp without time zone) TO service_role;
          public          postgres    false    623            -           1255    29634    create_ambers()    FUNCTION     w  CREATE FUNCTION public.create_ambers() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  if (TG_OP = 'UPDATE') then
     FOR i IN 1..NEW.no_of_ambers LOOP
  update public.ambers set farm_id=NEW.id;
  End Loop;
else
  FOR i IN 1..NEW.no_of_ambers LOOP
  INSERT INTO public.ambers(farm_id,amber_id)
values(NEW.id,i);
END LOOP;
end if;

RETURN NEW;
END;
$$;
 &   DROP FUNCTION public.create_ambers();
       public          postgres    false            -           0    0    FUNCTION create_ambers()    ACL     �   GRANT ALL ON FUNCTION public.create_ambers() TO anon;
GRANT ALL ON FUNCTION public.create_ambers() TO authenticated;
GRANT ALL ON FUNCTION public.create_ambers() TO service_role;
          public          postgres    false    557            *           1255    29635    create_inventory()    FUNCTION       CREATE FUNCTION public.create_inventory() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    r varchar;
    myarr varchar[]:=array(select * from get_all_item_code());
BEGIN
if (TG_OP = 'UPDATE') then
     
  FOR i IN 1..NEW.no_of_ambers LOOP
    ForEach r IN array myarr LOOP
         update public.inventory set farm_id=NEW.id;
    END LOOP;
  END LOOP;
  else
  FOR i IN 1..NEW.no_of_ambers LOOP
    ForEach r IN array myarr LOOP
         INSERT INTO public.inventory(farm_id,amber_id,item_code,quantity,small_quantity)
      values(NEW.id,i,r,0,0);
    END LOOP;
  END LOOP;
  end if;
RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.create_inventory();
       public          postgres    false            .           0    0    FUNCTION create_inventory()    ACL     �   GRANT ALL ON FUNCTION public.create_inventory() TO anon;
GRANT ALL ON FUNCTION public.create_inventory() TO authenticated;
GRANT ALL ON FUNCTION public.create_inventory() TO service_role;
          public          postgres    false    554            +           1255    29636 *   create_user(text, text, jsonb, text, text)    FUNCTION     �  CREATE FUNCTION public.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$ 
  declare
  user_id uuid;
  encrypted_pw text;
BEGIN
  user_id := gen_random_uuid();
  encrypted_pw := crypt(password, gen_salt('bf'));
  
  INSERT INTO auth.users
    (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, recovery_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, confirmation_token, email_change, email_change_token_new, recovery_token)
  VALUES
    ('00000000-0000-0000-0000-000000000000', user_id, 'authenticated', schema_user_name, email, encrypted_pw, now(), now(), now(), '{"provider":"email","providers":["email"]}',user_meta, now(), now(), '', '', '', '');
  
  INSERT INTO auth.identities (provider_id,id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
  VALUES
    (user_id,gen_random_uuid(), user_id, format('{"sub":"%s","email":"%s"}', user_id::text, email)::jsonb, 'email', now(), now(), now());
  --EXECUTE 'GRANT '||schema_user_name||' TO ' || user_id;
  --EXECUTE 'GRANT USAGE ON SCHEMA ' || schema_name || ' TO ' || user_id;
  RETURN user_id;
END;
$$;
 w   DROP FUNCTION public.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text);
       public          postgres    false            /           0    0 i   FUNCTION create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text)    ACL     �  GRANT ALL ON FUNCTION public.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text) TO anon;
GRANT ALL ON FUNCTION public.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text) TO authenticated;
GRANT ALL ON FUNCTION public.create_user(email text, password text, user_meta jsonb, schema_user_name text, schema_name text) TO service_role;
          public          postgres    false    555            p           1255    29637    delete_related_farm_data()    FUNCTION     �  CREATE FUNCTION public.delete_related_farm_data() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$declare
user_schema json:=(select raw_user_meta_data->'schema' from auth.users where id=old.farm_supervisor);
BEGIN

--raise exception 'here we go' using hint='before delete';
  DELETE FROM production USING farms f
  WHERE production.farm_id = OLD.id;

  DELETE FROM ambers USING farms f
  WHERE ambers.farm_id = OLD.id;

  DELETE FROM items_movement USING farms f
  WHERE items_movement.farm_id = OLD.id;

  DELETE FROM inventory USING farms f
  WHERE inventory.farm_id = OLD.id;

  delete from supervisors using farms f
  where supervisors.u_id=OLD.farm_supervisor;
  
  
   update auth.users set raw_user_meta_data=jsonb_set(raw_user_meta_data,array['schema'],to_jsonb(user_schema::text)) where id=OLD.farm_supervisor;
  -- raise insufficient_privilege using
  --     message = 'Not allowed to use application/vnd.pgrst.plan';
  RETURN null;
END;$$;
 1   DROP FUNCTION public.delete_related_farm_data();
       public          postgres    false            0           0    0 #   FUNCTION delete_related_farm_data()    ACL     �   GRANT ALL ON FUNCTION public.delete_related_farm_data() TO anon;
GRANT ALL ON FUNCTION public.delete_related_farm_data() TO authenticated;
GRANT ALL ON FUNCTION public.delete_related_farm_data() TO service_role;
          public          postgres    false    624            4           1255    29638    get_all_item_code()    FUNCTION     +  CREATE FUNCTION public.get_all_item_code() RETURNS SETOF character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
    r varchar;
BEGIN
    FOR r IN
        SELECT item_code FROM items
    LOOP
       
       
        RETURN NEXT r; -- return current row of SELECT
    END LOOP;
    RETURN;
END;
$$;
 *   DROP FUNCTION public.get_all_item_code();
       public          postgres    false            1           0    0    FUNCTION get_all_item_code()    ACL     �   GRANT ALL ON FUNCTION public.get_all_item_code() TO anon;
GRANT ALL ON FUNCTION public.get_all_item_code() TO authenticated;
GRANT ALL ON FUNCTION public.get_all_item_code() TO service_role;
          public          postgres    false    564            q           1255    29639 0   get_amber_monthly_report(integer, integer, date)    FUNCTION     �
  CREATE FUNCTION public.get_amber_monthly_report(f_id integer, amb_id integer, into_date date) RETURNS SETOF public.amber_daily_report2
    LANGUAGE plpgsql
    AS $$

declare
today_report amber_daily_report2;
--reportDate date := TO_DATE(repDate,'YYYYMMDD');
begin
for today_report in
 WITH egg_movement AS (
    SELECT
        --item_code,
	    type_movement,
        farm_id,
        amber_id,
        SUM(CASE WHEN item_code = '001-003' THEN quantity ELSE 0 END) AS "outCarton",
        SUM(CASE WHEN item_code = '001-004' THEN quantity ELSE 0 END) AS "outtry",
        SUM(CASE WHEN item_code = '001-002' THEN quantity ELSE 0 END) AS "out_feed",
        STRING_AGG(case when (item_code='001-003' or item_code='001-004' or item_code='001-002') then quantity || '-' || notes else null end, ',') AS notes,
        movement_date
    FROM items_movement
    WHERE amber_id = amb_id
        AND farm_id = f_id
	   and type_movement='خارج'
        AND EXTRACT(MONTH FROM movement_date) = EXTRACT(MONTH FROM into_date)
    GROUP BY ( movement_date, amber_id, farm_id,type_movement)
),

production_data AS (
    SELECT
        farm_id,
        amber_id,
        "prodDate",
        COALESCE(death, 0) AS death,
        COALESCE(incom_feed, 0) AS incom_feed,
        COALESCE(intak_feed, 0) AS intak_feed,
        COALESCE("prodTray", 0) AS "prod_tray",
        COALESCE("prodCarton", 0) AS "prod_carton"
    FROM production
    WHERE farm_id = f_id
        AND amber_id = amb_id
        AND EXTRACT(MONTH FROM "prodDate") = EXTRACT(MONTH FROM into_date)
        AND EXTRACT(year FROM "prodDate") = EXTRACT(year FROM into_date)
)
 select
    COALESCE(em.movement_date, p."prodDate") AS in_date,
    COALESCE(p.death,0),
    COALESCE(p.incom_feed,0),
    COALESCE(p.intak_feed,0) + COALESCE(em.out_feed, 0) AS out_feed,
    COALESCE(
        (SELECT * FROM get_remaining_feed(f_id::INT, amb_id::INT, em.movement_date)),
        (SELECT * FROM get_remaining_feed(f_id::INT, amb_id::INT, p."prodDate"))
    ) AS remin_feed,
    COALESCE(p.prod_tray,0),
    COALESCE(p.prod_carton,0),
    COALESCE(em.outtry, 0) AS out_tray,
    COALESCE(em."outCarton", 0) AS out_carton,
    COALESCE(em.notes,'لايوجد'),
    (
        SELECT calculate_inventory_report(f_id::INT, amb_id::INT, COALESCE(em.movement_date, p."prodDate"))
    ) AS remin_egg
FROM egg_movement AS em
FULL JOIN production_data AS p ON em.movement_date = p."prodDate"
and  (p.amber_id=amb_id
    AND  p.farm_id=f_id)
      and (EXTRACT(month from p."prodDate") = extract(month from into_date)
  and EXTRACT(year from p."prodDate") = extract(year from into_date))
  order by in_date 
  loop
       return next today_report;
  end loop;
  --end if;
end
$$;
 ]   DROP FUNCTION public.get_amber_monthly_report(f_id integer, amb_id integer, into_date date);
       public          postgres    false    1382            2           0    0 O   FUNCTION get_amber_monthly_report(f_id integer, amb_id integer, into_date date)    ACL     X  GRANT ALL ON FUNCTION public.get_amber_monthly_report(f_id integer, amb_id integer, into_date date) TO anon;
GRANT ALL ON FUNCTION public.get_amber_monthly_report(f_id integer, amb_id integer, into_date date) TO authenticated;
GRANT ALL ON FUNCTION public.get_amber_monthly_report(f_id integer, amb_id integer, into_date date) TO service_role;
          public          postgres    false    625            r           1255    29640 (   get_daily_report(integer, integer, date)    FUNCTION     �  CREATE FUNCTION public.get_daily_report(f_id integer, amb_id integer, rep_date date) RETURNS SETOF public.amber_daily_report
    LANGUAGE plpgsql
    AS $$

declare
today_report amber_daily_report;
begin
if amb_id>0 then
for today_report in
  WITH egg_movement AS (
    SELECT
        --item_code,
        farm_id,
        amber_id,
        SUM(CASE WHEN item_code = '001-003' THEN quantity ELSE 0 END) AS outcarton,
        SUM(CASE WHEN item_code = '001-004' THEN quantity ELSE 0 END) AS outtray,
        SUM(CASE WHEN item_code = '001-002' THEN quantity ELSE 0 END) AS "out_feed",
        STRING_AGG(quantity || '-' || notes, ',') AS notes,
        movement_date
    FROM items_movement
    WHERE amber_id = amb_id
        AND farm_id = f_id
        AND  movement_date = rep_date
    GROUP BY ( movement_date, amber_id, farm_id)
),

production_data AS (
    SELECT
        farm_id,
        amber_id,
        "prodDate",
        COALESCE(death, 0) AS death,
        COALESCE(incom_feed, 0) AS incom_feed,
        COALESCE(intak_feed, 0) AS intak_feed,
        COALESCE("prodTray", 0) AS "prod_tray",
        COALESCE("prodCarton", 0) AS "prod_carton"
    FROM production
    WHERE farm_id = f_id
        AND amber_id = amb_id
        AND "prodDate" =rep_date
        --AND EXTRACT(year FROM "prodDate") = EXTRACT(year FROM '2023-12-20'::date)
)

SELECT
    COALESCE(em.amber_id, p.amber_id) AS amber_id,
   coalesce(p.death,0) as death,
   coalesce(p.incom_feed,0),
    coalesce(p.intak_feed,0) + COALESCE(em.out_feed, 0) AS out_feed,
    COALESCE(
        (SELECT * FROM get_remaining_feed(f_id::INT, amb_id::INT, em.movement_date)),
        (SELECT * FROM get_remaining_feed(f_id::INT, amb_id::INT, p."prodDate"))
    ) AS remin_feed,
   coalesce(p.prod_tray,0),
   coalesce(p.prod_carton,0),
    
    COALESCE(em.outcarton, 0) AS out_carton,
    COALESCE(em.outtray, 0) AS out_tray,
    em.notes,
    (
        SELECT calculate_inventory_report(f_id::INT, amb_id::INT, COALESCE(em.movement_date, p."prodDate"))
    ) AS remin_egg
FROM egg_movement AS em
FULL JOIN production_data AS p ON em.movement_date = p."prodDate"
and  (p.amber_id=amb_id
    AND  p.farm_id=f_id)
      and (p."prodDate" = rep_date OR em.movement_date=rep_date)
       limit 1
  loop

       return next today_report;
  
  end loop;
else
 for today_report in
  WITH egg_movement AS (
    SELECT
        --item_code,
        farm_id,
        amber_id,
        SUM(CASE WHEN item_code = '001-003' and type_movement='خارج' THEN quantity ELSE 0 END) AS outcarton,
        SUM(CASE WHEN item_code = '001-004' and type_movement='خارج' THEN quantity ELSE 0 END) AS outtray,
        SUM(CASE WHEN item_code = '001-002' and type_movement='خارج' THEN quantity ELSE 0 END) AS "out_feed",
        STRING_AGG(case when ((item_code='001-003' or item_code='001-004' or item_code='001-002') and type_movement='خارج')  then quantity || '-' || notes else null end, ',') AS notes,
        movement_date
    FROM items_movement
    WHERE 
     farm_id = f_id
        AND  movement_date = rep_date
    GROUP BY ( movement_date, amber_id, farm_id)
),

production_data AS (
    SELECT
        farm_id,
        amber_id,
        "prodDate",
        COALESCE(death, 0) AS death,
        COALESCE(incom_feed, 0) AS incom_feed,
        COALESCE(intak_feed, 0) AS intak_feed,
        COALESCE("prodTray", 0) AS "prod_tray",
        COALESCE("prodCarton", 0) AS "prod_carton"
    FROM production
    WHERE farm_id = f_id
        --AND amber_id = amb_id
        AND "prodDate" =rep_date
        --AND EXTRACT(year FROM "prodDate") = EXTRACT(year FROM '2023-12-20'::date)
)

SELECT 
    COALESCE(p.amber_id, em.amber_id) AS amber_id,
   coalesce(p.death,0) as death,
   coalesce(p.incom_feed,0),
    coalesce(p.intak_feed,0) + COALESCE(em.out_feed, 0) AS out_feed,
    COALESCE(
        (SELECT * FROM get_remaining_feed(f_id::INT, em.amber_id::INT, em.movement_date)),
        (SELECT * FROM get_remaining_feed(f_id::INT, p.amber_id::INT, p."prodDate"))
    ) AS remin_feed,
   coalesce(p.prod_tray,0),
   coalesce(p.prod_carton,0),
    
    COALESCE(em.outcarton, 0) AS out_carton,
    COALESCE(em.outtray, 0) AS out_tray,
    em.notes,
    (
        SELECT calculate_inventory_report(f_id::INT, COALESCE(em.amber_id, p.amber_id)::INT, COALESCE(em.movement_date, p."prodDate"))
    ) AS remin_egg
FROM egg_movement AS em
full JOIN production_data AS p ON em.movement_date = p."prodDate"
and  (
  p.amber_id=em.amber_id and
      p.farm_id=f_id)
       and p."prodDate" =rep_date
  order by (amber_id)
  --limit 1
  loop

       return next today_report;
  
  end loop;
  end if;

end
$$;
 T   DROP FUNCTION public.get_daily_report(f_id integer, amb_id integer, rep_date date);
       public          postgres    false    1379            3           0    0 F   FUNCTION get_daily_report(f_id integer, amb_id integer, rep_date date)    ACL     =  GRANT ALL ON FUNCTION public.get_daily_report(f_id integer, amb_id integer, rep_date date) TO anon;
GRANT ALL ON FUNCTION public.get_daily_report(f_id integer, amb_id integer, rep_date date) TO authenticated;
GRANT ALL ON FUNCTION public.get_daily_report(f_id integer, amb_id integer, rep_date date) TO service_role;
          public          postgres    false    626            s           1255    29641 $   get_farm_month_report(integer, date)    FUNCTION     K  CREATE FUNCTION public.get_farm_month_report(f_id integer, rep_date date) RETURNS SETOF public.month_report
    LANGUAGE plpgsql
    AS $$
declare
farm_month_rep public.month_report;
begin

 for farm_month_rep in select
  p."prodDate",
  sum(p.death) as death,
  sum(incom_feed) as incomFeed,
  sum(intak_feed) as intakFeed
  ,
  (
    select
      *
    from
     get_remaining_feed (farm_id::INT, 0::INT, "prodDate")
  ) as reminFeed,
 ( select * from calculate_egg(sum("prodTray")::INT, sum("prodCarton")::INT) )as prodEggs,
  --sum("prodCarton") as prodcarton,
  --sum("prodTray") as prodtray,
  (select *from calculate_egg((
    coalesce(
    (
      select
       sum( quantity)
      from
        items_movement
      where
        item_code = '001-004'
        and farm_id = p.farm_id
        and type_movement='خارج'
        and movement_date = p."prodDate"
    ),
    0
  ))::INT,
    (coalesce(
    (
      select
        sum(quantity)
      from
        items_movement
      where
        item_code = '001-003'
        and farm_id = p.farm_id
        and type_movement='خارج'
        and movement_date = p."prodDate"
    ),
    0
  ))::INT))as outEgg,

 (select * from get_remain_egg_by_farm(p.farm_id::INT,p."prodDate"::Date)) as remainegg

from
  production as p
where
  p.farm_id = f_id
  and extract(
    month
    from
      p."prodDate"
  ) = extract(
    month
    from
     rep_date
  )
group by
  (p.farm_id, p."prodDate")
order by
  p."prodDate" asc
  loop
  return next farm_month_rep;
  end loop;
end;
$$;
 I   DROP FUNCTION public.get_farm_month_report(f_id integer, rep_date date);
       public          postgres    false    1385            4           0    0 ;   FUNCTION get_farm_month_report(f_id integer, rep_date date)    ACL       GRANT ALL ON FUNCTION public.get_farm_month_report(f_id integer, rep_date date) TO anon;
GRANT ALL ON FUNCTION public.get_farm_month_report(f_id integer, rep_date date) TO authenticated;
GRANT ALL ON FUNCTION public.get_farm_month_report(f_id integer, rep_date date) TO service_role;
          public          postgres    false    627            )           1259    29643    items_movement    TABLE     �  CREATE TABLE public.items_movement (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    farm_id bigint DEFAULT '1'::bigint,
    amber_id bigint NOT NULL,
    item_code character varying,
    type_movement character varying DEFAULT '{''وارد'',''خارج''}'::character varying,
    movement_date date,
    quantity numeric,
    notes character varying
);
 "   DROP TABLE public.items_movement;
       public         heap    postgres    false            5           0    0    TABLE items_movement    ACL     �   GRANT ALL ON TABLE public.items_movement TO anon;
GRANT ALL ON TABLE public.items_movement TO authenticated;
GRANT ALL ON TABLE public.items_movement TO service_role;
          public          postgres    false    297            :           1255    29651 [   get_outitems_monthly_by_amber(integer, integer, date, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying) RETURNS SETOF public.items_movement
    LANGUAGE plpgsql
    AS $$

begin
return query
select *  from items_movement where item_code=it_code and amber_id=amb_id and type_movement=move_type
and farm_id=f_id  AND EXTRACT(MONTH FROM movement_date) = EXTRACT(MONTH FROM rep_date)
order by movement_date asc;

end;
$$;
 �   DROP FUNCTION public.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying);
       public          postgres    false    297            6           0    0 �   FUNCTION get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying)    ACL       GRANT ALL ON FUNCTION public.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying) TO anon;
GRANT ALL ON FUNCTION public.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying) TO authenticated;
GRANT ALL ON FUNCTION public.get_outitems_monthly_by_amber(f_id integer, amb_id integer, rep_date date, it_code character varying, move_type character varying) TO service_role;
          public          postgres    false    570            t           1255    29652 Q   get_outitems_monthly_by_farm(integer, date, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying) RETURNS TABLE(movement_date date, item_code character varying, quantity numeric, notes text)
    LANGUAGE plpgsql
    AS $$

begin
return query
    WITH out_details AS (
    SELECT
      em.item_code,
        em.movement_date,
        em.type_movement,
        TRIM(em.notes) AS name_of,
        SUM(em.quantity) AS summation
    FROM items_movement as em
    WHERE EXTRACT(MONTH FROM em.movement_date) = EXTRACT(MONTH FROM rep_date)
    and EXTRACT(YEAR FROM em.movement_date) = EXTRACT(YEAR FROM rep_date) and 
    em.item_code=it_code and em.type_movement = move_type
   
    GROUP BY em.movement_date, TRIM(em.notes),em.item_code,em.type_movement
),
from_movement AS (
    SELECT p.farm_id, p.movement_date
    FROM items_movement as p
    WHERE EXTRACT(MONTH FROM p.movement_date) = EXTRACT(MONTH FROM rep_date)
    and    EXTRACT(YEAR FROM p.movement_date) = EXTRACT(Year FROM rep_date)
)
SELECT distinct
    p.movement_date,
    em.item_code,
    em.summation,
    em.name_of
FROM from_movement AS p
LEFT JOIN out_details AS em ON p.movement_date = em.movement_date
WHERE p.farm_id = f_id
    AND EXTRACT(MONTH FROM p.movement_date) = EXTRACT(MONTH FROM rep_date)
    AND EXTRACT(Year FROM p.movement_date) = EXTRACT(YEAR FROM rep_date) 
    and em.item_code=it_code
    and em.type_movement=move_type
order by p.movement_date asc;

end;
$$;
 �   DROP FUNCTION public.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying);
       public          postgres    false            7           0    0 z   FUNCTION get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying)    ACL     �  GRANT ALL ON FUNCTION public.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying) TO anon;
GRANT ALL ON FUNCTION public.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying) TO authenticated;
GRANT ALL ON FUNCTION public.get_outitems_monthly_by_farm(f_id integer, rep_date date, it_code character varying, move_type character varying) TO service_role;
          public          postgres    false    628            u           1255    29653 %   get_remain_egg_by_farm(integer, date)    FUNCTION     0  CREATE FUNCTION public.get_remain_egg_by_farm(f_id integer, into_date date) RETURNS integer[]
    LANGUAGE plpgsql
    AS $$
declare
egg_arr int[];
begin

WITH egg_from_items_movs(outtray,outcarton) AS (
    SELECT
        SUM(CASE WHEN i.item_code = '001-004' THEN i.quantity ELSE 0 END) AS outtray,
        SUM(CASE WHEN i.item_code = '001-003' THEN i.quantity ELSE 0 END) AS outcarton
    FROM items_movement AS i
    WHERE
        i.type_movement = 'خارج'
        AND i.movement_date <= into_date
        AND farm_id = f_id
    GROUP BY i.farm_id
), tray_carton AS (
    SELECT
        coalesce(SUM("prodCarton"), 0) AS remCarton,
        coalesce(SUM("prodTray"), 0)  AS remTray
    FROM production
    WHERE
        production."prodDate" <= into_date AND
        farm_id = f_id
),real_amount as(

SELECT
   coalesce( tray_carton.remTray,0)-(SELECT
   coalesce((select coalesce(outtray,0) as tray from egg_from_items_movs),0)) AS totalTray,
  coalesce( tray_carton.remCarton,0)-(SELECT
   coalesce((select coalesce(outcarton,0) as carton from egg_from_items_movs),0)) AS totalCarton
FROM tray_carton
)
 
  select 
  calculate_egg 
    (
      (select totalTray from real_amount)::INT,
       (select totalCarton from real_amount)::INT
  )into  egg_arr;
 return egg_arr;
end
$$;
 K   DROP FUNCTION public.get_remain_egg_by_farm(f_id integer, into_date date);
       public          postgres    false            8           0    0 =   FUNCTION get_remain_egg_by_farm(f_id integer, into_date date)    ACL     "  GRANT ALL ON FUNCTION public.get_remain_egg_by_farm(f_id integer, into_date date) TO anon;
GRANT ALL ON FUNCTION public.get_remain_egg_by_farm(f_id integer, into_date date) TO authenticated;
GRANT ALL ON FUNCTION public.get_remain_egg_by_farm(f_id integer, into_date date) TO service_role;
          public          postgres    false    629            D           1255    29654 A   get_remaining_feed(integer, integer, timestamp without time zone)    FUNCTION       CREATE FUNCTION public.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
declare
remain_feed numeric;
begin
--remain_feed :=
if(ambid>0) then
select
 coalesce(sum(incom_feed),0) - coalesce(sum(intak_feed),0) - (
    select
     coalesce(sum(quantity),0)
    from
      items_movement
    where
      item_code = '001-002'
      and type_movement = 'خارج'
      and movement_date <=toDate
      and amber_id = pro.amber_id
      and farm_id = pro.farm_id
  ) as remainFeed
from
  production as pro
where
  pro."prodDate" <=toDate
  and pro.farm_id = fid
  and pro.amber_id = ambid
group by
  (pro.amber_id, pro.farm_id) into remain_feed;
else
select
 coalesce(sum(incom_feed),0) - coalesce(sum(intak_feed),0) - (
    select
     coalesce(sum(quantity),0)
    from
      items_movement
    where
      item_code = '001-002'
      and type_movement = 'خارج'
      and movement_date <=toDate
      --and amber_id = pro.amber_id
      and farm_id = pro.farm_id
  ) as remainFeed
from
  production as pro
where
  pro."prodDate" <=toDate
  and pro.farm_id = fid
  --and pro.amber_id = ambid
group by
  ( pro.farm_id) into remain_feed;
  end if;
  
return remain_feed;
end;
$$;
 i   DROP FUNCTION public.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone);
       public          postgres    false            9           0    0 [   FUNCTION get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone)    ACL     |  GRANT ALL ON FUNCTION public.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone) TO anon;
GRANT ALL ON FUNCTION public.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone) TO authenticated;
GRANT ALL ON FUNCTION public.get_remaining_feed(fid integer, ambid integer, todate timestamp without time zone) TO service_role;
          public          postgres    false    580            C           1255    29655    handle_new_user()    FUNCTION     o  CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
schema_name text :=new.raw_user_meta_data->>'schema';
begin
 set search_path=schema_name;
  insert into supervisors (u_id, name)
  values (new.id,new.email); -- new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'avatar_url');
  return new;
end;
$$;
 (   DROP FUNCTION public.handle_new_user();
       public          postgres    false            :           0    0    FUNCTION handle_new_user()    ACL     �   GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;
          public          postgres    false    579            G           1255    29656 ,   insert_to_supervisors_table_after_add_farm()    FUNCTION     Y  CREATE FUNCTION public.insert_to_supervisors_table_after_add_farm() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
email varchar:=(select email from auth.users where id=new.farm_supervisor);
--schema text:=select raw_user_meta_data->'schema' from auth.users where id=new.farm_supervisor;
begin
insert into public.supervisors(name,details,u_id) values(email,'مشرف مزرعة '||new.farm_name,new.farm_supervisor);
update auth.users set raw_user_meta_data=raw_user_meta_data||jsonb_build_object('farm_id', new.id) where id=new.farm_supervisor;
return new;
end;
$$;
 C   DROP FUNCTION public.insert_to_supervisors_table_after_add_farm();
       public          postgres    false            ;           0    0 5   FUNCTION insert_to_supervisors_table_after_add_farm()    ACL     
  GRANT ALL ON FUNCTION public.insert_to_supervisors_table_after_add_farm() TO anon;
GRANT ALL ON FUNCTION public.insert_to_supervisors_table_after_add_farm() TO authenticated;
GRANT ALL ON FUNCTION public.insert_to_supervisors_table_after_add_farm() TO service_role;
          public          postgres    false    583            v           1255    29657 #   retieve_users_in_schema(text, text)    FUNCTION     �  CREATE FUNCTION public.retieve_users_in_schema(schema_name text, user_role text) RETURNS TABLE(id uuid, role character varying, email character varying, raw_app_meta_data jsonb, raw_user_meta_data jsonb)
    LANGUAGE plpgsql
    AS $$
-- declare
-- users_row RECORD;
begin
-- for users_row in 
return query
select
  tbl.id,
    tbl.role,
    tbl.email,
    tbl.raw_app_meta_data,
    tbl.raw_user_meta_data
from
  auth.users as tbl
where
  tbl.raw_user_meta_data ->> 'schema' = schema_name and tbl.role=user_role  
  and tbl.raw_user_meta_data ->'role' IS NULL and tbl.raw_user_meta_data ->'farm_id' is null;
  -- LOOP
  --    RETURN NEXT users_row; -- return current row of SELECT
  --   END LOOP;
  --   RETURN;
End;
$$;
 P   DROP FUNCTION public.retieve_users_in_schema(schema_name text, user_role text);
       public          postgres    false            <           0    0 B   FUNCTION retieve_users_in_schema(schema_name text, user_role text)    ACL     1  GRANT ALL ON FUNCTION public.retieve_users_in_schema(schema_name text, user_role text) TO anon;
GRANT ALL ON FUNCTION public.retieve_users_in_schema(schema_name text, user_role text) TO authenticated;
GRANT ALL ON FUNCTION public.retieve_users_in_schema(schema_name text, user_role text) TO service_role;
          public          postgres    false    630            w           1255    29658 '   update_inventory_based_items_movement()    FUNCTION     �  CREATE FUNCTION public.update_inventory_based_items_movement() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
in_farm_id int :=New.farm_id;
in_amber_id int :=New.amber_id;
--item_code varchar :=New.item_code;
in_quantity numeric:=New.quantity;
--type_move varchar :=New.type_movement;
itemCode varchar :=item_code from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code=New.item_code;--check if the item in inventory
last_amount numeric :=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code=New.item_code; --get the previous amount from inventory
sub_quantity  int:=small_quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
--used to get the amount of cartoons only if the item_code=001-004
egg_carton_amount int;
egg_try_amount int;

--used to calculate tray and carton if item_code=001-004
nums int[]=ARRAY[]::int[]; --:=select calculate_eggs(prod_tray,prod_carton);
begin

if New.type_movement ='خارج'
 then

--- if the itemcode is طبق so we need to calculata the remaining cartons and tray
if New.item_code ='001-004'
   then
   egg_carton_amount :=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
   --RAISE NOTICE 'Value: (%)', egg_carton_amount;
   sub_quantity :=sub_quantity-in_quantity;
   --RAISE NOTICE 'Value: (%)', sub_quantity;
   nums :=array(select calculate_egg(sub_quantity,egg_carton_amount));
  egg_carton_amount := elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 2;
   egg_try_amount :=elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 1;
      update inventory set quantity = egg_carton_amount,small_quantity=egg_try_amount where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';

 else
      --- if the itemCode so this is the first time insert the item into the inventory
       if itemCode is NULL
            then
           insert into inventory(farm_id,amber_id,item_code,quantity)
            values(New.farm_id,New.amber_id,New.item_code,New.quantity);
         else
        last_amount :=last_amount-in_quantity;
        update inventory set quantity=last_amount  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code=New.item_code;
      end if;
   end if;
--------- so the type movement is وارد ---
  else 
   --- if the itemCode so this is the first time insert the item into the inventory
     if itemCode is NULL then
      insert into inventory(farm_id,amber_id,item_code,quantity) values(New.farm_id,New.amber_id,New.item_code,New.quantity);
      else
      last_amount :=last_amount+in_quantity;
     update inventory set quantity=last_amount  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code=New.item_code;
     end if;
 end if;
 return new;
 end;
$$;
 >   DROP FUNCTION public.update_inventory_based_items_movement();
       public          postgres    false            =           0    0 0   FUNCTION update_inventory_based_items_movement()    ACL     �   GRANT ALL ON FUNCTION public.update_inventory_based_items_movement() TO anon;
GRANT ALL ON FUNCTION public.update_inventory_based_items_movement() TO authenticated;
GRANT ALL ON FUNCTION public.update_inventory_based_items_movement() TO service_role;
          public          postgres    false    631            2           1255    29659 3   update_inventory_quantity_after_update_production()    FUNCTION     �
  CREATE FUNCTION public.update_inventory_quantity_after_update_production() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

declare
in_feed numeric :=New.incom_feed;
out_feed numeric:=New.intak_feed;
prod_carton int :=New."prodCarton";
prod_tray int :=New."prodTray";
-- out_carton int :=New."outCarton";
-- out_tray int :=New."outTray";
no_death int :=New.death;

feed_amount numeric :=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-002';
egg_carton_amount int :=quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
egg_try_amount int :=small_quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';
no_of_hens int := quantity from inventory where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-001';

nums int[]=ARRAY[]::int[]; --:=select calculate_eggs(prod_tray,prod_carton);
--the old row of current update
old_row production%rowtype :=Old;
begin
 --if (TG_OP = 'UPDATE') then
 no_of_hens :=no_of_hens+old_row.death-no_death;
feed_amount :=feed_amount -(old_row.incom_feed-old_row.intak_feed)+(in_feed - out_feed);
egg_carton_amount :=egg_carton_amount-(old_row."prodCarton")+(prod_carton);
egg_try_amount := egg_try_amount-(old_row."prodTray")+(prod_tray);
nums :=array(select calculate_egg(egg_try_amount,egg_carton_amount));
egg_carton_amount := elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 2;
egg_try_amount :=elem from 
   unnest (nums)
             with ordinality as a(elem,idx)
         where idx = 1;
-- else
-- no_of_hens :=no_of_hens-no_death;
-- feed_amount :=feed_amount + in_feed - out_feed;
-- egg_carton_amount :=egg_carton_amount+prod_carton-out_carton;
-- egg_try_amount := egg_try_amount+prod_tray-out_tray;
-- nums :=array(select calculate_egg(egg_try_amount,egg_carton_amount));
-- egg_carton_amount := elem from 
--    unnest (nums)
--              with ordinality as a(elem,idx)
--          where idx = 2;
-- egg_try_amount :=elem from 
--    unnest (nums)
--              with ordinality as a(elem,idx)
--          where idx = 1;
-- end if;
update inventory set quantity = no_of_hens ,updated_at = current_timestamp  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-001';
update inventory set quantity = feed_amount,updated_at = current_timestamp  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-002'; 
update inventory set quantity = egg_carton_amount,small_quantity=egg_try_amount,updated_at = current_timestamp  where (farm_id=New.farm_id and amber_id =New.amber_id) and item_code='001-003';


return new;
end;    
$$;
 J   DROP FUNCTION public.update_inventory_quantity_after_update_production();
       public          postgres    false            >           0    0 <   FUNCTION update_inventory_quantity_after_update_production()    ACL       GRANT ALL ON FUNCTION public.update_inventory_quantity_after_update_production() TO anon;
GRANT ALL ON FUNCTION public.update_inventory_quantity_after_update_production() TO authenticated;
GRANT ALL ON FUNCTION public.update_inventory_quantity_after_update_production() TO service_role;
          public          postgres    false    562            3           1255    29660 )   update_supervisors_table_after_add_farm()    FUNCTION     N  CREATE FUNCTION public.update_supervisors_table_after_add_farm() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
email varchar:=(select email from auth.users where id=new.farm_supervisor);
--schema text:=select raw_user_meta_data->'schema' from auth.users where id=new.farm_supervisor;
begin
insert into supervisors(name,details,u_id) values(email,'مشرف مزرعة '+new.farm_name,new.farm_supervisor);
update auth.users set raw_user_meta_data=raw_user_meta_data||jsonb_build_object('farm_id', new.id) where id=new.farm_supervisor;
return new;
end;
$$;
 @   DROP FUNCTION public.update_supervisors_table_after_add_farm();
       public          postgres    false            ?           0    0 2   FUNCTION update_supervisors_table_after_add_farm()    ACL       GRANT ALL ON FUNCTION public.update_supervisors_table_after_add_farm() TO anon;
GRANT ALL ON FUNCTION public.update_supervisors_table_after_add_farm() TO authenticated;
GRANT ALL ON FUNCTION public.update_supervisors_table_after_add_farm() TO service_role;
          public          postgres    false    563            /           1255    29661    apply_rls(jsonb, integer)    FUNCTION     �(  CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;
 G   DROP FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer);
       realtime          supabase_admin    false    1406    34            @           0    0 7   FUNCTION apply_rls(wal jsonb, max_record_bytes integer)    ACL     <  GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;
          realtime          supabase_admin    false    559            �           1255    29663 E   broadcast_changes(text, text, text, text, text, record, record, text)    FUNCTION       CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;
 �   DROP FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text);
       realtime          supabase_admin    false    34            A           0    0 �   FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text)    ACL     v  GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;
          realtime          supabase_admin    false    647            x           1255    29664 C   build_prepared_statement_sql(text, regclass, realtime.wal_column[])    FUNCTION     �  CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;
 �   DROP FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]);
       realtime          supabase_admin    false    1403    34            B           0    0 s   FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[])    ACL     �  GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;
          realtime          supabase_admin    false    632            y           1255    29665    cast(text, regtype)    FUNCTION       CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;
 8   DROP FUNCTION realtime."cast"(val text, type_ regtype);
       realtime          supabase_admin    false    34            C           0    0 (   FUNCTION "cast"(val text, type_ regtype)    ACL     �  GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;
          realtime          supabase_admin    false    633            |           1255    29666 <   check_equality_op(realtime.equality_op, regtype, text, text)    FUNCTION     U  CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;
 j   DROP FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text);
       realtime          supabase_admin    false    34    1397            D           0    0 Z   FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text)    ACL       GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;
          realtime          supabase_admin    false    636            }           1255    29667 Q   is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[])    FUNCTION     �  CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;
 z   DROP FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]);
       realtime          supabase_admin    false    1400    34    1403            E           0    0 j   FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[])    ACL     n  GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;
          realtime          supabase_admin    false    637            �           1255    29668 *   list_changes(name, name, integer, integer)    FUNCTION     �  CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;
 v   DROP FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer);
       realtime          supabase_admin    false    1406    34            F           0    0 f   FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer)    ACL     V  GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;
          realtime          supabase_admin    false    648            z           1255    29669    quote_wal2json(regclass)    FUNCTION     �  CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;
 8   DROP FUNCTION realtime.quote_wal2json(entity regclass);
       realtime          supabase_admin    false    34            G           0    0 (   FUNCTION quote_wal2json(entity regclass)    ACL     �  GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;
          realtime          supabase_admin    false    634            L           1255    29670     send(jsonb, text, text, boolean)    FUNCTION       CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    SET LOCAL realtime.topic TO topic;

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      PERFORM pg_notify(
          'realtime:system',
          jsonb_build_object(
              'error', SQLERRM,
              'function', 'realtime.send',
              'event', event,
              'topic', topic,
              'private', private
          )::text
      );
  END;
END;
$$;
 U   DROP FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean);
       realtime          supabase_admin    false    34            H           0    0 E   FUNCTION send(payload jsonb, event text, topic text, private boolean)    ACL     �   GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;
          realtime          supabase_admin    false    588            �           1255    29671    subscription_check_filters()    FUNCTION     <
  CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;
 5   DROP FUNCTION realtime.subscription_check_filters();
       realtime          supabase_admin    false    34            I           0    0 %   FUNCTION subscription_check_filters()    ACL     �  GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;
          realtime          supabase_admin    false    643            R           1255    29672    to_regrole(text)    FUNCTION     �   CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;
 3   DROP FUNCTION realtime.to_regrole(role_name text);
       realtime          supabase_admin    false    34            J           0    0 #   FUNCTION to_regrole(role_name text)    ACL     �  GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;
          realtime          supabase_admin    false    594            P           1255    29673    topic()    FUNCTION     �   CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;
     DROP FUNCTION realtime.topic();
       realtime          supabase_realtime_admin    false    34            K           0    0    FUNCTION topic()    ACL     n   GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;
          realtime          supabase_realtime_admin    false    592            ~           1255    29674 *   can_insert_object(text, text, uuid, jsonb)    FUNCTION     �  CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;
 _   DROP FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb);
       storage          supabase_storage_admin    false    30            L           0    0 P   FUNCTION can_insert_object(bucketid text, name text, owner uuid, metadata jsonb)    ACL     s   GRANT ALL ON FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) TO postgres;
          storage          supabase_storage_admin    false    638            �           1255    29675    extension(text)    FUNCTION     T  CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
    select string_to_array(name, '/') into _parts;
    select _parts[array_length(_parts,1)] into _filename;
    -- @todo return the last part instead of 2
    return split_part(_filename, '.', 2);
END
$$;
 ,   DROP FUNCTION storage.extension(name text);
       storage          supabase_storage_admin    false    30            M           0    0    FUNCTION extension(name text)    ACL     K  GRANT ALL ON FUNCTION storage.extension(name text) TO anon;
GRANT ALL ON FUNCTION storage.extension(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.extension(name text) TO service_role;
GRANT ALL ON FUNCTION storage.extension(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;
          storage          supabase_storage_admin    false    641                       1255    29676    filename(text)    FUNCTION     �   CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[array_length(_parts,1)];
END
$$;
 +   DROP FUNCTION storage.filename(name text);
       storage          supabase_storage_admin    false    30            N           0    0    FUNCTION filename(name text)    ACL     F  GRANT ALL ON FUNCTION storage.filename(name text) TO anon;
GRANT ALL ON FUNCTION storage.filename(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.filename(name text) TO service_role;
GRANT ALL ON FUNCTION storage.filename(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;
          storage          supabase_storage_admin    false    639            T           1255    29677    foldername(text)    FUNCTION     �   CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[1:array_length(_parts,1)-1];
END
$$;
 -   DROP FUNCTION storage.foldername(name text);
       storage          supabase_storage_admin    false    30            O           0    0    FUNCTION foldername(name text)    ACL     P  GRANT ALL ON FUNCTION storage.foldername(name text) TO anon;
GRANT ALL ON FUNCTION storage.foldername(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.foldername(name text) TO service_role;
GRANT ALL ON FUNCTION storage.foldername(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;
          storage          supabase_storage_admin    false    596            Q           1255    29678    get_size_by_bucket()    FUNCTION        CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;
 ,   DROP FUNCTION storage.get_size_by_bucket();
       storage          supabase_storage_admin    false    30            P           0    0    FUNCTION get_size_by_bucket()    ACL     @   GRANT ALL ON FUNCTION storage.get_size_by_bucket() TO postgres;
          storage          supabase_storage_admin    false    593            S           1255    29679 L   list_multipart_uploads_with_delimiter(text, text, text, integer, text, text)    FUNCTION     9  CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;
 �   DROP FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text);
       storage          supabase_storage_admin    false    30            Q           0    0 �   FUNCTION list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text)    ACL     �   GRANT ALL ON FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) TO postgres;
          storage          supabase_storage_admin    false    595            �           1255    29680 B   list_objects_with_delimiter(text, text, text, integer, text, text)    FUNCTION     �  CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;
 �   DROP FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text);
       storage          supabase_storage_admin    false    30            R           0    0 �   FUNCTION list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text)    ACL     �   GRANT ALL ON FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) TO postgres;
          storage          supabase_storage_admin    false    642            X           1255    29681    operation()    FUNCTION     �   CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;
 #   DROP FUNCTION storage.operation();
       storage          supabase_storage_admin    false    30            S           0    0    FUNCTION operation()    ACL     7   GRANT ALL ON FUNCTION storage.operation() TO postgres;
          storage          supabase_storage_admin    false    600            Y           1255    29682 ?   search(text, text, integer, integer, integer, text, text, text)    FUNCTION       CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;
 �   DROP FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
       storage          supabase_storage_admin    false    30            T           0    0 �   FUNCTION search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text)    ACL     �   GRANT ALL ON FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) TO postgres;
          storage          supabase_storage_admin    false    601            W           1255    29683    update_updated_at_column()    FUNCTION     �   CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;
 2   DROP FUNCTION storage.update_updated_at_column();
       storage          supabase_storage_admin    false    30            U           0    0 #   FUNCTION update_updated_at_column()    ACL     F   GRANT ALL ON FUNCTION storage.update_updated_at_column() TO postgres;
          storage          supabase_storage_admin    false    599            {           1255    29684    http_request()    FUNCTION     �  CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;
 1   DROP FUNCTION supabase_functions.http_request();
       supabase_functions          supabase_functions_admin    false    26            V           0    0    FUNCTION http_request()    ACL     _  REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;
          supabase_functions          supabase_functions_admin    false    635            �           1255    29476    secrets_encrypt_secret_secret()    FUNCTION     (  CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;
 5   DROP FUNCTION vault.secrets_encrypt_secret_secret();
       vault          supabase_admin    false    19            *           1259    29685    ambers    TABLE     �   CREATE TABLE al_watania.ambers (
    id bigint NOT NULL,
    quantity bigint,
    age bigint,
    other_details character varying,
    farm_id bigint NOT NULL,
    amber_id bigint NOT NULL
);
    DROP TABLE al_watania.ambers;
    
   al_watania         heap    postgres    false    22            W           0    0    TABLE ambers    ACL     �   GRANT ALL ON TABLE al_watania.ambers TO authenticated;
GRANT ALL ON TABLE al_watania.ambers TO al_watania_users;
GRANT ALL ON TABLE al_watania.ambers TO anon;
GRANT ALL ON TABLE al_watania.ambers TO service_role;
       
   al_watania          postgres    false    298            +           1259    29690    ambers_id_seq    SEQUENCE     �   ALTER TABLE al_watania.ambers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME al_watania.ambers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         
   al_watania          postgres    false    298    22            X           0    0    SEQUENCE ambers_id_seq    ACL     �   GRANT ALL ON SEQUENCE al_watania.ambers_id_seq TO anon;
GRANT ALL ON SEQUENCE al_watania.ambers_id_seq TO authenticated;
GRANT ALL ON SEQUENCE al_watania.ambers_id_seq TO service_role;
       
   al_watania          postgres    false    299            ,           1259    29691    farm_serial    SEQUENCE     z   CREATE SEQUENCE al_watania.farm_serial
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE al_watania.farm_serial;
    
   al_watania          postgres    false    22            Y           0    0    SEQUENCE farm_serial    ACL     �   GRANT ALL ON SEQUENCE al_watania.farm_serial TO anon;
GRANT ALL ON SEQUENCE al_watania.farm_serial TO authenticated;
GRANT ALL ON SEQUENCE al_watania.farm_serial TO service_role;
       
   al_watania          postgres    false    300            -           1259    29692    farm_serial    SEQUENCE     v   CREATE SEQUENCE public.farm_serial
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.farm_serial;
       public          postgres    false            Z           0    0    SEQUENCE farm_serial    ACL     �   GRANT ALL ON SEQUENCE public.farm_serial TO anon;
GRANT ALL ON SEQUENCE public.farm_serial TO authenticated;
GRANT ALL ON SEQUENCE public.farm_serial TO service_role;
          public          postgres    false    301            .           1259    29693    farms    TABLE     �  CREATE TABLE al_watania.farms (
    id bigint DEFAULT nextval('public.farm_serial'::regclass) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    farm_name text NOT NULL,
    farm_type public.type_of_poultry NOT NULL,
    no_of_ambers bigint NOT NULL,
    farm_start_date date,
    farm_end_date date,
    is_running boolean DEFAULT true NOT NULL,
    farm_supervisor uuid
);
    DROP TABLE al_watania.farms;
    
   al_watania         heap    postgres    false    301    22    1388            [           0    0    TABLE farms    ACL     �   GRANT ALL ON TABLE al_watania.farms TO al_watania_users;
GRANT ALL ON TABLE al_watania.farms TO service_role;
GRANT ALL ON TABLE al_watania.farms TO authenticated;
GRANT ALL ON TABLE al_watania.farms TO anon;
       
   al_watania          postgres    false    302            /           1259    29701 	   inventory    TABLE     �  CREATE TABLE al_watania.inventory (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    farm_id bigint NOT NULL,
    amber_id bigint NOT NULL,
    item_code character varying NOT NULL,
    quantity numeric DEFAULT '0'::numeric,
    small_quantity integer DEFAULT 0,
    initial_quantity numeric DEFAULT '0'::numeric NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT inventory_small_quantity_check CHECK ((small_quantity < 12))
);
 !   DROP TABLE al_watania.inventory;
    
   al_watania         heap    postgres    false    22            \           0    0    TABLE inventory    ACL     �   GRANT ALL ON TABLE al_watania.inventory TO al_watania_users;
GRANT ALL ON TABLE al_watania.inventory TO anon;
GRANT ALL ON TABLE al_watania.inventory TO authenticated;
GRANT ALL ON TABLE al_watania.inventory TO service_role;
       
   al_watania          postgres    false    303            0           1259    29711    inventory_id_seq    SEQUENCE     �   ALTER TABLE al_watania.inventory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME al_watania.inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         
   al_watania          postgres    false    303    22            ]           0    0    SEQUENCE inventory_id_seq    ACL     �   GRANT ALL ON SEQUENCE al_watania.inventory_id_seq TO anon;
GRANT ALL ON SEQUENCE al_watania.inventory_id_seq TO authenticated;
GRANT ALL ON SEQUENCE al_watania.inventory_id_seq TO service_role;
       
   al_watania          postgres    false    304            1           1259    29712    items    TABLE     �   CREATE TABLE al_watania.items (
    id bigint NOT NULL,
    item_code character varying NOT NULL,
    item_name character varying NOT NULL,
    description text
);
    DROP TABLE al_watania.items;
    
   al_watania         heap    postgres    false    22            ^           0    0    TABLE items    ACL     �   GRANT ALL ON TABLE al_watania.items TO al_watania_users;
GRANT ALL ON TABLE al_watania.items TO anon;
GRANT ALL ON TABLE al_watania.items TO authenticated;
GRANT ALL ON TABLE al_watania.items TO service_role;
       
   al_watania          postgres    false    305            2           1259    29717    items_id_seq    SEQUENCE     �   ALTER TABLE al_watania.items ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME al_watania.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         
   al_watania          postgres    false    22    305            _           0    0    SEQUENCE items_id_seq    ACL     �   GRANT ALL ON SEQUENCE al_watania.items_id_seq TO anon;
GRANT ALL ON SEQUENCE al_watania.items_id_seq TO authenticated;
GRANT ALL ON SEQUENCE al_watania.items_id_seq TO service_role;
       
   al_watania          postgres    false    306            3           1259    29718    items_movement_id_seq    SEQUENCE     �   ALTER TABLE al_watania.items_movement ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME al_watania.items_movement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         
   al_watania          postgres    false    296    22            `           0    0    SEQUENCE items_movement_id_seq    ACL     �   GRANT ALL ON SEQUENCE al_watania.items_movement_id_seq TO anon;
GRANT ALL ON SEQUENCE al_watania.items_movement_id_seq TO authenticated;
GRANT ALL ON SEQUENCE al_watania.items_movement_id_seq TO service_role;
       
   al_watania          postgres    false    307            4           1259    29719 
   production    TABLE       CREATE TABLE al_watania.production (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    farm_id bigint NOT NULL,
    amber_id bigint DEFAULT '0'::bigint NOT NULL,
    "prodDate" date NOT NULL,
    incom_feed integer,
    intak_feed numeric,
    "prodTray" bigint,
    "prodCarton" bigint,
    "outTray" bigint,
    "outCarton" bigint,
    "outEggsNote" character varying,
    death bigint,
    remain_feed numeric GENERATED ALWAYS AS (((incom_feed)::numeric - intak_feed)) STORED
);
 "   DROP TABLE al_watania.production;
    
   al_watania         heap    postgres    false    22            a           0    0    TABLE production    ACL     �   GRANT ALL ON TABLE al_watania.production TO al_watania_users;
GRANT ALL ON TABLE al_watania.production TO anon;
GRANT ALL ON TABLE al_watania.production TO authenticated;
GRANT ALL ON TABLE al_watania.production TO service_role;
       
   al_watania          postgres    false    308            5           1259    29727    production_id_seq    SEQUENCE     �   ALTER TABLE al_watania.production ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME al_watania.production_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         
   al_watania          postgres    false    22    308            b           0    0    SEQUENCE production_id_seq    ACL     �   GRANT ALL ON SEQUENCE al_watania.production_id_seq TO anon;
GRANT ALL ON SEQUENCE al_watania.production_id_seq TO authenticated;
GRANT ALL ON SEQUENCE al_watania.production_id_seq TO service_role;
       
   al_watania          postgres    false    309            6           1259    29728    supervisors    TABLE       CREATE TABLE al_watania.supervisors (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    phone_numbers bigint DEFAULT '777207896'::bigint NOT NULL,
    details character varying,
    u_id uuid NOT NULL
);
 #   DROP TABLE al_watania.supervisors;
    
   al_watania         heap    postgres    false    22            c           0    0    TABLE supervisors    ACL     �   GRANT SELECT ON TABLE al_watania.supervisors TO al_watania_users;
GRANT ALL ON TABLE al_watania.supervisors TO anon;
GRANT ALL ON TABLE al_watania.supervisors TO authenticated;
GRANT ALL ON TABLE al_watania.supervisors TO service_role;
       
   al_watania          postgres    false    310            7           1259    29735    supervisors_id_seq    SEQUENCE     �   ALTER TABLE al_watania.supervisors ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME al_watania.supervisors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         
   al_watania          postgres    false    22    310            d           0    0    SEQUENCE supervisors_id_seq    ACL     �   GRANT ALL ON SEQUENCE al_watania.supervisors_id_seq TO anon;
GRANT ALL ON SEQUENCE al_watania.supervisors_id_seq TO authenticated;
GRANT ALL ON SEQUENCE al_watania.supervisors_id_seq TO service_role;
       
   al_watania          postgres    false    311            8           1259    29736    audit_log_entries    TABLE     �   CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);
 #   DROP TABLE auth.audit_log_entries;
       auth         heap    supabase_auth_admin    false    33            e           0    0    TABLE audit_log_entries    COMMENT     R   COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';
          auth          supabase_auth_admin    false    312            f           0    0    TABLE audit_log_entries    ACL     �   GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;
          auth          supabase_auth_admin    false    312            9           1259    29742 
   flow_state    TABLE     �  CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);
    DROP TABLE auth.flow_state;
       auth         heap    supabase_auth_admin    false    33    1367            g           0    0    TABLE flow_state    COMMENT     G   COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';
          auth          supabase_auth_admin    false    313            h           0    0    TABLE flow_state    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;
          auth          supabase_auth_admin    false    313            :           1259    29747 
   identities    TABLE     �  CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);
    DROP TABLE auth.identities;
       auth         heap    supabase_auth_admin    false    33            i           0    0    TABLE identities    COMMENT     U   COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';
          auth          supabase_auth_admin    false    314            j           0    0    COLUMN identities.email    COMMENT     �   COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';
          auth          supabase_auth_admin    false    314            k           0    0    TABLE identities    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;
          auth          supabase_auth_admin    false    314            ;           1259    29754 	   instances    TABLE     �   CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE auth.instances;
       auth         heap    supabase_auth_admin    false    33            l           0    0    TABLE instances    COMMENT     Q   COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';
          auth          supabase_auth_admin    false    315            m           0    0    TABLE instances    ACL     �   GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;
          auth          supabase_auth_admin    false    315            <           1259    29759    mfa_amr_claims    TABLE     �   CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);
     DROP TABLE auth.mfa_amr_claims;
       auth         heap    supabase_auth_admin    false    33            n           0    0    TABLE mfa_amr_claims    COMMENT     ~   COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';
          auth          supabase_auth_admin    false    316            o           0    0    TABLE mfa_amr_claims    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;
          auth          supabase_auth_admin    false    316            =           1259    29764    mfa_challenges    TABLE       CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);
     DROP TABLE auth.mfa_challenges;
       auth         heap    supabase_auth_admin    false    33            p           0    0    TABLE mfa_challenges    COMMENT     _   COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';
          auth          supabase_auth_admin    false    317            q           0    0    TABLE mfa_challenges    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;
          auth          supabase_auth_admin    false    317            >           1259    29769    mfa_factors    TABLE     �  CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);
    DROP TABLE auth.mfa_factors;
       auth         heap    supabase_auth_admin    false    1373    1370    33            r           0    0    TABLE mfa_factors    COMMENT     L   COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';
          auth          supabase_auth_admin    false    318            s           0    0    TABLE mfa_factors    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;
          auth          supabase_auth_admin    false    318            ?           1259    29774    one_time_tokens    TABLE     �  CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);
 !   DROP TABLE auth.one_time_tokens;
       auth         heap    supabase_auth_admin    false    33    1376            t           0    0    TABLE one_time_tokens    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;
          auth          supabase_auth_admin    false    319            @           1259    29782    refresh_tokens    TABLE     8  CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);
     DROP TABLE auth.refresh_tokens;
       auth         heap    supabase_auth_admin    false    33            u           0    0    TABLE refresh_tokens    COMMENT     n   COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';
          auth          supabase_auth_admin    false    320            v           0    0    TABLE refresh_tokens    ACL     �   GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;
          auth          supabase_auth_admin    false    320            A           1259    29787    refresh_tokens_id_seq    SEQUENCE     |   CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE auth.refresh_tokens_id_seq;
       auth          supabase_auth_admin    false    320    33            w           0    0    refresh_tokens_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;
          auth          supabase_auth_admin    false    321            x           0    0    SEQUENCE refresh_tokens_id_seq    ACL     �   GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;
          auth          supabase_auth_admin    false    321            B           1259    29788    saml_providers    TABLE     H  CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);
     DROP TABLE auth.saml_providers;
       auth         heap    supabase_auth_admin    false    33            y           0    0    TABLE saml_providers    COMMENT     ]   COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';
          auth          supabase_auth_admin    false    322            z           0    0    TABLE saml_providers    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;
          auth          supabase_auth_admin    false    322            C           1259    29796    saml_relay_states    TABLE     `  CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);
 #   DROP TABLE auth.saml_relay_states;
       auth         heap    supabase_auth_admin    false    33            {           0    0    TABLE saml_relay_states    COMMENT     �   COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';
          auth          supabase_auth_admin    false    323            |           0    0    TABLE saml_relay_states    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;
          auth          supabase_auth_admin    false    323            D           1259    29802    schema_migrations    TABLE     U   CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);
 #   DROP TABLE auth.schema_migrations;
       auth         heap    supabase_auth_admin    false    33            }           0    0    TABLE schema_migrations    COMMENT     X   COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';
          auth          supabase_auth_admin    false    324            ~           0    0    TABLE schema_migrations    ACL     �   GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;
          auth          supabase_auth_admin    false    324            E           1259    29805    sessions    TABLE     T  CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);
    DROP TABLE auth.sessions;
       auth         heap    supabase_auth_admin    false    33    1364                       0    0    TABLE sessions    COMMENT     U   COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';
          auth          supabase_auth_admin    false    325            �           0    0    COLUMN sessions.not_after    COMMENT     �   COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';
          auth          supabase_auth_admin    false    325            �           0    0    TABLE sessions    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;
          auth          supabase_auth_admin    false    325            F           1259    29810    sso_domains    TABLE       CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);
    DROP TABLE auth.sso_domains;
       auth         heap    supabase_auth_admin    false    33            �           0    0    TABLE sso_domains    COMMENT     t   COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';
          auth          supabase_auth_admin    false    326            �           0    0    TABLE sso_domains    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;
          auth          supabase_auth_admin    false    326            G           1259    29816    sso_providers    TABLE       CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);
    DROP TABLE auth.sso_providers;
       auth         heap    supabase_auth_admin    false    33            �           0    0    TABLE sso_providers    COMMENT     x   COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';
          auth          supabase_auth_admin    false    327            �           0    0     COLUMN sso_providers.resource_id    COMMENT     �   COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';
          auth          supabase_auth_admin    false    327            �           0    0    TABLE sso_providers    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;
          auth          supabase_auth_admin    false    327            H           1259    29822    users    TABLE     4  CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);
    DROP TABLE auth.users;
       auth         heap    supabase_auth_admin    false    33            �           0    0    TABLE users    COMMENT     W   COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';
          auth          supabase_auth_admin    false    328            �           0    0    COLUMN users.is_sso_user    COMMENT     �   COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';
          auth          supabase_auth_admin    false    328            �           0    0    TABLE users    ACL       GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT ON TABLE auth.users TO authenticated;
          auth          supabase_auth_admin    false    328            �           0    0    TABLE pg_stat_statements    ACL     �   GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;
       
   extensions          supabase_admin    false    287            �           0    0    TABLE pg_stat_statements_info    ACL     �   GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;
       
   extensions          supabase_admin    false    286            �           0    0    TABLE decrypted_key    ACL     A   GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    285            �           0    0    TABLE masking_rule    ACL     @   GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    283            �           0    0    TABLE mask_columns    ACL     @   GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    284            I           1259    29837    al_watania_users_info    VIEW     �   CREATE VIEW public.al_watania_users_info AS
 SELECT users.id,
    users.email,
    users.phone,
    users.raw_user_meta_data,
    users.role,
    users.created_at
   FROM auth.users
  WHERE ((users.role)::text = 'al_watania_users'::text);
 (   DROP VIEW public.al_watania_users_info;
       public          postgres    false    328    328    328    328    328    328            �           0    0    TABLE al_watania_users_info    ACL     �   GRANT ALL ON TABLE public.al_watania_users_info TO anon;
GRANT ALL ON TABLE public.al_watania_users_info TO authenticated;
GRANT ALL ON TABLE public.al_watania_users_info TO service_role;
          public          postgres    false    329            J           1259    29841    ambers    TABLE     �   CREATE TABLE public.ambers (
    id bigint NOT NULL,
    quantity bigint,
    age bigint,
    other_details character varying,
    farm_id bigint DEFAULT '5'::bigint NOT NULL,
    amber_id bigint NOT NULL
);
    DROP TABLE public.ambers;
       public         heap    postgres    false            �           0    0    TABLE ambers    COMMENT     @   COMMENT ON TABLE public.ambers IS 'ambers details in the farm';
          public          postgres    false    330            �           0    0    COLUMN ambers.quantity    COMMENT     R   COMMENT ON COLUMN public.ambers.quantity IS 'the number of poultry in the amber';
          public          postgres    false    330            �           0    0    TABLE ambers    ACL     �   GRANT ALL ON TABLE public.ambers TO anon;
GRANT ALL ON TABLE public.ambers TO authenticated;
GRANT ALL ON TABLE public.ambers TO service_role;
          public          postgres    false    330            K           1259    29847    ambers_id_seq    SEQUENCE     �   ALTER TABLE public.ambers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ambers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    330            �           0    0    SEQUENCE ambers_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.ambers_id_seq TO anon;
GRANT ALL ON SEQUENCE public.ambers_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.ambers_id_seq TO service_role;
          public          postgres    false    331            L           1259    29848    farms    TABLE     ^  CREATE TABLE public.farms (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    farm_name text NOT NULL,
    farm_type public.type_of_poultry NOT NULL,
    no_of_ambers bigint NOT NULL,
    farm_start_date date,
    farm_end_date date,
    is_running boolean DEFAULT true NOT NULL,
    farm_supervisor uuid
);
    DROP TABLE public.farms;
       public         heap    postgres    false    1388            �           0    0    TABLE farms    COMMENT     7   COMMENT ON TABLE public.farms IS 'table of all farms';
          public          postgres    false    332            �           0    0    TABLE farms    ACL     �   GRANT ALL ON TABLE public.farms TO anon;
GRANT ALL ON TABLE public.farms TO authenticated;
GRANT ALL ON TABLE public.farms TO service_role;
          public          postgres    false    332            M           1259    29855    farms_id_seq    SEQUENCE     �   ALTER TABLE public.farms ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.farms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    332            �           0    0    SEQUENCE farms_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.farms_id_seq TO anon;
GRANT ALL ON SEQUENCE public.farms_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.farms_id_seq TO service_role;
          public          postgres    false    333            N           1259    29856 	   inventory    TABLE     B  CREATE TABLE public.inventory (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    farm_id bigint DEFAULT '1'::bigint NOT NULL,
    amber_id bigint NOT NULL,
    item_code character varying NOT NULL,
    quantity numeric DEFAULT '0'::numeric,
    small_quantity integer DEFAULT 0,
    initial_quantity numeric DEFAULT '0'::numeric NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT inventory_quantity_check CHECK ((quantity >= (0)::numeric)),
    CONSTRAINT inventory_small_quantity_check CHECK ((small_quantity < 12))
);
    DROP TABLE public.inventory;
       public         heap    postgres    false            �           0    0    TABLE inventory    COMMENT     m   COMMENT ON TABLE public.inventory IS 'table that get as inventory to the items in every ambers in the farm';
          public          postgres    false    334            �           0    0    COLUMN inventory.item_code    COMMENT     U   COMMENT ON COLUMN public.inventory.item_code IS 'code of the item from items table';
          public          postgres    false    334            �           0    0    COLUMN inventory.small_quantity    COMMENT     i   COMMENT ON COLUMN public.inventory.small_quantity IS 'the value of the small qiantity ex cartoon, tray';
          public          postgres    false    334            �           0    0    TABLE inventory    ACL     �   GRANT ALL ON TABLE public.inventory TO anon;
GRANT ALL ON TABLE public.inventory TO authenticated;
GRANT ALL ON TABLE public.inventory TO service_role;
          public          postgres    false    334            O           1259    29868    inventory_id_seq    SEQUENCE     �   ALTER TABLE public.inventory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    334            �           0    0    SEQUENCE inventory_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.inventory_id_seq TO anon;
GRANT ALL ON SEQUENCE public.inventory_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.inventory_id_seq TO service_role;
          public          postgres    false    335            P           1259    29869    items    TABLE     �   CREATE TABLE public.items (
    id bigint NOT NULL,
    item_code character varying NOT NULL,
    item_name character varying NOT NULL,
    description text
);
    DROP TABLE public.items;
       public         heap    postgres    false            �           0    0    TABLE items    COMMENT     V   COMMENT ON TABLE public.items IS 'the items that will be insertd into the inventory';
          public          postgres    false    336            �           0    0    COLUMN items.item_code    COMMENT     N   COMMENT ON COLUMN public.items.item_code IS 'code of the items like 001-001';
          public          postgres    false    336            �           0    0    COLUMN items.description    COMMENT     K   COMMENT ON COLUMN public.items.description IS 'other detailse about item';
          public          postgres    false    336            �           0    0    TABLE items    ACL     �   GRANT ALL ON TABLE public.items TO anon;
GRANT ALL ON TABLE public.items TO authenticated;
GRANT ALL ON TABLE public.items TO service_role;
          public          postgres    false    336            Q           1259    29874    items_id_seq    SEQUENCE     �   ALTER TABLE public.items ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    336            �           0    0    SEQUENCE items_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.items_id_seq TO anon;
GRANT ALL ON SEQUENCE public.items_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.items_id_seq TO service_role;
          public          postgres    false    337            R           1259    29875    items_movement_id_seq    SEQUENCE     �   ALTER TABLE public.items_movement ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.items_movement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    297            �           0    0    SEQUENCE items_movement_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.items_movement_id_seq TO anon;
GRANT ALL ON SEQUENCE public.items_movement_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.items_movement_id_seq TO service_role;
          public          postgres    false    338            S           1259    29876 
   production    TABLE     �  CREATE TABLE public.production (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    farm_id bigint NOT NULL,
    amber_id bigint NOT NULL,
    "prodDate" date NOT NULL,
    incom_feed integer,
    intak_feed numeric,
    "prodTray" bigint,
    "prodCarton" bigint,
    "outTray" bigint,
    "outCarton" bigint,
    "outEggsNote" character varying,
    death bigint,
    remain_egg_tray numeric GENERATED ALWAYS AS (("prodTray" - "outTray")) STORED,
    remain_carton_tray numeric GENERATED ALWAYS AS (("prodCarton" - "outCarton")) STORED,
    remain_feed numeric GENERATED ALWAYS AS (((incom_feed)::numeric - intak_feed)) STORED
);
    DROP TABLE public.production;
       public         heap    postgres    false            �           0    0    TABLE production    COMMENT     J   COMMENT ON TABLE public.production IS 'the daily data in ambers of farm';
          public          postgres    false    339            �           0    0    TABLE production    ACL     �   GRANT ALL ON TABLE public.production TO anon;
GRANT ALL ON TABLE public.production TO authenticated;
GRANT ALL ON TABLE public.production TO service_role;
          public          postgres    false    339            T           1259    29885    production_id_seq    SEQUENCE     �   ALTER TABLE public.production ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.production_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    339            �           0    0    SEQUENCE production_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.production_id_seq TO anon;
GRANT ALL ON SEQUENCE public.production_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.production_id_seq TO service_role;
          public          postgres    false    340            U           1259    29886    supervisors    TABLE     ?  CREATE TABLE public.supervisors (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    phone_numbers bigint DEFAULT '777207896'::bigint NOT NULL,
    details character varying,
    u_id uuid DEFAULT 'eb12d1d3-3fa0-4231-831c-fc21954fd683'::uuid NOT NULL
);
    DROP TABLE public.supervisors;
       public         heap    postgres    false            �           0    0    TABLE supervisors    COMMENT     H   COMMENT ON TABLE public.supervisors IS 'the supervisor table of farms';
          public          postgres    false    341            �           0    0    COLUMN supervisors.u_id    COMMENT     Q   COMMENT ON COLUMN public.supervisors.u_id IS 'the id of the user in auth table';
          public          postgres    false    341            �           0    0    TABLE supervisors    ACL     �   GRANT ALL ON TABLE public.supervisors TO anon;
GRANT ALL ON TABLE public.supervisors TO authenticated;
GRANT ALL ON TABLE public.supervisors TO service_role;
          public          postgres    false    341            V           1259    29894    supervisors_id_seq    SEQUENCE     �   ALTER TABLE public.supervisors ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.supervisors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    341            �           0    0    SEQUENCE supervisors_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.supervisors_id_seq TO anon;
GRANT ALL ON SEQUENCE public.supervisors_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.supervisors_id_seq TO service_role;
          public          postgres    false    342            W           1259    29895    messages    TABLE     w  CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);
    DROP TABLE realtime.messages;
       realtime            supabase_realtime_admin    false    34            �           0    0    TABLE messages    ACL     8  GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;
          realtime          supabase_realtime_admin    false    343            X           1259    29902    schema_migrations    TABLE     y   CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 '   DROP TABLE realtime.schema_migrations;
       realtime         heap    supabase_admin    false    34            �           0    0    TABLE schema_migrations    ACL     �  GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;
          realtime          supabase_admin    false    344            Y           1259    29905    subscription    TABLE     �  CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);
 "   DROP TABLE realtime.subscription;
       realtime         heap    supabase_admin    false    1400    594    1400    34            �           0    0    TABLE subscription    ACL     g  GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;
          realtime          supabase_admin    false    345            Z           1259    29913    subscription_id_seq    SEQUENCE     �   ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            realtime          supabase_admin    false    34    345            �           0    0    SEQUENCE subscription_id_seq    ACL     �  GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;
          realtime          supabase_admin    false    346            [           1259    29914    buckets    TABLE     k  CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);
    DROP TABLE storage.buckets;
       storage         heap    supabase_storage_admin    false    30            �           0    0    COLUMN buckets.owner    COMMENT     X   COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';
          storage          supabase_storage_admin    false    347            �           0    0    TABLE buckets    ACL     �   GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;
          storage          supabase_storage_admin    false    347            \           1259    29923 
   migrations    TABLE     �   CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE storage.migrations;
       storage         heap    supabase_storage_admin    false    30            �           0    0    TABLE migrations    ACL     �   GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;
          storage          supabase_storage_admin    false    348            ]           1259    29927    objects    TABLE     �  CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);
    DROP TABLE storage.objects;
       storage         heap    supabase_storage_admin    false    30            �           0    0    COLUMN objects.owner    COMMENT     X   COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';
          storage          supabase_storage_admin    false    349            �           0    0    TABLE objects    ACL     �   GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;
          storage          supabase_storage_admin    false    349            ^           1259    29937    s3_multipart_uploads    TABLE     j  CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);
 )   DROP TABLE storage.s3_multipart_uploads;
       storage         heap    supabase_storage_admin    false    30            �           0    0    TABLE s3_multipart_uploads    ACL     �   GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads TO postgres;
          storage          supabase_storage_admin    false    350            _           1259    29944    s3_multipart_uploads_parts    TABLE     �  CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 /   DROP TABLE storage.s3_multipart_uploads_parts;
       storage         heap    supabase_storage_admin    false    30            �           0    0     TABLE s3_multipart_uploads_parts    ACL       GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO postgres;
          storage          supabase_storage_admin    false    351            `           1259    29952    hooks    TABLE     �   CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);
 %   DROP TABLE supabase_functions.hooks;
       supabase_functions         heap    supabase_functions_admin    false    26            �           0    0    TABLE hooks    COMMENT     k   COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';
          supabase_functions          supabase_functions_admin    false    352            �           0    0    TABLE hooks    ACL     �   GRANT ALL ON TABLE supabase_functions.hooks TO postgres;
GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;
          supabase_functions          supabase_functions_admin    false    352            a           1259    29958    hooks_id_seq    SEQUENCE     �   CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE supabase_functions.hooks_id_seq;
       supabase_functions          supabase_functions_admin    false    352    26            �           0    0    hooks_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;
          supabase_functions          supabase_functions_admin    false    353            �           0    0    SEQUENCE hooks_id_seq    ACL       GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO postgres;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;
          supabase_functions          supabase_functions_admin    false    353            b           1259    29959 
   migrations    TABLE     �   CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);
 *   DROP TABLE supabase_functions.migrations;
       supabase_functions         heap    supabase_functions_admin    false    26            �           0    0    TABLE migrations    ACL     �   GRANT ALL ON TABLE supabase_functions.migrations TO postgres;
GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;
          supabase_functions          supabase_functions_admin    false    354            !           1259    29472    decrypted_secrets    VIEW     �  CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;
 #   DROP VIEW vault.decrypted_secrets;
       vault          supabase_admin    false    3    17    4    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    19    4    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    19    4    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    19    4    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    19    4    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    19    4    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    19    4    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    19    4    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    3    3    3    17    3    17    17    3    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    3    17    3    17    17    3    17    3    17    17    3    17    3    17    3    17    19    19            �           2604    29965    refresh_tokens id    DEFAULT     r   ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);
 >   ALTER TABLE auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
       auth          supabase_auth_admin    false    321    320            �           2604    29966    hooks id    DEFAULT     |   ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);
 C   ALTER TABLE supabase_functions.hooks ALTER COLUMN id DROP DEFAULT;
       supabase_functions          supabase_functions_admin    false    353    352            p          0    29685    ambers 
   TABLE DATA           Y   COPY al_watania.ambers (id, quantity, age, other_details, farm_id, amber_id) FROM stdin;
 
   al_watania          postgres    false    298   ��      t          0    29693    farms 
   TABLE DATA           �   COPY al_watania.farms (id, created_at, farm_name, farm_type, no_of_ambers, farm_start_date, farm_end_date, is_running, farm_supervisor) FROM stdin;
 
   al_watania          postgres    false    302   ��      u          0    29701 	   inventory 
   TABLE DATA           �   COPY al_watania.inventory (id, created_at, farm_id, amber_id, item_code, quantity, small_quantity, initial_quantity, updated_at) FROM stdin;
 
   al_watania          postgres    false    303   ��      w          0    29712    items 
   TABLE DATA           J   COPY al_watania.items (id, item_code, item_name, description) FROM stdin;
 
   al_watania          postgres    false    305   ��      n          0    29602    items_movement 
   TABLE DATA           �   COPY al_watania.items_movement (id, created_at, farm_id, amber_id, item_code, type_movement, movement_date, quantity, notes) FROM stdin;
 
   al_watania          postgres    false    296   #�      z          0    29719 
   production 
   TABLE DATA           �   COPY al_watania.production (id, created_at, farm_id, amber_id, "prodDate", incom_feed, intak_feed, "prodTray", "prodCarton", "outTray", "outCarton", "outEggsNote", death) FROM stdin;
 
   al_watania          postgres    false    308   ��      |          0    29728    supervisors 
   TABLE DATA           ]   COPY al_watania.supervisors (id, created_at, name, phone_numbers, details, u_id) FROM stdin;
 
   al_watania          postgres    false    310   j       ~          0    29736    audit_log_entries 
   TABLE DATA           [   COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
    auth          supabase_auth_admin    false    312   0                0    29742 
   flow_state 
   TABLE DATA           �   COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
    auth          supabase_auth_admin    false    313   �      �          0    29747 
   identities 
   TABLE DATA           ~   COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
    auth          supabase_auth_admin    false    314   v�      �          0    29754 	   instances 
   TABLE DATA           T   COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    315   ��      �          0    29759    mfa_amr_claims 
   TABLE DATA           e   COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
    auth          supabase_auth_admin    false    316   ��      �          0    29764    mfa_challenges 
   TABLE DATA           |   COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
    auth          supabase_auth_admin    false    317   ��      �          0    29769    mfa_factors 
   TABLE DATA           �   COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
    auth          supabase_auth_admin    false    318   ��      �          0    29774    one_time_tokens 
   TABLE DATA           p   COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    319   �      �          0    29782    refresh_tokens 
   TABLE DATA           |   COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
    auth          supabase_auth_admin    false    320   ��      �          0    29788    saml_providers 
   TABLE DATA           �   COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
    auth          supabase_auth_admin    false    322   ��      �          0    29796    saml_relay_states 
   TABLE DATA           �   COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
    auth          supabase_auth_admin    false    323   �      �          0    29802    schema_migrations 
   TABLE DATA           2   COPY auth.schema_migrations (version) FROM stdin;
    auth          supabase_auth_admin    false    324   6�      �          0    29805    sessions 
   TABLE DATA           �   COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
    auth          supabase_auth_admin    false    325   ��      �          0    29810    sso_domains 
   TABLE DATA           X   COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    326   -�      �          0    29816    sso_providers 
   TABLE DATA           N   COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    327   J�      �          0    29822    users 
   TABLE DATA           O  COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
    auth          supabase_auth_admin    false    328   g�      e          0    29204    key 
   TABLE DATA           �   COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
    pgsodium          supabase_admin    false    280   ��      �          0    29841    ambers 
   TABLE DATA           U   COPY public.ambers (id, quantity, age, other_details, farm_id, amber_id) FROM stdin;
    public          postgres    false    330   ��      �          0    29848    farms 
   TABLE DATA           �   COPY public.farms (id, created_at, farm_name, farm_type, no_of_ambers, farm_start_date, farm_end_date, is_running, farm_supervisor) FROM stdin;
    public          postgres    false    332   �      �          0    29856 	   inventory 
   TABLE DATA           �   COPY public.inventory (id, created_at, farm_id, amber_id, item_code, quantity, small_quantity, initial_quantity, updated_at) FROM stdin;
    public          postgres    false    334   W�      �          0    29869    items 
   TABLE DATA           F   COPY public.items (id, item_code, item_name, description) FROM stdin;
    public          postgres    false    336   ��      o          0    29643    items_movement 
   TABLE DATA           �   COPY public.items_movement (id, created_at, farm_id, amber_id, item_code, type_movement, movement_date, quantity, notes) FROM stdin;
    public          postgres    false    297   ��      �          0    29876 
   production 
   TABLE DATA           �   COPY public.production (id, created_at, farm_id, amber_id, "prodDate", incom_feed, intak_feed, "prodTray", "prodCarton", "outTray", "outCarton", "outEggsNote", death) FROM stdin;
    public          postgres    false    339   ��      �          0    29886    supervisors 
   TABLE DATA           Y   COPY public.supervisors (id, created_at, name, phone_numbers, details, u_id) FROM stdin;
    public          postgres    false    341   �      �          0    29902    schema_migrations 
   TABLE DATA           C   COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
    realtime          supabase_admin    false    344         �          0    29905    subscription 
   TABLE DATA           b   COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
    realtime          supabase_admin    false    345   �      �          0    29914    buckets 
   TABLE DATA           �   COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
    storage          supabase_storage_admin    false    347   �      �          0    29923 
   migrations 
   TABLE DATA           B   COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
    storage          supabase_storage_admin    false    348         �          0    29927    objects 
   TABLE DATA           �   COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
    storage          supabase_storage_admin    false    349   �
      �          0    29937    s3_multipart_uploads 
   TABLE DATA           �   COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
    storage          supabase_storage_admin    false    350   �
      �          0    29944    s3_multipart_uploads_parts 
   TABLE DATA           �   COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
    storage          supabase_storage_admin    false    351   �
      �          0    29952    hooks 
   TABLE DATA           a   COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
    supabase_functions          supabase_functions_admin    false    352         �          0    29959 
   migrations 
   TABLE DATA           F   COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
    supabase_functions          supabase_functions_admin    false    354   ,      g          0    29453    secrets 
   TABLE DATA           f   COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
    vault          supabase_admin    false    288   �      �           0    0    ambers_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('al_watania.ambers_id_seq', 38, true);
       
   al_watania          postgres    false    299            �           0    0    farm_serial    SEQUENCE SET     ?   SELECT pg_catalog.setval('al_watania.farm_serial', 102, true);
       
   al_watania          postgres    false    300            �           0    0    inventory_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('al_watania.inventory_id_seq', 418, true);
       
   al_watania          postgres    false    304            �           0    0    items_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('al_watania.items_id_seq', 1, false);
       
   al_watania          postgres    false    306            �           0    0    items_movement_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('al_watania.items_movement_id_seq', 89, true);
       
   al_watania          postgres    false    307            �           0    0    production_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('al_watania.production_id_seq', 207, true);
       
   al_watania          postgres    false    309            �           0    0    supervisors_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('al_watania.supervisors_id_seq', 19, true);
       
   al_watania          postgres    false    311            �           0    0    refresh_tokens_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 740, true);
          auth          supabase_auth_admin    false    321            �           0    0    key_key_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);
          pgsodium          supabase_admin    false    279            �           0    0    ambers_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ambers_id_seq', 33, true);
          public          postgres    false    331            �           0    0    farm_serial    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.farm_serial', 116, true);
          public          postgres    false    301            �           0    0    farms_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.farms_id_seq', 5, true);
          public          postgres    false    333            �           0    0    inventory_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.inventory_id_seq', 160, true);
          public          postgres    false    335            �           0    0    items_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.items_id_seq', 7, true);
          public          postgres    false    337            �           0    0    items_movement_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.items_movement_id_seq', 202, true);
          public          postgres    false    338            �           0    0    production_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.production_id_seq', 508, true);
          public          postgres    false    340            �           0    0    supervisors_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.supervisors_id_seq', 10, true);
          public          postgres    false    342            �           0    0    subscription_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);
          realtime          supabase_admin    false    346            �           0    0    hooks_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, false);
          supabase_functions          supabase_functions_admin    false    353            �           2606    29968    ambers ambers_id_key 
   CONSTRAINT     Q   ALTER TABLE ONLY al_watania.ambers
    ADD CONSTRAINT ambers_id_key UNIQUE (id);
 B   ALTER TABLE ONLY al_watania.ambers DROP CONSTRAINT ambers_id_key;
    
   al_watania            postgres    false    298            �           2606    29970    ambers ambers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY al_watania.ambers
    ADD CONSTRAINT ambers_pkey PRIMARY KEY (id, farm_id);
 @   ALTER TABLE ONLY al_watania.ambers DROP CONSTRAINT ambers_pkey;
    
   al_watania            postgres    false    298    298            �           2606    29972    ambers farm_amber_id_key 
   CONSTRAINT     d   ALTER TABLE ONLY al_watania.ambers
    ADD CONSTRAINT farm_amber_id_key UNIQUE (farm_id, amber_id);
 F   ALTER TABLE ONLY al_watania.ambers DROP CONSTRAINT farm_amber_id_key;
    
   al_watania            postgres    false    298    298            �           2606    29974    farms farm_name 
   CONSTRAINT     g   ALTER TABLE ONLY al_watania.farms
    ADD CONSTRAINT farm_name UNIQUE (farm_name) INCLUDE (farm_name);
 =   ALTER TABLE ONLY al_watania.farms DROP CONSTRAINT farm_name;
    
   al_watania            postgres    false    302            �           2606    29976    farms farm_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY al_watania.farms
    ADD CONSTRAINT farm_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY al_watania.farms DROP CONSTRAINT farm_pkey;
    
   al_watania            postgres    false    302            �           2606    29978    farms farms_id_key 
   CONSTRAINT     O   ALTER TABLE ONLY al_watania.farms
    ADD CONSTRAINT farms_id_key UNIQUE (id);
 @   ALTER TABLE ONLY al_watania.farms DROP CONSTRAINT farms_id_key;
    
   al_watania            postgres    false    302            �           2606    29980    inventory inventory_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY al_watania.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id, farm_id, amber_id);
 F   ALTER TABLE ONLY al_watania.inventory DROP CONSTRAINT inventory_pkey;
    
   al_watania            postgres    false    303    303    303            �           2606    29982    items items_item_id_key 
   CONSTRAINT     [   ALTER TABLE ONLY al_watania.items
    ADD CONSTRAINT items_item_id_key UNIQUE (item_code);
 E   ALTER TABLE ONLY al_watania.items DROP CONSTRAINT items_item_id_key;
    
   al_watania            postgres    false    305            �           2606    29984 "   items_movement items_movement_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY al_watania.items_movement
    ADD CONSTRAINT items_movement_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY al_watania.items_movement DROP CONSTRAINT items_movement_pkey;
    
   al_watania            postgres    false    296            �           2606    29986    items items_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY al_watania.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id, item_code);
 >   ALTER TABLE ONLY al_watania.items DROP CONSTRAINT items_pkey;
    
   al_watania            postgres    false    305    305            �           2606    33272    production production_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY al_watania.production
    ADD CONSTRAINT production_pkey PRIMARY KEY (farm_id, amber_id, "prodDate", id);
 H   ALTER TABLE ONLY al_watania.production DROP CONSTRAINT production_pkey;
    
   al_watania            postgres    false    308    308    308    308            �           2606    29990    supervisors supervisors_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY al_watania.supervisors
    ADD CONSTRAINT supervisors_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY al_watania.supervisors DROP CONSTRAINT supervisors_pkey;
    
   al_watania            postgres    false    310            �           2606    29992     supervisors supervisors_u_id_key 
   CONSTRAINT     _   ALTER TABLE ONLY al_watania.supervisors
    ADD CONSTRAINT supervisors_u_id_key UNIQUE (u_id);
 N   ALTER TABLE ONLY al_watania.supervisors DROP CONSTRAINT supervisors_u_id_key;
    
   al_watania            postgres    false    310                       2606    29994    mfa_amr_claims amr_id_pk 
   CONSTRAINT     T   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT amr_id_pk;
       auth            supabase_auth_admin    false    316            �           2606    29996 (   audit_log_entries audit_log_entries_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY auth.audit_log_entries DROP CONSTRAINT audit_log_entries_pkey;
       auth            supabase_auth_admin    false    312            �           2606    29998    flow_state flow_state_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY auth.flow_state DROP CONSTRAINT flow_state_pkey;
       auth            supabase_auth_admin    false    313            �           2606    30000    identities identities_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_pkey;
       auth            supabase_auth_admin    false    314            �           2606    30002 1   identities identities_provider_id_provider_unique 
   CONSTRAINT     {   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);
 Y   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_provider_id_provider_unique;
       auth            supabase_auth_admin    false    314    314            �           2606    30004    instances instances_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY auth.instances DROP CONSTRAINT instances_pkey;
       auth            supabase_auth_admin    false    315                       2606    30006 C   mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);
 k   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey;
       auth            supabase_auth_admin    false    316    316                       2606    30008 "   mfa_challenges mfa_challenges_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_pkey;
       auth            supabase_auth_admin    false    317            	           2606    30010 .   mfa_factors mfa_factors_last_challenged_at_key 
   CONSTRAINT     u   ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);
 V   ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_last_challenged_at_key;
       auth            supabase_auth_admin    false    318                       2606    30012    mfa_factors mfa_factors_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_pkey;
       auth            supabase_auth_admin    false    318                       2606    30014 $   one_time_tokens one_time_tokens_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY auth.one_time_tokens DROP CONSTRAINT one_time_tokens_pkey;
       auth            supabase_auth_admin    false    319                       2606    30016 "   refresh_tokens refresh_tokens_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_pkey;
       auth            supabase_auth_admin    false    320                       2606    30018 *   refresh_tokens refresh_tokens_token_unique 
   CONSTRAINT     d   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);
 R   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_token_unique;
       auth            supabase_auth_admin    false    320                       2606    30020 +   saml_providers saml_providers_entity_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);
 S   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_entity_id_key;
       auth            supabase_auth_admin    false    322                        2606    30022 "   saml_providers saml_providers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_pkey;
       auth            supabase_auth_admin    false    322            %           2606    30024 (   saml_relay_states saml_relay_states_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_pkey;
       auth            supabase_auth_admin    false    323            (           2606    30026 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 P   ALTER TABLE ONLY auth.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       auth            supabase_auth_admin    false    324            +           2606    30028    sessions sessions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_pkey;
       auth            supabase_auth_admin    false    325            0           2606    30030    sso_domains sso_domains_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_pkey;
       auth            supabase_auth_admin    false    326            3           2606    30032     sso_providers sso_providers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY auth.sso_providers DROP CONSTRAINT sso_providers_pkey;
       auth            supabase_auth_admin    false    327            ?           2606    30034    users users_phone_key 
   CONSTRAINT     O   ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 =   ALTER TABLE ONLY auth.users DROP CONSTRAINT users_phone_key;
       auth            supabase_auth_admin    false    328            A           2606    30036    users users_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY auth.users DROP CONSTRAINT users_pkey;
       auth            supabase_auth_admin    false    328            C           2606    30038    ambers ambers_id_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.ambers
    ADD CONSTRAINT ambers_id_key UNIQUE (id);
 >   ALTER TABLE ONLY public.ambers DROP CONSTRAINT ambers_id_key;
       public            postgres    false    330            E           2606    33247    ambers ambers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.ambers
    ADD CONSTRAINT ambers_pkey PRIMARY KEY (farm_id, amber_id);
 <   ALTER TABLE ONLY public.ambers DROP CONSTRAINT ambers_pkey;
       public            postgres    false    330    330            G           2606    30042    ambers farm_amber_id_key 
   CONSTRAINT     `   ALTER TABLE ONLY public.ambers
    ADD CONSTRAINT farm_amber_id_key UNIQUE (farm_id, amber_id);
 B   ALTER TABLE ONLY public.ambers DROP CONSTRAINT farm_amber_id_key;
       public            postgres    false    330    330            I           2606    30044    farms farms_farm_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_farm_name_key UNIQUE (farm_name);
 C   ALTER TABLE ONLY public.farms DROP CONSTRAINT farms_farm_name_key;
       public            postgres    false    332            K           2606    30046    farms farms_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.farms DROP CONSTRAINT farms_pkey;
       public            postgres    false    332            M           2606    30048    inventory inventory_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id, amber_id);
 B   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_pkey;
       public            postgres    false    334    334            O           2606    30050    items items_item_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_item_id_key UNIQUE (item_code);
 A   ALTER TABLE ONLY public.items DROP CONSTRAINT items_item_id_key;
       public            postgres    false    336            �           2606    30052 "   items_movement items_movement_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.items_movement
    ADD CONSTRAINT items_movement_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.items_movement DROP CONSTRAINT items_movement_pkey;
       public            postgres    false    297            Q           2606    30054    items items_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id, item_code);
 :   ALTER TABLE ONLY public.items DROP CONSTRAINT items_pkey;
       public            postgres    false    336    336            S           2606    30058    supervisors supervisors_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.supervisors
    ADD CONSTRAINT supervisors_id_key UNIQUE (id);
 H   ALTER TABLE ONLY public.supervisors DROP CONSTRAINT supervisors_id_key;
       public            postgres    false    341            U           2606    30060    supervisors supervisors_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.supervisors
    ADD CONSTRAINT supervisors_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.supervisors DROP CONSTRAINT supervisors_pkey;
       public            postgres    false    341            W           2606    30062     supervisors supervisors_u_id_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.supervisors
    ADD CONSTRAINT supervisors_u_id_key UNIQUE (u_id);
 J   ALTER TABLE ONLY public.supervisors DROP CONSTRAINT supervisors_u_id_key;
       public            postgres    false    341            Y           2606    30064    messages messages_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);
 B   ALTER TABLE ONLY realtime.messages DROP CONSTRAINT messages_pkey;
       realtime            supabase_realtime_admin    false    343    343            ^           2606    30066    subscription pk_subscription 
   CONSTRAINT     \   ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);
 H   ALTER TABLE ONLY realtime.subscription DROP CONSTRAINT pk_subscription;
       realtime            supabase_admin    false    345            [           2606    30068 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 T   ALTER TABLE ONLY realtime.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       realtime            supabase_admin    false    344            b           2606    30070    buckets buckets_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY storage.buckets DROP CONSTRAINT buckets_pkey;
       storage            supabase_storage_admin    false    347            d           2606    30072    migrations migrations_name_key 
   CONSTRAINT     Z   ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);
 I   ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_name_key;
       storage            supabase_storage_admin    false    348            f           2606    30074    migrations migrations_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_pkey;
       storage            supabase_storage_admin    false    348            k           2606    30076    objects objects_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY storage.objects DROP CONSTRAINT objects_pkey;
       storage            supabase_storage_admin    false    349            p           2606    30078 :   s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);
 e   ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_pkey;
       storage            supabase_storage_admin    false    351            n           2606    30080 .   s3_multipart_uploads s3_multipart_uploads_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY storage.s3_multipart_uploads DROP CONSTRAINT s3_multipart_uploads_pkey;
       storage            supabase_storage_admin    false    350            r           2606    30082    hooks hooks_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY supabase_functions.hooks DROP CONSTRAINT hooks_pkey;
       supabase_functions            supabase_functions_admin    false    352            v           2606    30084    migrations migrations_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);
 P   ALTER TABLE ONLY supabase_functions.migrations DROP CONSTRAINT migrations_pkey;
       supabase_functions            supabase_functions_admin    false    354            �           1259    30085    audit_logs_instance_id_idx    INDEX     ]   CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);
 ,   DROP INDEX auth.audit_logs_instance_id_idx;
       auth            supabase_auth_admin    false    312            5           1259    30086    confirmation_token_idx    INDEX     �   CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);
 (   DROP INDEX auth.confirmation_token_idx;
       auth            supabase_auth_admin    false    328    328            6           1259    30087    email_change_token_current_idx    INDEX     �   CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);
 0   DROP INDEX auth.email_change_token_current_idx;
       auth            supabase_auth_admin    false    328    328            7           1259    30088    email_change_token_new_idx    INDEX     �   CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);
 ,   DROP INDEX auth.email_change_token_new_idx;
       auth            supabase_auth_admin    false    328    328                       1259    30089    factor_id_created_at_idx    INDEX     ]   CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);
 *   DROP INDEX auth.factor_id_created_at_idx;
       auth            supabase_auth_admin    false    318    318            �           1259    30090    flow_state_created_at_idx    INDEX     Y   CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);
 +   DROP INDEX auth.flow_state_created_at_idx;
       auth            supabase_auth_admin    false    313            �           1259    30091    identities_email_idx    INDEX     [   CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);
 &   DROP INDEX auth.identities_email_idx;
       auth            supabase_auth_admin    false    314            �           0    0    INDEX identities_email_idx    COMMENT     c   COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';
          auth          supabase_auth_admin    false    4088            �           1259    30092    identities_user_id_idx    INDEX     N   CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);
 (   DROP INDEX auth.identities_user_id_idx;
       auth            supabase_auth_admin    false    314            �           1259    30093    idx_auth_code    INDEX     G   CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);
    DROP INDEX auth.idx_auth_code;
       auth            supabase_auth_admin    false    313            �           1259    30094    idx_user_id_auth_method    INDEX     f   CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);
 )   DROP INDEX auth.idx_user_id_auth_method;
       auth            supabase_auth_admin    false    313    313                       1259    30095    mfa_challenge_created_at_idx    INDEX     `   CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);
 .   DROP INDEX auth.mfa_challenge_created_at_idx;
       auth            supabase_auth_admin    false    317                       1259    30096 %   mfa_factors_user_friendly_name_unique    INDEX     �   CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);
 7   DROP INDEX auth.mfa_factors_user_friendly_name_unique;
       auth            supabase_auth_admin    false    318    318    318                       1259    30097    mfa_factors_user_id_idx    INDEX     P   CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);
 )   DROP INDEX auth.mfa_factors_user_id_idx;
       auth            supabase_auth_admin    false    318                       1259    30098 #   one_time_tokens_relates_to_hash_idx    INDEX     b   CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);
 5   DROP INDEX auth.one_time_tokens_relates_to_hash_idx;
       auth            supabase_auth_admin    false    319                       1259    30099 #   one_time_tokens_token_hash_hash_idx    INDEX     b   CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);
 5   DROP INDEX auth.one_time_tokens_token_hash_hash_idx;
       auth            supabase_auth_admin    false    319                       1259    30100 &   one_time_tokens_user_id_token_type_key    INDEX     v   CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);
 8   DROP INDEX auth.one_time_tokens_user_id_token_type_key;
       auth            supabase_auth_admin    false    319    319            8           1259    30101    reauthentication_token_idx    INDEX     �   CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);
 ,   DROP INDEX auth.reauthentication_token_idx;
       auth            supabase_auth_admin    false    328    328            9           1259    30102    recovery_token_idx    INDEX     �   CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);
 $   DROP INDEX auth.recovery_token_idx;
       auth            supabase_auth_admin    false    328    328                       1259    30103    refresh_tokens_instance_id_idx    INDEX     ^   CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);
 0   DROP INDEX auth.refresh_tokens_instance_id_idx;
       auth            supabase_auth_admin    false    320                       1259    30104 &   refresh_tokens_instance_id_user_id_idx    INDEX     o   CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);
 8   DROP INDEX auth.refresh_tokens_instance_id_user_id_idx;
       auth            supabase_auth_admin    false    320    320                       1259    30105    refresh_tokens_parent_idx    INDEX     T   CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);
 +   DROP INDEX auth.refresh_tokens_parent_idx;
       auth            supabase_auth_admin    false    320                       1259    30106 %   refresh_tokens_session_id_revoked_idx    INDEX     m   CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);
 7   DROP INDEX auth.refresh_tokens_session_id_revoked_idx;
       auth            supabase_auth_admin    false    320    320                       1259    30107    refresh_tokens_updated_at_idx    INDEX     a   CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);
 /   DROP INDEX auth.refresh_tokens_updated_at_idx;
       auth            supabase_auth_admin    false    320            !           1259    30108 "   saml_providers_sso_provider_id_idx    INDEX     f   CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);
 4   DROP INDEX auth.saml_providers_sso_provider_id_idx;
       auth            supabase_auth_admin    false    322            "           1259    30109     saml_relay_states_created_at_idx    INDEX     g   CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);
 2   DROP INDEX auth.saml_relay_states_created_at_idx;
       auth            supabase_auth_admin    false    323            #           1259    30110    saml_relay_states_for_email_idx    INDEX     `   CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);
 1   DROP INDEX auth.saml_relay_states_for_email_idx;
       auth            supabase_auth_admin    false    323            &           1259    30111 %   saml_relay_states_sso_provider_id_idx    INDEX     l   CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);
 7   DROP INDEX auth.saml_relay_states_sso_provider_id_idx;
       auth            supabase_auth_admin    false    323            )           1259    30112    sessions_not_after_idx    INDEX     S   CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);
 (   DROP INDEX auth.sessions_not_after_idx;
       auth            supabase_auth_admin    false    325            ,           1259    30113    sessions_user_id_idx    INDEX     J   CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);
 &   DROP INDEX auth.sessions_user_id_idx;
       auth            supabase_auth_admin    false    325            .           1259    30114    sso_domains_domain_idx    INDEX     \   CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));
 (   DROP INDEX auth.sso_domains_domain_idx;
       auth            supabase_auth_admin    false    326    326            1           1259    30115    sso_domains_sso_provider_id_idx    INDEX     `   CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);
 1   DROP INDEX auth.sso_domains_sso_provider_id_idx;
       auth            supabase_auth_admin    false    326            4           1259    30116    sso_providers_resource_id_idx    INDEX     j   CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));
 /   DROP INDEX auth.sso_providers_resource_id_idx;
       auth            supabase_auth_admin    false    327    327                       1259    30117    unique_phone_factor_per_user    INDEX     c   CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);
 .   DROP INDEX auth.unique_phone_factor_per_user;
       auth            supabase_auth_admin    false    318    318            -           1259    30118    user_id_created_at_idx    INDEX     X   CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);
 (   DROP INDEX auth.user_id_created_at_idx;
       auth            supabase_auth_admin    false    325    325            :           1259    30119    users_email_partial_key    INDEX     k   CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);
 )   DROP INDEX auth.users_email_partial_key;
       auth            supabase_auth_admin    false    328    328            �           0    0    INDEX users_email_partial_key    COMMENT     }   COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';
          auth          supabase_auth_admin    false    4154            ;           1259    30120    users_instance_id_email_idx    INDEX     h   CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));
 -   DROP INDEX auth.users_instance_id_email_idx;
       auth            supabase_auth_admin    false    328    328            <           1259    30121    users_instance_id_idx    INDEX     L   CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);
 '   DROP INDEX auth.users_instance_id_idx;
       auth            supabase_auth_admin    false    328            =           1259    30122    users_is_anonymous_idx    INDEX     N   CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);
 (   DROP INDEX auth.users_is_anonymous_idx;
       auth            supabase_auth_admin    false    328            \           1259    32636    ix_realtime_subscription_entity    INDEX     \   CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);
 5   DROP INDEX realtime.ix_realtime_subscription_entity;
       realtime            supabase_admin    false    345            _           1259    30124 /   subscription_subscription_id_entity_filters_key    INDEX     �   CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);
 E   DROP INDEX realtime.subscription_subscription_id_entity_filters_key;
       realtime            supabase_admin    false    345    345    345            `           1259    30125    bname    INDEX     A   CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);
    DROP INDEX storage.bname;
       storage            supabase_storage_admin    false    347            g           1259    30126    bucketid_objname    INDEX     W   CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);
 %   DROP INDEX storage.bucketid_objname;
       storage            supabase_storage_admin    false    349    349            l           1259    30127    idx_multipart_uploads_list    INDEX     r   CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);
 /   DROP INDEX storage.idx_multipart_uploads_list;
       storage            supabase_storage_admin    false    350    350    350            h           1259    30128    idx_objects_bucket_id_name    INDEX     f   CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");
 /   DROP INDEX storage.idx_objects_bucket_id_name;
       storage            supabase_storage_admin    false    349    349            i           1259    30129    name_prefix_search    INDEX     X   CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);
 '   DROP INDEX storage.name_prefix_search;
       storage            supabase_storage_admin    false    349            s           1259    30130 .   supabase_functions_hooks_h_table_id_h_name_idx    INDEX     �   CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);
 N   DROP INDEX supabase_functions.supabase_functions_hooks_h_table_id_h_name_idx;
       supabase_functions            supabase_functions_admin    false    352    352            t           1259    30131 '   supabase_functions_hooks_request_id_idx    INDEX     k   CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);
 G   DROP INDEX supabase_functions.supabase_functions_hooks_request_id_idx;
       supabase_functions            supabase_functions_admin    false    352            �           2620    30132    farms delete_on_farms_delete    TRIGGER     �   CREATE TRIGGER delete_on_farms_delete BEFORE DELETE ON al_watania.farms FOR EACH ROW EXECUTE FUNCTION al_watania.delete_related_farm_data();
 9   DROP TRIGGER delete_on_farms_delete ON al_watania.farms;
    
   al_watania          postgres    false    535    302            �           2620    30133 #   farms delete_on_public_farms_delete    TRIGGER     �   CREATE TRIGGER delete_on_public_farms_delete BEFORE DELETE ON al_watania.farms FOR EACH ROW EXECUTE FUNCTION public.delete_related_farm_data();
 @   DROP TRIGGER delete_on_public_farms_delete ON al_watania.farms;
    
   al_watania          postgres    false    624    302            �           2620    30134 )   farms delete_supervisors_when_delete_farm    TRIGGER     �   CREATE TRIGGER delete_supervisors_when_delete_farm BEFORE DELETE ON al_watania.farms FOR EACH STATEMENT EXECUTE FUNCTION al_watania.update_supervisors_table_after_delete_farm();
 F   DROP TRIGGER delete_supervisors_when_delete_farm ON al_watania.farms;
    
   al_watania          postgres    false    302    547            �           2620    30135    farms insert_ambers    TRIGGER     �   CREATE TRIGGER insert_ambers AFTER INSERT OR UPDATE ON al_watania.farms FOR EACH ROW EXECUTE FUNCTION al_watania.create_ambers();
 0   DROP TRIGGER insert_ambers ON al_watania.farms;
    
   al_watania          postgres    false    603    302            �           2620    30136    farms insert_inventory    TRIGGER     �   CREATE TRIGGER insert_inventory AFTER INSERT OR UPDATE ON al_watania.farms FOR EACH ROW EXECUTE FUNCTION al_watania.create_inventory();
 3   DROP TRIGGER insert_inventory ON al_watania.farms;
    
   al_watania          postgres    false    536    302            �           2620    30137 '   farms insert_supervisor_details_of_farm    TRIGGER     �   CREATE TRIGGER insert_supervisor_details_of_farm AFTER INSERT ON al_watania.farms FOR EACH ROW EXECUTE FUNCTION al_watania.insert_to_supervisors_table_after_add_farm();
 D   DROP TRIGGER insert_supervisor_details_of_farm ON al_watania.farms;
    
   al_watania          postgres    false    302    541            �           2620    30138    production on_add_production    TRIGGER     �   CREATE TRIGGER on_add_production AFTER INSERT ON al_watania.production FOR EACH ROW EXECUTE FUNCTION al_watania.calculate_inventory_quantity();
 9   DROP TRIGGER on_add_production ON al_watania.production;
    
   al_watania          postgres    false    534    308            �           2620    30139    production on_update_production    TRIGGER     �   CREATE TRIGGER on_update_production BEFORE UPDATE ON al_watania.production FOR EACH ROW EXECUTE FUNCTION al_watania.update_inventory_quantity_after_update_production();
 <   DROP TRIGGER on_update_production ON al_watania.production;
    
   al_watania          postgres    false    308    609            �           2620    30140 ;   items_movement update_inventory_based_items_movemnt_trigger    TRIGGER     �   CREATE TRIGGER update_inventory_based_items_movemnt_trigger AFTER INSERT ON al_watania.items_movement FOR EACH ROW EXECUTE FUNCTION al_watania.update_inventory_based_items_movement();
 X   DROP TRIGGER update_inventory_based_items_movemnt_trigger ON al_watania.items_movement;
    
   al_watania          postgres    false    296    608            �           2620    52327    users change_user_role_trigger    TRIGGER     �   CREATE TRIGGER change_user_role_trigger AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION al_watania.change_user_role();
 5   DROP TRIGGER change_user_role_trigger ON auth.users;
       auth          supabase_auth_admin    false    412    328            �           2620    30141    farms insert_ambers    TRIGGER     z   CREATE TRIGGER insert_ambers AFTER INSERT OR UPDATE ON public.farms FOR EACH ROW EXECUTE FUNCTION public.create_ambers();
 ,   DROP TRIGGER insert_ambers ON public.farms;
       public          postgres    false    332    557            �           2620    30142    farms insert_inventory    TRIGGER     �   CREATE TRIGGER insert_inventory AFTER INSERT OR UPDATE ON public.farms FOR EACH ROW EXECUTE FUNCTION public.create_inventory();
 /   DROP TRIGGER insert_inventory ON public.farms;
       public          postgres    false    332    554            �           2620    30143    production on_add_production    TRIGGER     �   CREATE TRIGGER on_add_production AFTER INSERT ON public.production FOR EACH ROW EXECUTE FUNCTION public.calculate_inventory_quantity();
 5   DROP TRIGGER on_add_production ON public.production;
       public          postgres    false    339    556            �           2620    30144    production on_update_production    TRIGGER     �   CREATE TRIGGER on_update_production BEFORE UPDATE ON public.production FOR EACH ROW EXECUTE FUNCTION public.update_inventory_quantity_after_update_production();
 8   DROP TRIGGER on_update_production ON public.production;
       public          postgres    false    339    562            �           2620    30145 ;   items_movement update_inventory_based_items_movemnt_trigger    TRIGGER     �   CREATE TRIGGER update_inventory_based_items_movemnt_trigger AFTER INSERT ON public.items_movement FOR EACH ROW EXECUTE FUNCTION public.update_inventory_based_items_movement();
 T   DROP TRIGGER update_inventory_based_items_movemnt_trigger ON public.items_movement;
       public          postgres    false    297    631            �           2620    30146    subscription tr_check_filters    TRIGGER     �   CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();
 8   DROP TRIGGER tr_check_filters ON realtime.subscription;
       realtime          supabase_admin    false    643    345            �           2620    30147 !   objects update_objects_updated_at    TRIGGER     �   CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();
 ;   DROP TRIGGER update_objects_updated_at ON storage.objects;
       storage          supabase_storage_admin    false    599    349            {           2606    30148    ambers ambers_farm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY al_watania.ambers
    ADD CONSTRAINT ambers_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES al_watania.farms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY al_watania.ambers DROP CONSTRAINT ambers_farm_id_fkey;
    
   al_watania          postgres    false    298    4065    302            |           2606    30153    farms farm_supervisors    FK CONSTRAINT     �   ALTER TABLE ONLY al_watania.farms
    ADD CONSTRAINT farm_supervisors FOREIGN KEY (farm_supervisor) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE SET DEFAULT;
 D   ALTER TABLE ONLY al_watania.farms DROP CONSTRAINT farm_supervisors;
    
   al_watania          postgres    false    302    4161    328            }           2606    30158     farms farms_farm_supervisor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY al_watania.farms
    ADD CONSTRAINT farms_farm_supervisor_fkey FOREIGN KEY (farm_supervisor) REFERENCES al_watania.supervisors(u_id);
 N   ALTER TABLE ONLY al_watania.farms DROP CONSTRAINT farms_farm_supervisor_fkey;
    
   al_watania          postgres    false    302    4079    310            ~           2606    30163     inventory inventory_farm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY al_watania.inventory
    ADD CONSTRAINT inventory_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES al_watania.farms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY al_watania.inventory DROP CONSTRAINT inventory_farm_id_fkey;
    
   al_watania          postgres    false    4065    302    303            w           2606    30168 *   items_movement items_movement_farm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY al_watania.items_movement
    ADD CONSTRAINT items_movement_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES al_watania.farms(id) ON UPDATE CASCADE ON DELETE SET DEFAULT;
 X   ALTER TABLE ONLY al_watania.items_movement DROP CONSTRAINT items_movement_farm_id_fkey;
    
   al_watania          postgres    false    302    296    4065            x           2606    30173 ,   items_movement items_movement_item_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY al_watania.items_movement
    ADD CONSTRAINT items_movement_item_code_fkey FOREIGN KEY (item_code) REFERENCES al_watania.items(item_code);
 Z   ALTER TABLE ONLY al_watania.items_movement DROP CONSTRAINT items_movement_item_code_fkey;
    
   al_watania          postgres    false    296    305    4071                       2606    40946 "   production production_farm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY al_watania.production
    ADD CONSTRAINT production_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES al_watania.farms(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 P   ALTER TABLE ONLY al_watania.production DROP CONSTRAINT production_farm_id_fkey;
    
   al_watania          postgres    false    4065    302    308            �           2606    30178 !   supervisors supervisors_u_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY al_watania.supervisors
    ADD CONSTRAINT supervisors_u_id_fkey FOREIGN KEY (u_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY al_watania.supervisors DROP CONSTRAINT supervisors_u_id_fkey;
    
   al_watania          postgres    false    328    4161    310            �           2606    30183 "   identities identities_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_user_id_fkey;
       auth          supabase_auth_admin    false    328    4161    314            �           2606    30188 -   mfa_amr_claims mfa_amr_claims_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_fkey;
       auth          supabase_auth_admin    false    316    4139    325            �           2606    30193 1   mfa_challenges mfa_challenges_auth_factor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_auth_factor_id_fkey;
       auth          supabase_auth_admin    false    4107    317    318            �           2606    30198 $   mfa_factors mfa_factors_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_user_id_fkey;
       auth          supabase_auth_admin    false    318    328    4161            �           2606    30203 ,   one_time_tokens one_time_tokens_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY auth.one_time_tokens DROP CONSTRAINT one_time_tokens_user_id_fkey;
       auth          supabase_auth_admin    false    4161    328    319            �           2606    30208 -   refresh_tokens refresh_tokens_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_session_id_fkey;
       auth          supabase_auth_admin    false    4139    320    325            �           2606    30213 2   saml_providers saml_providers_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    322    4147    327            �           2606    30218 6   saml_relay_states saml_relay_states_flow_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_flow_state_id_fkey;
       auth          supabase_auth_admin    false    323    313    4085            �           2606    30223 8   saml_relay_states saml_relay_states_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    4147    327    323            �           2606    30228    sessions sessions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_user_id_fkey;
       auth          supabase_auth_admin    false    328    4161    325            �           2606    30233 ,   sso_domains sso_domains_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    4147    326    327            �           2606    30238    ambers ambers_farm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ambers
    ADD CONSTRAINT ambers_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES public.farms(id) ON UPDATE CASCADE ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.ambers DROP CONSTRAINT ambers_farm_id_fkey;
       public          postgres    false    4171    332    330            �           2606    30243     farms farms_farm_supervisor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_farm_supervisor_fkey FOREIGN KEY (farm_supervisor) REFERENCES public.supervisors(u_id);
 J   ALTER TABLE ONLY public.farms DROP CONSTRAINT farms_farm_supervisor_fkey;
       public          postgres    false    4183    332    341            �           2606    30248     inventory inventory_farm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES public.farms(id) ON UPDATE CASCADE ON DELETE SET DEFAULT;
 J   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_farm_id_fkey;
       public          postgres    false    4171    332    334            y           2606    30253 *   items_movement items_movement_farm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.items_movement
    ADD CONSTRAINT items_movement_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES public.farms(id) ON UPDATE CASCADE ON DELETE SET DEFAULT;
 T   ALTER TABLE ONLY public.items_movement DROP CONSTRAINT items_movement_farm_id_fkey;
       public          postgres    false    297    332    4171            z           2606    30258 ,   items_movement items_movement_item_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.items_movement
    ADD CONSTRAINT items_movement_item_code_fkey FOREIGN KEY (item_code) REFERENCES public.items(item_code);
 V   ALTER TABLE ONLY public.items_movement DROP CONSTRAINT items_movement_item_code_fkey;
       public          postgres    false    336    4175    297            �           2606    30263 "   production production_farm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES public.farms(id) ON UPDATE CASCADE ON DELETE SET DEFAULT;
 L   ALTER TABLE ONLY public.production DROP CONSTRAINT production_farm_id_fkey;
       public          postgres    false    4171    332    339            �           2606    30268 !   supervisors supervisors_u_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.supervisors
    ADD CONSTRAINT supervisors_u_id_fkey FOREIGN KEY (u_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.supervisors DROP CONSTRAINT supervisors_u_id_fkey;
       public          postgres    false    341    328    4161            �           2606    30273    objects objects_bucketId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);
 J   ALTER TABLE ONLY storage.objects DROP CONSTRAINT "objects_bucketId_fkey";
       storage          supabase_storage_admin    false    349    4194    347            �           2606    30278 8   s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);
 c   ALTER TABLE ONLY storage.s3_multipart_uploads DROP CONSTRAINT s3_multipart_uploads_bucket_id_fkey;
       storage          supabase_storage_admin    false    347    350    4194            �           2606    30283 D   s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);
 o   ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey;
       storage          supabase_storage_admin    false    4194    351    347            �           2606    30288 D   s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;
 o   ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey;
       storage          supabase_storage_admin    false    350    351    4206            d           3256    49907 D   inventory Allow delete access to inventory for al_watania_users only    POLICY     �   CREATE POLICY "Allow delete access to inventory for al_watania_users only" ON al_watania.inventory FOR DELETE TO al_watania_users USING ((( SELECT auth.uid() AS uid) IS NOT NULL));
 b   DROP POLICY "Allow delete access to inventory for al_watania_users only" ON al_watania.inventory;
    
   al_watania          postgres    false    545    303            b           3256    49905 D   inventory Allow insert access to inventory for al_watania_users only    POLICY     �   CREATE POLICY "Allow insert access to inventory for al_watania_users only" ON al_watania.inventory FOR INSERT TO al_watania_users WITH CHECK (true);
 b   DROP POLICY "Allow insert access to inventory for al_watania_users only" ON al_watania.inventory;
    
   al_watania          postgres    false    303            a           3256    49904 I   inventory Allow select access to inventory for al_watania_users and authe    POLICY     �   CREATE POLICY "Allow select access to inventory for al_watania_users and authe" ON al_watania.inventory FOR SELECT TO authenticated, al_watania_users USING ((( SELECT auth.uid() AS uid) IS NOT NULL));
 g   DROP POLICY "Allow select access to inventory for al_watania_users and authe" ON al_watania.inventory;
    
   al_watania          postgres    false    303    545            c           3256    49906 D   inventory Allow update access to inventory for al_watania_users only    POLICY     �   CREATE POLICY "Allow update access to inventory for al_watania_users only" ON al_watania.inventory FOR UPDATE TO al_watania_users USING ((( SELECT auth.uid() AS uid) IS NOT NULL)) WITH CHECK (true);
 b   DROP POLICY "Allow update access to inventory for al_watania_users only" ON al_watania.inventory;
    
   al_watania          postgres    false    303    545            V           3256    30293 4   ambers Enable insert for al_watania_users users only    POLICY     �   CREATE POLICY "Enable insert for al_watania_users users only" ON al_watania.ambers TO authenticated, al_watania_users USING ((( SELECT auth.role() AS role) = 'authenticated'::text)) WITH CHECK (true);
 R   DROP POLICY "Enable insert for al_watania_users users only" ON al_watania.ambers;
    
   al_watania          postgres    false    549    298            W           3256    30294 5   items Enable read access for items table to all users    POLICY     �   CREATE POLICY "Enable read access for items table to all users" ON al_watania.items FOR SELECT TO al_watania_users USING (true);
 S   DROP POLICY "Enable read access for items table to all users" ON al_watania.items;
    
   al_watania          postgres    false    305            X           3256    30295    farms allow select on farms    POLICY     �   CREATE POLICY "allow select on farms" ON al_watania.farms FOR SELECT TO al_watania_users USING (((( SELECT auth.jwt() AS jwt) ->> 'role'::text) = 'al_watania_users'::text));
 9   DROP POLICY "allow select on farms" ON al_watania.farms;
    
   al_watania          postgres    false    302    548            Z           3256    30296 E   supervisors allow_insert_to_al_watania_supervisor_to_al_watania_admin    POLICY     
  CREATE POLICY allow_insert_to_al_watania_supervisor_to_al_watania_admin ON al_watania.supervisors TO postgres, authenticated, anon, al_watania_users USING (((( SELECT auth.role() AS role) = 'authenticated'::text) OR (( SELECT auth.role() AS role) = 'anon'::text)));
 a   DROP POLICY allow_insert_to_al_watania_supervisor_to_al_watania_admin ON al_watania.supervisors;
    
   al_watania          postgres    false    310    549            <           0    29701 	   inventory    ROW SECURITY     ;   ALTER TABLE al_watania.inventory ENABLE ROW LEVEL SECURITY;       
   al_watania          postgres    false    303            =           0    29712    items    ROW SECURITY     7   ALTER TABLE al_watania.items ENABLE ROW LEVEL SECURITY;       
   al_watania          postgres    false    305            >           0    29719 
   production    ROW SECURITY     <   ALTER TABLE al_watania.production ENABLE ROW LEVEL SECURITY;       
   al_watania          postgres    false    308            Y           3256    30297 2   production restrict access to al_watania_user only    POLICY     �  CREATE POLICY "restrict access to al_watania_user only" ON al_watania.production TO authenticated, anon, service_role, al_watania_users, supabase_admin USING (((( SELECT auth.role() AS role) = 'al_watania_users'::text) OR (( SELECT auth.role() AS role) = 'supabase_admin'::text) OR (( SELECT auth.role() AS role) = 'authenticated'::text) OR (( SELECT auth.role() AS role) = 'service_role'::text) OR (( SELECT auth.role() AS role) = 'anon'::text))) WITH CHECK (true);
 P   DROP POLICY "restrict access to al_watania_user only" ON al_watania.production;
    
   al_watania          postgres    false    549    308            `           3256    30298 E   inventory restrict access to inventory table to al_watania_users only    POLICY     �   CREATE POLICY "restrict access to inventory table to al_watania_users only" ON al_watania.inventory TO authenticated, al_watania_users USING ((( SELECT auth.role() AS role) = 'al_watania_users'::text)) WITH CHECK (true);
 c   DROP POLICY "restrict access to inventory table to al_watania_users only" ON al_watania.inventory;
    
   al_watania          postgres    false    549    303            _           3256    30299 N   items_movement restrict access to items_movement table to al_watania_users onl    POLICY     #  CREATE POLICY "restrict access to items_movement table to al_watania_users onl" ON al_watania.items_movement TO authenticated, al_watania_users USING (((( SELECT auth.role() AS role) = 'al_watania_users'::text) OR (( SELECT auth.role() AS role) = 'authenticated'::text))) WITH CHECK (true);
 l   DROP POLICY "restrict access to items_movement table to al_watania_users onl" ON al_watania.items_movement;
    
   al_watania          postgres    false    549    296            ?           0    29728    supervisors    ROW SECURITY     =   ALTER TABLE al_watania.supervisors ENABLE ROW LEVEL SECURITY;       
   al_watania          postgres    false    310            [           3256    30300 9   users ALLOW_ACCESS_TO_AUTH_USERS_TO_USERS_HAVE_ADMIN_ROLE    POLICY     �   CREATE POLICY "ALLOW_ACCESS_TO_AUTH_USERS_TO_USERS_HAVE_ADMIN_ROLE" ON auth.users TO authenticated USING ((( SELECT (users.raw_user_meta_data ->> 'role'::text) AS role) = 'admin'::text));
 Q   DROP POLICY "ALLOW_ACCESS_TO_AUTH_USERS_TO_USERS_HAVE_ADMIN_ROLE" ON auth.users;
       auth          supabase_auth_admin    false    328    328            @           0    29736    audit_log_entries    ROW SECURITY     =   ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    312            A           0    29742 
   flow_state    ROW SECURITY     6   ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    313            B           0    29747 
   identities    ROW SECURITY     6   ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    314            C           0    29754 	   instances    ROW SECURITY     5   ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    315            D           0    29759    mfa_amr_claims    ROW SECURITY     :   ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    316            E           0    29764    mfa_challenges    ROW SECURITY     :   ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    317            F           0    29769    mfa_factors    ROW SECURITY     7   ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    318            G           0    29774    one_time_tokens    ROW SECURITY     ;   ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    319            H           0    29782    refresh_tokens    ROW SECURITY     :   ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    320            I           0    29788    saml_providers    ROW SECURITY     :   ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    322            J           0    29796    saml_relay_states    ROW SECURITY     =   ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    323            K           0    29802    schema_migrations    ROW SECURITY     =   ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    324            L           0    29805    sessions    ROW SECURITY     4   ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    325            M           0    29810    sso_domains    ROW SECURITY     7   ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    326            N           0    29816    sso_providers    ROW SECURITY     9   ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    327            O           0    29822    users    ROW SECURITY     1   ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    328            \           3256    30301 3   supervisors Enable read access for all authenticatd    POLICY     x   CREATE POLICY "Enable read access for all authenticatd" ON public.supervisors FOR SELECT TO authenticated USING (true);
 M   DROP POLICY "Enable read access for all authenticatd" ON public.supervisors;
       public          postgres    false    341            ]           3256    30302 4   farms Enable read access for all authentivated users    POLICY     y   CREATE POLICY "Enable read access for all authentivated users" ON public.farms FOR SELECT TO authenticated USING (true);
 N   DROP POLICY "Enable read access for all authentivated users" ON public.farms;
       public          postgres    false    332            ^           3256    30303    items select_items_policy    POLICY     }   CREATE POLICY select_items_policy ON public.items FOR SELECT TO authenticated USING ((auth.role() = 'authenticated'::text));
 1   DROP POLICY select_items_policy ON public.items;
       public          postgres    false    336    549            P           0    29895    messages    ROW SECURITY     8   ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;          realtime          supabase_realtime_admin    false    343            Q           0    29914    buckets    ROW SECURITY     6   ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    347            R           0    29923 
   migrations    ROW SECURITY     9   ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    348            S           0    29927    objects    ROW SECURITY     6   ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    349            T           0    29937    s3_multipart_uploads    ROW SECURITY     C   ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    350            U           0    29944    s3_multipart_uploads_parts    ROW SECURITY     I   ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    351            e           6104    30304    supabase_realtime    PUBLICATION     Z   CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');
 $   DROP PUBLICATION supabase_realtime;
                postgres    false            f           6106    44653    supabase_realtime inventory    PUBLICATION TABLE     I   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY al_watania.inventory;
       
   al_watania          postgres    false    303    4453            i           6106    44656     supabase_realtime items_movement    PUBLICATION TABLE     N   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY al_watania.items_movement;
       
   al_watania          postgres    false    296    4453            j           6106    44657    supabase_realtime production    PUBLICATION TABLE     J   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY al_watania.production;
       
   al_watania          postgres    false    4453    308            g           6106    44654    supabase_realtime supervisors    PUBLICATION TABLE     K   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY al_watania.supervisors;
       
   al_watania          postgres    false    4453    310            k           6106    44658    supabase_realtime farms    PUBLICATION TABLE     A   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.farms;
          public          postgres    false    4453    332            l           6106    44659    supabase_realtime inventory    PUBLICATION TABLE     E   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.inventory;
          public          postgres    false    4453    334            h           6106    44655     supabase_realtime items_movement    PUBLICATION TABLE     J   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.items_movement;
          public          postgres    false    4453    297            m           6106    44660    supabase_realtime production    PUBLICATION TABLE     F   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.production;
          public          postgres    false    339    4453            �
           826    30316     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     1  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON SEQUENCES TO service_role;
       
   al_watania          postgres    false    22            �
           826    30317     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     1  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON FUNCTIONS TO service_role;
       
   al_watania          postgres    false    22            �
           826    30318    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON TABLES TO service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA al_watania GRANT ALL ON TABLES TO al_watania_users;
       
   al_watania          postgres    false    22            �
           826    30319     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;
          auth          supabase_auth_admin    false    33            �
           826    30320     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;
          auth          supabase_auth_admin    false    33            �
           826    30321    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;
          auth          supabase_auth_admin    false    33            �
           826    30322     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    29            �
           826    30323     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    29            �
           826    30324    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     y   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    29            �
           826    30325     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;
          graphql          supabase_admin    false    15            �
           826    30326     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;
          graphql          supabase_admin    false    15            �
           826    30327    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;
          graphql          supabase_admin    false    15            �
           826    30328     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;
          graphql_public          supabase_admin    false    13            �
           826    30329     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;
          graphql_public          supabase_admin    false    13            �
           826    30330    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;
          graphql_public          supabase_admin    false    13            �
           826    29253     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     r   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    17            �
           826    29252    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     o   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    17            �
           826    29250     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    3            �
           826    29251     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    3            �
           826    29249    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     u   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    3            �
           826    30331     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
          public          postgres    false            �
           826    30332     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
          public          supabase_admin    false            �
           826    30333     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;
          public          postgres    false            �
           826    30334     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;
          public          supabase_admin    false            �
           826    30335    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     y  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;
          public          postgres    false            �
           826    30336    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;
          public          supabase_admin    false            �
           826    30337     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;
          realtime          supabase_admin    false    34            �
           826    30338     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;
          realtime          supabase_admin    false    34            �
           826    30339    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;
          realtime          supabase_admin    false    34            �
           826    30340     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;
          storage          postgres    false    30            �
           826    30341     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;
          storage          postgres    false    30            �
           826    30342    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     }  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;
          storage          postgres    false    30            �
           826    30343     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO service_role;
          supabase_functions          supabase_admin    false    26            �
           826    30344     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO service_role;
          supabase_functions          supabase_admin    false    26            �
           826    30345    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO service_role;
          supabase_functions          supabase_admin    false    26            _           3466    30357    issue_graphql_placeholder    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();
 .   DROP EVENT TRIGGER issue_graphql_placeholder;
                supabase_admin    false    652            d           3466    30395    issue_pg_cron_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();
 )   DROP EVENT TRIGGER issue_pg_cron_access;
                supabase_admin    false    616            ^           3466    30356    issue_pg_graphql_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();
 ,   DROP EVENT TRIGGER issue_pg_graphql_access;
                supabase_admin    false    653            ]           3466    30349    issue_pg_net_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();
 (   DROP EVENT TRIGGER issue_pg_net_access;
                postgres    false    654            `           3466    30358    pgrst_ddl_watch    EVENT TRIGGER     j   CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();
 $   DROP EVENT TRIGGER pgrst_ddl_watch;
                supabase_admin    false    655            a           3466    30359    pgrst_drop_watch    EVENT TRIGGER     e   CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();
 %   DROP EVENT TRIGGER pgrst_drop_watch;
                supabase_admin    false    553            p   >   x�3����"CCCNC.#KT#.C$�d��12ט��k�e��7j64E�q��qqq ���      t   �   x�M��m�0��4����L�Cd�\h����@�.��R���"o�R����(0rb������"*/��^��z���^o�^��z�?AU8��[�Ŝ�RYd}5(�̒1��g��ό�#e3�	3��ľ�֜��X�a��d���A�����@>��K$�G(�,��屭�`��5e;bM�E��D�^�Yb١L��&R��f5��>�x�b      u   �  x���]��0���S佰�I>DO��?G���cũhdѷg8f�$�,@�'Ҫ�g0@�_ �����&DH����剼*�P�*J�'d40W�,����,�$��: ���H+`�����B�62�
�� ���4ts}�f}b]�y���3������2u�n2���4�4�^'snP��^w��n�uEY�2��V��e��,7��tF�;���~�\���ewg�9��Ӝ���Y��n0"}�$+؆*-Q��elg�e�<05	�u��-�ϐB�Ś������m*!��~j� }$~���B�僺r˅P�5��.e�.�����;����6掤0�;�YCP	C95N@�0�$	��a����CPC59$�V�w p��Jl�sZ3�*6b�#e�-a��-7����"ހ���nP�X�C-h7��XC�����E����ܣ�0oX�����>�r�ɣ��H�Q��D�Ԉe�� �� �h���2|�l?B�@۶���1����AK�Am�3&c�YRO�@�af�Iꗀn��T�V"�@e^*���z�ľAWh��l���ɻ�׏�*s�x�޿9X 9�(�ʓ^:�9�*xW�b7�/T��1�|�䐽]#�e�m��y�Ȯ:�7����B%�#�t�O�:_%�������;SvɭDz��C��ř�H��v�������'?�?$#�      w   �   x�U��	�@����*��n�]XA�I�HD"�TrN7������?�8����'<-��I{4^���b���K�B�V�8�l�j�;r�\
>��'T)Ui�.<^��A���ߦ�(6�G�v�fƘ�\�      n   i  x���mn�6������g�����q�āO�-�u�$
�D�M��rwE���E$>"���Z�[�[�`"�(��B"���7 �Y�������8���,��v�7��n~���~�lH%2xq%�O݆��{$�.��7���U������U)^�$�N��C�z:L9E�iŸ�f�l4���0Z�xk$��L�����)&��@xk5�2��������p�����9?/
�o���)��)u ��my�<,���)��4��l�~��&������`�&��;�|��i�)D"z����w�;$���U�%eǶ�%]�m^ăxxrq�>0�-OK�b AEzK��ȔȨ ��xd�G�<@�=����Ȕ���{0h���g�-a�}	��G�BA!��I��ZR��c#*H�'rԵ� i�IR��J�sג9���t��Ĺ�G�2z��xd�xmI�A���yy�<d��!Ggߢ�&�J�
9� l�aߩdz�T�D8����<���Rs9ɲ�)���J]��[)�OR��&�Ƭ�Q���w�������q�}0dUpt#���N/��jZ᭍9b]�0����O��ᕗl��٢�QT�q��~.|=�
��Q��ِ���r�tE�����{�>/9���UZ$J��vhr���!� �s1�����dE �ϗ%�t�Ӄa�ky+?>-�����c�t�nVg�-���/elÄ4b��P�"ض��xO
܍�[!{�7Ϊ/�?6%�
���C���s��ĉHB[���Ag����)��8��I
�1��/��JE��/���9P�>�$�J�C;����$ߐ�M,e/y�C�ZI�v.̠2 �^C[���b\�+Rb�rOl���]*ٳqmNd��aQ���C�j��)f�M�Ȋ���x�\���ѫ���*�ꬒ� �5�"�z�Ր�
L�V"���B#�� ��[
�NzW₝B��dJ�/T����RX�a��}t����T�x��2��T�Ns-Ƚ��p~��\�@�*���\܍mj�5ۄ<�_G��$�b�<p��O`S��wr~@��-��=��w����{y�q�6���/�h��ҽU?RUG���CX>t����K�aȺ�BnKd%��=�N��EWa"�xw�פ�'n�Vj�H�ܵS^T�BmR����(���hf���H^���M��NAʄ!bo�+H�J��_��g���=�v�䰿�5��(�y�s%��7��%�Jk|P�<J1���ȵ���p��]��w��9]&#��K1��2x�	5wҭ�Z+&�c��SӒv����-�S��U�%��=� ��K`���^Ƌ-zWT��&*'��R{_x�!�#l{�z�q*�[钍�8�d-���>����T07���;b�����
c��j�

(J[h/U;��`�h
/2|k�C�u`�b -��픷�ds���+���D�@���D���h�Aƥ菓�e�*4�t��
%J�7r���9�\������yի��`�u'?��M<�`�|M�*�,�ֲD���/�e�μ��LN\�5�%�sw��7Kq��l_)8I=�or]�N�g�1cP�"@<G�Nѹ^�WdI����1��~�k���:c��-#�      z   �  x�m�K��@�Y����r�"���_Ǔ��2�Gm|�$�w҇���?Կ(_�/��AU��|�Cۉ��W/��G?��>�G�����tU-7@���^����~9��/�%P 0	�s���k~�B3��}��Ӓ���T.C�V���~_�߯���q vKJ����� 1ȭl
�M�脺l��	��U�IJ�q��)��3A�U*�t�?	�9�_�/�W�R�vځ �)�D�0�a#*�!^�2%#�ܖ،NK��?`������� �퐸<��/���A����;�e��4��f�a^A&�^M�%3tBs������ xCĚ쀟�����P�,�+��iMqA��2I2�sK)d�����e����k�LOv�`=��f�g��N���%h�7o�x_���8�����uh� |���l{B�.o`����ؖ��@�Oϛ`<	��`VSz�����dd+�����USz�xi\%N�b9�W�Ƣ�:A�R�u���b1h�n^���	���\�:��� ݙ��?� 0GLxLѓ�q;�y|a��2@�ZY��6,@��m٠� 	ܕ�q��P@ ��Qm{@�*讂lj�W�&pC�P��~Rn� �@��r��N�[� v	���d�U��� /��5J�6��!����V�O <!��5���EЯghO+h`-yRO�w~��Vj&�\E���i�A�wR��Xz��U�{$�|���K��	��h@<9�_o9�T��g��P>z�$����
c�a3%L+����TW�5Y1 ��iQ-<��*+%#���eVm'��/ �Ւ-��"Lʣ"���o�7�-�!��qb��+9:s�TC=�ɘ�Pd�(�r E���Vq��1mY4¥�p=�[��ܒ[)�O��x ��	�'���ć�Ғ)K���cػ�6�`ӎ�u��p�RF�:�B���TX�[hA��1���h?�SŃ�P/o��J���/�TG���2e�%B�+eX��O��cY�U!K�`�U�=�C���l*�U��p���I���ܝ���&�;9m��4�g"�V���D�Ri�x��1��k�{ ��`^�-��p��W{�ےڏܖC������'Ք\���H^�;Z�o���9�����;�d�w�M�N�D�;�6<�;�wO[nR���nM��M�JR���Q��`��ɳ[��E�Ŏ��?��V��JG���g�i��B[]zz�=9`S}+'��m�,/�R8�`��S"�|�O{�բ�Gŋ��o��,���N�3��r,�d���I��,� ���hg7?|n��dԱ~�D�&5��]xe1Jf`��J��Y�]`�*�����%bv�c-^^��N������!��1��Vp�FDi���6S�A3]������I$V��ېR�W�C���8�A���u���skѶŝ�7v1�I��1��̛/E$3"T�[;�d0�7����𑵴�&}��`�`��(����T���ơ�f��NH�028`U�I����s������&��h�ݻtsr���� tUO<��ۻ���C��z�>�d$���Or�����֣;���{n��	z���'J=���S�f�u���(�(ŧ�$�έ�l���_ �ք{)+��P�~�$wx��%�OF���|zćAo�v��Q��(]�y�Q��1�K�ɨQM�r�_r<���s��Q����f»����X�s�zk�-k]��2q��������n�P���`�_r�|>��3b���~�Ba�ӦsǢ����;�J)�=g{
	��FYX!;W-��p��N�22G�Lq�[J�4�&�w%������/���<�U<��|$�;��$�x� �ݹt)QY|0�!�{OowK���V&�l��s�`�6�	�3@��8��۶�E��H�N���-�2086˨3�O�7 v14�����6F�"X��	�k���Rc{BV�0�AħV�l˳a�SN�H�H|��jw,H'�^��J�xm��d�*G�}?��E�:Q��b��b~�sMZ�j�D�<@�����Ҕ,�A�Rg3���/� �#�{O;��8ѣWw��v�~w4�x�h����fe2
�aQ�r�+x�zx�u��/b�E��?r�-��*��:U���:1�.��B>5���S��o0���3Ľ�4e<�w���w.�6F�S-��C�S�'Z�~.�6H|5��޾>!区�3���^(�`�Y�6�� �!������5K�vB�q���]NuzJ|.x3l]�����4�g�6����^9Ľ�.���i�> ��SO���N��?7h�od���h�}ʦ�;K���RfuX�瑈;��`���'�Y� ��f��Z_P��� �����&N�f�%��##������S�;���&�s"�g���7��6�'�o�Q��0n}��˼����<a�2#�����X�u�-3X� �v�%��x�1Ȉ���ԗ�ߌ:�*myՖ�<b�İ�-�$kl�³G�#)��P#���J�����EiV�`�<�xOܮpa�c�OD^a�&}��q����щ�;�Hb�U2q�سrE��z����T�����{�[qջ�u�����Q�%o�����/n-��������y�p�v2(�ղ6�}M�@�.��2v�o��^���]�!���$m	#k�$'�J���#�N|f�li�1�Ϝv�d0F�ڕ���}�F������t���}30~����1���2G9�R�+�7D����ʇm)S3�]�V�����B{[��I�d�&�o��,cB�W��eL8}q��0{�=U"XΆ�Y��e�*���]ڊb�o�Kl���0�0�:0L���L���4eP]�/g�wY�m��̠��)(���xO%��?(�Z��"	4S�mբ���P���h��!�w�DTM2�~�Z�����|����h�V���������|	�      |   �  x���K��0E��*2G/����ΨW�
z�ر@t)`H�j#���'5+qv��J�[�� JN�=G��	��D:1�(^	�=���]i�z�T��������2��(��(�:�)Z�1�sO���HƘ��勛u}�+Fr�P�}Q����D k��M1��� ɀ8�����`�±;�w.�m�\�۫�=|��zW���v��S=wxFmv��y�ϪP5HƤA{�'��$���Fx�!&s��#�A� K��;o��Ē}��K=�O˽���MF�ơ�P�	�-Z�"!����1�$^�m�� ~��6��)�LdFAO��~�Z�ۡ������z�w�q;�c�o{����v��=���^߮�lR�7_M0'g��ܚκ�Ã)-j��Gb4F�)���pX���a���WZ
��~*�$��0����p\PS=�}����      ~      x�ܽݎ^ɭ%x}�)�NǇ ��y5ob�o�}\��s�F��}ȝ�*�*=ʸ�ѷ%�,I�io&�\�A.���#}�ӗ�&j����������E�Z�T��N�o��m��Ͽ���/��������]�?�����������鿕?����_��������ο��?����������ן۟��_����_���������?������s���?�Ͽ�?��|�_�ϴ����/�im>����������%���'��\p�,��a����>�1�Y�|�����5��?����o����	��/,/��$��[���̻�0�ʉUj��?5�5�&9�1�׶�w��_������{d��Z�������������_����0��5�%�?@})��[�B�7N�k锬7�왚)�-�F!1�	�C���Q��|�6u���-�^���E����b}��v{۸�����[��qfe�%YǑ�fM}YI��4bD��������A�A*���J����Gn�H<&7��8��������k�}������f���͠a�,��jY��z�Ժm�6����x�L������|b#W��Z�E[*f~P���Ӳ4F^ƽqF��A�?@yq��q�
�fjY�����o���mS�U�h{����O`�������E�O:�kK����[�#@[��?�q����A��Y�t��<?�N&�b��٦��~�C�j�~�����qwQ����,{j&A�bz#\Uox_��/���� Ա�Q�NȎ�a��љI�P�U����8������c����[u(G��|	�ڹ�;���Y���y<��h��f*��h�����ݧ����&��c/T�W���U��=Y�숗���Չ�yú&w.p�HtY��k�W0�2pX5Y�;eE��d�3+;HB��pp���`K��{���L���]m��͟�8���'�z�sde��S��D�" ��)�lӏ����X9��cJ�k��Z�z\I[VM4��f��?VT�����9����d+g�P{��&����,�D�8'w�5v���.�3�����>�ǳd��]͍����q+H���˙D�?@�7���'�&���+{ȁa�g��Ϊ8��lޥvU� �8���C��@�{��,�ٷ�=g�c�I������wF �V~��$�s�*���s�"#յ�t*i7/A�G�^�r!9.���7���vy<q~=�\XU�������d�2�+���]%��D��ii��_��©�%�� _��x�qE@����3hGmDy'��?v��9�ivo��"�Ps=�(U:BݜT���ȟ<�$6`{����{�W���C ׃�!s["��p(2u%�SɃz�U(ן�6�	< =���U��(3G�mQrZ(ƈ������8����Z<�x��$��ss!��-m\�3���3��������A�Y�Z�4�Cf\ط�jIPX����3��0D[����B]�g>�Qqq��=7#Ü��^~�85D���xr��vn��L0�߬L���9�9�$����g0���z�C�#8�Ѫ;��{��E����և5@0�F�N^
���y�ŎJ�"�a�1[t�Ee7{����ڐ�7�kxg�J�䖱4e[��� ��f�:ܣiy�͋(�q�D������8�!�#:.�9�+�����H^r� �z_<�ȃ�P�������I��ù�Lڛ%�&h�F�z������p��kDFq�6�S�8���\N��O ��8�R�#�zP�F���`ڪ�Q�r���Q2��ʢ���P������ZP���(��CZ��E�ƌ�I��C��/F ғn0#6@?(���X+|aI��	=3�?�A	�x=�{��.�=�C͹��b���f��~
㔸�Ru*r��?{^C M�8Kݙ^�[�u6ksܟ�ht<q}�a��fdw���cNaع0k4���f���d�n^~�?D��d�?
�M�P�X��s���H��}�޼��2��GL/Q�_�� IVM�KR�M`�\�͋(��ѨP!���K��ˠ�&͝�
WH+7�?Pfi79�q�y��myE���y������2]K禛7f\�qě���?�l}�^��h���nIøð��>�zF��WR^ ;C�'���Z��������ԙ�;��q����.��1G���l&�\��RT�.�+�"O��2<�;��J�Kc?L���R˚μ��������K>�f��9�z|�L���Ta�.���^ۏ��
�.�8v�1�KSGj{G�V�276{_V|j_����<�m�}������%��8��VE��ps���w�d�G^�GtfmJI��[k������r^j8n��X\p���<v�v��7I���F<�ƥ��Ұ)��k�5�m�/��T	��kǴWx���:&ir�J�`�3��>��:iwlE=��4G�(�����A%�{l |�Suن�� �R�ts��=�6V�����s=��^ L7����(�aI� ����Ԣ�Lkao(3����O�9E"�8��pP��cT�c�w��,ǳ����0.�	�C�?�+�x�p�|-q�2�c���΄��bcץwA�5��]T���ʊs>�;m�LxGA����x(Q�S�x����i4��W��FDX�̅��մW��Y�*��&ye��{mn��#i׫�m�� h��ωDO����I�gw��vR[ݙ��($���~R�i�=���F�,!S�AY�lk�̚S�i�nޒ��7����������4O#;Im��s!G�!{�y�'0N��VQ�rRR �(�i4!�q���uqq��H��85��]��`�KB�(ҏGX�#UX�7�6����2]��Nf%�w^Q����g�</�����r�0yk�s�#E��o,��{��rbX�M�`��s�=��$Ƴ��.��p�x8np������ �.����=��8f'UL�,�Bmz�
)Ц��=N������g0�q�螰�,�ې�[��~�vkN��θ�������=T��$Om��&���9@���y}A�n���.l@߮�#e��=�)Ɵj�o�%�<j�e��gj��d�;#���pJ��!���x��]t��C�i�M����u�N���Ɖd��Zy;��#l����MTo�K��&���V����Xr�@��Zs琲T���A�\�]��O<d-��{���O񉺲��f�8����3ʫq$�gɊ��_@�n�1CGǁ���,W�x
��у�O`�n��Fs��ל	�EoJ�1��$c�����8viw�����F��رHsϩ�Jz��q����4��y������yr>��Cٍ�C���$�Y��ZU��jw�x�]7�%�Ua���q��
�@QK�:�;r&B?Sw���/�ͱ� �{O<���_J�@-r�ÔV�]���݅&_�á;�5K>9V���h�졊�w�Lb;K��4�<�ۛ&D	Q~)vrER�r@�)��'�y&��}�ׂ}����8Dqf���R�&��9V]8,8Ә�놼Q~�cEb�\���wP7����$2G�n����)<����Ls;$��FKy̹z��Ƅ���<����Q��&R�a��d��SG�+��FGv�o�5�ցx�T^޲V��'�'({xVJ�=(Q��H��l+�i�ݛU/� �0?*�����+�$ǂ�#������l2���+�ơ�Oƌ'kCt�',Lc�@�I[�4ɜ�c.3����.�qǁ�`'�����������Nr����j�M�>��̾�ԳU)��sJ�L�;��j�&c�dK�#�,��O<�m�V^ ���NE�RR��R�ȢCc��`�Kҧ�֓a�cbcsV��#h� �L��9j���\r���TN$��	�?�N��s�"3��[8����5���8��B�t���ڀ�%UR���= 7�L:��bP�q(G*�E뉈?�ܹ�����z�9S�nkc�	��e�V��d��]<1i�%�=�ZK�j��W�?α��A�'7��U�63�=cX���a����]i�i8����    d�B���T�b��ԫXj��K=��1�K�g�v�ɉ	�N�f��Sڈ]�$$]>�ƾ ��\.�`�>'�Sy@Ԅ��%�*��쁗z�;'��2x���wF 8u~H0W�i��z1Y�99�UC�%�B��+��~$
���go�m8$�J�I�GRX����*���L�3B�-][�
r,��^�z\�&�][�<�]�-������r�Q֝%��p����N���������{��q�œʵ�6����\s�5N\B���L3&��0��,�� ��8��Lf<�"����5el��Ln�9I�Gk�[����Oa�
�%�^g�|:�5��sF�9b;']�������E��F(|t���P��˘��!��lit�a��	w�i3�K�(Ъ�����Uh�A��R�"��3n]���������ve��1�(j5���Kʥok��.���f�w`G�_�s;�$�A�C@���
�=���VxJW����NT��ܙ�j� 	���� �q���0C���HI�P@�s�&[�'�w�'WH�R���C���h����b��p��TRs���Le�G�w�R�7��"�( ��wI���Qe��qT����	ZY���\n|��")!�^O�"Lj��3Ɋ���ofC9�MluW]7�03���!6{��(�0��h��#Ăc��|_��9���ƅ�_����ܶ�I7�"p���K��)��)�F�=�h)7�����.Xh@K�t��D���4��X����s�(ݑ�ԏ�H�-9�j�ע1I.'���jepd��Z�쁥�6B�ȣ�X��!uy���;#`> �Z˪:xsh�̜L��h��^���\���$�"T�����c�8i	AV?�J��@?������,�ȟό�c��#DM�N�$�Q�b4o����P�( [Ȳ�i�� �
|m���c$��,�`��[|D�9�ة��@�+�Ӳ��<n\�|3N�~Wwm8�<�4&َ�5!�m��k�i\�լݸ���8���<���0�;��k���q�j�J�s	}��o�����U1_��ш6��d疘<��G�3����ɰ���AQO
�s�R��Z��3�W4��:u��ugY�_�SJ�[�'yF�������T&f}t�����Í�^�eg)���|��	��'��B1�q�MT����ʓ���?̀Q �����,�h�榬Á�(WuS��Gd�&���䤈���=�t[���Z�Vb��m�;k|�j��S%;��kz�HWo��5t�GP{'�u�ه����`d��VU>	���SYe�n��b�����F��:ηF��|r/o�j4����?�I:�����œ�B�m�.ZO����<(�E;��.�F+�ȰK�B�7P���b3�AqK[�����O��:�6��R��+f���%tp��9���|��b
	��nb���b����&0�k#�G�J�
[����ṳ�>�ы�U��d�����3d�oߟ0�$Y�����ynL�_�Ir�,9�35�eɝ��ߌ��W����ˉb�H��JOKxivL��&���́�@��pЇ��RO�����K2�K;��<؋ʖ�H���\Y$��g�|�J��k��Z;�U3y>�?$XF%ڞQ���}J�ޟ�Ô�d�}�5�i�-��Q:'�a5&u������*�����b@�si��P��iw��6���:o�U^�_�D~��TdW�N9�0��C�M�du✱���3a
*�d��	@ZFԝ�c�汓霩�8 ��Z�6�>�o��~��&G�+y�6���qѰ�I)�8[��������?������{o���}�a����<֟���_֧ �j���5�gzu����ߦ�����x3��g�Ǥi$��ƽ,il;E$Υ0�־���_��Φ�l�<�	o;V�+*�K�N�[�0iN����͛=�M��������ǎ�K�u�����J5���ea��*�oơ��aV8���s%K���0z��j�ʠ�ŉ��o/�2LY�q@}Ԋr�u���նû�`X��muo��R�'���~�����w�yB3��gW%���Q\,<͗����|���;��Q���Jt�WG%'}13q������{�T�Z�:P����� ���YOvz�.�pe�(���N��$�v�h�/�m?,���m��U����o!o*���(����KԶ���2�6��L���2�s���$S
��	8� V���pH��e��o�f>c��,�s�aR�h���u���85Ѥ:8�Σ�ߝ11�G&;R�'�6[��|.qIE���R�LEns�-W9�^�>�U.'R�F+�!�<��?mRs��V��BZnr?��jppW���%X�ITB���8� ��;��|�S�,�Z>a%dى��R�X8'�o�5Ϛ4�&�x��7��D����1�me�H��
ij�+i�Q�wȪx߸���L���W���ZZ�u�o�P�s�~�6��I��8��G�XOʎ8Fͅ�W-�+����LH�(e[���e���c]V�f�N�����G�3��z2����{�2������=t.N�S����;���T�5$�s�=�-6��m�K��Փݟ�V� 5�ʎB5�#�p>�i��<n2��<Þ�A�t��0�pA=Om����]<��{��q/�CB�xH�<��T,���LmWHHY�v�Lx�ﯱ8���Ht�r�y��4}fu�.��x��F�l3w��"���Î�+�ɲ��y�MN�,d���m�iB�{�خ߭�=�s����d����qy�ƫ������p�Z��m��~rL�\m*"�&T����f������eP��~�0�5M�Ɖ�k=i&��aE2�n�^F��5@Vw�3E���E���m&���7B�2{�����H��J�2���ԛ���8W'�#+����^̽WG��r�-uk1�KW���r{�D�n��fD:����e=Nnc�m�\l�M�x5hw��/������ȚP<B=����������8��!��F`9�8k)��n"��SL�It���So���f��{3�=!0�Y�13�5���V�H����Ǯ��ߌ�\�hې9"o�Q��ږ�.L���v��Z�of(a���:�yU�����������49sw�ժ�'.\F�����h�F�'V�˕��d8��м�nK���GM'B<�L�T�a7�d4!9��fk1�g�'�a}�]Qz���B���>sxFE�SR��e���7���!�|�)eb�c9�Ҙ�ͭ&���*7�wF�|wp ��>w�4˛x�.��X��Ips\]����qf:���Ln��	y;#-�_[�E�et���]�c��13�n�zr�7ʰF,�)��W
��ܹ�]{}���ʯFp,pR����~�ZC�v���иƽ�F�6�.��k�y=΃�9F_ �;����#˟���+�|Q�wF`8�5���:[��hЊ���&�7�UƼǢ7z���\�W�u��=c��%.ɜyڜ��m��u6��~3�ѐRE?A���_-T�e���,R%۽������F�g�a�M�<f�ث�
	��^�t.wt3`~�k�ˏI9[]8�*��1�S5'��R��4�*|�:��|e�z»������a5V�>�����!�~FO�����.�o�ɰ����RX	e�Mn�*�	�υnS�����qEz�>���$���X-�?e����۰O~�;����O�I�-r:R�h�r@�Z^3�ژ�y��7Pw���S���I��6���ԘG�2ai�ܦ>yu�1Ġ���I!�MFmL�mDW^D����2;��>|k�r2-4=JWL���0�};��@�:괷	m�H�8�`8Q�RV]%9ͬ��
s�u�K �6nR�~g�ZN
�y�����5�-y<4�CK���w�n�(9�k�iq�w$&<��L�a+�P��3[�N�T�:n�"���I?{��ӈ����#�.�ȱ��@>,>=�/h�G�G�qr�˥�gQ;����1��6v�3���Mjp_A��t�H�z\`"��_[�l)    �ɦ4�y�Z/�K�T3*�����:p�2���,-�9��Yq�8ńyo!�W�P���x�cP�:z*B�ksj ��u��^?�e� �W�ʮ� C8�sTҞ�9w��y�P)����Q����{#��n@�8�bn0�U(��=���38CD�Ţ�73Ԩ�d	z:Y��Ș�C��u�9�[��'��I���Ǘ�O�������eY{�$u�/����Ӡ��v#�� �k�'C�%;P:�U���+g�:�?y�iw�A8�M��;#��l��=C:���FTg7������.Ѻ����d���ϰ2<8���XZN���(�h�&��w6p2y����Jj��Q�3D��HQ&�%uކrإMq�Yۉ Ŭ������N?{��QTR7��8E�������A�2K+s�ym��򺋴�� T����ע�1%BՓ��{��c�m��H��H�Cڿj#�5�=$��!����t��ݒP,M��Z[�iz��sU�w��k6�(�T��ٜN��'Fa2��� ��ȉ:g��5K��/�f�j'%J��횶���ޢ��ZZ6��,O9�.�ax-Y��<}�t2�X�m
-�k��{���q˶L�;���|o��}gej����CG��Y��k���o���6^kS_��U>Ҵ]�g�,	Y".(l��(��h�?$SO����
��L\M*�D��]�c2v?���wi�k����ى5*���tp��G��CPq"�T4�6J3�R�=��@rru����"�9�/�Փ���YK��d^����]�,��[���A�D�SK.~(`O�֠߄P��@��0)��<�R�I���w�v�X���I���%�%�Q�����]��T
��wX�`��G��To�g���n:?�K��S��.��9T���:	g���;�'u}��!�����OO���L�1el����v���{#��z8ntg(~J)�Ol�5�!����iy�kb��E���D�lm0�=-���\���hi o�N�{t������]<:@
u2����=Rn��`��n3i���2]�JΩ��TX��ɷ�!^�ɚs�b]�.!x:���h�,��N�g��QL��S�Z371���v}:���]�T@�DX~h���1ڞj�d��=���֦{/��8!�&'�q�\�<2457N�dN&Ҫ��s�w
%TN�+��԰�gZ��hdh���VO�{�Y�a�M���6��'}�QyeW�`V-;z��g��Ǥ�eagX�߮m3������Q�11&��@R�R����g��x�o6��U�Q9.u�1�J-��264ֵ=$���P��a��NN4\���ZH\�d0V�Ϯ{�ڤߣ_���dLy��,G�̘�FO]��Ww�;Æ�t�a��ء��
=��ȅI�yK��������K�b'p����{#)'R��
�iXLZ�H-�NMs�$�wR��$_�_b4���5����T�yd��k�.8ݖ�LV���{�4��'�CO�-�@��;�IS�qFVI<m. ��m��.�k�ol(5��rto�����i��xxTkz&%���?.����NJ��c�1J���!��B.g�X�{v����|��عB��Iij�S�ɖ:�f"g�j�8��{i�e��p�!PZ
�ha���H{�J��&5G^�6p�x���֏^����*�!�N�se&c�D��c`�̀��x⛅$�h���`'ǥ�ї�
3��S+V�a�i�8��ᆠ��4��)��i�{�NB{(����Z���'�%���g�wf@;ѽ�!+h��\o2�g���.����-h���{�F!O���k��f���P{�؎�2x��k�O�����5�C�fٓy��s�$���k��D�UϹˡ����=}n�b�ر`Gҭ`�ǘie
�αz %X�fS���� �i,1��p$�R�(��\3Q�}mR�QK����gĦ��}���Ց�IO��fC�i�Nn�Jش�7����o��k	�:�:p�V��5��P�1އ��f��3l���.73N�`��0�r�k6��FN����CIU%5�\�M���7�������ɌSwXk�dS˱J��E[VH�����>���'b˃����ZtM�O��))�<T+b�{�(y5N���8���]�˱Y(~:V��wjHr��xi<�2y��d��g�JT���t2���f϶����?���S԰(;��)��^�#W���e򰫘X��o-�h��Pey���n<,�b�થ���s�(=�A�B�oi�+�(ͭ��-����p,r��#'�?�[�a=Ċݘ���3C�iV����gq��ݔK�'�Sg��NC�d��ghiN��h��&?Azq���X>y����v��Jl�>wj��?��h����ϑ]X������ҊĒC�u=뜘v�YD!v���C_����dRU�X��j��Q�j��ǖ�U8�5�{��4�î6Y��D�C�p�,����^�"6:!0�{����8 w���Up��d���'$�u��,�o<�����UO=��΀u�_�G��;��#�
B�{dN�q�Y��r��/�)�	$r��Ar�^�qݓJ��($�F�Zy�݊o�z贃��MgO$���G�t���f��}�{�W.�x^!%���cc5g�3�o��аǘ��mg��� �0g��;�D���E�J�P������3Z-1��m9����B�j����,�JB9��0�X�E��A\����f�yU���@���'�l�XU��=����UoN�4����������.��bt"�o�:�ْl٬����0v���ۅ�/�a��ُ{�c��X�\n#jYS�}$M �
�?�yʥ����'�����Ctl�,QI-��6�"Xw���b��5��*�Y�{p]5��8�26�T����%mߌ����	߭�!IѸ�<A� 4-��ar]��b��Ʈ�D
���I��Ʊs,s�)����b�!�Vj]���O<�V��%�W: V!�PR�F�OI�]�тG��ڿ}��EV�R)��"�'�x��!z�������똀w���|{�c�4˵�/W9�A��oָ�������W�@3B�m�=��S2?�E�U���ı�0�c����t7ib݄&[<���l�d�ҩ��"'[�r��S�X>�c�"q�T=L~������/�6��я6�����5�j���U�C�,b�>JR��EN�3�n�HJ��h�ƨ� �� ��Q5���e�?�%����<��H�F�qb�4Uvl�����3a J��������8i�Ў�$I����'�E:a����s���b�Y=Z踄�d�
N1�F+��%<��d=���n'm���q3KG�5w�ϋ?�!�vtB�'�{	/v/ 罉J�#�1��C��J��p�S���N����ȶ�Vv(E�/`��l�zBm�t���r�\����Ή�S�tI��\	-��q)�(��,���&�X?��_�bc�ă%����a�b��\��+��b[r�a8��$�8.ߚ�ԓ�l\PE$��Pc��c�\7��C���g0������D�j�Aԝ�0č�Jj�v�S�Q�x�����Ѣ�<��Ϊ�
�3M���Y�_!q0 �մwE^n�Ԝ�{)�G����$]�UY�I��73�����i:$�!c5�(a�0K�&�`����Q��@9;*d��l�'
1��=�,Љb���OO���!��l�ު ׋n��(��x���̃����pC\*�Y_���|��^T�J<�k�I{�)w'��>+��Tf���(FÏ�'����iM��Y������3"����S�o�I79��2���v9ǲ��\��N��:��2�{��^y���M:c��Ͱ=>�ޝ���W�=�?|`���x"����f֞�.5[rjn�s�;���b��e��|�y�ަ'KS��3�Ť�8f��e)�{=)�|o�j�\�><m�m�V�)��c0���s��1V��T<���K�!3�����Pζ�r��:����7[$��f��I�_��Fq�d���֓^(�8S����ſR����3��U��+�T�IgD�DA���o    yG��&�e*�Ϯ�y.3T<aTE�:f���p\�M$�,TU0����g0D}��i�('�L`�0�	:����W��	�Rm�)μ3CD���@�'畲'=�u3�ȩjטI�>����R3ʯ�t�*�u�%1�|�~�X��Du\�͞R�m���f( '"���Y�a�q6q�?0�m+�'�l���p e�~4T2�r8��%:E���ׁ��iXnS�yg�z�T�6ٔZ����I�H�\��N�y�ZE�����(*,'j���q�`�Vv���-��(ujn�U~.3���H�����'�ڵ�BR��x����gm7��El�/�y��^	i��	.N/ft�o�ɃL��U���L��'��G�A��5��|�����**kl��W���Wެo�����o�ή̓�R�%�u"������;3�ɦ�ζB_:A�'�n���-�b+������i���&��Tl>>Y����+[ڹq�ց�IpH9 ��2�C<�;�fw��:�ڷ�����\�Jί�mt���t?�?�K��α�D���mC�cqtR��6�ı��]&�v����f ��P�*3r�x��WXɐ���4�x#��Wޔ�kډ�ÎUY<o^����$5cj�.Ý�&��ߚ��ŉΧ	���B�o�T�i;mmK��]:-���G./�cq2�ԭI��<�Į������h_�I�s�N�3�ѮH�Iщ[#kvN�6fD���"��ި�p��g�G�xp,x��C_i�ڎ���z�̙c��m��;+0��ݲu�}Zj�����Ͱ�e�����_,�:�L�ho���8��� �j�B9��m�.�����L��I�ȺG#sDI�c|��k�������x�ӭ�z�����+H(�a��F��SOGz�S�^8ڱ�_�[#T9�0Q��*�دkRc���z&�U���X����!��'�i��r�Y�:��ȟ�^����vF����5�֓a.�=c;�~=��[�_��&ǓM�yre��x�@t�k�5�|�.ɜw%���9D�����G��k�UO`+���Ka�y�v���Ա��^�|F��A�/����wA�N����j'�#;���*7���M�;#�+����}�ӊ��I�~���1�����͠�i"$�H�N��gn6R���)�;t��4�S��g+�Od�G�s�M1��q��=_��!��N��6����o���zVU+5��Y��C���آੴ	NǙN?�}��oFp+���c��*�+ZbJ��J�yZ�V��� �����hEO�ks&��33�R��O�I��))�Ⱦ�ꦯ���pF�O�e�(N�0�4t���[ˡ���oߨ�����w�z�����2{b������I�X�¼����q�3��7|X~�e��
�C�+�?7H�l7w��)v?P��`���n���P��J�F-%��9���73T:Q#.�������M��֜�z]l���u��5�)��ʑ�,q�^f(Ȥ���S���)�ɾ���2ߘ �\�)�Ҧ�.%�E,�)����r+��N=��ؗ����$QL�6��.�����whb���x�΋B�6�=�3��XB]֫���՞<���c=���t��zIr��#
�p�h���<m�)��V�	u�nw)cmv�p�2�՝��8(��cGj<�*�1)����f��ޯ�zD��	���A�$�f��5�X�����Y�{���F�L'A�Qŵd���� ��B�ڌ�d����B�Fe?�O}���s���过�:4�u'��՗�{+�~e��FY� TLS�L��;-4Ubz���e��ȴ�g�b"������Rm��3�d�(f��2�R�͘��f <Zz�\<F�:<ZP�I��P<	jk�G3^��h<b�:��q�N�^/PO��7t�r��6]6ϻ�y�7��A�2c��N�#��x�����ik���>!�x3��Z*z���s/����Y����պ�N7r2{k��q�>TN�G�m�(nG5"��-����x�v���.�a���1�J5t�p�ԶĢ�
�Gv�Z Nౢ�Z��W�g�3���/�-?(�b$�ů��S��ه���l�K�,;���i��%�u����n�������.SK���{&#���k��Ѵ�4'� �XDH�@C�"���Qď7��Q��9ɞ�T�XLR���kl���WY*��=�}<�����On�΋�S�9C?%�W���P�_�.�a���Y��pBC{n�"KZ�'_�'3���P(:�>ۘ�TF��0�v��h��)�;[�0�ދ{/�`����Pvtx��v�1+C�V!^�-���ΦӉ�v�y��j��vR����*SoѦ�����U��dt ۨS���Ȍ���uT���1�S�]5��މml�Z)R�aэs�=���=�[�H�g�C�Ժ:�ܵ$G�n��0�&�v�<s��:�r�~����,��Su,�3+l���VE[7<_�yg��'���Yh�&��A�����[��tl[]�='OW�~}���k�(-��J��j��Ċ���N�����w�_��a���LG�=��p�.?#m��U��<���C��8��(�7�D���E��혋kQ���8��&[���?c��*�ܖ��'�=[�R���Qi��ݣֱ~�V�v�O����J�5�j�;k_��������w����q��=�Nf'���C�i��x�������ψ�j��w�&�����l��NH4Vp���e���P~��_̓���zpc֧�m1&�:�~w��.� �r��=��;\�൷��QQ��lg&�K�zM�<�f�!��s:�,|o�7��XJ �A� z���=?*�f]ޒS���w���뿸G|RZb�#��\OJ�����)�Fhm��W�4����h},����7#�Q��L]ԁ��5�sM�29/ɸ��v�q_��bFE�Iw=٪;i@Xe�:��̤��%���9�������]�;��d��.���̉�ٜJ��m�NK����w3 �����K���� ���էW�\j^�7�!yg�#��%��ĘT���+��o3��a�ѓz�Ŷ*:�'2�u)
eGZC3�?�Z-W��?�+�f�r2��a�%t�`���V����	�B�_���?Vz٣֬'+{��n���b�F;pJ}���G�����*�O�5���Q��I��Jg�5a��.����r+#4�̉�}*W�&=�>r.x�`��2�����[�I&�s��m]�.����@�@�(�z�s�RϘ"�[/������a����õ}��p-'�F��e&����ir���.jc:�wY���
���`Hi�9<����X$�Z�� ����j��\�?v�����9EҮ�
"��Zcǌ�����'�E|1�Ã&��)Zq/X�َ��<IT2���Li�i��?d��M�R4��)��l�h# �ὧο�\�F.��g7t<��	��A)��j���c��ΐȴ���f�V>�!����
�ŏ�I-+�f/V���X�/��;:��&��XOJ�k.Ȟ2�T�;b/}ql�&D�����3�¥9����ZN$�z_�0��{���b��l�=�̻��;�sЃ�����e���u�M�4z�q(u��p���U�G;��E�3�4v�'�2F������Ǝ{L�7B)'W
3�5��=��9u�1�&��9�ǂ^����4Y�@��>�eY�v�H���]R+����n0d"va�3٠���a�졌�s��TzT���m��_���͠��$TO����˓�WN�D�q�cK�,7����k?�j=)�N,��Xi��ϑ1u����!F>�S�� A�b��up��i�-����d_Xq�)5�ε�w�xg)'C_��J�XZ-����/��7���7�y�Y$.��L;˞)E�m�O���mL�����3����g�F�HyŴ�ҝz��Z[;;��^�����.��'�6�?N�@y��%�h8�N!4�,
::��V�^���]���cE��Ʌ�V���?!�<�Ѩy��3rPp��    E�K��a5C�I<��m��u��xv��1��z�Qm��]6@�7z�;H�y��l6�m�)cv�����@��R��r�v�*�O��v��ɳ�P���;O��w���_ZܯV��8���O�ւهB���}d�^m��6%Lt�M�f`3�3p8��>2��,2�(�1"���X+j6˧��?�
�5i G�É�I�)x��8M)P��O�v���ùg��xы�ݪ��9�H�s�үMҡk�5�g%i��t$[;��,$hB`���������]���El�@���ˣV;�n{���R&[�� J��o"������� p4����0+�<�zp��on��!s���zo=�0ε����\,�pRvd�c���)��#1�P�#Ǟ���]��|t�����(���g��΍@4��K��=�)���������=2�I��H��龑�F#�J�f�.b������ &�$z0��npT*�ay��VC��qG�.4Gq�?��༽��x,���\�4��SS�㱎�UjKsQ]`��=���w������섖��6�L��m�u'5���YG�.U����8���T�����^e���P\Bjz�
�WS}3O}���"�����u���!�P�9@3)uN�~�+���o�T�#�\�q�ȫLG�ч�i�^ɝ�Q��jN�{��<тb�'����GW)� �+����~uhbi0ֽ�"D�)��`4c�<�,�+�Ļ�Tu,��oxb�Cx63�wA��8�C�2�I�TF-�S�J��0c�����$i���퍃/�w���U4紌-֮�d��T=�ܺP�?-_�O~r����q�w��0����p���3��E�y�=&��Q��yȣ.e8i_���`Vg�9ޭ������Q[7�H�/1Ƭ��V��ɕ�x���C�1u��g�Vf���r���堧˽��D�c��<{�iͿږ�uO��y��n��H/��`G�3s�'s��m��q�1� ��龍��;+`f:���ydI	����J�����ć��^��R������	9�����h�
�4�?|�z"��z�s�A���p�&�BG�,�>����*����e(_��}�@9�P�=e@�n�v�y�h�5��ڴ�оW���KHN������mCZ���ƚ�儝�<��w���R�D���Ѝ���O�l5���ORG�Ϗ�=�!4�'�P�����ĳ��5�0 ��db�F�O��<���ܼ�N��͠�)J@3���ً�5:���П��j��u΢��br�
��
����+��c9]����$�k=]�Py <��+�R�$u��n}�Нl��.}�rZ��b�u��������=$�Ҵ�V�F-��!���c�,���~3�F��"�I�����uM�>B�6�A�N�Ra�r��#,+�Q�L�|�2g��c����qyZڈ{-S�M�N�t�wq���KTd&�Y�=�Cd�K�W�.��GB����ݖ+�u$�_i�wn#A��4R�kO�uW��m~K�)�Nis��b�<'+*���c-	����Oj�+���������ǻ�^+��m�� ��	}�˻j�Vmט��Ͳ�MF�����_>���h+���@���x�ug��t�� ������o^��>�3q��aTw��d>�2/?�_�wq�t��B⑤��+u��ò>�.�
_�֫�h�=�,>�Pb<9�Z:��^a��e���Ba�(��¿���	]^P�`M�pw�~gJ!��|G��m�`Nu�ҵr�G��GRJ<u!p$<���)��K�� Q�v�vD����%v�Y9	J��z!��Y"w�4ª�R0n���F/B'g�-������V�'[�3�&{x����B�Q|�J�Nz'��Zk�V�2`	2��ܣ��i�DE| ��v�#V�تA��j�����+dԖg��6*��ed}dD�z�y��Y+��̍��+;%P�*S��[�%�� $�����"mE��Z�u:�^#�%n2�glw�MI���g�yy|�W�c샔3�鰀9��h��!��"(?`����)�"�wPj�}�sK�BDP���ټ�RHo���#���A�L-R�"U��c=��M�}�&�6K���4��a���@�����sv��uy�!?�!87�9X��m��>����7HR&���&�WA@T;������w����.��ޗ������.vxty>ū�0�l��Ic�YF���&bj��=�ugݦ�&)��'Rj��ln��fG�os羦V "� J�Q���Oo���N*���j�� S��I}D�
�}�J+�җF�/�� ����bf�Wэ�xLЅ�֘S��Jv�{�r�C�ށ�����Z������gv���F�{iO�>q�O ���U�!}�{��}�5���CA^I�}Ү�9i���b�:����v�����&��}�2$�Ω�!qRyv��K�PO:3t�=���W2�����d�8�R.�z�����ɥ��V\���i���_��9��M���W��z��3��su"e�	8Ee�5�ڝ~8�t���\5���]�RS�xTq�i����V���3Fo����	Ήz���M��/�c�'MJ{-�]h/+�"fn�)e�t���z�(��������ռG�����O��&�[LJ�nr"��'����H�,�"��c�x'9���k7���s��(?RJ'�9��3)XD����s�F>v:� ϒ���@�*}R+���e/�V0���9zɍ�SI���|Y����j:J��"�6�f`mk���2�{�ٕP�EE���[�l���-��[��:��M�:���F�+��CK>��\EH�\�?ty/�)Br��\k} AӉn���ß�6�O�#<>�-����m*���
�M���A��20�16�N�K�
o9X�^B9��a�����Ѱ�0/#b Ѱ����u�-w�b�F�U��t�z2mu�%��5��6
�z�N԰6wjk��������7w7�,r���V���Qp��6gS���{����_.���P���=c7�I0�%+C|̃�r�wX}��֖�uًE�� �'W�#��!I��kK[���Խ���t�
�{��O��BpRK�7O�3ŝE�Z��:��W��C��G�MBO\���h��ȼ�V!�5I
q��B�����]t��.F���V����R��Ա��ai��m��t�#�O;�Θ�����l�����g��f��=.>�QPw�Ϡ�5g:���2f����zui��:K���%�K.�?@(�d��K��P|n�@X�y�U;X���=.��ՌB��K�R9����}!ET �4אm�6���x�5�@��:1/�����������䑬��]q��@����Ý�O
�Z�a+�ж�-�-!���T�+�5����k�"�d���샖���'�p��BZ�
�:����;<�r�.Ƞ9�������"���+��&#�$�B���_�;�'�z­�[�k�}��1>�yT0��U,w-����C��'�-�P�H����$���e������~;��E��cՓK1)��+]�v��%�+�2b�V��&y-�Z��BX(�O]�[����"Ѡ,{?��
8�'���t��d�
r^~Q�.*Q5�]���t����R0h�rR^䮸��e�ē	�5�\��b��N�^v=��e��HIOXE���s��i�t�' @��=?{�R(P�'M\Ji�V8���;-�f)̺��O=��_���e���G�NdW͵��w�>��g�A)(Z찔�P~V��>w��l�v�@u[������ xF(��wq_WyU�./�`c�M+k?�!�䝳B/�V�2͉�y���)'�b��SX#H���n�%�f�,	��Y������'��z��<�7�9 J�-�0x��Wʖ��Ý����}m���!C�.Zj�?$ӝ:	�.���8�7��lH�r���6�Hɸγ#o+J�[�u���Z� �Nc�r��bq"<�B��V���7:�괚�T� �Җ�̡�S'+"�s��!ڳ�9��{R    e�����0�;�P�`9CbHn]��ƾ}x,))�O��l<:V��I��;���3�f���F}��j=�y/�����X�&��{B�ԡ�F����B;=�J��6ӊ�R��W���3��+�AOo#/�C}8iz���v@_^�ʂ��Ӛ}ۜH�7�zyKU���O<�	��X㐊w-�z!2�^g��7Z�P(,h�M<%�eF���V˭Q�k�F]��Y�Gy���)m��Y������[�Ȣ�m��m����
ǈ7���,�{�%��)�n�28%{y��w��+��\�ɩ�؄�B��ޛ�Mg���O5�q����w��r#{{�^s:���m����3���=(f��.�����{��x���ţ[��O��#ɐGُe��cNs[�<��z{-R=�*U�M�҃����#�	�X��Ɨ�~� TI���H�����D��x��}�R�9��+0^� �8�էhJrp�bY�'ˎ�} 2Iɋo��H/_���`Q�?��)?���$X@yP��6�ӽ+k�Uu1����pޢ��#�_ka��+Dgp�N?��РE�)�X�q�]��xA}t���'����VP�&��ܴ�ԝ�F�C�ׂ�%�� 0�Aձ�5&>�U�4F ��{�B�{�;���<F�\.pL���!����T��u�j��F�'�(�����6$ �RE҉�����eV����M;����TF��]��"'���H{2f!$�,O�� ׽�g7I��y�A�(ze:���a��7(��^��-��;y���C��^z-���|�#9�y�o��
Ҧ���g��b�D?���@�%:i��M�-�a�3A�RghYӆ�U�<k�Џq�L�H������.�4Bך#�Y��Z��[���=ӛ�C�?�ANmđs	��(z�l�JV�6D��?��Wԩ�cf�K1It�p7�J2lS]�Y�n햂mm�P���{,���@�ţ�Z�&P���P��5��gZs��`�rN���"툚K^�UF�	@�xv�VM��y�e�v��5��b���d��7�ҹz��hy��ݷ��)9�	Aʟ��f��'�!s?�n��A�^�B���h<}G@�8?*���S��s�+ n��Ǿ�1�x�[\�s��QO�Q�z���da6������#J�a�4*�s��ˮ����OӐ�|�y��H��PO}�{6�	S���{�����Y����<����]+��q'�-�� �M2������QG@ݛ儱s\���@�>̭�(���f��\��c����G�Z��DCFj�5���[�UFX��L��ן:�� �3�C��I�J��y��:R��Q��󭣧�ix�M�o4�'W�St-Y��,;���*'�#C��=��w)~K��I��:|��J���5����xU���Yd?��
L�z���w����p�	m;����<;��4bqn��Rٽ�����ӳ�Z�����O�������=�53�=�i�fO˃}v�����v��е}!��G�(��� g_��{���Z��I[�TďW���BҭP�A�������] ��O�;��,�l7��=8� '�+G�]U�}w����?����(�\��h���r���^���h
�QV�ۇ�������TTF�9�r�ѼV�vĈ�1Hi�h�����xR}d]?�s�l��,��cC�F%��߈n\�yDW�ITNF+�L������n:�l[b���]�?� '~j6}\�bkW?��U��#�ԭ�~�P���!�>H�:�W��j���{���e{�`�Ie���]�o�ϾZ)�%}X�#+N��H���k�mč�[l!���T�} !�x�V��R��kw�!d�i��k�-;���[Z������{$���|o�Y���o�g����;�HM�?�x���W>b��(�d��8{����e�#�8ܿ_�v�{���XȣƒN�w��3g�^wc5����ZDI�H�c�g�@ �C!jOn��^>h�|n�f
�FD�-V����=�; ����x����+�a} �?7�H|����W�'Ӄ���0i|��@����@�I�w�Q�@[�b �ޛ��LV���e����eC��ܼ��mׄdÂ�s��'�h�!�f�#����sa���0kC���1�	0�UQ��!���`K�$�"^�^���	G�;����I�c-���u)/�R�C��
� �f�d/�އ�o��og���U{e�8)_�-�R���C-�<�,JJ�*��o_��,V*'#� BS*`Z+C��.'�2�Q���nuwt��z7bf�G�F���R�ݟ��z�:�Y�e앻t���\����bH�X W�ycu���'|��ܐpߞ�� �|G ��M��'.���~��U�A���ӝeW�f�?�a}@��I%Km�jڀĖ[/A���7(iϹ{�����ߞM�ߟ�ވ����l}���}vx�)m��'�A}��]��'����ő��hT����N\�����&(=ק�?�J&������p@�y�Q���b3���6�]�Ѿ�j{�d����7��)Q�q�~+����6f��fKw8�xG �<Dݵ��][��?17��JH��q��e�q��ן���x�xr��l!�?�p�}ڡ�
��g�+��Md*ūٍ�|��� ��e�CF�����i�]�G]��B�~����`'�4��FP�!����Z��ѫ�_��~�MZN�ImG,����B�B���y��9���5���*�j*M�N�#�A�d�E��C�*�V,�z���W]P=�cj�"52ܮK%�O_��K���>
7Y >��Q�ډj�t����O�J&�S�ޭ�`'�,�~X��j�f��l�����C�6m#�8ǈ�T۽g��>2��I���-DQ�z��=Ѽ�_�]K�:V��#]~#�^W��8�O���!мR\f���s�:x�	�� ���E;�j��rqЌ���nU��%=֗?���������3�US���è�M����i�Vlwo��G��� �"�f��@�:ͻՆ_2O����} ]F4���=(���$�T
�,���6Cc��P\�{���[�����o�a'<C4P��^�藬�S5�U�%��<��<$�փ`�V���U��e�
�U��mx:�w�f�CG$,�MX�ruנ��G�ђ�˴ivo	"oً^��ȩ��F6?�wC�Ŋix�0����;{ܥ�#�"�KM+2�WC��C���B�>�+��>"�g�gL�¹�'�M�6�aH�};#��Lr_ըw9�Ca:�'�4c���i���b���b��8R�?zl���-ϴeM���ᡌ�,˧DF�����.#\>� 'JD(��M4�y��ژ14I�=�}&v8�>�Q���b�=V^��C�����U<{�����/���A��)ci��x�ٝߗՌ���hq*��d�^���S�"�f�|2�)��nEL�5�Fx���*���.�>��K��&���χ����ow�*Y��y��Lp��)?�Ӓ���T��Wh���ԋ7�b:��6��>�@���F��a������co-�8s�{�������ϥ��cb"�'f�9�Zd�-�g�x������RT�[P_k=|#R�F����欁G+AKNa�X�̵F}���A�12��/�>�9 �l
i��Q�2��3�t:�RN�`�*~O�� ~8�����!;ۆ\{�b��;rM��Pޏ��}�M��3ۼ[�mPK�y��~}����0�d'��VsNݐ/F���Z=K��T��v��D����N��?�Ļ�h���̠5{uEL����L��+�t�6��Z��;�!6� ��T,-pͤ���n |(�ۛx�T��<�<+C�y�47���O�x��I�	��&����I|�IZ���bw��:��"�T�-��q�����К�����-e&	�<qNr�Y��Ro)OۈwY`@�?�<5o�a��=���7}ol�N�NIn��{h�trL�����-�2�G��:�L���}��f=����ضe5    �W)��n�|���l�0�ƕ����ِ�*��-u%^���YV�&�5G^~��g�;£?��_v�l�]��W�)`�n��ADV��6R�懑��Iq�ȯ�}��7Py_DK����)p���=�T/��SN7�:i�r�(����Ƽ�5���q��|�/`�rb�&�)���Adze��E����c��Xs @A~��r�<�&(��Wp��
 J���	b�x��_��G����s�a\0��PԮ�*�����0F2�#&������l�Š}����@2�t{o�}�h��`@n<�>�ՙ����۠�>�x�5�䕭~y���A��
��J<�,�<fRC�(�*�f
!!0�:g�oC�?�P�:���S+�u�U^{a������.`��Ͷ�@��=YYJ<i��F�(<q��=Z���ϭ}o�*wY`�j=��$+��6�v����ll�z�z��e�A?�'�xօ%�5Ps��|n`ai�V���ڿ����aN�l�Ejk�X�����P���Y��'�
@�U� R������:vH�>�+��-�:�^�鉢����8��Yv��{����+Ɨ��}����.B���KRU>����L�� B.A)�Y¦e~�/������X�\o�e���ky��U�L�l�e�I����j��P���C�I
����V"E<n-�Cm�^{��*={O�B�Փ�8P겻wj�����9�Z����7蕼`��/C��ǋ\(|/��Qr�!��BQ��m\�֗��+�]�Ȁ���B]Ő;�q�:���\t�%tZE?���Д��Z���uL�l��$[ł {�L� 3�>�PӉ�&�7�q�^��/'GZ �Q��Fk!y���Ð�O���p�ro���tҚߡ����)�!G|A"�����������܌ڭ5��������v-���=3��i��I;ӎڊWD��걃Tƌ�˰,/p뻭_�\Q+��EA�(����b��s��`����۔���P�ܗ$���d@Qĕ�" �Q�i��s�D��=��gLNXu[Z6S��7[�����E����jL����_��?>���_�%
��"w���Om��?����W�����P��������������_?��rl�B�^I�	o�?��e,����������4�T�"���e�>�[j��2�re��:�_������e���_?��g���/�x��(d��p.'��X|܇�{'�Z͍{W�)C��?�\�+�^c�������O��
��l���i����?������S�(�d?�q�#5�S$�6�������������]s���F!~�6f�ϼ@��SZ�Z&���;0�ⳗ���m)�z� ^C�.�x���K�'+B%��,��4�ՓR���>�J�\���ap�M��]o��3�����c�2.�h���&�:E ��Q��t�N��0HLG�e#�Vڀ҈�u���}�6���n|���?�Ax����k��q�Z�k���Mw�����7
��^9�}b����{JċJՐ����C�H)�Pz�¯oF�zR#	ED~[��B��X�Қy�1bLߺM�v��������L-���
�zV'�����BJE6����f�B5B�)�W.�C�&4e���8�����v!����c9�Lڼ�����7�� %���f����?��}��;���/��52�~��o�M�r9��.�|p���'^uX,t��j��I�|����m9~��d��Z��ퟷw�5���j	�045a���v,/��#ǃ�aI��i!�ќ��0bH�Hs"=_{�;�x��+͒N]���gX���)�3�>;��س}y��b+���_O��{��F�>s3����~�j/}S�+�.�:s[T�D� �mx��{�l�̀�c�O�xԙgK��毗Z��N��T�#l(��O)k(��ͼVo��[�6�4y��G�#�
��s�;?O���_�3>SRn�<Ϻj���뉫��Yƀ�.�E����G�u��k�8��+2���F�xu�����l�#�˙&'C&T$��d0O/L��w�;6�.+^�%,����g�s/�P+m�����$�ٷ~��~�����A�r<8��1n�	�(���?�*m�e�|S�w ��g��3OCqq����3�*>�[��6ȵ0�q��O00�����^�BPŢ�Z�Y�����ȱ����b	]�ȹr9�^��Sl��w��EX{�fR�[���{���T� wГ��eL�qu/wa 7`����5#��\�|?p�e�c���J���9�{����3�{�lC��
��8O^�cp>�E�[�n�G$zr�e�jn[�ݶ���y��H�X��z�� ���~/�%Y�����}H��</��r�؋�@v1��҉�䌉���Qv�jw&�943P�5��t�����C��$N?��{���l�P��xK]�҆�U{I�͍��m�z5��4a��:l�Ey����W^����Ǽ����ù<r�'[��4�\���ٛ�X��F����d�I>0�|j�AЭ���c`�, 4�׈.(�B�C[oߙ���쌘|����s��ܠ1�������Q���������x;�����
�}�+�����T�7���4�D���+����i�t�z
�Y|�t~ �f�71��5֔��%F��%3F:�UI��A|`$��*���M=���Ůj�X\�N��l�5)��u�����V��ۋ�oG'� ?���'�[�N��>�H��`�~����H#�I�mx�o0�sΏ��1���m����01�Z��j�[Y����؆?�@�T�oE���\7���k�oJ�Q3�ԾK1�G
������-Ws�Ϣ�|�۴Ny�g_���G ��p�ܓcN���?v����ր@�K��d6g��M�~񓼟��`�t�l�3��I���*�����0Q��S��[��(��F%s��'��Mɋ�;{oT١	�A�lV+=���J $9�h1��+�`���!�n��PHڨM�[O��]�����<Hs>9�M\V7����2���RW�p&j���;�
u�څ��buP�]�$e��8������J������M)�W�Ă�yrL����84/e3@Q�B&�S�ʗ&�y"���þ��bï9��k=�MɻSY�2n�U.���k�\�|ui�(�[n�H�� yGVQ��:bޛ{��+֫Χ��@���/�kr� f>��O�c���} N~���Ij�'dD�c�������G$��A��I��Jr�&�?W����4�95�S�YΆ8PT���N]e��Jͽc]�z���Fv��*�<:�_��x��& w�b���i�Wa�����ߴ�����r�+ؘ���2�w�Vr��d�x������C2��xt^���4������C3G�U.-���5)�w��/<@��M�*6���ۚ&ǲ�_j�k:Ϡq�0	�dBJt~�\��@�v�
�%{��,?g����s+����y���y<�Atr�J����t6ww�j%T�ؼ��?�H�J`��E$�f�/����xr
���2���ߠ��H�K��2�[\�}]W(�������/7^0��8n P�� �ԇ2�{�Q���D��=���EoA�u4#�����ͧЅ�'M�j^�0�w�2F�a��Q��m�t�i��AIN
���zZ?���Q�{4��7��!q�?�趇�Q��T[�}8�,W�N�({��[ְM����u�$JIgvc\qɲ�����ުX�����k��k� g7{)���i?���:D��r�/=C6��u���{`���[�ɥx�n������rh��!X.U�<y�'���|�?y ���'�mF���F|�����&�k����{\�~���z2�i�1�d̹�C�z�jbM$:��v�|��D'R>ɪ;�SP�R����<��۠ �:O0�n���`��'���M�>eXT}�2�C3���k&�3�������:�j�� >,j��    ��foj[�O'v��y�&>|��䲗V��j�ex[�Hei��̤���^s=�����=r���o�5$vt/��ZA�ێ!���._o�W\`���1ƚi[X�:����&)CVN4�.���vco�>e6�7�V�ۯ���-�>{��o�eN�|���(%�&��r��8[�7�}���F��s����,������B^I��} aN��T�9y���<�}���g��2�jI��C�l�
ECB�6T��?�%w��O$$���0N&'VhT�D쇴��57��1�D�OI�[�ҋ���	�6����S�'ܜ���F)HT�Zv�d��x�����7���A�H�^e(��X��۶,ʝ:�E�K�� �P<�̑z�q 2�j�����V#v��X�w9�����Fn:��G���R�N�6o!��'';��6�)��V�Y��LG�âum
ټ���������Q5���M?��`FF'ֈ'xB;���F��ޞ��ΆtQ�e�����#S�9{UA���Cd��6�%Ϻ�k����v ����.��Q��\&����͍y��W��H�wa�����ß`@Τ|2�N�r�����X�S��Y�h_7��㢗��YN�Ε�O�mu�I[,�(�=�.��6��
��T�S,, Ñ�5�*�"���m)��뱨/���xQ������d�B�;Q�V�7�S�n�h�i�8����U暩Y�?�cÎ�u��2�i�uPK�����n�ׇf=��4��^R
�t��� �>+5MZ��#�^&>s���Q�O{IL�yİ�@oX˝�"1���II\���[>2rX���w�Aך�^	�]=ͧ��^I'�bb��V�*AJG�p!��H��˺��Vu>Ռ$Y���zh\i��ܦ$4��V�n�
m~����'�rY,3�M�����f/Dm��M�n��N�T�*����ޭN��0��;����m^�8���գ��6��0�� ���?^ ���E:�/&�/���'$=������I�O��ݩ7l�=�g
��y �����W���T(�H�\O�U&����`x��e���#T������/K��!���#����4?���
(z��>l�')G"�������?� ��A��2u{W����o��fKlE����Fs�a�'���%�7�ǫ���Lb~9�g*ž��z�6͟�p|�t�m'��*%��*U!T����:�*~�&��{����?
����('�d�ղw8���m�`�!P6�$]c�g�+aP�I����w^r.n�(,.w@z��n�l��+��9�t��M�S[u�}x������|B��8���:�@��4#��YA�;����u���� kDs�C�w�f/g��P,)n]zdc�#��T$���O���Z}��[|~ �o�1��W�F�Bn=Ѹ	l-6wP��P�R��S^{�}�@�+'%�GP��Z�A'i������q{��i���)�B'��N^�4���:2�ػ����ό��|���?4v(�[$�<NGP0��T!O�n�&�'���PKɞ�0�(�Ie���8�����C��h]���[����ų�Nⷔ!�R�W:�X̯G.�(��a��-*c���������7�2��������U��f�V�8.��x!�� �s41��4��%n�B�҄�H,?���a���h������!l��.U�.A���AV���#ڳe*��AE�>q��~� �����X���X�H���S�I4�ޏ��-��
)-�}�����,���%從g寑_���=��H:�R���@�9d]��D�2	���A/K4���1H\�3�q5��^��u	i���H��� a��#Ū'.!�T��ե�(^��m��2���u�9�^�"o�n���I�`�1l��3L�~�E�A�g��{d�� @��Yj��)�5|�g[	���ũ]�*��;��������M�ᶟ'Ļ��(���]�"w��[�[�h�o�A`��Ts�`�+-h�5�g�F��^_⿭��/l��_���ܫ՚I��h�wh%��=_Wܐ�Z��|�����[������cV�Q����\�5��}�@[����v:��/�wl쁟��`��b�!l4�fa��ж!�v�އЎ��:� �x�+�hRcd=� q�$R�ڽ�3��O���4�<[��j@��\�]�y+�j�_Zh	n,#Z)I����|�X�o��"�4�]��E��={Vu�����i���9ƫ��I���{)F���'�ߵ>��UDS{��l�¼ԇ�C �O�*즶ڥM��~
=F[4�e��ҹ��z��upv��5�,b�z虰e��ࠌ���\(I
g�%f^�e�s�U1JX�>��ڬ�J�W"�|2	<��!n�kE�%BJ�PTw�U��VT�Q�-�؇���v�������Ć���������'�}4ݣj�T�*}q �J�.��wz���ߕ�����T:i�(���kN�/��h�uЭ
��i�쿲^��':Ts��%��_E� &��'�ײ�Y���}��2�Nj��6?�	 �5��6s��U��E2�w=��U��a3D����	1f��� �����������M�����J��7�^<�*>��L�w/{���n\�ߨ�I��TO�g���CsT��k%ta�/�ؖRI7:�� �~�1��lS|�����R��"`%����rM��Q@�̂�����iז�&B�	.>j��y{߽��5�gy�a�N,��N}������ġ���>��j�����"����㣖�'V1Uk6S�>��wD�g.��_�q�.��Z���PL�O�.r�ؓV(ˇ��\��9�`9�A>��s5�_X�oɻ�_�#"�F7�9���L���~���
�И%�ՙ>�����Ol��/%��A��؃pǾ�ސ�K3�>��)�灮�HH�P��O�8���â���b�a� �y���	配D7K��ρx�w�������޲e��(S�~{g�Q�����y�c�ȫ,4�!�W�"�rjkJ���s��=S��,^��}	au
Yc��+���[.*���f���8���
�x4�5I�a�0K$�I�:
g��ڱ�e�@(d�	bmZ�z��3�D^)�l�&ߕ �|84�1���S(��6-!Ͻ��MT:�k��w�Y��?�O��@��x2��Fm}�{|,��g� -c��;Ӎ��?����ue���N�y�.�%,�6�m�;93{�[Jlc:1$q$����>0|��I,�Y"[��]�@�l��2*S;���XiȪ�eJ��~��zG>?P�F*�p>�1��ͭn�T/�Y���a�J�D�7�lB}!J<q;5*E��P�>ԑ�y��s�D��U��ׇ2�>Qf�&����q���%�7M���4S�u5�/h�����}�2J�3�7!n�Ҥ�J36�ڥ�z��Dzwү�?����!į���BN��T'�\-���x�;���b�1��u����ܖ��9rLEr/��m�oA߸��h�ɣ���TVȱ{�6��!w�;Խ�M����/�A��eY���S�Q�"��eS<?f�7� >��'�yC�����BB3Xa��7R���p�;m�)��J�����!��yWp%��3��p��x	��/1x����UrS�� �T>�	%v��*3;y�f���i��ڞ՘���q=�4\s�ެ�^||x���U�0n��oct+K$�r4ݕ�O�T��rǺ|ȭ�P��mO�)��3kO���į0�[_j�o:K�@��|�����`�!V?�sڜ��d��N���ܹ-��~�����ƸEv���͖���]j�\�QICww�d
�QoQ�����%:��tT��FI4���з�-A?H߻��<ݑ�B:�	��)>g�
c%X)���.2�	I+�{3�n��H����]r�%M����2D�nN�k3H1g���	0P:���U�rw=d�䣅�� VV/�Y�l�y���>U'� �G!6;��s��c V������    d���^��Su^m%|� sM'\�����Bˮ�(�	��usE��Z7�9]�d�-և�O|H'�@K]�>7�
�������WUƳsC^��$&t�^v���$��@L�]��A���!~#
��� ���ib�'��c57�X�x����	Һ��n�� ������ԥי���'�.�Q`�{s�)�Xc4��O���(���%���(���E�b�yB,�1tՎ=�jz>{!�:�T����vz�p��♛�3k�#l��Y8�r�m����k�w|���{��"��a��C�A�)�b���G��_��-!aXѓ�l�X�IRq�7�+5���؍xI�fq��c��a�O��e���%ְ���$�K$Um{�ёa^���'\/��ˤ��*�f�;X��:Ύ������6���ϕ�����.�5'Hɓy\-�dU��z;�p����Cs��!������.�]��Ac=r��3/� �P�	AdB�g���Zcs+��l��� |�6]��:Ae�,�MW���=s���a���5�,���Y��4+����xQ(4Q �r+N�n�~��c=2v���vh�w�jf)@�V����).���[��$'×H
�r�<鱸�x+��kem|�� H<9�e��kF����>�A2jF[���~?��J�Bz�'wYs�B~D�*�5T��Y�9�B��f-���S��cv
�)~���x]a4�H�k�ܷ�zj����'>��8p�5C8���iei?���Çﺾ��{y��Nv���ˉkm�f���m#R�4"uZU����/��^pzc�* ��X�G�9�8o/(�*>fl��B,��z���rљ����œ�%���o���{B�o�Jp�.:^~x�; ���p[����KZސe9�w���}�l ��w���=�co�D�m3�@ujK�ˣ�5l�J]��؅%};��w���OWw<�O:.Vk}	�}�x�x�Y�T���D��;s�;,J>�$EI��tr��%TZ޵f94vEnC��_������ʓ�� �ĺ���r�ʣ#h\�{2�ƴgjߝZ�:���x�i��81ϕ��,#�2�
;��.�"H,��4�f/�4��3) ���A��Dk���[U?�S��!%!����E��0�1��"hI@���c�͡�+Oo���3�5���u){!>�	٪y.�����n�5�2̈́�v���W�����ט��������O(��M�%�F*dT����9��)��ON�EJɳ;����ɕ�ک�� �Zy�(�Հ�xr�Fܴ����;��`9a󱟓ݜ�]wC	j^x:�`�z�ΑՒxA�T��Nu͘���x�ADy�[�e��h�Z�ӍH�xq !u�`k���ųg�s�����*�A�i(E
A�r�z����ѷw#���*�3����Yċ���
xrV�OA��Fґ��}�/��*�1?Y.���aKR��ض{���u��r��T����' k:�W���� >��g�b��B�|��${�S�5�(	�ޯSO�6DL���b2��#�2m:֗��/�&� �T>H�`�#�S��o��s�ɃhI�j�5���k���l�d�-�c��*TZv(�� �V�S:�ǭ��/ �[Oj�[,N/��+���M#��P;[6��ly(�7.?#c>�`	ܖ����>�,��Y'�t�Ւ�gO�.ω8QC\.��r��3s��m���:(z��l�o�t�i'5/�49�
(
�^� ;�;1+�B�
�"f�'���R�0���$�B���-��n�=> �MGi�Aͭ4�x�J�*:1&5^���B�׀�\����򉓏��t�cפ�z7%ho�L+��}*dx�5���+(�Y۠p�2^!������P�����@�z���#�Փ2�<�"]�n#0�Ƴ���̘�L��D&-'��R�^
#�Ȣ%!�(^aD^4l����O(܊�>*%:q3�qu/�����`��ZŃei��aV��'[#���OAH>CY�O�K����R�=ߔ�@�{���N;�GB|��/ɴ��S�������SK_vE�D�� s�2bm��Q�R�f^=�:>�$�;1�Q�擩���@x�F}�98!V�^��"���2�@�x�l�ZY1��"פ1����������ݼvAQ���N�FA`a�%�e�5p�;�m�2oN��u�e��@ؑ&_�y-�
as���8��d��R���2�H�Jo�$Z��#&�����'V��_z���ɴƍrǟ��ZNT�JsH!Wy�>��7i�y�G��� �f6�����S����=`�[ര"D��̟��R����?c�~���p4���t^�a�B���-�+�)�G�J;~���W���_�e����Ϳ����������%���hD�T�_�f>|98��]������o�����Oߙ����Ϧ��O.�-��j!�y)v�]f�1/N�������q��ON=��)g|7��{�`n�>Ry[��`���Rr�sɗ���I�E��-� f�ͽ*n�Ɔ��X���x�e[�>�P�.�`�%�uy����2k,y�~�7�@~�.C!b>�_�u�m�C�;du�j.}�q�gM�_��6V���w�n"�|b��������� ��G*���/Y���������nI�K-nA��K�+�����b�~��u^�2C�
y��[����Vk���&�3%�}:��
j�(֐{-^�C3�	y���	��Dy@�u�IʹB^suٖ7HUn}�4�m=^��a�oR}�?d��{�w1�����Х�C�Ns�����Z�0��vC��� ��%�K�Į�f��p�?8����}�KwȊxp�)N�|"�.>�WֳK�u0�\���m�j��)&�3��g�c ^��W�o�|��\.��s�! �WY���r;�{�_���t��|֍�@�ڎ'7_�5Є��nD7��x%J-�ogA��6�_���n�pp�����h
H�Q�DrW���!����>m����&�a���s�Ruc�P�}�¦Z�W�UҶ�������09�V�>8�9m�6���J�R����ۧ�\=�������A�BX�i�U+�٪��*�Lf1M�	ky~n��%8>7�ә��HYl9�.1�\�6�P�ڬ���c���f~ T�(=2��Q]nC���eëR���ʦV^���o�}_����@�l%��'�h��ZC���\K}E���M�k���r-Ï��:�N��a����F���S��!��n�Y��==ӡ�]�6(�[�~������DC�����-����a�K6'����b#W�L"޳�$^���M�1���t��!�3R �V�8�[i�ݪ�{��6�A�.f~0&**v2��hD�!!��������H��=�`?�PcՃ �-���6�6�DA�Im�G�mV/����/�XF���"�%^7�O7�Qh�ۜ�����R<k�H�>�Ѽ������(k�O�����Gp&�~w��j�$�NR��|��(W)t��*�T�`K�d���)�����ۂ։X���t�{��VC���˜3%N�cF���	&�:v�{6���.n��^�!?ˉ�C�Q�-^҇��A�`C+Z;�gռFGm�%��v��mO��w�2$f�`<_���a0�A�CD�dt6*Cm�:�xdl$�0�4�6:����Z�ķ0����Cք�Pb
-F��v�t�t��2��������J��o{�,Yrd��k�����#.�"%��H����7@r������U�dE����V"��7�AFFDFz�=�L����9cى�v�Awv�PV4�Ъ-�l7�^��!N��Cmy%'"����*aYs����<?=?�#G���9��y[�$��Ms��m%R��)���[�ܬ�毮4Y^+�I�s�u�h��ai���6��흹��-�w����-)�y�W��'�i�#��Sȹ$l�iqg�3c�0�ܤ��|��^ڰ�Ԟ�26�Z� I��E��8���	�0�C����'i�g�k�4��IO    �� �^�7e�ﹻ��C�c�C�G�rTpY[�q�q	_�v���u�wЯyݡט~�B����'e�Pr���X$�$��WZ����I��$�����R�r�8��+m��<� �(u/A[t���O�\^ �z1�Ie�ǄR��޴�Y��i�C�bO��[=�h7��Kn��D9�Z��M�1۞=�4/Z�bδ	|��>�1�8����d=�[/����K��7���6��O3�D\;<�}W8�2rs_�&μ�ռ����Ƃ9�:��^�H�Ju�ԩ��6�_
�x$�{�C�w�ܒh8��Ҥ�!�6�P�U����+8�)���tb^l}T�	V�T�$�O��|�FW)��έ�mm�����]#1���a�HJ���r�s��Z|7���֒/X�TyV;8<Q�ņ��e �V���-��s��W�߷�}$|?���^x��Jk��5vQ�Y}�w����8�,�����
y�S�Y|�@HR�v,N�Gh���x|���F[! 5��kJ����zPwi�9jV:��پ�/�<^K��N�Y��<��@k5�Am��LC�
.'��TX�8�QE���o��κS	I+�-�Հ=L�?m�����Ť���K�g��{i;�\L��k���O���� v�Eb�vͅ\�x>�����TZ�"�.��hC�+=�ҽ�]N�T���ՎNh[��-{$���w�R��\&D��K�y��8f3��Aa�]��kn�gv�-M��1N��M�����F�O*�w�Ն���Q�����:46q�,����ܰط��4ޖ�*�pv�f������cJ��ߥ)ތd�j��j|-:	�k�z��7/�'c��x�ڝ�:����r߂ ��tp�Us[L#�-U��s��e:�Z�f�n���<�[ޞ�����6'h)��T-���{���8��c1[�,�N��;U����r����_a�<Q�-/%�������'&dYZ��/-a(�<NMRwW�l����_�v���~�jC��4�Y����R�������3��'�oЀD`at�p҄�h oJ�U�0�ڴ�� H}���E^� �'f�<XN��>�I��Eg��	�^�l�.�wc�P2��B��<�z�����2���bGa�:?+�ea��k�g�1_�'��֭���U#����{bI�w�,����)~�6���|��h8��F�с;�-'a�e��2�����˳�7p0?$k��v#�� :�g�^�uy<�(����p^�}���O�]�E�zV�!���J��KҲǘ�������Wx�2��'�/�wO���n���|���|L��ʍ��\���V~h�`'�a{�dG��XL֖�UDr�z������
�}�zل�A���q镊W+S���t�N����w|�*������q)�lG�z^ٴ��+z���_�z��5G�����o�w%o'���J�V���1���J+�:M��=��;`sH��'��	:u����$���\�<��} ��I��P���b���'�k��f;�1A��g%��(#��v�O;(�^������e�Y��s��� ��9�ѽ�c3�Ϗ��p,�+�<�|�4MCN	ˊ���w�%:8��^�μ�|�����^���)u$[���T2zugU��r񋠠�QN�y���v��VȆ5�yn-e��N@�Fᗦ��(��
]U�J<:��;�ɼ��kQ�a͑2���s��O��K���Osr��i���r��rՋ���qÜ{�Aԟ�,��@p�SB��9��`9l-�y���o�cPu0Z��u|Z���P��'*%���k.�W�I�T��e��	�����sH4JE/�OLoUgH{���v_c�б�Q��<{��R0x\;!���m�4�D�ʌ3�miq�!mȴ�~8|5��/U����t�Z�;��qM��Z���x�eylxz��`���=�n�=*���C`xnH��+��dh?#�c�Ы�,_.���o�F=="̊�����ysJ��P����g�K��YOJ̲=;�4ś7]�1=[&�����0?o~�
@Ըa *����Z�;bZi�-N�6u���.��T�jG��l�fi���e�j=�T�h�=P�j=���6����I���f`���h�H��9JZ�%������=��ć��t |A�H�<��&�9� z^������K��8�>�<�9�3�����Qw�����-2��'��`x"^��UJ���C���BL%�Z�^�@��(
G��[��-�.O�E��U�&h���J�/���'�����Ω�8uk�<�Qiu������e׃k�����(/5�Pq&q��CM�xU�Tj�g�m_
�G��}3(��(Dg�+�kR����I1A�o���@�%qZ]�����*�KzNu�PsN��?�7db��6��[Je>�Qw�xi���JH!��ގCA]u���A�sZ���7� �Z6����zsxI�@x�lqNˣ��{�����K����cb�:�ˤ�cE�'Sܲ3k\�@@��A���|k>ѸM��Y�X�"P�o�K�_�,[�}~P����[D��uV#��QUL/����&&��-[���?���v�D+��L��f�B��C�=�tns8����Ȧ��\������V��oZR��X��o��\&�G�Y�o���@�_M�Y�I���
��D;�y�s(��ɘt�)���"|)��|2=�k�ΐ,�t����CM��2W��O~��z��B�NW��pRo:�4�	�^
�3Y}��c�Vc�K��30�ɉ⛿�|�.�҇��Vv,�jVr�B�c����������{��#B_^sˈ�R���b^oz���T����`���\�0���C�6��h���)xzѭt>�@��&~Ї)�Pf�9ĥ�?	C��FL�y�q|��u�z�[,f��%m�E��f*Qj��S��8�c�ݵ���h ���/����Uғ�rZ�Կ�QB�R�5'��}_��v��p>y�Z[ze�D]xy��k\�z�)���=e��<ʮBc�}������ZX����@��dq\���hj��}�;�h9�Q�*�%�e%��}G4n3u�s�����z��a��A���&��$���3�Z1/�3���S ^q=|
�8����BҸ�kI�$������Q|���\X$Y�A�5ʪ:�?gFC�ҕ�l5u\d��W�8�z��?/X� '�q�c�8�ʸ�w�s��<ʾN=�~~���4̱l��w�`a�Ě�T:�^3g6�/~��������|�K�gZ[+L,/8��v����.K4���>��G�	��Gwrf�/��֩C��CΞ8���P3��W�EC��y�k����bv�ά��M��Q�W��1�V� q�L�sLK}�h�ٜ.V#�]In1~�/��\`䌫��!����C���D�:�"���s ��(_�ZTNDp�Z3���,��L\�wٜn)�{q����w.�e =��#/6ekp�L�F��4�;��*�T��K}����~O�^��W�9�+c�ōL��������C�����,'�@��W̨IB�)(yA�޵@'�~W��%�������DD O�Y�8�a�/�4�Y���,���( GC>d����5�7u���o�P�P�������䗇�C>��@��d���r��?T{fO7C�سZ̿�S`�̤�|<�Z�b@��y_綋xH�c�����È=�5}��=՚l��4:W�@9i�4/�G	U41)�P���+-;l�i��Z��V�ɬ�n֝��5���P"�����|�y��Ϧ�sNqҭ����U���I�^���N'��T�u�aj��p(��̉�A����K�4����Ĺ2Y��b�=
T�D�I �����BSW��k�V�2Օ�0��r-���)TO�6�h��i��1�8(9�B{;�ge�_ƓR�v��-�u�&��;������&���ކ>H�!�zv������i��=�6f���Ӑ:o�U>m�z����r"�M5��v��]��^�{�d��<}~����\m85���>��rr�ZC��SDrH    �Bx}E�V�G����x@9+/U:�XiV9�d��G7���}ޖ��kB�j��2�YQ"�ZC��b{dI�=p�uꆲ��/���S�����9���iD�d�#9�$��^�=��2P�DЃ��A�f�:�ѩ6u&/=49@T�`�Пmr5O��7��
��>|��r8+��D2	���h_
�t(���ɐ����WBԒzq�]`�]��F�WB���40��䗒��ԇ����D�C�>���W�p�z8�.'WF��z��{��T�m���{��(ߢu�=���9wW_ y{	�!Pn3ɬĵK���j=x���:'��Ɍ���z��L���ex8v3��ei�geP_1=�f�ڨ�%a1H=)��!_9ߤ�݁(ם{���0%9d��ϕ$avʦI!4�Ĺ�ҝ׺Ek��`�G.EN���T�:��%��45i+Qn�d����V:x%N	Wm�j� _����f�˚�J��9��ۖs�[Hy����J�8�����P�8Vw�ux�j��g�w���1�o<�������{�*!a�� �qA�|d��÷0P5=D��Is�Tz`F�ZS'�9���Q{����3��1�h�&�B��i�:�P��ۜI1_{�M!�08B�)1�"jNքo%���$�8a.#���\�Iٚu��� ?��ԇSc;�g�hD�ٵWi%̌WR��F!T�G+~>h��k�[ �MH�K�)v����ӤuRrpr�3o�ϗ��_��P:�Abp��yC��l_kN3�@�c4�}�+3��h��65�wzޞJg��Vgfy�;�k�U��љ��x��^�+�"8��i�[�+��i��k�' ���4X=2�������(������qw��� iX��`!��y��N�&/�љ"���\D&��/�_c�\f���9��AK<e�9�O��m4I�d�l��%C_v����H�x|�HiŬ)P�m-�GSX8����/ �56S�e1����2�s�Y�;Զcv��Wg������Fl�[  뉌��.�6�0.~�j�#���5Z�������z�gFס�I;MH�m��U���]�D�a]��O+ڼV|Q�L�3����*=�zi֪�����ք�A=�$N���@ag��2�f���HDˊ����*�/���q��%<�<c(&�c�\�Hy6Ϫ�nuA�֨�>�����r$�T�j�=Zjv�{0�N/�t8�4|5 8��a���:�����K�Ԧ��;#�݆W�����7�C)β`X�Ĳ���!�V�!�g��D�����NK�mP~- 0TN�>4O�Z�)��W�锲sΰC�������K��<�zPwh��W��r ���$��lR���Ŀ!Z���;Ι�Zx>iO^v�3��Zq^q�~�zɻ�Ɲ9hգ����<\�QC%���k��F����*ګ����pL�e{�[�5X�h�d��y�P��(C����G�h2=�Go\�E�Y����7�0�/���{4�������x�n@ݚ���f���d�ÿ��{(^2F8%y��\��v2�D=�GsI0,|�h\�tl}@�y�s�w@gHu(���#b�A(�{�Q���Ѯ����}(j@�%yAԓ�ު�w*��ɴ�ɗ�Nٳߥ�xՓ�2z)�$�5��a��+I�N�����C/ߐ��P���D�e���<��W8'�ķ�-1���f|����@��8P�Ai]�z�V�a��k��q�P �ٚЀ��Cr:�\S�^�:�@9���iN�ŷ�ܥw�=�NdJhI��Q�6���$�v�Tv������D<�Ӫs�aI,f���5�gK^�ANR9`�/�
���1�V��e`x�Q�|Ӗ!z</��P��<J�yn���).���'9.�O-����#ԯ�����N�"Z������p�P�����	�%YR//U����!�V�n[�u4X��ۭ��ՄF���5�ёE�t�;7Y�KF�5��x�*1  ��4�'ޜ'���G�fI��%�U3zE?��)���Aϸj�"GÑYWސL/�8�ֳ>� �kh���d��z�~/Q��O����ZqL�GR��R����	�ϭ�^{�`�R�Q+C]����΁�P8��f��U"�Κ�?��fz��K� ��5���)���6.�s.Ce�Z�+ ��K�`�����a�Rj���{�\�Fh��z�ǹ_��F�F$�������@3w��5	D�^���J0����6^�|�q_�r�V;z�(iT5g򾆆�����V��0\���yG�N����Мw!U�X=	$�1~l�j&�'��,��J��:��Z� J���������գ�]tv��z��
B����#t�̗��j�?�.Н�G�P8:�^���:%�*�U�$_"���,�l��B h)'$�e�ٜ[�^g��kA=*p�K �q=��ca�\��C�Ǟ �	��C�-�'O�{t���X?A�夓��7Z�a9=YeKc@)ى��k�A�T/��EN�<Tq�EP�S�����yn�Wm��G��E��a���mV�W����Ρ �:u<o���(\��g&�Y��ZQ%��VMܫ5���ӳS��p9��Xin��X3��"�R񰹜:ݻ��
Nܞ?�,�2tưj�b'�X�L|�l��x�ߓ��^�¡Dg��������%w�^[rH��8��6aQ�k��=�����$��@��`��C��3�6v[��`[�.zN�]�|��(�DJ��0M��e	I�<��Pf�b-��9�
�|�@j�=A i��,Y�L������w�����^�'�!�I�j�l�7If���B�&��u�=l�-�U��ގ%�����WR��a9�ϸ$^�xW-��i�km��0��<Q똙
���9��"�P�c�'��ϼ�pM�B���4/�N:�{�m=��Q��Rg*iHv>�e��c�/BAѓ��.��hG,Q���3^�ա�L\v���׳k"��󪂾��N2yuJaat��n{���Ϩ>b@�O<\�x�=C�F-.1<M�p2�>����;^t)D=���
��iܨ��E-Z��l�JTG�1�V�y%LO&f�07�ۿj�g��aH���j��?�Kl�R	�t�)yNT�u�����P4-F��I����}��#��%J�Y(�b�Ԗ��l]��秧_���P,������%tu�R|sI2�=�d�����XBS.��� "փJ˲B^N��΄�N(Ӯ��y٩r��3��d�kN+<cv�8�Au%�k'_����.��M$�����h�?���$�q��%�����P�[Ɇ��z�@��hz^y��B�*f ���:5FY�4D{w���ǜ=|x~oD���h�m��i�ľv6���5����m.��>z	p,d�\���[lX^`�����JIRun��+���V_rq�����3����r����[qpy9�ßXs-Z�[�w��^���[���fm�}N�oi��3L���z��S���L���-�5�r�!��z��͒m�7���9'(�=�V��xa�RN�wFƩҸ��s��8�� �{�~��2�tR���Y/�r��#Ze��H6v��y��ٜ����"��cԒv���Y��� (���=���ȵ\��Jt�)u-���>�W���BK�71D�+5G�
;�rb�^����C4w�}��!�Q�9�lؾ�n!x�	�c2H��9����H�5�1|M�v\��o">�
y ��<)�=Rr�^����!g��e%�B'� �&Z���Ge�'At�]	v�o����*�,���c��V�����pB�=2j�o��4�p�m�g�i���@Z}��'P|D�`���XO~;u;0��U�q�u!��(c��5�S1����.8Ң�p��h3ũV g��-��?B�Ȭ����5G_r�[�)����n�&8����1�vP��ԉ78���,�%1<���u�̷7��C��t��^��m�1S�%�y	�U��C��R��<��h	3��U�if!��q���V�Sz]��o�� |
  �<8,<Nx]y�2��=���0&^S�"��{�M�Mt�>aZN�Z��|SOQI���S�|�i�P9?�L�����P�sM�BT2�ȃ�w��C=�x�5�&Z�r�:?w5�d9�&'�40�����}y��cW����OPH V~8�����)]-�?k�}{��|�Q����' �O��Xf��T(A	]�co�c���u�Ĺ�'(�K�o�C��;��5f�z4����ѱϞI�����Jt2 9K�V��J�H��Z�`m5�� {5��o0��y b9)�����ϕ�u��I��IP����K��� _$F'TJo�)�m<f�3�d��f�D*Ձ�<���)5.�#�b�\N\�rɓKK2bdڃi�.�J�;w�N�z�e� v�Z�Z7��tV��c'OA9]Ո%��R���!Lxs��|"�����2R4��rX�;]ي龇��G ��p̕��^eD.��o����j���� pb��� j�^xNO���E�{&`q>QZa{v���pP��'��B2�&��#g�#5����}��?�H����˫��S�؀9�,�ZK�F�������k�Pɭ�-Ą?!�O<�����̒/Q�<D�HZ&ż��ݢąD�������S�5�T(�Ф�M�����cB8'ނs_ \�HbIcB�;}�l}��_�G[V��q��7&ސs��*�z�_� ��HSQB�ʙVo�W���P����OP��29�Nt(���X�M6G��ڡO�E�ƶl�z�K�o�P���#��̝J�6��Ļ��^ů"N����2��d�,��vҠ��������=ˋ��";U�!�
矗h���o��_���?�?�����?|�ć�O��!x@�
v����[=&i�W)�,D�6�����~�v���o��.�'�V=Ӥk���!H��R��G^�s�WN���#���� ��9<=vܐe������*ӖV���o9,n��Dʑsyez��~s��PC[MTv����F������Q{2u=���Lc\�x#ɦ�M���z�t��@x�;�sI��;G��@L�4Jٟ��|�������ߵ�=�?���ӿ���v�����<,Im��k����.����+$�����������?��������������_�׿������hY��?���(G��d����U�d0��s-��;Fs4$�&�
^���z�~ϐ$�k��YPNl� ��!'J�;I7�D×#��$�����o�ӿ��o�ς���~�a�")�`�#[3�N����~��1+;��tI��> ����u��N��T����Ovj�ж�!�MW��rE��P�Wy���
�ᅹ�HR�N}���v��d�V��z�X���c��w+�(<!�n>8��e�!�������<�7�f�����%���ZN:/��c�j� �'�1��Ds��H`������_�)L���c��������-4�Wz����N���?��~�/��~8_ekv�|/h琠�=F��ݳ�!P�#�����3Gk�8��5����|��:e�Y�Yo�����0�\P�Z&�i	84fsp�z(6�Qꯂ|j?=�sу�'��J'L���*s���C˙�n^�{u_�S1&n)O�Ǥ18�>�&=����y����h�[ ���`��b�m���TK}瞊��&C��ե�'���No��5P���IǑHk�E�'��W-���ixiX�E����ċ/Ǡ�՗��0����<��&��]��e͑=��J�&��(n�"�{�K�y���&y|���膗�=,��(R1�J�-�C��ZR];	��3Ns��O����ry�8i=�0n6��Ni�mF̣s�\;��sm�����\�O�x�%ضsP��H飱��=�i9cT���D�Y�wir��b�d":K��S�n5?�⿷�)��K��m_�^W�߸��4�>�������?V����4F\	vHZ�'����N�����a��̉9�mefH��:�5
O�V2)�FV�tK�1<��.��޽/J�X(^�۶ �`i�5篠�|H㜾j)'�v[�,���a�,������A���gI���B�M�r@j�֋��ʸ��i�gY����R�x z�\���N�
Q���f=im-�^g6z;v��Ѵ���l�<�@_��YO����a���^VA$������s������bE�y���O�8a:ݖu���7t/�6�lG�(9�n�P4$���|3�W��_��_*�I2P�'��D�K8�y���N#���2�`�x^#�5���2\Ǉo*8���6�k��R!6�M	���M�(�7���'3���%�zH�����6��M��Vb\?!�����3t^a�2j���J�i(H=�=�?��RޠC�[m�ԭ�kA�h�Id�����������~�ͧ}�?��_��c���,q����y.�Y���s�Ɠ���ȹ�W���������,'����s[���������-ͥ�9���n5נ�85���))��q����5y��R�:��ko*��Nɫ��y�.7�=B�&n�|�x����|W�c���hA.�M�f:�)A�Vz�iaX��̠��#���g�_g^_����?��?�<�p         s  x���[O�I��?��o���>q7�"x2��#��a A��l2�C����O�[o�O�/�J(��q�y�Ȥ��*�BA�t��(���m�F��-�;W)����0$0�@OQd�r�x		}5JW�����b�^_�N��N��cXM�͙�=v��ʣ*��ݴ�*h&�n��5�Q���D������a�T}?�Ź�,�,���Bf��S�'����J.�-�p!1��0�32U�F�T����rL�H'K&f@`^�=�"4�3�G�g����}���:7���鼵,��Z��z�?ML�ߙθ�P!��9m���1]�F!i��gGq�=k]*&FF �)<2�(�b-�,B�����ɟ����Y�&I������;^4�7S2d���Q�b��d���苇ףp�T�ͻ�b҆������Ξ�?N���;97�>L����sS��8�����v��-r&kMj����H���QA�q�U:+��!r:��d���)ү$��*`�˚�*�)q"��;�*D��;q�F��\4���-�r1��vX�|1���z0���O��n��.���y���_���̘m�:�2æ6�&fH�-�$�M���17Ve�@m�%I!R_@�(Q�Bzg>������j�_��f⺍f�f�Оv/�����:����>~�L�j�@�˼�f��h�Cf� F�Y(&��0��*T\����m�A� �x�^;���CICP��R"�@�t��T���U�v�4�=�o�g�d�� 7���x���r=�?G���ׇ�Ϙ�P3�+a>`ފn3K�\O�d1C��&M��
��%O%4�&e`9Fb�A2Kje*z	�{닮Lt9R�2[(���f��΂�]�h�}g�oˎ:��_��^/��Ѵ����1�����+�I���0��ϘU]�����Vt�9���v��&p����O�	�9�S��?c��)g2�����S+��KrR��<z~��jxbFo��̽��������}r������1�>c6u%ktA���Vtg�i�@�k���������dbʈ���1C�p2|؎\��,2ǒ�F�+�❹9l$69���ϣ	��..�ә��f6i���m�[�Z�-�?�0��R�,pg>���6sFtZ��ͰM�&UP�s�T璒UA�$�lM(T�l6C��L���`���W�Sڰ\�f���ٔ"�$y�;��;��mk��^�/݇nw�>&q��7�gw4������O�3f�unk�J��.�vt����̇ں67��l��%�ò!ER�5�a�K�sBC���@I�$aCU��$�T"��J�%�����a�D-ߙ���T�޶��'���8�-����R��S}z��g�����~��Ցׄ���ͼ�f�^�����ֿl      �   0  x����n+E��3Oe5ꮪ���*���D8�Q|B��8/�
�@,x��m�	�I<' ����Lum�b���z2�H�����{���������6��NN��O?W�U�\�ئ:�1���t��Lesu���h���xb�����>D/��5��+H�7�&J�L��,�[qd�F+@�poB2	�"�JJ�"ӎ��a:�������|��g䕡	ѳ������&�TR����b(l������Hի�z�!DG�|L�;qqXd��Y�>�'��I���ez �h9���\��V���z�Txw��n��gL��36+k&�Ǭ:�:돫5�V���|��z+�|r�ꈦ�	A"&`�"9��6��R�vL�����駼*ƿG+r�%f^�jqܸk���ʠ.¹Fđ���ִ����f�N�J!����˰���l܇��οO4�(++�I�Ezl_��j���r�8�i��I���L�k���}��:GMF�A�YQ�^�y'I�Xd��\��ǹG�%M:�n�~e�$�x랎�65��$^���2AtU+�
b�l�h#e��TX+&�!�@'+��6�(�"���>�i����x���1�A�o���N�:M������(�&Ѥ���-�ͦ�}�(�L;8K��p�8Z<G���S��_�j�Ś�=HS'��)b�6Z�;%W�(Խ'��C��q�Y����F;�a�����v���Gy@;72+��9U��땪Yt\5.���O�+��Σ��YӒ�bB;�HFPrWS��|hRf��5���a�iGs�{v�Y�ٟ�����v�}E�mKz��ќ}9_$�-�{y��z�]�ϯ�����~������O�~������O'w��p�a6Ώ;?t��yST��<�:�����0�Z�8z�n�T��*��Zj��Q5�6Z�R�t�v�`�������'��f�YcB�Y)�"�.�KܟՇ��ؼ�䈦�����"]]���EQ�x\��Pt[�qzR�n:��(�io���8k�$�2�;tU���<~1���'޳��      �      x������ � �      �   �  x���=�G�c�)^��0 ��E���vY��ol�D�|��0 ����QcL0%ٱ��!P롋,z���E �>�/��t�`���7��}����/4È����A�$p����I!4<��2��S@huhm9Hۄ��ڋ�Fj��\���6}�lf�B8l$�"D+�x��J7G%�f�ZZ������zq�I���D��z�]�'	;��W�N�Z[�5�4�6'`Ow��/�l&f[`��|h:��Z��ki/�v�\O/�8�����������h�9dlD[lU�툲Za�Ltg�;?"ؠ�ץ7G�5� ��K�B9+ɏ��f��i��V��K�>�B�+O�ͽ"�3d@�=-�H����:b�t�S��805�t4A~����[���d�����J�/<l{�:�.�	}���a�,z�C�E��8�Scy��<}��w��\#��L���u�U���V;�nŶ��l�;����U��r/��A��/�\���N�i�o"a" �8�ݲ����K�>�卣O(�[���&ΰw�cpU���˪ҕ��g��Z�z����wE�-�֑�!���Q���Z]��5W�4��.F�����<�Mn���㬥��4����{ݶ,�c[L�ɋ˫�-w�cɪnԀǪy�jn�d�ii��^�)Wɽ��;���7E��|��SH���	���m,��K��&���Pd���%�G�̯�A��\|_������c.�iP�tgh��o�����'���v����      �      x������ � �      �      x������ � �      �   y  x�}�An\1���"�0`�V9H��Ʀ�35sŉTu��������cTL`Z�ɩ���$=L`�M�r��	�)�QM�yu��^#���k��\��|���o�󺽽�|�l����F�f�0�k�������J�+���6N ϟ�]6�����S)l&��C�f�T��j�[�̜b�i����-X,�G*=r�Y|٠������Y�%�I���)��B��<k���
b5#92�U;�*{�/����mq<����￤� �'�C� 8�R~ �dZ]zYF��H����V��������KʘW�����HL}��6�����Ţ���[Mh��X���n�'T@�ieʿY����KY���kY�H��Ӿ�T�      �   P  x����N�J���S��QG�]��.@a�B�����mw&�m��Oyf`��9(�b���tU��~]��ەh����IǗ����a:�m�8:�� �7^2L�g�)�l0�E��Ɍ�ƙ$&�d`�o�V���X��6�������I"�sڥ3�#��Ȃ2��N�Rp��PD2;<�f��]�>|�?Y�}�z�r(O��u�ߊ���"
U�*w�����Uȅa�f�I��}n���C�B�E��ƺ������A�>9��F����(7��ZD!JS���FJ�tE7�'.n�f4��\������%��� V��+�������"��}��{ _�kw��kÃ��ST���@�*Ȋ洽�B���o\T��*Z��w!:�{�����Hg�nΡa�"��":]�&���|�6�?T���n��ܞ�v�)�O6+8�EG��*��uE7�'\�'�����j�ƙҭV���$(�,�Lc���Y��)�|�Q9��<��*P��bA	���#�T9T��9���'dN��� ���z�,��"Ēg�~/�5�4U=�����G��sg�}�8�ssdQ��*���-�)�ZQ1}?S��@Aگ�p	�!���U*�h�C�3�����3EzGZwJŒFn�'�x���G���~����v���.ew�)@\�ʢJ(&Z'tVxH̨�Cd���b��$�E�����b��w�������Bq��=��*��[��*�����k�uvB=��=�Z�&z��)�4Ճ��h�s.R#��J��ds{����O�ڸ9Q�DG����"�I�°��x�4�Ĉh��W.����Xt�*e
���D�2#�*�,řiNk�9yS�L�d��i;���NF���t�ݝ1S
��ȴ�3���E�Pr�i�E���B��}�P)o]n2��,�I����Lٺ�b�i}��'��WPLU����1veY5����쥏������{>�$�̵5�S��5�A�i��Yiȸ
��YY<���/N�g��ݧ�C'���n��/��"\W��J/�-��qf�;��;�k�_�p�w�$�,.��xe�0�5B̐	�jȂiَ$��S��1�wO/���vZOO�b�[*�r�#���Ʃ��q�����o��"$�~��x.��S;n�<7������cK���\�p���~sMؠXe�_�'lUb�=���OL���ԛ�l����>5j�������>=��u�/�!�p�K#.�,��h�0yt|�f�KKCL�Y��V�C�r�u�b�!����VPY����?�ܛ�o���*���*QEj�����'�Myt:I˥�����lnϯ�bv�|.{�n�ӽ�+<����[����cb.      �      x������ � �      �      x������ � �      �   K  x�U�ɕ1�{�G�%��?�)Z��}��,�F�����7=��`N�����ML"Zb��)�e�_S<��䋮[N��i�v�Nv8�M�Dn����~�X�[ܡ�F�Ɠ�H���S� �v^Zp�_�W��͆��/*�Z�;rUk��d�9^�æ��#��`���i;/��p�����[�S��5�C�qf�D��͹���Վ�TsF},:�./������7�p�9�U�"QSP�C홆M�D�&hZ��w7�������Î��w^�AŏZu��NM�e5a�s.����*^���I-�V�����ɦ��v��Ϳ�u]����      �   �  x��VMo7=˿b�6Z�3��9-��}i�\r!�$�ƍ�E����:.K�c��3��{��Q�.؂��ǥ�K���ȀM�������1jp�"9�(Z��M�`�.�	�L:�x���~ �N�����\���χ�]���=�7v��TYu�k�ձ��jt���z_�l��N9���������²ĘQ��Fg�9�'�q�~�iXy��Ҝ�	e���,5��T��sd�g).UU7���YoѨ�0��3�O�D��C�G�fo�\�NB�7����J���0j�~�l����aZɤM>��Lw�jݜ�/���O�ٶ����\��Y	�K2B�ʡ�Ut������I]��,0(�'c�W$,3���[��(7� ��g2�E���@ca�K��>5�L��^���#=�����X�e^\Ֆ�3�
9*,	 �Pǆ���%�H+i�j�,��<߆�-A��+0J�����VmCa쑃�� ���U��d��̀t�b[�<�i_�-�7:(T
#3=���]eo�6�}B�Շ�cl%�P�"�a�h���4
��[�g�M3�Lb�D�a��A[�y]S�D����5����ۋ�r*���������d|��d"���D>�~��������TH=����oo�~�q�ؾ�ӯ}yy2�������ͯ�ަ?L����G�j.��T�Km.���Uj�p��cĶ,��=S��&��$Li_��ⁱ�"[��稧hGȚu`g���|�eq��%宍J~	T��f� �u��=�hѻ���b����q��hP���F�X�ts�DK�$�=�:��gY��~�� ;r��b�.j蠈�$[
��ȅ�D0���|t�0����~�(i���� w��F�Ey�w����?;�%�      �      x������ � �      �      x������ � �      �     x��XIs"�>k~����MUe��#�Ģ]~Euw ����cn����������o\�6��a�y����*�:3�\�l��?ފ��g� (��h�rM=�{ьcZ��-���;l�zhܿ��Hu��o���[��~a�{���s	���`����c���?�ݟ����oKMeDX��#R��l���C+2�v.�m:����c�mq�V�����/N:�M*��N��J¦۞.����[wnZ�� _V�����.F�s��A U�֦�N/o����Z$�(�$a!=jT�I.�g�h$#ix�H>q�� ���}�V�͢�û���`�/��X�%Վ��5��|qT�������;����>-��L3X�LM�*�g~��Y�{DN��T�QE��"�CqNiH����#犓���-5�$�,֣O2�t	P��h ���?_񏷽��O��ϟ�]���#(�%e���G*�N�� 9��Ǧ�H���q0Ի/�ҩ/h���>�_�ЯI���I!(�J�lߡ�'A�n� �55Vk �f��[V��%UDz*�Rd�@Z�J}��ԛM���J?��t���= �WK��h8nčCZ<̎{�\�T�����Z�ON�{�w��a!�9�R(jB�����2�BrE�$�NcDɻ�p�0@�g>إ��W��×��:>K�y��ݰ裷͛�lˤIlu{`ҧ7{]���e.g-���\��m2�� o$P�FX��*�(�S���؆`8��:ezE�vI�MD�!NƱ���j���ACr'��
��\��^�����[�c2)��2��y�����c�2�WJ-%9ρ���I	������R��ZP �o@� �&B�Ȑbړ��W��"
%� ����HZ�0�yP�Q��\5F����T7����C}P�Q{P����R)/��YL�/%&j����+���iU)�B����sc��E�^�"(�q'��t���� jL"���(�I��#N+Fm�%�W�'�ٛcM������z؈�w���(���Y]�ʁ��r�z|2�\�g���Ij�cq�#*��L��Tᯰ��ʁ�z�I6���W����11՜2���tY)MH+<j��F�#�2�X�����۽��,^���[����Z2*�����D]��g���p������-��.���K�S�N]Bs|�bطX.�Ig �b|�	���;lK:b��2l��!�;rF7�`�2t�a<Q�
G.Ղ�h��R�[�`��05}2�bWŷ�NP:/T�Q�q[7���#�'h�~�Fe{�Q��R�^�"��G��X	jiF�
s�Y�(p�/R҆�5g$V�1����;�P�z�}7q�gJ�~����s�rv!�Ws�~s*J�훮��tzM��8&�6��oVݹ���eK%�`�sA���|�Rn����B�q�n���ϊ��fY&�F֋R�~��l������h�U�;��>'wݻ������5����Y��>L��ᰁh��Q��7
(���$!�|�L=�ȴ��B�~���{�0�jd�����8As_���F����
�'\�xԈ�B��8��ݡ�7�P����X�A�49��E���I��%��_�]�����H��������}���d��i0,��#P�C��	��ː�2��ʀ���4�ќ�pZֱ��^ލ��5h��PZ�ǵ���������e����_���y���_�~��jқ����M�|�FI��?�>|�f��+      e      x������ � �      �   g   x�M��	�0�s4LI$�D'��sԅ�<cَr�X��Na:�ٱ���'Zs/03��C��T	���e��R�����r��vT���z�݄���ʾ8�      �   -  x�}�Kn�@DמSx5��|z|N��x<'��r@J"�Rn2�Mp��H��zU]�0� *pl;���zO��iS>˱|�C[v�Ӵ��˩���^ˮ��b5hV���ĉ������� y`����U_e��Ңvȝ$�!�s�形��L=�.,�bϑ�� 6�����C熾7sDb�Вv�X�B���M�X!����m�4��e�^�-bw�?Uު��6��Q^�Į1������Z�F'�|�Sv����"s���~T��n�Y7�$��T���`�Xq^]�e�4���Zc�" ��      �   �  x���K��8DתSx?a��G�����1��eI�	Fm�W�d��d��˓ғ��x��&�\�)-�В=S*K�Ŗ����d��y����I��/��1��MڦmM5k�AdL�]�މ�����%��,��F�0тDs�X�>FU�01����Aբ�(s���Ġj�abP��<�j�y�9Պo
�T��h��qmN����T�c�Sm8�yR5�{��^�s��B'���fu�T�� f��2�c�	/s>f�����q���^�T|��I��̔o��D��V��tOO��߉�7��
kٛ>2�xM�e��b{��U�"�A������4a6������ؖ�f��BJの�l�i������S���҃��*Ô\�0�s�%z�������6�H+e�>�kL�Ot[h����ຊ�4�3�"\��:�@Ky[�ئ�
�5�3m� ���N���X��߭��"��Z�Ƈpr���|#ݽcf��MsJ�Z#�0�R_�*VL�k�J	�fGu[�X�vy����P��O��FT�e�\9�jK?f��⯓��da`��������}�ڸ��Y�]������-챠O��	�0��P����(����H	yi�dߑ8@�]m�@<��ľ�t���w�j��u�K������� ��J?8�����|�n�O�$��  ����@]�
�Ҝ'��=W�	�x9�#��Ô`�3C�&��&\��z"S�xx��ɆD��s�ޑ�E~�)/d�3�P}5"��ޜ�m|����,�ko�? ��g��HTl�}���5���Ppe
����w��U��N�9�x�u
�q',S@Jv���@��#@��H���%��h��O���*�V�h�\�j�J�U-Ze�*JѪ|��hU�V1�b�y�h��y�h��y��x�߫`6�sf�=�a6�sfC�fC�fC�f����^�!���!���!������0�9����0�8/0�8/0�8/0�8/0�8/0�8/0�8/0�9�a��0�9�a���۫�O|�[�ޅ�ܤ����{��*�z��*���p*���b*����ʮ�Cn���y����3Tvۀ.�n��x��pJ�nk8%^�5���N��p��븆S�\�)�z��xM�pJ���qJ���w����!�^`      �   �   x�U��	�@����*��n�]XA�I�HD"�TrN7������?�8����'<-��I{4^���b���K�B�V�8�l�j�;r�\
>��'T)Ui�.<^��A���ߦ�(6�G�v�fƘ�\�      o   c  x���k��6�O��[f�_x�9A.��1�9����d�8^;�JyOB�f�AR"A�����5��A��@�{@�����(r߂G�p���9x�=tv������ �{8��t���/��P%F>I��U$�%+��B�.pϤu�r�13���"e���u.2��G�L�����}j� ѽ@:@<2�<[r������?�|�2nk�vu:�2>@8R�5�("~>�M�l:���Ц���`p��BmtB.m��b���}KH�G�.�0�������u,��G�T�E���5O��t���p�az����xt�Hغ�	dȣ�*��iMt?X��y�}�GW��<ڗ��*�qJ4]��Ѭ˦���|mt\�f�q���a�ڀ��kX�-��L����8���?M��l�ݨL�������8R^�m��Y7��2� 
7��A(X:]mL�<o�u�ɽ��8�=4�%�/O����U&N�����oݟ�+���=X�c/JN�LP�r-h\�����
��7(�H�&�r;͗4ud�#�p;-,i��B���^�bA3�Z���󤩤�ߍ�w1���f,r%+�99���,(X�m9ض���%+�4��n�,uܢ.Э��de���^#�!fda�SD_u~8�<	���A~R%�e��t��, �V���a-$ Ns�=w3Ð���£0��e�+<u�o�mih��'�4@�&��עլ3Ƕs~rI��U�}�Ք{�R%��U�h��̣��g���:��R��2��r���>��Ry��Ӳ@u)�R]��`rU��}�3U�@�M�>d��nMQd����:�S擭�ݭ�K�㪻El#�����<�Mަ���V?�m�͹�q!�f�ܤ��C��j.�6�O&3��iH.�`i��`��5�?�(:߷:K�%�[b��C���B��@hk)�b��yf�j�xYE���	��Z�̷f��mD�=�rzz����{�vj� U���]��'dSV$�u�xȩ�V�YmJ���D��%�xSW$�����R/��J��"�[ !^-�n�i_��	����,!K�(�t_}�z<��8 ٭���Eޙwz:�Ғ����r��II��07�E�oC���.��AuY*t"�Uq���H ��U)��Y�����)�*4d�����bK�ڣ�,���fcN���Ȇ!C��P��SK�ox�Lو���!l����R�&1��Y�e��a�p�*45lM�����)�p:7�˯�kـв��e{���p�U�R�&}��]ێ0;d���4��|zR�Dqb��xt�����!Y5�@�dg�:H���Vcc=&�hʳ�e�_�]&
����\M�(��2��+��Jδ������X�LRa;�pC��RR��p^��B�X ����F3d�"c�3��,�>�̉�m\HUh`��H�V&:-i�T��.i �z7��s����T���_������丗���J�yU��C�����Q</�s�DKI�Zr�x��Q����c�=�<_5�J������B�E���?*H*��NɅ�k�K���i��Ф�ș��B�wKf0������ذ+��NԑȻB��ӵf�zo����O��a(�ɒ��E�ǽӮ�� �{�`������t7���m�3���a��S�H�/ō`.�`� c�X8��R��H��ha����/��Z��Ï��*�6�����FtD���R����W��v
0��t�w�1���y���bH3�@[����|��n�S)]̚���z(6ӅI 3}����^q]#��������1ߺ7�,;���<S�+��=������f�q�S�oMt#XJ�#��J�����t�Jn0.2��p��jx�Z�R�W����)���N5h�n�78�~W{w҈��5c��,��^�*d����{�߫�K���@�Y�g5��?i�}ӫ�`Í�fK�끽s�{��<_�ɋmH��o�
,����H��$���`M��->�T���?����[��W��K;6�hM����K[fgI1F-�yWx�l��={���;4�4jk�pZ�I�}��m(m��jh�ӮX�%�4qk�Q��#y�0gyNOOv��zzp�K37:�
�8�uzi�F�6��+*�;�abP�#���%\8���TM�T%Y8!n��ר�����"�+��h���)�-TYR��� iǥ�5��Q��{з��"q��*�\��p�Tc	��#����4-�Z+��$��FWR�6�Z�9�;J�0��|���b��;�kP,�d��Oɕ�F�P�B��=���QyI�d�����R�Z����s]	Z`����h�����V\M\�U���Q��-@���������O��t]Ŗ��w��(P��VXKV�6�4��т�׎ӊ��Ҹ0�� �=K+��p8v��"?�DB�D�Jk�$ۿ��WJi}dG/-�	 �~���K������i�-����r?�����s�!�v�T�AC��K��\BK���F�a��)?�?M�۞����q ���i�>�4)U�VD%�&Re�s���	�N�O/zV���zࠐ��A��ce���D��Q,X�M�񦼡T\p+����/H��r����t�WT��\�є���{�T�~U)ﺏ�3T��K!da�u���9G����}A֍t��֋��,ynKx{����ݳ�?��UK�]�iI]*I���6f=.ΐj.ގ����RJ�������ϧ��=W�� LZs�^a�鳦Ee����d��_� T$;M�v���OjO�T)��#j�wP�R/]Iv��������d3+��͐]di�`+5�T���D{�V�K�W���������s��ŷ��9��9x�q�0mM��.�go���)8$�u�r���w�o ���5g6vZ�j���b&�p8��h!��k"�����;�x��7D�[v�gb�!ȱ/5�&b�r��2c���%����о?�1��d)k9�%U�IdY�]�i�f��~NM0�R�*��r�PaB�O�7x�<��`�i��ΗGu�dc�f���p����C� ;�t�����5����^���+Tߢ&�\,�����_*S��� �X�:SΗFj���3�4A��-Q=�����ħ;��ԢO3� ;V2�ǘ}�����Ϩ)2��W�u���y�2�S���=s����
SZ�p�VY�֢�n#�6�է�z�� 7����+C���֎�����a?ZS�3!9��T�K���+��A^���
�ڂ<��]�K��Ӓ�+2f�~���D���~�B�5a��Z���z��4�o�9} �P�JkW�n�������k���i[���X^����)��|=�z�7�S�@�z-\y:x�*�T�bO�FW���~l���?��	�      �      x��[m�����s���`�	�Y|�A�)iy
�w�*�fh��n�}��D
(�(6(�Cvͫ�D~�Lg�aB� �!�;���J�H���|�r�Mn���~���U�@� ��-kNXw����C����S>>O��������8�B�7�!�&;�A���C~`~Pڪby"����������﯏����ϯ��~x~{}|}���O��߽>==>|���������7�����?��צXYcy o��Ym���rSL�b���)= m Q�bj��M�/j�>�i��� ܀g��`<�o����� �<�6�e?�-��BC��<o���̒�;�|�.���������8�`v X(=P�"�jvp^N�V;��-'F�`�;	1��a��l�+�G�Cd��_�G�j���&o�iū����j�+����ܴT�L΂�e�B��9�e����W~$�@E��2=q3�l������9|Hų�Cx�X�t�������I(��-��[���au����l`�}���Z�_���~�2AUO��nu�5�S���jK,�/�4+�[��Rt#���K�V�]���d���o�dy��IIS����2E���@	�k���n�������<�=��������Y?[V����4z���M��D��������A�����|ʞˊa�?
0h�]{��L��W3�hY�
���,�r(-h.���\W9¾�c7M砰�a�Xf�l�Z��k�0�*�y���I;� ���j����C^?�'�'+��o��ַ�����rO����s�Z2����=~�{�h�ؑ!"Sٴc41��@��������{��Y��*"lԊ�^+���-g{�OXs/wP��;b�(��$4�q�C���g欼"��h��B�������Y����B��qW��d�&�*��-��#/b��r�v���ּ"X��0�V���VUe��)��W����������G���Ѭ���	X,A�:* ]��7ρ���$"��
T�A֑Q�l@�#��� �S��iJ�&��� <�ZX�O��ZW)0��j5��"��$���tE؏��2X��X8���w����1U�97ye��y�/7z#�P��-��IMb���.8�������v��+����C��VY���`?G(���i���#������܃S�#�B��Z�`�	�B���j�K�tEp��YD�������0ybv~�͒��U�Z�=���:Hj�@�	�΀�R�i������Ge4�Z��?���ŉZ�{�k9?w��^�E���«N�81N�YIW���;��H�7g�-_���!8o�%aH�B{���dZ 89�L��F'u�}ut?�S<3&`������B������H\T�)h�U�%rD�l����h�t���l�uE�ֻP)+�?d�Kʰ���S$<(���\`m$��#T.j��x)�͸5�B*��ݖ�"�uJ��\�8 ��V�N1t��P'=Rސs]�?��-�����W�4� ���E��L�	iģA��a;�
��/�SS�{;q� ��7�<[�0J����jİ��2c����0j�㴆�.F6׹[5BqU \���D��^�Z�n+]��	����� ښ`<�)��2��F�*s������Ж?�U����5Bl-C?3�����ц~���	��'p;����?,�(a^=z��,�F�[�tN��P���d�DS]j�f�3�&�y'<8'`�]�0������cIO#�+��K;k��JWPn�MT�u�+��uK�����ﯿN�ǒS|�y����������YG�����ϐ�5N{�ƛ���������@�T�t����/��V���c?�/?����8��k��nb�;:�tq��+Bq�
YW�_C�t]�8 �Z��|�p�8i)����`��Z���p���̿
�|�W(i��'�E MC��S#�9�k]o�b�6~X'�|���8�A��V:�&\�JBx�Z!Vr��N���|Z,ջO��u4�&�؋����S����.'�ltlq�4�FB�8ِy	h��m�byغ\���}�9*�A��1���RE[7�`�M�[�Ђ��}��� �b5��`+��s	C`�cQq������B�N۸���|2NN��:�l�4���4Qx���؎��國3wQ';�a-0nӒꤻ4�U�$��T��*r�h8�.��>Wda	jz/NMMeE(�Y*X8���1�z/�b�^�m�c��X+&B��#!ͳ�t�=���yU�ZB9p�6(�Zm��JB	��}Ӹ,+1�*���(��W:���l��@Gb5Q����':c���|�j�Z�]&�#�"��Q��s��!J�r0q�ܪ����m��@o��P/��퇒�9��`��Y�0-~�ж��a.���+�E��Ps�k����)�i��"8�:	�еߙ&�d�=:6$�`ʁ�B^�����c���!-ʐ��Y|�a�k�o=���2{��-g�f؇�IrYܚ��Φtv"+D�`k�s�ѝ���a�h:,����-���Rf�k��O�yC�xA0S�6�6�eCXs��-L"U���_�0�!�� �v�zu����G�Ab��\ժp��ezb�O�� #�;at]�&e�������>>��o����n^�9��!��Tk^�SҾ-8��wVPWP����c0S�J���������m�����JY��3<O?}�6 �$�=�7E#ȁ�>>����h^!�3˚ �g0MlT���$+�l�����5"x3c-����ۈZ�hM��jD$q�
&ˣ���U�>ЕO�ߌ�,�\�B�պ�Y�z,��4L���.�BPax�d�T|�9���]u�0���U��
A`��4�hi"HA�\��[W��KPV	��3V<f�#t�.�v��+Û8#�A0�yu�����͒F�9H�g8��>��)a[S��u��T*�I��x�t�����tO�[ѱ�v��Q�����:��U�1n�i�����WT�D�f�D����2�j��+j�KX��FB����Om�G��:���Ns��j]��5K�ٸk����U���!DT1粦9������i^��_^�^�v~k��5}����D��1'�̢�s8��!���%�P��15a^1��fY{�)W�s��,G�&�����U�Cy��&X�m��\��9]CӎbEh��JJ��$Ä@+�8�cꣳ��c����"^A�
$}�-Q�:e_���X�@���tŦ�(��e�Z��"�|:� `��I|7<���ˡ�A��<?���??}g�L��}�~�K�Zx.4���`��n$q���m��Р����R�w`}��",U�I��r���Ƃ�(duG�	�r��x�,'�%��e���ak�%�����p'
K*+�>$M}�x!����Q���{�y�%�
K���=�Qt���u�� ��$Ũ�,�' �\�4�C�[^#��+h�"�G
F�R'���(R�N���Y�L���'D�ڃ�BO�MG�`�u=NSpZ�+~��/MX����!ąs�B�L��~ :C�%�Pnd*�H�`L�>���s�o	r��N��_<��\+�2��Ֆ�F�F��Ȅ�Jc���V!�O�2�TÉ�z��DWc���U�c=�&c���y�*�^��X�U����T�	��~��.�|Nyh Ђ�W�k�4��D�"xq�YY��C��(�����C�ʊ�W��U�!��j�ż���8�N��t��l�yE��<f֓S�!N?Y�Uپ�Ƥ���p���g!������g<Bc�Aֳ����崤D機\��> ���W�0�����R*	z��+.�SYCZh�hm�.2���i��'���9&��nr����C�M�c�8�"�����7�Zh&(5Ȑ��9��꒍FXG,�w���aM���YM�|�4k�ɓ���T��LAc��j��ܰDƈ�y-�k^ֵ��y �   �;�?Z#U%���;��_�:'�\y>;3q6TY��?�3;�F9��؇���N"bZ�
�tڠ���V!��>��HaJ@Ї>4�<�v��Aj�R�]jB��g;Ú#�qεd֬fƽ���\������'4�      �   a  x���Mj�0���)�c�G#���	r�ld˂Ҵ^$��@�@/�v�J�7�oS}miiB�BH00��Έ:F@���a�8�0��Շ�v�X���xu!�V����~���zh��z������7����~��u&Δ�$�B`B��)�+ٛ��O��I݄22F>�/SO�wW��z\�7/I�C���:�c�H�J W��0�SQ]R��(� ��'�Q���t�>]������N܌!/��.�U@}L�hЕ��A�$��H��o�i;���?c�c�9���A�0sROi))����(��msl}�?I�C�9��@������m_��l�V���c��? ��e      �   �  x�����0��Ul�!�W-鿎����.g�Y�� R�!��W޵�߻��x��#lÅxH�5��;�&�E<!���-@
��
q����4��yB��Q�h�S��,cz
�hŔ7��|��c����Q61�����MoDDc��ScB*s�f���Ҵ���%B3�y~i�NӑZ , B5�х�9�i,OӝH����J��40�%�S�%� P��\�����n�y˥�3�TW+M�V�io�JC,+$��8�٨�2]����t)����Á��3^��y
�P>��6�¹ �&��}iR��B����B�|����$��j{�w.:C�w$~"z�K��)�-�a+��7H;��]����@Nd��9d&��[]T��\�����r�q~%�_�/��[�����o\�kQ�"�@1�7/}(N��y�R�?��m���{'      �      x������ � �      �      x������ � �      �   �  x�}V�n9}V��?0IQ�|�%Q�l}�=N�����mZ����C��\\��,:��E��t�N�Խ:��k(���$MHr�0��*�%���'����/����r�����y�e�����pTȵ^MH��!�RC=��K.������ .�Tb�M4���o%%�� ��wgYޖ�W=N�����Z�
 \3�J��
R��Xe�v嚠o�����d���:��B�~(6�8�YZ��Q��IB�������������.���V�cC*,�0�t��Q�ȼ]{����`a:�A��8�t��s�x#VF1�7hҌ�z�@���9$�Oo\L�i���U��3;\�^[0�2<c��
v�M0�l�;��V�s�{�h���h�a�J�J����«T��]ܘ�OW�K{� �yT�� f�F��u	I���La�(�~��{��oF̽!g�.�ai&�(�<�3鈺9��,�y���ʍ���v���U�_�OL���l:�|�s������&B�3�>st0��I��1u]�~�i�e�R��<0�(܂G/5����res��zl{j7�ô����5-����3��z2�5�J��+��7m��nW��Ŷ3N�� �n(���z��d�ʈ��%�y.1w�h�0s�����e:տ���(f����+f��׬l��,�cL����}ʻ^�+d�]���.���h�S.P"�d�H�u2�~9��ӷ�I�x�yw���7��J9�a['j�v��f)�
`�U6��f~������!�׮�6S���極�Oź�BV�\5j޶n+(Cc�U���C�!��2����?�p���,�$�Hf�� �+z�0��$�j�����'�����yy��w��EZ�֚�
�d���i��2�
����D���KH��;�����`W��bB���'�Wg��,�:��uTn�A>Q���>�4>��TҊM�bOuޙn�i믺�_��K*k��[/5�BPsU�\��t&6��;�cĊ��1Xz�ܺ�^��["��[��,X�@O�S|�^N������6��l�f�Q^4�j�a	�K�v����Q=q"�����g����~��A�4g�_ׅY�����f��F�����A"�:~�0��~Ao�g,������ӿ՛�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   P   x����,�L��4202�50�54P04�26�2��3�4��4�60��XXZ�Ǘ�$��Ƨ%������  L�      g      x������ � �     