## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTE: Need to find a valid Player group number for test
## to proceed
## Need a wager for a ticket
## Use TLC-8 or TLC-10

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestCancelPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestCancelPage
end

RSpec.describe "Admin->Contest->Cancel: Player Cancel Ticket verification test", :adminContest do
  begin
    before(:all) do
      puts "adminContestCancelTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminContestCancel-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Contest tab" do
      adminMenuLinks("Contest").wait_until_present.flash.click
		end

		it "Clicks on the Cancel link" do
			eventMenuLinks("Cancel").wait_until_present.flash.click
		end

		it "Verifies the Player Cancel Ticket Modal" do
			contestCancelPlayerCancelTicketModal.flash
		end

		it "Sets an invalid Group number" do
			playerCancelTicketModalGroupNumberTextField.flash.set ($adminContestCancelPlayerIdInvalid)
      sendKeysEnter
		end

		it "Verifies the No matches found error" do
			verifycontestCancelErrorSearchResults('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild group number" do
      playerCancelTicketModalGroupNumberTextField.flash.click
      sendKeysClear
      playerCancelTicketModalGroupNumberTextField.flash.set ($adminContestCancelPlayerId)
      playerCancelTicketModalGroupNumberTextField.flash.set ($adminContestCancelPlayerId)
      sendKeysEnter
			sendKeysTab
		end

		it "Verifies the valid search result" do
      verifycontestCancelErrorSearchResults('No tickets found to cancel for player TLC-10')
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
