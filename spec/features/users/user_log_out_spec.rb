require 'rails_helper'

RSpec.describe 'when i click on the logout button', type: :feature do
  before :each do
    @user = User.create(
      email: 'test@example.com',
      username: 'user123',
      password: 'password'
    )

    visit '/login'

    fill_in :username, with: 'user123'
    fill_in :password, with: 'password'

    click_button 'Log In'
  end

  it 'will end my session and redirect me to home' do
    click_on 'Log Out'

    expect(page).to have_content('Goodbye!')
    expect(page).to have_content('Register')
    expect(page).to have_content('Log In')
  end
end
