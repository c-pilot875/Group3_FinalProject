-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "NFL" (
    "Year" INT   NOT NULL,
    "Player" VARCHAR   NOT NULL,
    "Age" INT   NOT NULL,
    "School" VARCHAR   NOT NULL,
    "Height" FLOAT   NOT NULL,
    "Weight" FLOAT   NOT NULL,
    "Sprint_40yd" FLAOT   NOT NULL,
    "Vertical_Jump" FLOAT   NOT NULL,
    "Bench_Press_Reps" INT   NOT NULL,
    "Broad_Jump" FLOAT   NOT NULL,
    "Agility_3cone" FLOAT   NOT NULL,
    "Shuttle" FLOAT   NOT NULL,
    "Drafted..tm.rnd.yr." VARCHAR   NOT NULL,
    "BMI" FLOAT   NOT NULL,
    "Player_Type" VARCHAR   NOT NULL,
    "Position_Type" VARCHAR   NOT NULL,
    "Position" VARCHAR   NOT NULL,
    "Drafted" VARCHAR   NOT NULL
);

CREATE TABLE "Teams_by_Conference" (
    "School" VARCHAR   NOT NULL,
    "Conference" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Teams_by_Conference" PRIMARY KEY (
        "School"
     )
);

ALTER TABLE "NFL" ADD CONSTRAINT "fk_NFL_School" FOREIGN KEY("School")
REFERENCES "Teams_by_Conference" ("School");

