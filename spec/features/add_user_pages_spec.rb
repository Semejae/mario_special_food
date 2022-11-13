require "rails_helper"

describe "the user registration" do
  it ("allows a user to sign up") do 
    visit new_user_registration_path
    click_on "Sign up"
    fill_in "First name", with: "Anthony"
    fill_in "Last name", with: "Gladden"
    fill_in "user_email", with: "gladden@gmail.com"
    fill_in "user_password", with: "password99"
    fill_in "user_password_confirmation", with: "password99"
    click_button "sign up"
    expect(page).not_to have_content "error."
  end

  it ("allows user to login") do
    User.create!(email: "gladden@gmail.com", password: "password99")
    visit new_user_session_path
    click_on "login"
    fill_in "user_email", with: "gladden@gmail.com"
    fill_in "user_password", with: "password99"
    click_on "login"
    expect(page).not_to have_content "invalid email or password."
  end

  it ("allows a user to logout") do
    User.create!(email: "gladden@gmail.com", password: "password99")
    visit destroy_user_session_path
    expect(page).not_to have_content "error"
  end 
end

describe "allow usern to registration as admin" do
  it ("allows a user to sign up as admin") do 
    visit new_user_registration_path
    click_on "Sign up"
    fill_in "First name", with: "kacie"
    fill_in "Last name", with: "kicinski"
    fill_in "user_email", with: "kicinski@gmail.com"
    fill_in "user_password", with: "password99"
    fill_in "user_password_confirmation", with: "password99"
    click_button "sign up"
    User.where(email: "kicinski@gmail.com").update(admin: true)
  end

  it ("allows admin to login") do
    User.create!(email: "kicinski@gmail.com", password: "password99", admin: true)
    visit new_user_session_path
    click_on "login"
    fill_in "user_email", with: "kicinski@gmail.com"
    fill_in "user_password", with: "password99"
    click_on "login"
    expect(page).not_to have_content "invalid email or password."
  end

  it ("allows a user to logout") do
    User.create!(email: "kicinski@gmail.com", password: "password99")
    visit destroy_user_session_path
    expect(page).not_to have_content "error"
  end 
end