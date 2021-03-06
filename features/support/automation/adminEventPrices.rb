## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventPricesPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"

RSpec.configure do |c|
	c.include ToteLoginPage
	c.include HomePage
	c.include SiteSelectPage
	c.include Browsers
	c.include SendKeys
	c.include PricesPage
end

RSpec.describe "Admin->Event->Prices: Event Prices Prices race test", :adminEvent do
	begin
		before(:all) do
			puts "adminEventPricesCurrentRaceTest"
			launchToteBrowser
			selectSiteTable
			logInFunction
		end

		after(:each) do |example|
			if example.exception
				screenshot_file = "features/support/automation_screenshots/adminEventPrices-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Prices tab" do
			eventMenuLinks("Prices").wait_until_present.flash.click
		end

		it "Sets an invalid Event id" do
			eventPricesEventDropdown.wait_until_present.flash.click
      eventPricesEventSearchTextField.wait_until_present.flash.set ($adminEventPricesEventIdInvalid)
		end

		it "Verifes the error message" do
			verifyEventErrorMessage("No matches found")
		end

		it "Sets a valid Event id" do
      eventPricesEventDropdown.flash.click
			eventPricesEventDropdown.flash.click
      eventPricesEventSearchTextField.wait_until_present.flash.set ($adminEventPricesEventId)
      sendKeysEnter
			sendKeysTab
		end

		it "Sets Race 1" do
      eventPricesRaceDropdown.flash.click
			eventPricesRaceNumberByIndex(0).flash.click
    end

		it "Verifies the valid search result" do
      verifyAdminEventPricesEventSearchResults("CHF - CHURCHILL DOWNS Race 1 Prices Thu 30-Dec-2021")
    end

		it "Verifes the race finishers" do
      eventFinishResultsModal.flash
      puts "1st Place Finisher: #{eventFinishResultsModal1stPlaceFinisher}"
      puts "2nd Place Finisher: #{eventFinishResultsModal2ndPlaceFinisher}"
      puts "3rd Place Finisher: #{eventFinishResultsModal3rdPlaceFinisher}"
			puts "4th Place Finisher: #{eventFinishResultsModal4thPlaceFinisher}"
		end

		it "Sets Race 2 by click on arrow" do
      eventPricesRightArrow.flash.click
    end

		it "Verifies the valid search result" do
      verifyAdminEventPricesEventSearchResults("CHF - CHURCHILL DOWNS Race 2 Prices Thu 30-Dec-2021")
    end

		it "Verifes the race finishers" do
      eventFinishResultsModal.flash
      puts "1st Place Finisher: #{eventFinishResultsModal1stPlaceFinisher}"
      puts "2nd Place Finisher: #{eventFinishResultsModal2ndPlaceFinisher}"
      puts "3rd Place Finisher: #{eventFinishResultsModal3rdPlaceFinisher}"
			puts "4th Place Finisher: #{eventFinishResultsModal4thPlaceFinisher}"
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
