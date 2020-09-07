require 'pg'

def set_up_test_db
  p "Setting up test database..."
  connection = PG.connect(dbname: 'bank_accounts_test')
  connection.exec('TRUNCATE acounts;')
end