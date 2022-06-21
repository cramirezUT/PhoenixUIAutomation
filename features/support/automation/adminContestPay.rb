## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestPayPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestPayPage
end

RSpec.describe "Admin->Contest->Pay: Contest Pay verification test", :adminContest do
  begin
    before(:all) do
      puts "adminContestPayTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminContestPay-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
  	    @browser.driver.save_screenshot(screenshot_file)
        sleep 1
        @browser.quit
	    end
	  end

    it "Admin->Contest->Pay: Verifies the main system text in the header menu" do
      isMainSystemTextDisplayed
    end

		it "Clicks on the Admin tab in the main menu" do
			mainMenuLinks("Admin").wait_until_present.flash.click
		end

		it "Clicks on the Contest tab" do
      adminMenuLinks("Contest").wait_until_present.flash.click
		end

		it "Clicks on the Pay link" do
			eventMenuLinks("Pay").wait_until_present.flash.click
		end

		it "Verifies the Contest Pay Modal" do
			contestPayModal.flash
		end

		it "Sets an invalid Player id in search text field" do
			contestPaySearchTextField.flash.set ($adminContestPayPlayerGroupdIdInvalid)
			sendKeysEnter
			sendKeysTab
		end

		it "Verifies the Group must be specified error" do
			verifyContestPaysError('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild Player id" do
      contestPaySearchTextField.flash.click
			sendKeysClear
      contestPaySearchTextField.flash.set ($adminContestPayPlayerGroupdId)
      sendKeysEnter
		end

		it "Verifies the Player No outstanding tickets error is displayed" do
			verifyContestPaysError('No outstanding unpaid tickets found for player TL1-1')
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
