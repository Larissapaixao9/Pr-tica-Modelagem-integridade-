--Cria tabela customers:
CREATE TABLE custumers(
  id SERIAL PRIMARY KEY,
	"Fullname" TEXT NOT NULL,
	cpf varchar(11) NOT NULL UNIQUE,
	email TEXT NOT NULL,
	PASSWORD TEXT NOT NULL
)

--Cria tabela BankAccount
CREATE TABLE "bankAccount"(
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER REFERENCES custumers(id),
	"accountNumber" INTEGER NOT NULL,
	agency INTEGER NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE NOT NULL
)
--Cria tabela transactions
CREATE TABLE transactions(
  id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER REFERENCES "bankAccount"(id),
	amount NUMERIC NOT NULL ,
	type TEXT NOT NULL,
	time TIME DEFAULT NOW(), 
	description TEXT, 
	cancelled BOOLEAN NOT NULL DEFAULT false
)

--Cria tabela creditCards
CREATE TABLE "creditCards"(
  id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER REFERENCES "bankAccount"(id),
	name TEXT NOT NULL ,
	Number INTEGER NOT NULL,
	"securityCode" VARCHAR(3) NOT NULL, 
	"expirationMonth" VARCHAR(2) NOT NULL, 
	"expirationYear" VARCHAR(4) NOT NULL, 
	password TEXT NOT NULL, 
	"limit" INTEGER NOT NULL
)
--Cria tabela customerPhones
CREATE TABLE "customersPhones"(
  id SERIAL PRIMARY KEY,
	"customerId" INTEGER REFERENCES custumers(id),
	number INTEGER NOT NULL,
	type TEXT NOT NULL
)
--Criar tabela states
CREATE TABLE states(
  id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
)
--Cria tabela cities
CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	"stateId" INTEGER REFERENCES states(id),
	street TEXT NOT NULL,
	number INTEGER NOT NULL, 
	complement TEXT NOT NULL,
	"postalCode" INTEGER NOT NULL,
	"cityId" INTEGER REFERENCES cities(id)
)
--Cria tabela CustomerAddresses
CREATE TABLE "customersAddresses"(
  id SERIAL PRIMARY KEY,
	"customerId" INTEGER REFERENCES custumers(id),
	street TEXT NOT NULL,
	number INTEGER NOT NULL, 
	complement TEXT NOT NULL,
	"postalCode" INTEGER NOT NULL,
	"cityId" INTEGER REFERENCES cities(id)
)