require 'rails_helper'

describe 'Users can login with only a valid username ' do

  scenario 'Users can login' do
    visit '/'

    click_on 'signup'

    fill_in 'user[user_name]', with: "Hayley"
    fill_in 'user[password]', with: "duck"
    fill_in 'user[about]', with: "test"
    click_on 'Register'

    expect(page).to have_content("Students")
  end

  scenario 'Users cannot login with a duplicate user name' do
    visit '/'

    click_on 'signup'

    fill_in 'user[user_name]', with: "Hayley"
    fill_in 'user[password]', with: "duck"
    fill_in 'user[about]', with: "test"
    click_on 'Register'

    click_on 'signout'

    click_on 'signup'

    fill_in 'user[user_name]', with: "Hayley"
    fill_in 'user[password]', with: "duck"
    fill_in 'user[about]', with: "test"
    click_on 'Register'

    expect(page).to have_content("User name")
end


end
