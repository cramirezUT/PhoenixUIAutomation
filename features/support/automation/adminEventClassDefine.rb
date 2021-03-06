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

RSpec.describe "Admin->Event->Class: Event Class Define class test", :adminEvent do
  begin
    before(:all) do
      puts "adminEventClassDefineClassTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminEventClassDefine-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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
      eventClassGroupSearchTextField.wait_until_present.flash.set ($adminEventClassGroupId)
      sendKeysEnter
      sleep(1)
      sendKeysTab
      sendKeysTab
    end

		it "Determines if clean up is needed" do
			getEventClassDefinitionForCleanUp
		end

		it "Clicks on the save changes button" do
			eventClassSaveChangesButton.wait_until_present.flash.click
		end

		it "Verifies 'B' class was defined" do
			verifyEventClassDefinitionB(0)
		end

		it "Reset class definition" do
			eventClassButtonByIndex(0).wait_until_present.flash.click
		end

    it "Verifies 'A' class was defined" do
			verifyEventClassDefinitionA(0)
		end

    it "Reset class definition" do
			eventClassButtonByIndex(0).wait_until_present.flash.click
		end

		it "Clicks on the save changes button" do
			eventClassSaveChangesButton.wait_until_present.flash.click
		end

		it "Verifies a blank class definition was reset" do
			verifyEventClassDefinitionReset(0)
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
