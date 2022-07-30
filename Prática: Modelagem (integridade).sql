--(Passo 01) criar database:

CREATE DATABASE "drivenbanck";

--(Passo 02) criar tabelas:

--2.1 table states

  CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL
  )
  
--2.2 table cities
  
  CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
  )
  
--2.3 table customers

  CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "fullName" TEXT UNIQUE NOT NULL,
    "cpf" VARCHAR(11) UNIQUE NOT NULL,
    "email" TEXT NOT NULL,
    "passWord" VARCHAR(22)
  )
  
--2.4 table customerAddresses

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"costomerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
	"street" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" TEXT,
	"postalCode" VARCHAR(8),
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
)

--2.5 table customerPhones

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"costomerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
	"number" VARCHAR(9) NOT NULL,
	"type" TEXT NOT NULL
)

--2.6 table bankAccount

CREATE TABLE "banckAccount" (
	"id" SERIAL PRIMARY KEY,
	"costomerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
	"accountNumber" INTEGER UNIQUE NOT NULL,
	"agency" INTEGER NOT NULL,
	"openDate" TIMESTAMP DEFAULT NOW() NOT NULL,
	"closeDate" TIMESTAMP
)


--2.2 table transations

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"costomerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
	"number" VARCHAR(9) NOT NULL,
	"type" TEXT NOT NULL
)

--2.2 table cities


  
