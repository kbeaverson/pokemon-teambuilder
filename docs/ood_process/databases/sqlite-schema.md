# SQLite Database Schema
This is the database schema for my sqlite database.
```
CREATE TABLE "pokemon" (
	"id"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"dex_num"	INTEGER NOT NULL,
	"type"	TEXT NOT NULL,
	"is_pre_evolution"	INTEGER NOT NULL,
	"weight"	REAL NOT NULL,
	"gender_ratio"	REAL NOT NULL,
	"is_mythical"	INTEGER NOT NULL,
	"is_legendary"	INTEGER NOT NULL,
	"is_max"	INTEGER NOT NULL,
	"is_mega"	INTEGER NOT NULL,
	"mandatory_item_name"	TEXT,
	"base_hp"	INTEGER NOT NULL,
	"base_atk"	INTEGER NOT NULL,
	"base_def"	INTEGER NOT NULL,
	"base_spa"	INTEGER NOT NULL,
	"base_spd"	INTEGER NOT NULL,
	"base_spe"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "moves" (
	"id"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"dex_num"	INTEGER NOT NULL,
	"type"	TEXT NOT NULL,
	"category"	TEXT NOT NULL,
	"target"	TEXT NOT NULL,
	"power"	INTEGER NOT NULL,
	"accuracy"	INTEGER NOT NULL,
	"priority"	INTEGER NOT NULL,
	"pp"	INTEGER NOT NULL,
	"shortDescription"	TEXT NOT NULL,
	"longDescription"	TEXT NOT NULL,
	"has_secondary_effect"	INTEGER NOT NULL,
	"is_multi_hit"	INTEGER NOT NULL,
	"multi_hit_high"	INTEGER,
	"multi_hit_low"	INTEGER,
	"ignores_substitute"	INTEGER NOT NULL,
	"ignores_protect"	INTEGER NOT NULL,
	"bounceable"	INTEGER NOT NULL,
	"bite"	INTEGER NOT NULL,
	"bullet"	INTEGER NOT NULL,
	"contact"	INTEGER NOT NULL,
	"dance"	INTEGER NOT NULL,
	"heal"	INTEGER NOT NULL,
	"powder"	INTEGER NOT NULL,
	"pulse"	INTEGER NOT NULL,
	"punch"	INTEGER NOT NULL,
	"slice"	INTEGER NOT NULL,
	"sound"	INTEGER NOT NULL,
	"wind"	INTEGER NOT NULL,
	"boosted_by_sheer_force"	INTEGER NOT NULL,
	"ohko"	INTEGER NOT NULL,
	"is_z_move"	INTEGER NOT NULL,
	"is_max_move"	INTEGER NOT NULL,
	"is_legal"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "abilities" (
	"id"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"dex_num"	INTEGER NOT NULL,
	"description"	TEXT NOT NULL,
	"blocked_by_neut_gas"	INTEGER NOT NULL,
	"ignored"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "items" (
	"id"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"dex_num"	INTEGER NOT NULL,
	"fling_power"	INTEGER NOT NULL,
	"ignored_by_klutz"	INTEGER NOT NULL,
	"category"	TEXT,
	PRIMARY KEY("id")
);

CREATE TABLE "abilitypools" (
	"pokemon_id"	TEXT NOT NULL,
	"ability_id"	TEXT NOT NULL,
	"is_hidden_ability"	INTEGER NOT NULL,
	PRIMARY KEY("pokemon_id","ability_id"),
	FOREIGN KEY("pokemon_id") REFERENCES "pokemon"("id"),
	FOREIGN KEY("ability_id") REFERENCES "abilities"("id")
);

CREATE TABLE "movepools" (
	"pokemon_id"	TEXT NOT NULL,
	"move_id"	TEXT NOT NULL,
	"is_egg_move"	INTEGER NOT NULL,
	"is_tm_move"	INTEGER NOT NULL,
	"is_levelup_move"	INTEGER NOT NULL,
	"levelup_level"	INTEGER,
	PRIMARY KEY("pokemon_id","move_id"),
	FOREIGN KEY("pokemon_id") REFERENCES "pokemon"("id"),
	FOREIGN KEY("move_id") REFERENCES "moves"("id")
);

CREATE TABLE "regulations" (
	"id"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"is_dynamax_legal"	INTEGER NOT NULL,
	"is_mega_legal"	INTEGER NOT NULL,
	"is_tera_legal"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "regulation_clauses" (
	"id"	TEXT NOT NULL,
	"regulation_id"	TEXT NOT NULL,
	"clause_config"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("regulation_id") REFERENCES "regulations"("id")
);

CREATE TABLE "slots" (
	"id"	TEXT NOT NULL,
	"pokemon_id"	TEXT,
	"move1_id"	TEXT,
	"move2_id"	TEXT,
	"move3_id"	TEXT,
	"move4_id"	TEXT,
	"ability_id"	TEXT,
	"item_id"	TEXT,
	"nature"	TEXT NOT NULL,
	"tera_type"	TEXT,
	"is_gigantamax"	INTEGER NOT NULL,
	"notes"	TEXT,
	"hp_iv"	INTEGER NOT NULL,
	"hp_ev"	INTEGER NOT NULL,
	"atk_iv"	INTEGER NOT NULL,
	"atk_ev"	INTEGER NOT NULL,
	"def_iv"	INTEGER NOT NULL,
	"def_ev"	INTEGER NOT NULL,
	"spa_iv"	INTEGER NOT NULL,
	"spa_ev"	INTEGER NOT NULL,
	"spd_iv"	INTEGER NOT NULL,
	"spd_ev"	INTEGER NOT NULL,
	"spe_iv"	INTEGER NOT NULL,
	"spe_ev"	INTEGER NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("move2_id") REFERENCES "moves"("id"),
	FOREIGN KEY("move3_id") REFERENCES "moves"("id"),
	FOREIGN KEY("ability_id") REFERENCES "abilities"("id"),
	FOREIGN KEY("move4_id") REFERENCES "moves"("id"),
	FOREIGN KEY("item_id") REFERENCES "items"("id"),
	FOREIGN KEY("pokemon_id") REFERENCES "pokemon"("id"),
	FOREIGN KEY("move1_id") REFERENCES "moves"("id")
);

CREATE TABLE "teams" (
	"id"	TEXT NOT NULL,
	"name"	TEXT,
	"description"	TEXT,
	"regulation_id"	TEXT NOT NULL,
	"rental_code"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("regulation_id") REFERENCES "regulations"("id")
);

CREATE TABLE "team_members" (
	"team_id"	TEXT NOT NULL,
	"slot_id"	TEXT NOT NULL,
	PRIMARY KEY("team_id","slot_id"),
	FOREIGN KEY("slot_id") REFERENCES "slots"("id"),
	FOREIGN KEY("team_id") REFERENCES "teams"("id")
);

CREATE TABLE "bank" (
	"slot_id"	TEXT NOT NULL,
	PRIMARY KEY("slot_id")
);
```