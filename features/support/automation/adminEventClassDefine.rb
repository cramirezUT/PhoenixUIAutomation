## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventClassPage.rb"
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
  c.include ClassPage
  c.include WindowsHelpers
end

RSpec.describe "Event Class Define class test", :regression do
  begin
    before(:all) do
      $continue = true
      puts "adminEventClassDefineClassTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    around(:each) do |example|
      if $continue
        $continue = false
        example.run
        $continue = true unless example.exception
      else
        example.skip
      end
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
			mainMenuLinks("Admin").wait_until_present.flash.click
		end

		it "Clicks on the Event tab" do
      adminMenuLinks("Event").wait_until_present.flash.click
		end

    it "Clicks on the Class link" do
      eventMenuLinks("Class").wait_until_present.flash.click
    end

    it "Sets a valid Group ID" do
      eventClassGroupDropdown.flash.click
      eventClassGroupSearchTextField.wait_until_present.flash.set ($groupId)
      sendKeysEnter
      sleep(1)
      sendKeysTab
      sendKeysTab
    end

		it "Defines the event class" do
			eventClassButtonByIndex(0).wait_until_present.flash.click
		end

		it "Clicks on the save changes button" do
			eventClassSaveChangesButton.wait_until_present.flash.click
		end

		it "Verifies a class was defined" do
			verifyEventClassDefinition(0)
		end

		it "Reset class definition" do
			eventClassButtonByIndex(0).wait_until_present.flash.click
			eventClassButtonByIndex(0).wait_until_present.flash.click
		end

		it "Clicks on the save changes button" do
			eventClassSaveChangesButton.wait_until_present.flash.click
		end

		it "Verifies a class definition was reset" do
			verifyEventClassDefinitionReset(0)
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
