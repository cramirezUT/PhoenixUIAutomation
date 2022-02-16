## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminDealerPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AdminDealerPage
end

RSpec.describe "Admin Dealer verification test", :regression do
  begin
    before(:all) do
      puts "adminDealerTest"
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
			mainMenuLinks("Admin").wait_until_present.flash.click
		end

		it "Clicks on the Dealer tab" do
      adminMenuLinks("Dealer").wait_until_present.flash.click
		end

		it "Verifies the Admin Dealer modal" do
			adminDealerModal.flash
		end

		it "Sets an invalid Dealer id" do
      adminDealerModalDealerTextField.flash.click
      adminDealerModalDealerTextField.flash.set ($dealerIdInvalid)
    	sendKeysTab
		end

		it "Verifies invalid Admin Dealer error" do
			verifyAdminDealerError("Invalid seller 'TNT'!")
		end

		it "Sets a valid Dealer id" do
			adminDealerModal.flash
      adminDealerModalDealerTextField.wait_until_present.flash
			sendKeysClear
      adminDealerModalDealerTextField.flash.set ($dealerId)
			adminDealerModalDealerTextField.flash.set ($dealerId)
    	sendKeysTab
		end

		it "Sets the dealer pin" do
			adminDealerModalPinTextField.flash.click
			adminDealerModalPinTextField.flash.set ($dealerPin)
			sendKeysTab
		end

		it "Verifies the Admin Dealer command modal" do
			adminDealerCommandModal.flash
		end

		it "Clicks on the Balance button" do
			adminDealerCommandModalBalanceButton.flash.click
		end

		it "Verifies the Admin Dealer Balance modal" do
			adminDealerBalanceModal.flash
		end

		it "Sets the balance amount to 0.00" do
			adminDealerBalanceModalCashTextField.wait_until_present.flash
			adminDealerBalanceModalCashTextField.set ($cashBalanceAmountZero)
		end

		it "Click the Transaction button" do
			adminDealerCommandModalTransactionButton.flash.click
		end

		it "Verifies the Admin Dealer Dealer modal" do
			adminDealerUserModal.flash
		end

		it "Sets the Type option to Draw from dropdown" do
			adminDealerUserModalTypeDropdown.flash.click
			adminDealerUserModalTypeSearchTextField.flash.set ($typeOptionDraw)
			sendKeysEnter
			sendKeysTab
		end

		it "Sets the Amount in Amount text field" do
			adminDealerUserModalAmountTextfield.flash.set ($amountOneDollar)
			sendKeysEnter
		end

		it "Clicks on the Submit button" do
			adminDealerUserModalSubmitButton.flash.click
		end

		it "Verifies the Cash amount set" do
			verifyAdminDealerHistoryContent('Cash for $1.00')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
