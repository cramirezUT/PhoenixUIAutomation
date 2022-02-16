## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestInquireContestPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestInquireContestPage
end

RSpec.describe "Admin->Contest->Inquire->Contest: Contest Inquire Contest verification test", :regression do
  begin
    before(:all) do
      puts "adminContestInquireContestTest"
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

		it "Clicks on the Contest tab" do
      adminMenuLinks("Contest").wait_until_present.flash.click
		end

		it "Hovers on the Inquire link" do
			eventMenuLinks("Inquire").wait_until_present.flash.hover
		end

		it "Clicks on the Contest sub link" do
			eventMenuInquireSubLinks("Contest").flash.click
		end

		it "Verifies the Contest Inquiry modal" do
			contestInquiryModal.flash
		end

		it "Clicks on the Tournament dropdown" do
			contestInquiryModalTournamentDropdown.flash.click
		end
		#### INVALID CONTEST INQUIRY TEST ####
		it "Sets an invalid Tournament id in search text field" do
			contestInquiryModalTournamentSearchTextField.flash.set ($tournamentIdInvalid)
		end

		it "Verifies the Tournament No match error" do
			verifyContestInquiryError('Tournament','No matches found')
		end

		it "Clicks on the Tournament dropdown" do
			contestInquiryModalTournamentDropdown.flash.click
		end

		it "Sets a vaild Tournament id" do
			contestInquiryModalTournamentDropdown.flash.click
      contestInquiryModalTournamentSearchTextField.flash.set ($tournamentId)
      sendKeysEnter
			sendKeysTab
		end

		it "Clicks on the Contest dropdown" do
			contestInquiryModalContestDropdown.flash.click
		end

		it "Sets an invalid Contest id in search text field" do
			contestInquiryModalContestSearchTextField.flash.set ($contestIdInvalid)
		end

		it "Verifies the Contest No match error" do
			verifyContestInquiryError('Contest','No matches found')
		end
		#### VALID CONTEST INQUIRY TEST ####
		it "Sets a vaild Tournament id" do
			contestInquiryModalTournamentDropdown.flash.click
      contestInquiryModalTournamentSearchTextField.flash.set ($tournamentId)
      sendKeysEnter
			sendKeysTab
		end

		it "Verifies the Tournament result modal" do
			verifyContestTournamentModal
		end

		it "Sets a vaild Contest id" do
			contestInquiryModalContestDropdown.flash.click
      contestInquiryModalContestSearchTextField.flash.set ($contestId)
      sendKeysEnter
			sendKeysTab
		end

		it "Verifies the Contest result modal" do
			verifyContestContestModal
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
