## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventLiabilityPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include LiabilityPage
end

RSpec.describe "Event Liability Event All selection test", :regression do
  begin
    before(:all) do
      puts "adminEventEventAllTest"
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

		it "Clicks on the Event tab" do
      adminMenuLinks("Event").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the liability link" do
			eventMenuLinks("Liability").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Sets a valid Event id" do
      eventLiabilityEventDropdown.wait_until_present.flash(color: ["yellow"]).click
      eventLiabilityEventSearchTextField.wait_until_present.flash(color: ["yellow"]).set ($eventId)
      sendKeysEnter
		end

    it "Sets the Source" do
      eventLiabilitySourceDropdown.flash(color: ["yellow"]).click
      eventLiabilitySourceSearchTextField.wait_until_present.set ($sourceId)
      sendKeysEnter
      sendKeysTab
    end

    it "Click on the Races dropdown" do
      eventLiabilityRacesDropdown.wait_until_present.flash(color: ["yellow"]).click
    end

		it "Clicks on the All checkbox" do
			eventLiabilityRacesAllCheckbox.flash(color: ["yellow"]).click
		end

		it "Clicks on the Done button" do
			eventLiabilityRacesDoneButton.flash(color: ["yellow"]).click
		end

		it "Verifies the valid search result" do
      verifyEventSearchResults("CHF-CHURCHILL DOWNS Races 1-3")
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end