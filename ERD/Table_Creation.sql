-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "NFL" (
    "Year" INT,
    "Player" VARCHAR,
    "Age" INT,
    "School" VARCHAR,
    "Height" NUMERIC,
    "Weight" NUMERIC,
    "Sprint_40yd" NUMERIC,
    "Vertical_Jump" NUMERIC,
    "Bench_Press_Reps" INT,
    "Broad_Jump" NUMERIC,
    "Agility_3cone" NUMERIC,
    "Shuttle" NUMERIC,
    "Drafted..tm.rnd.yr." VARCHAR,
    "BMI" NUMERIC,
    "Player_Type" VARCHAR,
    "Position_Type" VARCHAR,
    "Position" VARCHAR,
    "Drafted" VARCHAR
);

CREATE TABLE "School_by_Conference" (
    "School" VARCHAR,
    "Conference" VARCHAR,
    CONSTRAINT "pk_School_by_Conference" PRIMARY KEY (
        "School"
     )
);

ALTER TABLE "NFL" ADD CONSTRAINT "fk_NFL_School" FOREIGN KEY("School")
REFERENCES "School_by_Conference" ("School");

