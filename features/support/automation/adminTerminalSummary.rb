## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminTerminalSummaryPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"
require_relative "../lib/windows.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AdminTerminalSummaryPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Terminal->Summary: Admin Terminal Summary functionality test", :adminTerminal do
  begin
    before(:all) do
      puts "adminTerminalSummaryTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminTerminalSummary-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Summary link" do
      eventMenuLinks("Summary").wait_until_present.flash.click
    end

		it "Verifies Terminal Summary modal" do
			adminTerminalSummaryModal.flash
		end

		it "Sets an invalid group id in text field" do
			adminTerminalSummaryModalGroupsDropdown.flash.click
			adminTerminalSummaryModalGroupsSearchTextField.flash.set ($adminTerminalSummaryGrouplIdInvalid)
		end

		it "Verifies the invalid group id error" do
			verifyTerminalGroupSummaryResultError("No matches found")
		end

		it "Sets a valid group id in text field" do
			adminTerminalSummaryModalGroupsSearchTextField.flash.click
			adminTerminalSummaryModalGroupsSearchTextField.flash.click
			adminTerminalSummaryModalGroupsSearchTextField.flash.set ($adminTerminalSummaryGrouplId)
			sendKeysEnter
			sendKeysTab
		end

		it "Verifies results modal" do
			adminTerminalGroupSummaryResultModal.flash
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
