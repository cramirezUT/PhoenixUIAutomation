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

RSpec.describe "Admin->Event->Liability->CurrentRace: Event Liability Event Merge selection test", :adminEvent do
  begin
    before(:all) do
      puts "adminEventEventMergeTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminEventLiabilityCurrentRace-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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
      eventLiabilitySourceSearchTextField.wait_until_present.set ($adminEventLiabilitySourceMerge)
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

		it "Clicks on the Current Race button" do
			eventLiabilityCurrentRaceButton.flash.click
		end

		it "Verifies the valid search result" do
      verifyAdminEventLiabilityCurrentRaceEventSearchResults("CHF-CHURCHILL DOWNS Race 3")
    end

		it "Verifies the figures view" do
			eventResultView.flash
			puts "Payoff Amount: #{getEventRacePayoffAmount(2).flash.text}"
			puts "Payoff Amount: #{getEventRaceBreakageAmount(2).flash.text}"
			puts "Payoff Amount: #{getEventRaceCommissionAmount(2).flash.text}"
			puts "Payoff Amount: #{getEventRaceRefundAmount(2).flash.text}"
			puts "Payoff Amount: #{getEventRaceTotalAmount(2).flash.text}"
			puts "Payoff Amount: #{getEventRacePool(2).flash.text}"
			puts "Payoff Amount: #{getEventRaceRace(2).flash.text}"
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
