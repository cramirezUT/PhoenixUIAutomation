## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminTerminalMessagePage.rb"
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
  c.include AdminTerminalMessagePage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Terminal->Message: Admin Terminal Message functionality test", :adminTerminal do
  begin
    before(:all) do
      puts "adminTerminalMessageTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminTerminalMessage-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Message link" do
      eventMenuLinks("Message").wait_until_present.flash.click
    end

		it "Verifies Terminal Message modal" do
			adminTerminalMessageModal.flash
		end

		it "Sets an invalid terminal id in text field" do
			adminTerminalMessageModalTerminalsTextField.flash.set ($adminTerminalMessageTerminalIdInvalid)
			sendKeysTab
		end

		it "Verifies the invalid terminal id error" do
			verifyTerminalMessageResultError("Terminal '***100' not found!")
		end

		it "Sets a valid terminal id in text field" do
			adminTerminalMessageModalTerminalsTextField.flash.click
			sendKeysClear
			adminTerminalMessageModalTerminalsTextField.flash.set ($adminTerminalMessageTerminalId)
			adminTerminalMessageModalTerminalsTextField.flash.set ($adminTerminalMessageTerminalId)
			sendKeysEnter
		end

		it "Sets text in the Message text field" do
			adminTerminalMessageModalMessageTextField.flash.set ($adminTerminalMessageTestMessage)
			sendKeysTab
		end

		it "Clicks on the Send button" do
			adminTerminalMessageModalSendButton.flash.click
		end

		it "Verifies the sent message" do
			verifyTerminalMessageHistory("'Testing Outgoing Messages' sent to 98 terminals for groups UTS BEL UQA TL1 TST PPF")
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
