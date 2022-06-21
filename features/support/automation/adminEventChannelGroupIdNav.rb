## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventChannelPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"
require_relative "../lib/windows.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include EventChannelPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Event->Channel: Event Channel group Id valid and invalid test", :adminEvent do
  begin
    before(:all) do
      puts "adminEventChannelGroupIdTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminEventChannelGroupIdNav-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

    it "Clicks on the Channel link" do
      eventMenuInquireSubLinks("Channel").wait_until_present.flash.click
    end

    it "Verifies the Event Channel modal" do
			eventChannelModal.flash
		end

    it "Sets invalid Group ID" do
      eventChannelModalGroupDropdown.flash.click
      eventChannelModalGroupSearchTextField.flash.set ($adminEventChannelGroupIdInvalid)
    end

    it "Verifies the Channel search result" do
      verifyEventSearchResultsInvalid("No matches found")
    end

    it "Sets a valid Group ID" do
      eventChannelModalGroupDropdown.flash.click
      eventChannelModalGroupDropdown.flash.click
      eventChannelModalGroupSearchTextField.flash.set ($adminEventChannelGroupId)
      sendKeysEnter
      sendKeysTab
    end

    it "Verify the Event search result" do
      eventChannelEeventResultsByIndex(0).flash
    end

    it "Sets an invalid channel id" do
      eventChannelEeventChannelTextFieldByIndex(0).flash.set ($adminEventChannelChannelIdInvalid)
      sendKeysTab
    end

    it "Verifies the invalid error message" do
      verifyEventChannelInvalidChannelIdError("Specified channel 'C' does not exist in any channel guides for UQA!")
    end

    it "Clicks on the Help button" do
      expect(eventChannelModalHelpButton.enabled?).to be_truthy
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
