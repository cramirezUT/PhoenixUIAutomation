## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountCancelPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountCancelPage
end

RSpec.describe "Admin->Account->Cancel: Account ticket cancelation validation", :regression do
  begin
    before(:all) do
      puts "adminAccountCancelTest"
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

    it "Clicks on the Cancel link" do
      eventMenuLinks("Cancel").wait_until_present.flash(color: ["yellow"]).click
    end

    it "Sets the Account Group Number" do
      accountCancelModal.wait_until_present.flash(color: ["yellow"])
      accountCancelSearchTextField.wait_until_present.flash(color: ["yellow"]).set ($invalidAccountGroupId)
      sendKeysEnter
    end

		it "Verifies the account Cancel error" do
			verifyEventInformationResultByIndex('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild account Cancel group id" do
			accountCancelModal.wait_until_present.flash(color: ["yellow"])
			accountCancelSearchTextField.click
			sendKeysClear
      accountCancelSearchTextField.flash(color: ["yellow"]).set ($accountGroupId)
      sendKeysEnter
		end

		it "Verifies the account Cancel results table" do
			accountCancelTicketResults.flash(color: ["yellow"])
		end

		it "Selects a ticket to cancel" do
			accountCancelTicketResultsByIndex(0).flash(color: ["yellow"]).click
		end

		it "Clicks on the Cancel Ticket button" do
			accountCancelTicketButton.flash(color: ["yellow"]).click
		end

		it "Clicks on the No button in the confirmation modal" do
			accountCancelConfirmationModal.flash(color: ["yellow"])
			accountCancelConfirmationModalNoButton.flash(color: ["yellow"]).click
		end

		it "Selects a ticket to cancel" do
			accountCancelTicketResultsByIndex(0).flash(color: ["yellow"]).click
		end

		it "Clicks on the Cancel Ticket button" do
			accountCancelTicketButton.flash(color: ["yellow"]).click
		end

		it "Clicks on the Yes button in the confirmation modal" do
			accountCancelConfirmationModal.flash(color: ["yellow"])
			accountCancelConfirmationModalYesButton.flash(color: ["yellow"]).click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
