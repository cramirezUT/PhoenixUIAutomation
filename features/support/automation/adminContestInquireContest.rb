## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTE:

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

RSpec.describe "Admin->Contest->inquire->Contest: Contest Inquire Contest verification test", :regression do
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
			mainMenuLinks("Admin").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Contest tab" do
      adminMenuLinks("Contest").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Hovers on the Inquire link" do
			eventMenuLinks("Inquire").wait_until_present.flash(color: ["yellow"]).hover
		end

		it "Clicks on the Contest sub link" do
			eventMenuInquireSubLinks("Contest").flash(color: ["yellow"]).click
		end

		it "Verifies the Contest Inquiry modal" do
			contestInquiryModal.flash(color: ["yellow"])
		end

		it "Clicks on the Tournament dropdown" do
			contestInquiryModalTournamentDropdown.flash(color: ["yellow"]).click
		end
		#### INVALID CONTEST INQUIRY TEST ####
		it "Sets an invalid Tournament id in search text field" do
			contestInquiryModalTournamentSearchTextField.flash(color: ["yellow"]).set ($tournamentIdInvalid)
		end

		it "Verifies the Tournament No match error" do
			verifyContestInquiryError('Tournament','No matches found')
		end

		it "Clicks on the Tournament dropdown" do
			contestInquiryModalTournamentDropdown.flash(color: ["yellow"]).click
		end

		it "Sets a vaild Tournament id" do
			contestInquiryModalTournamentDropdown.flash(color: ["yellow"]).click
      contestInquiryModalTournamentSearchTextField.flash(color: ["yellow"]).set ($tournamentId)
      sendKeysEnter
			sendKeysTab
		end

		it "Clicks on the Contest dropdown" do
			contestInquiryModalContestDropdown.flash(color: ["yellow"]).click
		end

		it "Sets an invalid Contest id in search text field" do
			contestInquiryModalContestSearchTextField.flash(color: ["yellow"]).set ($contestIdInvalid)
		end

		it "Verifies the Contest No match error" do
			verifyContestInquiryError('Contest','No matches found')
		end
		#### VALID CONTEST INQUIRY TEST ####
		it "Sets a vaild Tournament id" do
			contestInquiryModalTournamentDropdown.flash(color: ["yellow"]).click
      contestInquiryModalTournamentSearchTextField.flash(color: ["yellow"]).set ($tournamentId)
      sendKeysEnter
			sendKeysTab
		end

		it "Verifies the Tournament result modal" do
			verifyContestTournamentModal
		end

		it "Sets a vaild Contest id" do
			contestInquiryModalContestDropdown.flash(color: ["yellow"]).click
      contestInquiryModalContestSearchTextField.flash(color: ["yellow"]).set ($contestId)
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
