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

RSpec.describe "Admin->Terminal->Transaction->Type: Admin Terminal Transaction Types functionality test", :adminTerminal do
  begin
    before(:all) do
      puts "adminTerminalTransactionTypesTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminTerminalTransactionType-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Sets the Terminal id" do
			adminTerminalTransactionModalTerminalTextField.flash.set ($adminTerminalTransactionTerminalId)
			sendKeysTab
		end

		it "Verifies the Current Balance amount" do
			$stringCurrentBalance = getAdminTerminalTransactionNewBalance.text[0..7].gsub!(/[\s!$@%\/&"']/,'')
			puts "Current New Balance Text: #{$stringCurrentBalance}"
			$floatNewBlance = $stringCurrentBalance.to_f.round(3)
			puts "Current New Balance Float: #{$floatNewBlance}"
		end

		it "Clicks on the Money button" do
			adminTerminalTransactionModalMoneyButton.flash.click
		end

		it "Verifies the Money modal" do
			adminTerminalTransactionMoneyMondal.flash
		end

		it "Sets a count in the first text field" do
			adminTerminalTransactionMoneyMondalCount01TextField.flash.set ($adminTerminalTransactionMoneyCount)
			sendKeysTab
		end

		it "Sets a count in the second text field" do
			adminTerminalTransactionMoneyMondalCount05TextField.flash.set ($adminTerminalTransactionMoneyCount)
			sendKeysTab
		end

		it "Clicks on the Save button" do
			adminTerminalTransactionMoneyMondalSaveButton.flash.click
		end

		it "Verifies Terminal Transaction modal" do
			adminTerminalTransactionModal.flash
		end

		it "Clicks on the Submit button" do
			adminTerminalTransactionModalSubmitButton.flash.click
		end

		it "Verifies the New Balance amount" do
			$newTotalBalance = $floatNewBlance + 0.06.to_f
			puts "New Total Float Balance Added: #{$newTotalBalance.round(3)}"
			verifyTerminalTransactionNewBalance($newTotalBalance.round(3))
		end

		it "Verifies the history text" do
			verifyTerminalTransactionHistoryText("$0.06 to terminal EBET01 for balance of $#{$newTotalBalance.round(3)}")
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
