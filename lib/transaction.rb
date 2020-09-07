# frozen_string_literal: true

require_relative '../db_setup.rb'

class Transaction
  attr_reader :id, :date, :credit, :debit, :balance

  def initialize(id:, date:, credit:, debit:, balance:)
    @id = id
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def self.display
    puts 'date || credit || debit || balance'
    self.all.each do |line|
      puts "#{line.date} || #{line.credit} || #{line.debit} || #{line.balance}"
    end
  end

  def self.create(credit:, debit:, balance:)
    result = DataBaseConnection.query("INSERT INTO transactions (credit, debit, balance)
    VALUES ('#{credit}', '#{debit}', '#{balance}')
    RETURNING *;")
    Transaction.new(
    id: result[0]['id'],
    date: result[0]['date'],
    credit: result[0]['credit'],
    debit: result[0]['debit'],
    balance: result[0]['balance']
  )
  end

  def self.all
    result = DataBaseConnection.query('SELECT * FROM transactions;')
    result.map do |transac_details|
      Transaction.new(
      id: transac_details['id'],
      date: transac_details['date'],
      credit: transac_details['credit'],
      debit: transac_details['debit'],
      balance: transac_details['balance']
    )
    end
  end
end
