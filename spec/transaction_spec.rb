# frozen_string_literal: true

require 'transaction'
require 'user'

describe Transaction do
  it 'can save transactions' do
    User.create
    first_transac = Transaction.create(credit: 0, debit: 100, balance: -100, user_id: 1)
    Transaction.create(credit: 10, debit: 0, balance: 10, user_id: 1)
    transac = Transaction.all
    expect(transac.length).to eq(2)
    expect(transac.first).to be_a Transaction
    expect(transac.first.id).to eq(first_transac.id)
  end

  it 'displays transactions to corresponding user' do
    User.create
    User.create
    Transaction.create(credit: 10, debit: 0, balance: 10, user_id: 1)
    Transaction.create(credit: 100, debit: 0, balance: 100, user_id: 2)
    expect(Transaction.display(1)).to eq(1)
  end
end
