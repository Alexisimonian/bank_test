# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'can save transactions' do
    first_transac = Transaction.create(credit: 0, debit: 100, balance: -100)
    Transaction.create(credit: 10, debit: 0, balance: 10)
    transac = Transaction.all
    expect(transac.length).to eq(2)
    expect(transac.first).to be_a Transaction
    expect(transac.first.id).to eq(first_transac.id)
  end
end
