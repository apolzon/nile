require "spec_helper"

describe "User Registration" do
  it "allows creation of a new user" do
    visit "/users/new"
    fill_in "user_email", with: "bob"
    fill_in "user_password", with: "asdf"
    fill_in "user_password_confirmation", with: "asdf"
    click_button "Save"
  end
  it "requires name" do
    visit "/users/new"
    click_button "Save"
    page.should have_content "Name can't be blank"
  end
  it "requires email" do
    visit "/users/new"
    click_button "Save"
    page.should have_content "Email can't be blank"
  end
end

describe "User Login" do
  before do
    @user = User.create!(name: "a", email: "b", password: "asdf", password_confirmation: "asdf")
  end

  it "allows login with proper credentials" do
    visit "/sessions/new"
    fill_in "email", with: "b"
    fill_in "password", with: "asdf"
    click_button "Log in"
    page.should have_content "Logged in successfully"
  end
  it "errors on incorrect credentials" do
    visit "/sessions/new"
    fill_in "email", with: "b"
    fill_in "password", with: "jfjfjf"
    click_button "Log in"
    page.should have_content "Invalid email/password"
  end
end