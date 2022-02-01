## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventInquirePage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include InquirePage
end

RSpec.describe "Event Inquiry Summary test", :regression do
  begin
    before(:all) do
      puts "adminEventInquirySummaryTest"
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
			eventMenuLinks("Inquire").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Click on the Event By dropdown and select the ID" do
      eventInquiryDropdown.wait_until_present.flash(color: ["yellow"]).click
      eventInquirySearchTextField.wait_until_present.flash(color: ["yellow"]).set ($eventById)
      sendKeysEnter
			sendKeysTab
		end

    it "Verify the ID results for row 1" do
      verifyEventInquirySearchResultsForName(0, 'Aquaduct')
			verifyEventInquirySearchResultsForRaces(0, '1-3')
			verifyEventInquirySearchResultsForRace(0, '1')
			verifyEventInquirySearchResultsForStatus(0, 'POST')
    end

		it "Click on the Event By dropdown and select the Name" do
      eventInquiryDropdown.wait_until_present.flash(color: ["yellow"]).click
      eventInquirySearchTextField.wait_until_present.flash(color: ["yellow"]).set ($eventByName)
      sendKeysEnter
			sendKeysTab
		end

		it "Verify the ID results for row 1" do
			verifyEventInquirySearchResultsForName(0, 'Aquaduct')
			verifyEventInquirySearchResultsForRaces(0, '1-3')
			verifyEventInquirySearchResultsForRace(0, '1')
			verifyEventInquirySearchResultsForStatus(0, 'POST')
    end

		it "Click on the Event By dropdown and select the Open Races" do
      eventInquiryDropdown.wait_until_present.flash(color: ["yellow"]).click
      eventInquirySearchTextField.wait_until_present.flash(color: ["yellow"]).set ($eventByOpenRaces)
      sendKeysEnter
			sendKeysTab
		end

		it "Verify the ID results for row 1" do
			verifyEventInquirySearchResultsForName(0, 'CHURCHILL DOWNS')
			verifyEventInquirySearchResultsForRaces(0, '1-8')
			verifyEventInquirySearchResultsForRace(0, '3')
			verifyEventInquirySearchResultsForStatus(0, 'FINAL')
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
