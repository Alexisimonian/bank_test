# frozen_string_literal: true

require 'user'

describe User do
  let(:user){ User.create }

  it 'saves users into db' do
    user
    User.create
    users = User.all
    expect(users.length).to eq(2)
    expect(users.first.id).to eq(user.id)
  end

  it 'can credit account' do
    user.credit(100)
    expect(user.balance).to eq(100)
  end

  it 'can debit account' do
    user.debit(50)
    expect(user.balance).to eq(-50)
  end
end