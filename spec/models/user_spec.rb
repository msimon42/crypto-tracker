require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_assets) }
  it { should have_many(:assets).through(:user_assets) }
end
