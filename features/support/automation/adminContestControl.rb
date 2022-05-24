## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestControlPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestControlPage
end

RSpec.describe "Admin->Contest->Control: Contest Control verification test", :adminContest do
  begin
    before(:all) do
      puts "adminContestControlTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminContestControl-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the control link" do
			eventMenuLinks("Control").wait_until_present.flash.click
		end

		it "Verifies the Contest Control Modal" do
			contestControlModal.flash
		end

		it "Sets an invalid Tournament id" do
			contestControlTournamentDropdown.flash.click
			contestControlTournamentSearchTextField.flash.set ($tournamentdIdInvalid)
		end

		it "Verifies the No matches found error" do
			verifyContestControlsError('No matches found')
		end

		it "Sets a vaild Tournament id" do
      contestControlTournamentDropdown.flash.click
			contestControlTournamentDropdown.flash.click
      contestControlTournamentSearchTextField.flash.set ($tournamentdId)
      sendKeysEnter
			sendKeysTab
		end

		it "Verifies the Tournament modal is displayed" do
			verifyContestControlTournamentModal
    end

		it "Verifies the Contest modal is displayed" do
			verifyContestControlContestModal
		end

    it "Edits the No Entry date and time" do
      contestControlContestModalNoEntryTimeTextField.flash.click
      sendKeysSelectAll
      sendKeysDelete
      contestControlContestModalNoEntryTimeTextField.flash.set ($currentDateTime)
      sendKeysTab
    end

    it "Edits the End date and time" do
      contestControlContestModalEndTimeTextField.flash.click
      sendKeysSelectAll
      sendKeysDelete
      contestControlContestModalEndTimeTextField.flash.set ($currentDateTimePlus1Day)
      sendKeysTab
    end

    it "Closes the Contest modal" do
			contestControlContestModalCloseButton.flash.click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
