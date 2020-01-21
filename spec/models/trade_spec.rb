require 'rails_helper'

RSpec.describe Trade, type: :model do
  it {should belong_to :user_asset}
end
