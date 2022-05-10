## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminTerminalTextPage.rb"
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
  c.include AdminTerminalTextPage
  c.include WindowsHelpers
end

RSpec.describe "Admin Terminal Text functionality test", :regression do
  begin
    before(:all) do
      puts "adminTerminalTextTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminTerminalText-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Terminal tab" do
      adminMenuLinks("Terminal").wait_until_present.flash.click
		end

		it "Clicks on the Text link" do
      eventMenuLinks("Text").wait_until_present.flash.click
    end

		it "Verifies Terminal Text modal" do
			adminTerminalTextModal.flash
		end

		it "Sets an invalid group id in text field" do
			adminTerminalTextModalGroupDropdown.flash.click
			adminTerminalTextModalGroupSearchTextField.flash.set ($grouplIdInvalid)
		end

		it "Verifiesathe invalid group id error" do
			verifyTerminalGroupTextResultError("No matches found")
		end

		it "Sets a valid group id in text field" do
			adminTerminalTextModalGroupDropdown.flash.click
			adminTerminalTextModalGroupDropdown.flash.click
			adminTerminalTextModalGroupSearchTextField.flash.set ($grouplId)
			sendKeysEnter
			sendKeysTab
		end

		it "Verifies text modal" do
			adminTerminalTextDataModal.flash
		end

		it "Set text in Blurbs and welcome text fields" do
			adminTerminalTextDataModalBlurb1TextField.flash.click
			sendKeysClear
			adminTerminalTextDataModalBlurb1TextField.flash.set ($testBlurb1Text)
			adminTerminalTextDataModalBlurb2TextField.flash.click
			sendKeysClear
			adminTerminalTextDataModalBlurb2TextField.flash.set ($testBlurb2Text)
			adminTerminalTextDataModalWelcomeTextField.flash.set ($testWelcomText)
			adminTerminalTextDataModalWelcomeTextField.flash.set ($testWelcomText)
		end

		it "Clicks on the Save button" do
			adminTerminalTextDataModalSaveButton.flash.click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
