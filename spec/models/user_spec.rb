require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { TestConfiguration.create_example_user }

  it 'has name' do
    expect(user.name).to be_present
  end
  it 'has email' do
    expect(user.email).to be_present
  end
  it 'has password' do
    expect(user.password).to be_present
  end
end