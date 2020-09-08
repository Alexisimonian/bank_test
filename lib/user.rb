# frozen_string_literal: true

require_relative 'transaction'

class User
  attr_reader :balance, :id

  def initialize(id:)
    @balance = 0
    @id = id
  end

  def credit(amount)
    amount = amount.to_f
    @balance += amount
    Transaction.create(credit: amount, debit: nil, balance: @balance, user_id: @id)
  end

  def debit(amount)
    amount = amount.to_f
    @balance -= amount
    Transaction.create(credit: nil, debit: amount, balance: @balance, user_id: @id)
  end

  def status
    Transaction.display(@id)
  end

  def self.create
    result = DataBaseConnection.query('INSERT INTO users DEFAULT VALUES RETURNING *;')
    User.new(id: result[0]['id'])
  end

  def self.all
    result = DataBaseConnection.query('SELECT * FROM users;')
    result.map do |user|
      User.new(id: user['id'])
    end
  end
end
