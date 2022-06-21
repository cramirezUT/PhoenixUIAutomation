## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountPricesPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountPricesPage
end

RSpec.describe "Admin->Account->Prices: Account Prices verification test", :adminAccount do
  begin
    before(:all) do
      puts "adminAccountPricesTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminAccountPrices-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Account tab" do
      adminMenuLinks("Account").wait_until_present.flash.click
		end

		it "Clicks on the Prices link" do
			eventMenuLinks("Prices").wait_until_present.flash.click
		end

		it "Sets an invalid Event id" do
			accountPricesEventDropdown.wait_until_present.flash.click
      accountPricesEventSearchTextField.flash.set ($adminAccountPricesIdInvalid)
      #sendKeysEnter
		end

		it "Verifies the No matches found error" do
			verifyPricesEventErrorSearchResults('No matches found')
		end

		it "Sets the Event id" do
      accountPricesEventDropdown.flash.click
			accountPricesEventDropdown.flash.click
      accountPricesEventSearchTextField.flash.set ($adminAccountPricesId)
      sendKeysEnter
			sendKeysTab
		end

		it "Verifies the valid search result" do
      verifyPricesEventSearchResultsFirstPlaceHorse('Hey Court Lady')
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
