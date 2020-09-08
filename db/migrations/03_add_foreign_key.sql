\c bank_accounts;

ALTER TABLE transactions ADD COLUMN user_id INTEGER REFERENCES users(id);
ALTER TABLE transactions ADD FOREIGN KEY (user_id) REFERENCES users(id);

\c bank_accounts_test;

ALTER TABLE transactions ADD COLUMN user_id INTEGER REFERENCES users(id);
ALTER TABLE transactions ADD FOREIGN KEY (user_id) REFERENCES users(id);