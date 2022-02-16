## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestStandingsPlayerPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestStandingsPlayerPage
end

RSpec.describe "Admin->Contest->Standings->Player: Contest Standings Player verification test", :regression do
  begin
    before(:all) do
      puts "adminContestStandingsPlayerTest"
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

		it "Clicks on the Player sub link" do
			eventMenuInquireSubLinks("Player").flash.click
		end

		it "Verifies the Contest Standings Player modal" do
			playerStandingsModal.flash
		end

		it "Sets an invalid Player id in the search text field" do
			playerStandingsModalSearchTextField.flash.set ($playerIdInvalid)
			sendKeysEnter
		end

		it "Verifies the group must be specified error for Player" do
			verifyPlayerResultError('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild Player id in the search text field" do
			playerStandingsModalSearchTextField.flash.click
			sendKeysClear
      playerStandingsModalSearchTextField.flash.set ($playerId)
      sendKeysEnter
		end

		it "Verifies the Player result modal" do
			playerStandingsResultModal.flash
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
