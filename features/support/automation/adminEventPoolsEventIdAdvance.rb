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

RSpec.describe "Event Pools Event Id valid and invalid and selects an advanced race test", :regression do
	begin
		before(:all) do
			$continue = true
			puts "adminEventPoolsIdTest"
			launchToteBrowser
			selectSiteTable
			logInFunction
		end

		around(:each) do |example|
      if $continue
        $continue = false
        example.run
        $continue = true unless example.exception
      else
        example.skip
      end
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

		it "Clicks on the Event tab" do
			adminMenuLinks("Event").wait_until_present.flash.click
		end

		it "Clicks on the Pools tab" do
			eventMenuLinks("Pools").wait_until_present.flash.click
		end

		it "Sets a valid Event id" do
      eventPoolsEventDropdown.wait_until_present.flash.click
      eventPoolsEventSearchTextField.wait_until_present.flash.set ($eventId)
      sendKeysEnter
		end

		it "Sets the Source" do
      eventPoolsSourceDropdown.flash.click
      eventPoolsSourceSearchTextField.wait_until_present.set ($sourceId)
      sendKeysEnter
      sendKeysTab
    end

		it "Verifies the valid search result" do
      verifyEventSearchResults("CHF-CHURCHILL DOWNS Race")
    end

		it "Sets invalid Event ID" do
      eventPoolsEventDropdown.wait_until_present.flash.click
      eventPoolsEventSearchTextField.wait_until_present.flash.set ($invalidEventId)
    end

    it "Verifes the invalid Event search result" do
      verifyEventSearchResultsInvalid("No matches found")
    end

		it "Clicks on a advance race arrow" do
			eventPoolsRightArrow.flash.click
			sleep(1)
		end

		it "Verifies an advanced race is selected" do
			verifyEventSearchResults("CHF-CHURCHILL DOWNS Race 4 OPEN")
		end

		it "Clicks on the previous race arrow" do
			eventPoolsLeftArrow.flash.click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
