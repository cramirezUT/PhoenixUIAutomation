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
  c.include ChannelPage
  c.include WindowsHelpers
end

RSpec.describe "Event Channel Define Channel test", :regression do
  begin
    before(:all) do
      puts "eventChannelDefineChannelTest"
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

    it "Clicks on the Channel link" do
      eventMenuLinks("Channel").wait_until_present.flash(color: ["yellow"]).click
    end

    it "Sets a valid Group ID" do
      eventChannelGroupDropdown.flash(color: ["yellow"]).click
      eventChannelGroupSearchTextField.wait_until_present.flash(color: ["yellow"]).set ($groupId)
      sendKeysEnter
      sleep(1)
      sendKeysTab
      sendKeysTab
    end

		it "Defines the event Channel" do
			sleep(5000000)
			eventChannelButtonByIndex(0).wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the save changes button" do
			eventChannelSaveChangesButton.wait_until_present.flash(color: ["yellow"]).click
		end

		it "Verifies a Channel was defined" do
			verifyEventChannelDefinition(0)
		end

		it "Reset Channel definition" do
			eventChannelButtonByIndex(0).wait_until_present.flash(color: ["yellow"]).click
			eventChannelButtonByIndex(0).wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the save changes button" do
			eventChannelSaveChangesButton.wait_until_present.flash(color: ["yellow"]).click
		end

		it "Verifies a Channel definition was reset" do
			verifyEventChannelDefinitionReset(0)
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
