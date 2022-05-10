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

RSpec.describe "Buy Ticket from Phoenix application", :regression do
  begin
    before(:all) do
      puts "buyTicketTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/buyUnbuyTicket-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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
			ticketTicketTextField.wait_until_present.flash.set ($buyTicketNumber)
			sendKeysEnter
		end

		it "Clicks on the Buy button" do
			ticketBuyButton.wait_until_present.flash.click
		end

		it "Clicks on the Yes button in Buy Ticket modal" do
			verifyBuyTicketModalIsDisplayed
			buyTicketModalYesButton.flash.click
		end

		it "Verifies the Buy success alert" do
			verifyBuyTicketSuccessAlertIsDisplayed
		end

		it "Clicks on the refresh button" do
			ticketRefreshButton.flash.click
		end

		it "Clicks on the Unbuy button" do
			ticketUnbuyButton.wait_until_present.flash.click
		end

		it "Clicks on the Yes button in Buy Ticket modal" do
			verifyBuyTicketModalIsDisplayed
			buyTicketModalYesButton.flash.click
		end

		it "Verifies the Unbuy success alert" do
			verifyUnbuyTicketSuccessAlertIsDisplayed
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
