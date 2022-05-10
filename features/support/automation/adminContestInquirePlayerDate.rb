## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## Possible bug: Setting an "End" date can clicking
## on the modal will reset the "Begin" date to the same
## end date.

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestInquirePlayerPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestInquirePlayerPage
end

RSpec.describe "Admin->Contest->Inquire->Player: Contest Inquire Player Date verification test", :regression do
  begin
    before(:all) do
      puts "adminContestInquirePlayerDateTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminContestInquirePlayerDate-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Hovers on the Inquire link" do
			eventMenuLinks("Inquire").wait_until_present.flash.hover
		end

		it "Clicks on the Player sub link" do
			eventMenuInquireSubLinks("Player").flash.click
		end

		it "Verifies the Player Inquiry modal" do
			playerInquiryModal.flash
		end

		it "Sets a vaild Player id" do
			playerInquiryModalPlayerSearchTextField.flash.click
      playerInquiryModalPlayerSearchTextField.flash.set ($playerId)
      sendKeysEnter
		end

		it "Sets the Begin date" do
			playerInquiryModalBeginTextField.flash.click
			sendKeysSelectAll
			sendKeysDelete
			playerInquiryModalBeginTextField.flash.set ($currentDateTime)
			sendKeysTab
		end

		it "Sets the End date" do
			playerInquiryModalEndTextField.flash.click
			sendKeysSelectAll
			sendKeysDelete
			playerInquiryModalEndTextField.flash.set ($currentDateTimePlus1Day)
			sendKeysTab
		end

		it "Clicks on the Request button" do
			playerInquiryModalRequestButton.flash.click
		end

		it "Verifies the Player All result modal" do
			verifyPlayerResultModal
		end

	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
