## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTES: Need to find out how to get a user that does not have
## missing data. And I need to find out how to create more account
## users in order to "Pending" a ticket.

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountPendingPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountPendingPage
end

RSpec.describe "Admin->Account->Pending: Account Pending validation", :regression do
  begin
    before(:all) do
      puts "adminAccountPendingTest"
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

		it "Clicks on the Account tab" do
      adminMenuLinks("Account").wait_until_present.flash.click
		end

    it "Clicks on the Pending link" do
      eventMenuLinks("Pending").wait_until_present.flash.click
    end

    it "Sets an invalid Account Group Number" do
      accountPendingModal.wait_until_present.flash
      accountPendingSearchTextField.wait_until_present.flash.set ($accountGroupIdInvalid)
      sendKeysEnter
    end

		it "Verifies the account Pending error" do
			verifyAccountPendingError('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild account Pending group id" do
			accountPendingModal.wait_until_present.flash
			accountPendingSearchTextField.click
			sendKeysClear
      accountPendingSearchTextField.flash.set ($accountGroupId)
      sendKeysEnter
		end

		it "Verifies the account Pending ticket mdoal" do
			getAccountPendingTicketModal.flash
		end

		it "Clicks on the ticket by index" do
			getAccountPendingTicketModalTicketByIndex(0).flash.click
		end

		it "Verifies Account Pending ticket results" do
			verifyEventTicketResult
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
