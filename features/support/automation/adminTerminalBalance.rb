## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminTerminalBalancePage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"
require_relative "../lib/windows.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AdminTerminalBalancePage
  c.include WindowsHelpers
end

RSpec.describe "Admin Terminal Balance functionality test", :regression do
  begin
    before(:all) do
      puts "adminTerminalBalanceTest"
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

		it "Clicks on the Terminal tab" do
      adminMenuLinks("Terminal").wait_until_present.flash.click
		end

		it "Clicks on the Balance link" do
      eventMenuLinks("Balance").wait_until_present.flash.click
    end

		it "Verifies Terminal Balance modal" do
			adminTerminalBalanceModal.flash
		end

		it "Sets an invalid terminal id in text field" do
			adminTerminalBalanceModalTerminalsTextField.flash.set ($terminalIdInvalid)
			sendKeysTab
		end

		it "Verifies the invalid terminal id error" do
			verifyTerminalBalanceResultError('No terminals found matching ***100!')
		end

		it "Sets a valid terminal id in text field" do
			adminTerminalBalanceModalTerminalsTextField.flash.set ($terminalId)
			sendKeysTab
		end

		it "Verifies the terminal result modal" do
			adminTerminalBalanceResultsModal.flash
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
