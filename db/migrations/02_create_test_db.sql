CREATE DATABASE bank_accounts_test;

\c bank_accounts;

CREATE TABLE transations(
  id SERIAL PRIMARY KEY,
  date DATE DEFAULT 'CURRENT_DATE',
  credit VARCHAR,
  debit VARCHAR,
  balance VARCHAR,
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY
);