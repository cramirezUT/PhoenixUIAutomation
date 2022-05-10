## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTES: Need to find out how to get exchanges on an account

## Can't complete functionality in Phoenix need a wagering system
## To place a wager and split the wager between two races

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountExchangesPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountExchangesPage
end

RSpec.describe "Admin->Account->Exchanges: Account Exchanges validation", :regression do
  begin
    before(:all) do
      puts "adminAccountExchangesTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminAccountExchanges-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

    it "Clicks on the Exchanges link" do
      eventMenuLinks("Exchanges").wait_until_present.flash.click
    end

		it "Sets an invalid account id" do
			accountExchangesAccountSearchTextField.flash.set ($accountIdInvalid)
			sendKeysEnter
		end

		it "Verifies the account error" do
			verifyAccountExchangesError("A group must be specified! <group id>-<number>")
		end

		it "Sets a vaild account id" do
			accountExchangesAccountSearchTextField.flash.click
			sendKeysClear
      accountExchangesAccountSearchTextField.flash.set ($accountId)
      accountExchangesAccountSearchTextField.flash.set ($accountId)
      sendKeysEnter
			sendKeysEnter
		end

		it "Verifies the valid account id" do
			verifyAccountExchangesWarning("Account has no exchanges!")
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
