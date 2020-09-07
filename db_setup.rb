# frozen_string_literal: true

require './lib/database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DataBaseConnection.setup('bank_accounts_test')
else
  DataBaseConnection.setup('bank_accounts')
end
