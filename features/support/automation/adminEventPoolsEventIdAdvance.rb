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

RSpec.describe "Admin->Event->Pools->Event->ID: Event Pools Event Id valid and invalid and selects an advanced race test", :adminEvent do
	begin
		before(:all) do
			puts "adminEventPoolsIdTest"
			launchToteBrowser
			selectSiteTable
			logInFunction
		end

		after(:each) do |example|
			if example.exception
				screenshot_file = "features/support/automation_screenshots/adminEventPoolsEventIdAdvance-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Verifies the valid search result" do
      verifyAdminEventPoolsEventSearchResults("CHF-CHURCHILL DOWNS Race")
    end

		it "Sets invalid Event ID" do
      eventPoolsEventDropdown.wait_until_present.flash.click
      eventPoolsEventSearchTextField.wait_until_present.flash.set ($adminEventPoolsEventIdInvalid)
    end

    it "Verifes the invalid Event search result" do
      verifyAdminEventPoolsEventSearchResultsInvalid("No matches found")
    end

		it "Clicks on a advance race arrow" do
			eventPoolsRightArrow.flash.click
			sleep(1)
		end

		it "Verifies an advanced race is selected" do
			verifyAdminEventPoolsEventSearchResults("CHF-CHURCHILL DOWNS Race 4 OPEN")
		end

		it "Clicks on the previous race arrow" do
			eventPoolsLeftArrow.flash.click
		end

		it "Verifes the figures" do
      eventPoolsResultsModal.flash
      puts "Event Result Race: #{getEventResultsRaceTotal(14)}"
      puts "Event Result Pool: #{getEventResultsPool(14)}"
      puts "Event Result Total: #{getEventResultsTotalTotal(14)}"
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
