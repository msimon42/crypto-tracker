require 'rails_helper'

RSpec.describe 'when I attempt to log in', type: :feature do
  before :each do
    @user = User.create(
      email: 'test@example.com',
      username: 'user123',
      password: 'password'
    )

    visit '/login'
  end

  it 'will successfully log in if credentials are correct' do
    fill_in :username, with: 'user123'
    fill_in :password, with: 'password'

    click_button 'Log In'

    expect(current_path).to eq('/assets')
    expect(page).to have_content('Welcome, user123!')
    expect(page).to have_content('My Assets')
    expect(page).to have_content('Log Out')
  end

  it 'will fail to log in if password is incorrect' do
    fill_in :username, with: 'user123'
    fill_in :password, with: 'asdfsadf'

    click_button 'Log In'

    expect(current_path).to eq('/login')
    expect(page).to have_content('Invalid username or password')
  end
end
