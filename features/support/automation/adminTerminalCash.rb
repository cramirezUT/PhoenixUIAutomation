## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminTerminalCashPage.rb"
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
  c.include AdminTerminalCashPage
  c.include WindowsHelpers
end

RSpec.describe "Admin Terminal Cash functionality test", :regression do
  begin
    before(:all) do
      puts "adminTerminalCashTest"
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

		it "Clicks on the Terminal tab" do
      adminMenuLinks("Terminal").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Cash link" do
      eventMenuLinks("Cash").wait_until_present.flash(color: ["yellow"]).click
    end

		it "Verifies Terminal Cash modal" do
			adminTerminalCashModal.flash(color: ["yellow"])
		end

		it "Sets an invalid terminal id in text field" do
			adminTerminalCashModalTerminalsTextField.flash(color: ["yellow"]).set ($terminalIdInvalid)
			sendKeysTab
		end

		it "Verifies the invalid terminal id error" do
			verifyTerminalCashResultError('No terminals found matching ***100!')
		end

		it "Sets a valid terminal id in text field" do
			adminTerminalCashModalTerminalsTextField.flash(color: ["yellow"]).set ($terminalId)
			sendKeysTab
		end

		it "Clicks on the view count button" do
			adminTerminalCashModalCountViewButton.flash(color: ["yellow"]).click
		end

		it "Verifies the terminal result modal" do
			selectedTerminalsModal.flash(color: ["yellow"])
		end

		it "Closes the Selected Terminals modal" do
			selectedTerminalsModalCloseButton.flash(color: ["yellow"]).click
		end

		it "Clicks on the Balance button" do
			adminTerminalCashModalBalanceButton.flash(color: ["yellow"]).click
		end

		it "Verifies the balance module" do
			adminTerminalCashModuleBalanceModal.flash(color: ["yellow"])
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end