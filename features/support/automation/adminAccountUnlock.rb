## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountUnlockPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountUnlockPage
end

RSpec.describe "Account Unlock verification test", :regression do
  begin
    before(:all) do
      puts "adminAccountUnlockTest"
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
			mainMenuLinks("Admin").wait_until_present.flash.click
		end

		it "Clicks on the Account tab" do
      adminMenuLinks("Account").wait_until_present.flash.click
		end

		it "Clicks on the Unlock link" do
			eventMenuLinks("Unlock").wait_until_present.flash.click
		end

		it "Sets an invalid Event id" do
			accountUnlockSearchTextField.wait_until_present.flash.click
      accountUnlockSearchTextField.flash.set ($accountIdInvalid)
			accountUnlockSearchButton.flash.click
		end

		it "Verifies the No matches found error" do
			verifyAccountUnlockErrorSearchResults('A group must be specified! <group id>-<number>')
		end

		it "Sets the Event id" do
      accountUnlockSearchTextField.flash.click
			accountUnlockSearchTextField.flash.click
      accountUnlockSearchTextField.flash.set ($accountId)
      accountUnlockSearchButton.flash.click
			accountUnlockSearchButton.flash.click
		end

		it "Verifies the Unlocked icon" do
			verifyAccountUnlockIcon
		end

		it "Verifies the valid search result" do
      verifyAccountUnlockSearchResultsView
			accountUnlockLockedAccountsCloseButton.flash.click
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
