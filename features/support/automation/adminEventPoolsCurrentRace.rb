## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventPoolsPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
	c.include ToteLoginPage
	c.include HomePage
	c.include SiteSelectPage
	c.include Browsers
	c.include SendKeys
	c.include PoolsPage
end

RSpec.describe "Admin->Event->Pools->CurrentRace: Event Pools Current race test", :adminEvent do
	begin
		before(:all) do
			puts "adminEventPoolsCurrentRaceTest"
			launchToteBrowser
			selectSiteTable
			logInFunction
		end

		after(:each) do |example|
			if example.exception
				screenshot_file = "features/support/automation_screenshots/adminEventPoolsCurrentRace-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Event tab" do
			adminMenuLinks("Event").wait_until_present.flash.click
		end

		it "Clicks on the Pools tab" do
			eventMenuLinks("Pools").wait_until_present.flash.click
		end

		it "Sets a valid Event id" do
      eventPoolsEventDropdown.wait_until_present.flash.click
      eventPoolsEventSearchTextField.wait_until_present.flash.set ($adminEventPoolsEventId)
      sendKeysEnter
		end

		it "Sets the Source" do
      eventPoolsSourceDropdown.flash.click
      eventPoolsSourceSearchTextField.wait_until_present.set ($adminEventPoolsSourceId)
      sendKeysEnter
      sendKeysTab
    end

		it "Clicks on the Current Race button" do
			eventPoolsCurrentRaceButton.flash.click
		end

		it "Verifies the valid search result" do
      verifyAdminEventPoolsEventSearchResults("CHF-CHURCHILL DOWNS Race 3 FINAL")
    end

		it "Verifes the figures" do
      eventPoolsResultsModal.flash
      puts "Event Result Race: #{getEventResultsRaceTotal(14)}"
      puts "Event Result Pool: #{getEventResultsPool(14)}"
      puts "Event Result Total: #{getEventResultsTotalTotal(14)}"
			puts "Event Result Change: #{getEventResultsChangeTotal(14)}"
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
