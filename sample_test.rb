require "selenium-webdriver"
require "rspec"

describe "Blog Application" do

  describe "signup to the blog application" do
    it "confirm that a user can successfully sign up" do
      driver = Selenium::WebDriver.for :firefox
      driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

      username_field = driver.find_element(id: "user_username")
      username_field.send_keys("user")

      email_field = driver.find_element(id: "user_email")
      email_field.send_keys("email@test.com")

      password_field = driver.find_element(id: "user_password")
      password_field.send_keys("password")

      submit_button = driver.find_element(id: "submit")
      submit_button.click

      banner = driver.find_element(id: "flash_success")
      banner_text = banner.text
      expect(banner_text).to eq("Welcome to the alpha blog user")

      driver.quit
    end
  end

end