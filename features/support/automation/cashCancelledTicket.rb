## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/bettingTicketPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include BettingTicketPage
end

RSpec.describe "Cash Cancelled Ticket from Phoenix application", :regression do
  begin
    before(:all) do
      puts "cashcancelledTicketTest"
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

		it "Clicks on the Betting tab" do
			mainMenuLinks('Betting').flash.click
		end

		it "Clicks on the Ticket sub tab" do
			ticketSubMenuTab().flash.click()
		end

		it "Sets the ticket number in the Ticket Number text field" do
			ticketTicketTextField.wait_until_present.flash.set ($cancelTicketNumber)
			sendKeysEnter
		end

		it "Clicks on the Cancel button" do
			cancelTicketButton.wait_until_present.flash.click
		end

		it "Sets a reason in the reason text field" do
			cancelTicketModalReasonTextField.flash
			cancelTicketModalReasonTextField.set ($cancelVerificationCode)
		end

		it "Clicks on the Yes button" do
			sendKeysTab
			claimTicketModalYesButton.flash.click
		end

		it "Verifies the success alert" do
			verifyTicketClaimedAlertIsDisplayed
		end

		it "Sets the ticket number in the Ticket Number text field" do
			ticketTicketTextField.wait_until_present.flash.set ($cancelTicketNumber)
			ticketRefreshButton.flash.click
		end

		it "Verify ticket button is disabled" do
			verifyTicketButtonIsDisabled
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
