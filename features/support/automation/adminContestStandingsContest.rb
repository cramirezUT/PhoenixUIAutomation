## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestStandingsContestPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestStandingsContestPage
end

RSpec.describe "Admin->Contest->Standings->Contest: Contest Standings Contest verification test", :regression do
  begin
    before(:all) do
      puts "adminContestStandingsContestTest"
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

		it "Hovers over the Review link" do
			eventMenuLinks("Standings").wait_until_present.flash.hover
		end

		it "Clicks on the Contest sub link" do
			eventMenuInquireSubLinks("Contest").flash.click
		end

		it "Verifies the Contest Standings Contest modal" do
			contestStandingsModal.flash
		end

		it "Sets an invalid Tournament id in the search text field" do
			contestStandingsModalTournamentDropdown.flash.click
			contestStandingsModalTournamentSearchTextField.flash.set ($tournamentIdInvalid)
		end

		it "Verifies the No matches found error for Tournament" do
			verifyContestTournamentResultError('No matches found')
		end

		it "Sets a vaild Tournament id in the search text field" do
			contestStandingsModalTournamentDropdown.flash.click
			contestStandingsModalTournamentDropdown.flash.click
      contestStandingsModalTournamentSearchTextField.flash.set ($tournamentId)
      sendKeysEnter
      sendKeysTab
      sendKeysTab
		end

		it "Verifies the Tournament result modal" do
			contestStandingsTournamentResultsModal.flash
		end

		it "Sets an invalid Contest id in the search text field" do
			contestStandingsModalContestDropdown.flash.click
			contestStandingsModalContestSearchTextField.flash.set ($contestIdInvalid)
		end

		it "Verifies the No matches found error for Tournament" do
			verifyContestContestResultError('No matches found')
		end

		it "Sets a vaild Contest id in the search text field" do
			contestStandingsModalContestDropdown.flash.click
			contestStandingsModalContestDropdown.flash.click
      contestStandingsModalContestSearchTextField.flash.set ($contestId)
      sendKeysEnter
      sendKeysTab
		end

		it "Verifies the Contest result modal" do
			contestStandingsContestResultsModal.flash
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
