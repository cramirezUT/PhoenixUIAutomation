## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventChannelPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include EventChannelPage
end

RSpec.describe "Admin Event Channel verification test", :regression do
  begin
    before(:all) do
      puts "adminEventChannelTest"
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

		it "Clicks on the Channel sub link" do
			eventMenuInquireSubLinks("Channel").flash(color: ["yellow"]).click
		end

		it "Verifies the Event Channel modal" do
			eventChannelModal.flash(color: ["yellow"])
		end

		it "Sets an invalid Group id" do
      eventChannelModalGroupDropdown.flash(color: ["yellow"]).click
      eventChannelModalGroupSearchTextField.flash(color: ["yellow"]).set ($groupIdInvalid)
		end

		it "Verifies No matches found error" do
			verifyEventChannelSearchResults("No matches found")
		end

		it "Sets a valid Dealer id" do
			eventChannelModalGroupDropdown.flash(color: ["yellow"]).click
      eventChannelModalGroupDropdown.flash(color: ["yellow"]).click
      eventChannelModalGroupSearchTextField.flash(color: ["yellow"]).set ($groupId)
			sendKeysEnter
    	sendKeysTab
		end

		it "Verifies the Event modal" do
			eventChannelEventModal(0).flash(color: ["yellow"])
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
