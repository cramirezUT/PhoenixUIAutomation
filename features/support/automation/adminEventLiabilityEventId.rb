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

RSpec.describe "Event Liability Event Id valid and invalid test", :regression do
  begin
    before(:all) do
      puts "adminEventGroupEventIdTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminEventLiabilityEventId-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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
      eventLiabilityEventSearchTextField.wait_until_present.flash.set ($eventId)
      sendKeysEnter
		end

    it "Sets the Source" do
      eventLiabilitySourceDropdown.flash.click
      eventLiabilitySourceSearchTextField.wait_until_present.set ($sourceMerge)
      sendKeysEnter
      sendKeysTab
    end

    it "Click on the Races dropdown" do
      eventLiabilityRacesDropdown.wait_until_present.flash.click
    end

		it "Clicks on the All checkbox" do
			eventLiabilityRacesAllCheckbox.flash.click
		end

		it "Clicks on the Done button" do
			eventLiabilityRacesDoneButton.flash.click
		end

    it "Verifies the valid search result" do
      verifyEventSearchResults("CHF-CHURCHILL DOWNS Race")
    end

    it "Clicks on the Next button" do
      eventLiabilityNextButton.flash.click
    end

    it "Verifies the figures view" do
      eventResultView.flash
      puts "Payoff Amount: #{getEventRacePayoffAmount.flash.text}"
      puts "Payoff Amount: #{getEventRaceBreakageAmount.flash.text}"
      puts "Payoff Amount: #{getEventRaceCommissionAmount.flash.text}"
      puts "Payoff Amount: #{getEventRaceRefundAmount.flash.text}"
      puts "Payoff Amount: #{getEventRaceTotalAmount.flash.text}"
      puts "Payoff Amount: #{getEventRacePool.flash.text}"
      puts "Payoff Amount: #{getEventRaceRace.flash.text}"
    end

    it "Sets invalid Event ID" do
      eventLiabilityEventDropdown.wait_until_present.flash.click
      eventLiabilityEventSearchTextField.wait_until_present.flash.set ($invalidEventId)
    end

    it "Verifes the invalid Event search result" do
      verifyEventSearchResultsInvalid("No matches found")
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
