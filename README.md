# Bank Test

## Instructions

* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Running the code

This code uses databases to save transactions made by specific users.  
Therefore, to run the code and its tests, initiate first required tables by typing the code in db/migrations.  

## Running tests

Type `rspec` into the console to run tests.

## Code structure

I have decided to implement a database with a one to many relashionship: one user can have multiple transactions. The reason for doing so is that we can easily access information about all previous transactions made.  
I have decided to implement users to give space to possible additional features related to them. It also allowed me to separate better the responsibilties of classes: User credit and debit the account and keep their account status while Transaction is responsible for saving the transaction into the database and displaying them.

## How it works

`User.create` will create a new User with a unique id.  
We can then call on this user `credit(with_a_amount)` or `debit(with_a_amount)` to credit or debit their account with the specified amount.  
The transaction will automatically be saved into the database.  
To see all transactions made by a specific user, call `status` on it. This command will fetch into the database the transactions this user previously made.  
