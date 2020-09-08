# frozen_string_literal: true

def set_up_test_db
  p 'Setting up test database...'
  DataBaseConnection.query('TRUNCATE transactions RESTART IDENTITY CASCADE;')
  DataBaseConnection.query('TRUNCATE users RESTART IDENTITY CASCADE;')
end
