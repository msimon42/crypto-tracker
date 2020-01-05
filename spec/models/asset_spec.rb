require 'rails_helper'

RSpec.describe Asset, type: :model do
  it { should have_many(:user_assets) }
  it { should have_many(:users).through(:user_assets) }
end
