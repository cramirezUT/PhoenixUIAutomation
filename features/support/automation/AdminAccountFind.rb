## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountFindPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountFindPage
end

RSpec.describe "Admin->Account->Find: Account find account holder by name", :regression do
  begin
    before(:all) do
      puts "adminAccountFindTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/filesAccountBlock-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
  	    @browser.driver.save_screenshot(screenshot_file)
        sleep 1
        @browser.quit
	    end
	  end

    it "Verifies the main system text in the header menu" do
      isMainSystemTextDisplayed
    end

		it "Clicks on the Admin tab in the main menu" do
			mainMenuLinks("Admin").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Account tab" do
      adminMenuLinks("Account").wait_until_present.flash(color: ["yellow"]).click
		end

    it "Clicks on the Handle link" do
      eventMenuLinks("Find").wait_until_present.flash(color: ["yellow"]).click
    end

    it "Sets an invalid first and last name to search" do
      findAccountFirstNameTextField.flash(color: ["yellow"]).set ($findAccountFirstNameInvalid)
      sendKeysTab
      # findAccountLastNameTextField.flash(color: ["yellow"]).click
      findAccountLastNameTextField.flash(color: ["yellow"]).set ($findAccountLastNameInvalid)
      sendKeysTab
    end

		it "Clicks on the Search button" do
			findAccountSearchButton.flash(color: ["yellow"]).click
		end

		it "Verifies the account Find error" do
			verifyFindAccountErrorSearchResults('No accounts match specified criteria!')
		end

		it "Sets an valid first and last name to search" do
			findAccountFirstNameTextField.flash(color: ["yellow"]).click
			sendKeysClear
      findAccountFirstNameTextField.flash(color: ["yellow"]).set ($findAccountFirstName)
      findAccountFirstNameTextField.flash(color: ["yellow"]).set ($findAccountFirstName)
      sendKeysTab
      findAccountLastNameTextField.flash(color: ["yellow"]).click
      sendKeysClear
      findAccountLastNameTextField.flash(color: ["yellow"]).set ($findAccountLastName)
      findAccountLastNameTextField.flash(color: ["yellow"]).set ($findAccountLastName)
      sendKeysTab
    end

		it "Clicks on the Search button" do
			findAccountSearchButton.flash(color: ["yellow"]).click
		end

		it "Verifies the account Find search result" do
			getFindAccountAccountModal.flash(color: ["yellow"])
			verifyFindAccountSearchResults('Julie Anchorsteam')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
