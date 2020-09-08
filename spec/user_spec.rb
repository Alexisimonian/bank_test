# frozen_string_literal: true

require 'user'

describe User do
  it 'saves users into db' do
    user = User.create
    User.create
    users = User.all
    expect(users.length).to eq(2)
    expect(users.first.id).to eq(user.id)
  end
end