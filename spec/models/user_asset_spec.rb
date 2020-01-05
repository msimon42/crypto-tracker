require 'rails_helper'

RSpec.describe UserAsset, type: :model do
  it {should belong_to(:user)}
  it {should belong_to(:asset)}
end
