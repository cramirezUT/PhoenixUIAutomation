## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountFindPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountFindPage
end

RSpec.describe "Admin->Account->Find: Account find account holder by name", :adminAccount do
  begin
    before(:all) do
      puts "adminAccountFindTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminAccountFind-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
  	    @browser.driver.save_screenshot(screenshot_file)
        sleep 1
        @browser.quit
	    end
	  end

    it "Verifies the main system text in the header menu" do
      isMainSystemTextDisplayed
    end

		it "Clicks on the Admin tab in the main menu" do
			mainMenuLinks("Admin").wait_until_present.flash.click
		end

		it "Clicks on the Account tab" do
      adminMenuLinks("Account").wait_until_present.flash.click
		end

    it "Clicks on the Find link" do
      eventMenuLinks("Find").wait_until_present.flash.click
    end

    it "Sets an invalid first and last name to search" do
      findAccountFirstNameTextField.flash.set ($adminAccountFindFirstNameInvalid)
      sendKeysTab
      findAccountLastNameTextField.flash.set ($adminAccountFindLastNameInvalid)
      sendKeysTab
    end

		it "Clicks on the Search button" do
			findAccountSearchButton.flash.click
		end

		it "Verifies the account Find error" do
			verifyFindAccountErrorSearchResults('No accounts match specified criteria!')
		end

		it "Sets an valid first and last name to search" do
			findAccountFirstNameTextField.flash.click
			sendKeysClear
      findAccountFirstNameTextField.flash.set ($adminAccountFindFirstName)
      findAccountFirstNameTextField.flash.set ($adminAccountFindFirstName)
      sendKeysTab
      findAccountLastNameTextField.flash.click
      sendKeysClear
      findAccountLastNameTextField.flash.set ($adminAccountFindLastName)
      findAccountLastNameTextField.flash.set ($adminAccountFindLastName)
      sendKeysTab
    end

		it "Clicks on the Search button" do
			findAccountSearchButton.flash.click
		end

		it "Verifies the account Find search result" do
			getFindAccountAccountModal.flash
			verifyFindAccountSearchResults('Julie Anchorsteam')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
