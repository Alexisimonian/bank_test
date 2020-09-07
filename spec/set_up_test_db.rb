def set_up_test_db
  p "Setting up test database..."
  DataBaseConnection.query('TRUNCATE transactions RESTART IDENTITY CASCADE;')
end