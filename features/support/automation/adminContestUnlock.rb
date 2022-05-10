## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestUnlockPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestUnlockPage
end

RSpec.describe "Account Unlock verification test", :regression do
  begin
    before(:all) do
      puts "adminContestUnlockTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminContestUnlock-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Unlock link" do
			eventMenuLinks("Unlock").wait_until_present.flash.click
		end

		it "Sets an invalid Player id" do
			unlockplayerModalSearchTextField.wait_until_present.flash.click
      unlockplayerModalSearchTextField.flash.set ($playerIdInvalid)
			sendKeysTab
		end

		it "Verifies the group must be specified error" do
			verifyUnlockplayerErrorSearchResults('A group must be specified! <group id>-<number>')
		end

		it "Sets a valid Player id" do
      unlockplayerModalSearchTextField.flash.click
			unlockplayerModalSearchTextField.flash.click
      unlockplayerModalSearchTextField.flash.set ($playerId)
    	sendKeysTab
		end

		it "Verifies the Unlocked icon" do
			verifyUnlockPlayerLockedIcon
		end

		it "Clicks on the view icon" do
			unlockPlayerModalViewButton.flash.click
		end

		it "Verifies the Locked Players results modal" do
			verifyUnlockPlayerSearchResultsView
		end

		it "Clicks on the close icon in the Locked Players modal" do
			unlockPlayerLockedModalCloseButton.flash.click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
