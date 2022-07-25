## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventPoolsPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include PoolsPage
end

RSpec.describe "Admin->Event->Pools->Event->AllMerge: Event Pools All selection and Refresh test", :adminEvent do
  begin
    before(:all) do
      puts "adminEventPoolsAllTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminEventPoolsEventAllMergeRefresh-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Pools link" do
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

    it "Click on the Races dropdown" do
      eventRacesDropdown.wait_until_present.flash.click
    end

		it "Clicks on the All checkbox" do
			eventRaceSearchSelectAllCheckbox.flash.click
		end

    it "Click on the Races dropdown" do
      eventRacesDropdown.flash.click
    end

		it "Verifies the valid search result" do
      sleep(1)
      verifyAdminEventPoolsEventSearchResults("CHF-CHURCHILL DOWNS Races 1-8")
    end

    it "Clicks on the Refresh button" do
      eventPoolsRefreshButton.flash.click
    end

    it "Verifies the valid search result" do
      verifyAdminEventPoolsEventSearchResults("CHF-CHURCHILL DOWNS Races 1-8")
    end

    it "Sets the Source" do
      eventPoolsSourceDropdown.flash.click
      eventPoolsSourceSearchTextField.wait_until_present.set ($adminEventPoolsSourceMeregeId)
      sendKeysEnter
      sendKeysTab
    end

    it "Clicks on the Refresh button" do
      eventPoolsRefreshButton.flash.click
    end

    it "Verifies the valid search result" do
      sleep(1)
      verifyAdminEventPoolsEventSearchResults("CHF-CHURCHILL DOWNS Races 1-8")
    end

    it "Verifes the figures" do
      eventPoolsResultsModal.flash
      puts "Event Result Race: #{getEventResultsRaceTotal(0)}"
      puts "Event Result Pool: #{getEventResultsPool(0)}"
      puts "Event Result Total: #{getEventResultsTotalTotal(0)}"
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
