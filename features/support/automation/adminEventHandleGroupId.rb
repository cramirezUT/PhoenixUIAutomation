## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventHandlePage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include HandlePage
end

RSpec.describe "Event Handle group Id valid and invalid test", :regression do
  begin
    before(:all) do
      puts "adminEventHandleGroupIdTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminEventHandleGroupId-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

    it "Clicks on the Handle link" do
      eventMenuLinks("Handle").wait_until_present.flash.click
    end

    it "Sets invalid Group ID" do
      eventHandleGourpDropdown.wait_until_present.flash.click
      eventHandleGroupSerachTextField.wait_until_present.flash.set ($invalidGroupId)
      sendKeysEnter
    end

    it "Verifes the Handle search result" do
      verifyEventHandleSearchResults("No matches found")
    end

		it "Sets wild card character in search field" do
			eventHandleGroupSerachTextField.click
			sendKeysClear
      eventHandleGroupSerachTextField.wait_until_present.flash.set ($wildCharacterGroupId)
      sendKeysEnter
		end

		it "Verifes the Handle search result" do
      verifyEventHandleSearchResults("No matches found")
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
