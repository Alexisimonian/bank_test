# frozen_string_literal: true

require_relative '../db_setup.rb'

class Transaction
  attr_reader :id, :date, :credit, :debit, :balance, :user_id

  def initialize(id:, date:, credit:, debit:, balance:, user_id:)
    @id = id
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
    @user_id = user_id
  end

  def self.display(id)
    puts 'date || credit || debit || balance'
    self.all.each do |line|
      if id.to_s == line.user_id.to_s
        puts "#{line.date} || #{line.credit} || #{line.debit} || #{line.balance}"
        return id
      end
    end
  end

  def self.create(credit:, debit:, balance:, user_id:)
    result = DataBaseConnection.query("INSERT INTO transactions (credit, debit, balance, user_id)
    VALUES ('#{credit}', '#{debit}', '#{balance}', '#{user_id}') RETURNING *;")
    Transaction.new(
    id: result[0]['id'],
    date: result[0]['date'],
    credit: result[0]['credit'],
    debit: result[0]['debit'],
    balance: result[0]['balance'],
    user_id: result[0]['balance']
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
      balance: transac_details['balance'],
      user_id: transac_details['user_id']
    )
    end
  end
end
