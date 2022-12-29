-- PSS Schema
-- Schema SQL

-- Migration 0

CREATE TYPE public.user_types AS ENUM (
	'INTERNAL',
	'EMPLOYEE',
	'MERCHANT'
);

CREATE TYPE public.employee_type AS ENUM (
	'GUARD',
	'GUNMAN',
	'BOUNCER',
	'SUPERVISOR',
	'HOUSE_KEEPING'
);

CREATE TYPE public.merchant_type as ENUM (
	'F1',
	'F2'
);

CREATE TABLE public.users (
    id character varying NOT NULL,
    type public.user_types,
    username character varying NOT NULL,
	email character varying,
	password character varying NOT NULL
);

CREATE TABLE public.merchant (
	id character varying NOT NULL,
	name character varying,
	email character varying,
	type public.merchant_type,
	"billedAmount" integer,
	"bankId" character varying,
	"userIds" character varying[],
	"siteIds" character varying[],
	"paymentAddress" character varying[],
	"esicPF" json,
	"websiteLink" character varying
);

CREATE TABLE public.employee (
	id character varying NOT NULL,
	"userId" character varying NOT NULL,
	name character varying,
	type public.employee_type,
	salary integer,
	"entryTime" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
	"exitTime" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
	"shiftType" character varying,
	age smallint,
	height smallint,
	weight smallint,
	address character varying,
	"phoneNumber" character varying,
	"adharNumber" character varying,
	"bankId" character varying,
	"merchantIds" character varying[]
);

CREATE TABLE public.bank (
	id character varying NOT NULL,
	"bankName" character varying NOT NULL,
	"accountNumber" character varying,
	"ifscCode" character varying,
	"panNo" character varying,
	"gstinNumber" character varying
);

CREATE TABLE public.site (
	id character varying NOT NULL,
	"merchantId" character varying,
	address character varying,
	"employeeIds" character varying[]
);

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.merchant
    ADD CONSTRAINT merchant_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.merchant
    ADD CONSTRAINT unq_merchant UNIQUE (name);
	
ALTER TABLE ONLY public.users
    ADD CONSTRAINT unq_user UNIQUE (username);
	
ALTER TABLE ONLY public.bank
    ADD CONSTRAINT unq_bank UNIQUE ("accountNumber");

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "employee_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);
	
ALTER TABLE ONLY public.merchant
    ADD CONSTRAINT "merchant_bankId_fkey" FOREIGN KEY ("bankId") REFERENCES public.bank(id);

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "employee_bankId_fkey" FOREIGN KEY ("bankId") REFERENCES public.bank(id);

ALTER TABLE ONLY public.site
    ADD CONSTRAINT "site_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public.merchant(id);

INSERT INTO public.users (id,type,username,email,password) VALUES ('9e9427ac-5352-4b4d-a0ed-7edf9c7d8eb5','INTERNAL','Avirup Sinha','pss81official@gmail.com','abc@124');
INSERT INTO public.users (id,type,username,email,password) VALUES ('5c8b180e-1b36-46a0-83c8-0a42ed1526ae','INTERNAL','Mainak Sinha','pss81official@gmail.com','abc@123');
INSERT INTO public.users (id,type,username,email,password) VALUES ('68503a5f-0a65-458d-85f7-eb5554f003be','INTERNAL','Malay Sinha','pss81official@gmail.com','abc@125');

INSERT INTO public.bank (id,"bankName","accountNumber","ifscCode","panNo","gstinNumber") VALUES ('ad537875-d5bc-48b0-820c-560ee4dfd885','State Bank of India','0188101022992','SBIN00300',NULL,NULL);

INSERT INTO public.merchant (id,name,email,type,"billedAmount","bankId","userIds","siteIds","paymentAddress","esicPF","websiteLink") VALUES ('d72f3f63-b209-4216-baab-955042c3e46f','RUDRA AUTOMART','rudraautomart@rudrahyundai.in','F2','400000','ad537875-d5bc-48b0-820c-560ee4dfd885','{}','{}','{"ushagram asansol-3"}','{}','rudraautomart.com');

-- DROP QUERY
ALTER TABLE employee DROP CONSTRAINT "employee_userId_fkey";
ALTER TABLE merchant DROP CONSTRAINT "merchant_bankId_fkey";
ALTER TABLE employee DROP CONSTRAINT "employee_bankId_fkey";
ALTER TABLE site DROP CONSTRAINT "site_merchantId_fkey";
drop table users;
drop table merchant;
drop table employee;
drop table bank;
drop table site;
drop type user_types;
drop type employee_type;
drop type merchant_type;
