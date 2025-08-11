# Supabase Database Schema
This is the database schema for my supabase database.
```
-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.abilities (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  name text NOT NULL,
  dex_num smallint NOT NULL,
  description text NOT NULL,
  blocked_by_neut_gas boolean NOT NULL,
  ignored boolean NOT NULL,
  CONSTRAINT abilities_pkey PRIMARY KEY (id)
);
CREATE TABLE public.abilitypools (
  pokemon_id uuid NOT NULL,
  ability_id uuid NOT NULL,
  is_hidden_ability boolean NOT NULL,
  CONSTRAINT abilitypools_pkey PRIMARY KEY (pokemon_id, ability_id),
  CONSTRAINT abilitypools_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.abilities(id),
  CONSTRAINT abilitypools_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id)
);
CREATE TABLE public.bank (
  user_id uuid NOT NULL,
  slot_id uuid NOT NULL,
  CONSTRAINT bank_pkey PRIMARY KEY (user_id, slot_id),
  CONSTRAINT bank_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id),
  CONSTRAINT bank_slot_id_fkey FOREIGN KEY (slot_id) REFERENCES public.slots(id)
);
CREATE TABLE public.items (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  name text NOT NULL,
  dex_num smallint NOT NULL,
  fling_power smallint NOT NULL,
  ignored_by_klutz boolean NOT NULL,
  category json,
  CONSTRAINT items_pkey PRIMARY KEY (id)
);
CREATE TABLE public.movepools (
  pokemon_id uuid NOT NULL,
  move_id uuid NOT NULL,
  is_egg_move boolean NOT NULL,
  is_tm_move boolean NOT NULL,
  is_levelup_move boolean NOT NULL,
  levelup_level smallint,
  CONSTRAINT movepools_pkey PRIMARY KEY (pokemon_id, move_id),
  CONSTRAINT movepools_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id),
  CONSTRAINT movepools_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id)
);
CREATE TABLE public.moves (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  name text NOT NULL,
  dex_num smallint NOT NULL,
  type json NOT NULL,
  category text NOT NULL,
  target text NOT NULL,
  power smallint NOT NULL,
  accuracy smallint NOT NULL,
  priority smallint NOT NULL,
  pp smallint NOT NULL,
  short_description text NOT NULL,
  long_description text NOT NULL,
  has_secondary_effect boolean NOT NULL,
  is_multi_hit boolean NOT NULL,
  multi_hit_high smallint,
  multi_hit_low smallint,
  ignores_substitute boolean NOT NULL,
  ignores_protect boolean NOT NULL,
  bounceable boolean NOT NULL,
  bite boolean NOT NULL,
  bullet boolean NOT NULL,
  contact boolean NOT NULL,
  dance boolean NOT NULL,
  heal boolean NOT NULL,
  powder boolean NOT NULL,
  pulse boolean NOT NULL,
  punch boolean NOT NULL,
  slice boolean NOT NULL,
  sound boolean NOT NULL,
  wind boolean NOT NULL,
  boosted_by_sheer_force boolean NOT NULL,
  ohko boolean NOT NULL,
  is_z_move boolean NOT NULL,
  is_max_move boolean NOT NULL,
  CONSTRAINT moves_pkey PRIMARY KEY (id)
);
CREATE TABLE public.pokemon (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  name text NOT NULL,
  dex_num smallint NOT NULL,
  type json NOT NULL,
  is_pre_evolution boolean NOT NULL,
  weight real NOT NULL,
  gender_ratio smallint NOT NULL,
  is_mythical boolean NOT NULL,
  is_legendary boolean NOT NULL,
  is_max boolean NOT NULL,
  is_mega boolean NOT NULL,
  mandatory_item_name text,
  base_hp smallint NOT NULL,
  base_atk smallint NOT NULL,
  base_def smallint NOT NULL,
  base_spa smallint NOT NULL,
  base_spd smallint NOT NULL,
  base_spe smallint NOT NULL,
  CONSTRAINT pokemon_pkey PRIMARY KEY (id)
);
CREATE TABLE public.regulation_clauses (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  regulation_id uuid NOT NULL,
  clause_config json,
  CONSTRAINT regulation_clauses_pkey PRIMARY KEY (id),
  CONSTRAINT regulation_clauses_regulation_id_fkey FOREIGN KEY (regulation_id) REFERENCES public.regulations(id)
);
CREATE TABLE public.regulations (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  name text NOT NULL,
  is_dynamax_legal boolean NOT NULL,
  is_mega_legal boolean NOT NULL,
  is_tera_legal boolean NOT NULL,
  CONSTRAINT regulations_pkey PRIMARY KEY (id)
);
CREATE TABLE public.slots (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  pokemon_id uuid,
  move1_id uuid,
  move2_id uuid,
  move3_id uuid,
  move4_id uuid,
  ability_id uuid,
  item_id uuid,
  tera_type json,
  is_gigantamax boolean,
  notes text,
  nature text NOT NULL,
  hp_iv smallint NOT NULL,
  hp_ev smallint NOT NULL,
  atk_iv smallint NOT NULL,
  atk_ev smallint NOT NULL,
  def_iv smallint NOT NULL,
  def_ev smallint NOT NULL,
  spa_iv smallint NOT NULL,
  spa_ev smallint NOT NULL,
  spd_iv smallint NOT NULL,
  spd_ev smallint NOT NULL,
  spe_iv smallint NOT NULL,
  spe_ev smallint NOT NULL,
  CONSTRAINT slots_pkey PRIMARY KEY (id),
  CONSTRAINT slots_move3_id_fkey FOREIGN KEY (move3_id) REFERENCES public.moves(id),
  CONSTRAINT slots_move2_id_fkey FOREIGN KEY (move2_id) REFERENCES public.moves(id),
  CONSTRAINT slots_move4_id_fkey FOREIGN KEY (move4_id) REFERENCES public.moves(id),
  CONSTRAINT slots_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.abilities(id),
  CONSTRAINT slots_move1_id_fkey FOREIGN KEY (move1_id) REFERENCES public.moves(id),
  CONSTRAINT slots_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id),
  CONSTRAINT slots_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id)
);
CREATE TABLE public.team_members (
  team_id uuid NOT NULL,
  slot_id uuid NOT NULL,
  CONSTRAINT team_members_pkey PRIMARY KEY (team_id, slot_id),
  CONSTRAINT team_members_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id),
  CONSTRAINT team_members_slot_id_fkey FOREIGN KEY (slot_id) REFERENCES public.slots(id)
);
CREATE TABLE public.teams (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  name text,
  regulation_id uuid,
  description text,
  rental_code text,
  CONSTRAINT teams_pkey PRIMARY KEY (id),
  CONSTRAINT teams_regulation_id_fkey FOREIGN KEY (regulation_id) REFERENCES public.regulations(id)
);
CREATE TABLE public.user_teams (
  user_id uuid NOT NULL,
  team_id uuid NOT NULL,
  CONSTRAINT user_teams_pkey PRIMARY KEY (user_id, team_id),
  CONSTRAINT user_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id),
  CONSTRAINT user_teams_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id)
);
```