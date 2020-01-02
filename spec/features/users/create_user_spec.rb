require 'rails_helper'

RSpec.describe 'when i fill in the user registration form', type: :feature do
  before :each do
    @user = User.create(
      email: 'test@email.com',
      username: 'user1',
      password: 'password'
    )

    visit '/register'
  end

  it 'will create new user' do
    fill_in :email, with: 'test1@gmail.org',
    fill_in :username, with: 'user2',
    fill_in :password, with: 'password'

    click_on 'Register'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Welcome, user2!')
  end

  it 'will fail to create user if email is taken' do
    fill_in :email, with: 'test@email.com',
    fill_in :username, with: 'user2',
    fill_in :password, with: 'password'

    click_on 'Register'

    expect(current_path).to eq('/register')
    expect(page).to have_content('Email already taken')
  end

  it 'will fail to create user if username is taken' do
    fill_in :email, with: 'test1@gmail.org',
    fill_in :username, with: 'user1',
    fill_in :password, with: 'password'

    click_on 'Register'

    expect(current_path).to eq('/register')
    expect(page).to have_content('Username already taken')
  end

end
