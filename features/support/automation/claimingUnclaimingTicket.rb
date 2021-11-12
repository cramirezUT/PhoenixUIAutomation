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

RSpec.describe "Files-Account-Block: Verify the table options in the Displayed Columns modal", :regression do
  begin
    before(:all) do
      puts "claimingTicketTest"
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
			mainMenuLinks('Betting').flash(color: ["yellow"]).click
		end

		it "Clicks on the Ticket sub tab" do
			ticketSubMenuTab().flash(color: ["yellow"]).click()
		end

		it "Sets the ticket number in the Ticket Number text field" do
			ticketTicketTextField.wait_until_present.flash(color: ["yellow"]).set ($ticketNumber)
			sendKeysEnter
		end

		it "Verifies the Operator Ticket info" do
			verifyOperatorTicketNumber
			verifyOperatorTicketPrice(0)
			verifyOperatorTicketType(0)
			verifyOperatorTicketTerminal(0)
			verifyOperatorTicketGroup(0)
			# verifyOperatorTicketDateTime(0)
		end

		it "Clicks on the Claim button" do
			ticketClaimButton.flash(color: ["yellow"]).click()
		end

		it "Sets a reason in the reason text field" do
			claimTicketModalReasonTextField.flash(color: ["yellow"])
			claimTicketModalReasonTextField.set ($claimReason)
		end

		it "Clicks on the Yes button" do
			sendKeysTab
			claimTicketModalYesButton.flash(color: ["yellow"]).click
		end

		it "Verifies the success alert" do
			verifyTicketClaimedAlertIsDisplayed
		end

		it "Click on the Unclaim button" do
			ticketUnclaimButton.wait_until_present.flash(color: ["yellow"]).click
		end

		it "Sets a reason in the reason text field" do
			claimTicketModalReasonTextField.flash(color: ["yellow"])
			claimTicketModalReasonTextField.set ($unclaimReason)
		end

		it "Clicks on the Yes button" do
			sendKeysTab
			claimTicketModalYesButton.flash(color: ["yellow"]).click
		end

		it "Verifies the success alert" do
			verifyTicketClaimedAlertIsDisplayed
		end

	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
