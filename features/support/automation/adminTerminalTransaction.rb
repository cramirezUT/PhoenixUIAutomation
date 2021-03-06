## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminTerminalTransactionPage.rb"
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
  c.include AdminTerminalTransactionPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Terminal->Transacation: Admin Terminal Transaction functionality test", :adminTerminal do
  begin
    before(:all) do
      puts "adminTerminalTransactionTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminTerminalTransaction-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
  	    @browser.driver.save_screenshot(screenshot_file)
        sleep 1
        @browser.quit
	    end
	  end

    it "Verifies the main system Transaction in the header menu" do
      isMainSystemTextDisplayed
    end

		it "Clicks on the Admin tab in the main menu" do
			mainMenuLinks("Admin").wait_until_present.flash.click
		end

		it "Clicks on the Terminal tab" do
      adminMenuLinks("Terminal").wait_until_present.flash.click
		end

		it "Clicks on the Transaction link" do
      eventMenuLinks("Transaction").wait_until_present.flash.click
    end

		it "Verifies Terminal Transaction modal" do
			adminTerminalTransactionModal.flash
		end

		it "Selects Draw from the Type dropdown" do
			adminTerminalTransactionModalTypeDropdown.flash.click
			adminTerminalTransactionModalTypeSearchTransactionField.flash.set ($adminTerminalTransactionTypeOptionDraw)
			sendKeysEnter
			sendKeysTab
		end

		it "Sets an invalid Termial id in text field" do
			adminTerminalTransactionModalTerminalTextField.flash.set ($adminTerminalTransactionTerminalIdInvalid)
			sendKeysTab
		end

		it "Verifies the invalid error message" do
			verifyTerminalTransactionResultError("Terminal '100' not found!")
		end

		it "Clicks on the Clear button" do
			adminTerminalTransactionModalClearButton.flash.click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
