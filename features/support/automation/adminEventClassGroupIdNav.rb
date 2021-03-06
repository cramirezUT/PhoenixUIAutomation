## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventClassPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"
require_relative "../lib/windows.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ClassPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Event->Class: Event Class group Id valid and invalid test", :adminEvent do
  begin
    before(:all) do
      puts "eventClassGroupIdTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminEventClassGroupIdNav-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

    it "Clicks on the Class link" do
      eventMenuLinks("Class").wait_until_present.flash.click
    end

    it "Sets invalid Group ID" do
      eventClassGroupDropdown.wait_until_present.flash.click
      sleep 5
      eventClassGroupSearchTextField.wait_until_present.flash.set ($adminEventClassGroupIdInvalid)
      sleep 5
    end

    it "Verifies the Class search result" do
      verifyAdminEventClassEventSearchResultsInvalid("No matches found")
    end

    it "Sets a valid Group ID" do
      eventClassGroupDropdown.flash.click
      eventClassGroupDropdown.flash.click
      eventClassGroupSearchTextField.wait_until_present.flash.set ($adminEventClassGroupId)
      sendKeysEnter
      sleep(1)
      sendKeysTab
      sendKeysTab
    end

    it "Clicks on search result" do
      eventClassSearchResultByRow(0).wait_until_present.flash.click
    end

		it "Verifies the Group search result" do
      verifyGroupSearchResult(0, "CHF")
    end

    it "Verifies the Help button" do
      expect(eventClassHelpButton.enabled?).to be_truthy
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
