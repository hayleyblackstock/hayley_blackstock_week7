require 'rails_helper'

describe 'Users can CRUD Courses' do

  scenario 'Users can add Course' do
    visit '/'

    click_on 'signup'

    fill_in 'user[user_name]', with: "Hayley"
    fill_in 'user[password]', with: "duck"
    fill_in 'user[about]', with: "test"
    click_on 'Register'

    click_on 'Course List'
    click_on 'Add Course'

    fill_in 'course[title]', with: "Test"

    click_on 'Create Course'

    expect(page).to have_content("Welcome to the list of Courses")
  end

  scenario 'Users can edit Course' do
    visit '/'

    click_on 'signup'

    fill_in 'user[user_name]', with: "Hayley"
    fill_in 'user[password]', with: "duck"
    fill_in 'user[about]', with: "test"
    click_on 'Register'

    click_on 'Course List'
    click_on 'Add Course'

    fill_in 'course[title]', with: "Test"

    click_on 'Create Course'

    click_on 'Update Course'
    fill_in 'course[title]', with: "Test2"

    click_on 'Update Course'

    expect(page).to have_content("Test2")
  end

  scenario 'User can delete Course' do
    visit '/'

    click_on 'signup'

    fill_in 'user[user_name]', with: "Hayley"
    fill_in 'user[password]', with: "duck"
    fill_in 'user[about]', with: "test"
    click_on 'Register'

    click_on 'Course List'
    click_on 'Add Course'

    fill_in 'course[title]', with: "Test"

    click_on 'Create Course'

    click_on 'Delete Course'

    expect(page).to have_content("Welcome to the list of Courses")
  end

  scenario 'User can view show page of a Course' do
  visit '/'

  click_on 'signup'

  fill_in 'user[user_name]', with: "Hayley"
  fill_in 'user[password]', with: "duck"
  fill_in 'user[about]', with: "test"
  click_on 'Register'

  click_on 'Course List'
  click_on 'Add Course'

  fill_in 'course[title]', with: "Test"

  click_on 'Create Course'

  click_on 'Test'

  expect(page).to have_content("Day or Night")
  expect(page).to have_content("Title")

end

end
