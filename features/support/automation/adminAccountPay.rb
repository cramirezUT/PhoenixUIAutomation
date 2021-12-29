## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTES: Need to find out how to get a user that does not have
## missing data. And I need to find out how to create more account
## users in order to "pay" a ticket.

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountPayPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountPayPage
end

RSpec.describe "Admin->Account->Pay: Account Pay Ticket validation", :regression do
  begin
    before(:all) do
      puts "adminAccountPayTest"
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

		it "Clicks on the Account tab" do
      adminMenuLinks("Account").wait_until_present.flash(color: ["yellow"]).click
		end

    it "Clicks on the Pay link" do
      eventMenuLinks("Pay").wait_until_present.flash(color: ["yellow"]).click
    end

    it "Sets an invalid Account Group Number" do
      accountPayModal.wait_until_present.flash(color: ["yellow"])
      accountPaySearchTextField.wait_until_present.flash(color: ["yellow"]).set ($accountGroupIdInvalid)
      sendKeysEnter
    end

		it "Verifies the account Pay error" do
			verifyEventInformationResult('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild account Pay group id" do
			accountPayModal.wait_until_present.flash(color: ["yellow"])
			accountPaySearchTextField.click
			sendKeysClear
      accountPaySearchTextField.wait_until_present.flash(color: ["yellow"]).set ($accountGroupId)
      sendKeysEnter
		end

		it "Verifies the account Payee information mdoal" do
			getAccountPayeeInformationModal.flash(color: ["yellow"])
		end

		it "Clicks on the ticket by index" do
			getAccountPayTicketByIndex(0).flash(color: ["yellow"]).click
		end

		it "Verifies if information is missing from Payee Information modal" do
			verifyAccountPayError
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
