features/support/automation/adminContestStandingsContest.rb ## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminTerminalCouponsPage.rb"
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
  c.include AdminTerminalCouponsPage
  c.include WindowsHelpers
end

RSpec.describe "Admin Terminal Coupons functionality test", :regression do
  begin
    before(:all) do
      $continue = true
      puts "adminTerminalCouponsTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    around(:each) do |example|
      if $continue
        $continue = false
        example.run
        $continue = true unless example.exception
      else
        example.skip
      end
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

		it "Clicks on the Coupons link" do
      eventMenuLinks("Coupons").wait_until_present.flash.click
    end

		it "Verifies Terminal Coupons modal" do
			adminTerminalCouponsModal.flash
		end

		it "Sets an invalid group id in text field" do
			adminTerminalCouponsModalGroupDropdown.flash.click
			adminTerminalCouponsModalGroupSearchTextField.flash.set ($groupIdInvalid)
		end

		it "Verifies the invalid group id error" do
			verifyTerminalCouponsResultError('No matches found')
		end

		it "Sets a valid terminal id in text field" do
			adminTerminalCouponsModalGroupDropdown.flash.click
			adminTerminalCouponsModalGroupDropdown.flash.click
			adminTerminalCouponsModalGroupSearchTextField.flash.set ($groupId)
			sendKeysEnter
			sendKeysTab
		end

		it "Verifies the results modal" do
			adminTerminalCouponsResultModal.flash
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
