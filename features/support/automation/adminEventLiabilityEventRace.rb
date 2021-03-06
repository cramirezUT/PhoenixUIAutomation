## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventLiabilityPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include LiabilityPage
end

RSpec.describe "Admin->Event->Liability->EventRace: Event Liability Event Race test", :adminEvent do
  begin
    before(:all) do
      puts "adminEventLiablityEventRaceTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminEventLiabilityEventRace-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the liability link" do
			eventMenuLinks("Liability").wait_until_present.flash.click
		end

		it "Sets a valid Event id" do
      eventLiabilityEventDropdown.wait_until_present.flash.click
      eventLiabilityEventSearchTextField.wait_until_present.flash.set ($adminEventLiabilityEventId)
      sendKeysEnter
		end

    it "Sets the Source" do
      eventLiabilitySourceDropdown.flash.click
      eventLiabilitySourceSearchTextField.wait_until_present.set ($adminEventLiabilitySourceId)
      sendKeysEnter
      sendKeysTab
    end

		it "Click on the Races dropdown" do
      eventLiabilityRacesDropdown.wait_until_present.flash.click
    end

		it "Clicks on the All checkbox" do
			eventLiabilityRacesAllCheckbox.flash.click
			eventLiabilityRacesAllCheckbox.flash.click
		end

		it "Selects race 1" do
			eventLiabilityRacesCheckboxByIndex(0).flash.click
		end

		it "Clicks on the Done button" do
			eventLiabilityRacesDoneButton.flash.click
		end

    it "Verifies the valid search result" do
      verifyAdminEventLiabilityEventRaceEventSearchResults("CHF-CHURCHILL DOWNS Race 1")
    end

		it "Prints the Payoff amount" do
			puts "Payoff amount : #{getEventRacePayoffAmount(0).text}"
			puts "Breakage amount : #{getEventRaceBreakageAmount(0).text}"
			puts "Commission amount : #{getEventRaceCommissionAmount(0).text}"
			puts "Refund amount : #{getEventRaceRefundAmount(0).text}"
			puts "Total amount : #{getEventRaceTotalAmount(0).text}"
			puts "Pool : #{getEventRacePool(0).text}"
			puts "Race : #{getEventRaceRace(0).text}"
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
