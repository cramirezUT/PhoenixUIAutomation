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
			mainMenuLinks("Admin").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Dealer tab" do
      adminMenuLinks("Dealer").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Verifies the Admin Dealer modal" do
			adminDealerModal.flash(color: ["yellow"])
		end

		it "Sets an invalid Dealer id" do
      adminDealerModalDealerTextField.flash(color: ["yellow"]).click
      adminDealerModalDealerTextField.flash(color: ["yellow"]).set ($dealerIdInvalid)
    	sendKeysTab
		end

		it "Verifies invalid Admin Dealer error" do
			verifyAdminDealerError("Invalid seller 'TNT'!")
		end

		it "Sets a valid Dealer id" do
			adminDealerModal.flash(color: ["yellow"])
      adminDealerModalDealerTextField.wait_until_present.flash(color: ["yellow"])
			sendKeysClear
      adminDealerModalDealerTextField.flash(color: ["yellow"]).set ($dealerId)
			adminDealerModalDealerTextField.flash(color: ["yellow"]).set ($dealerId)
    	sendKeysTab
		end

		it "Sets the dealer pin" do
			adminDealerModalPinTextField.flash(color: ["yellow"]).click
			adminDealerModalPinTextField.flash(color: ["yellow"]).set ($dealerPin)
			sendKeysTab
		end

		it "Verifies the Admin Dealer command modal" do
			adminDealerCommandModal.flash(color: ["yellow"])
		end

		it "Clicks on the Balance button" do
			adminDealerCommandModalBalanceButton.flash(color: ["yellow"]).click
		end

		it "Verifies the Admin Dealer Balance modal" do
			adminDealerBalanceModal.flash(color: ["yellow"])
		end

		it "Sets the balance amount to 0.00" do
			adminDealerBalanceModalCashTextField.wait_until_present.flash(color: ["yellow"])
			adminDealerBalanceModalCashTextField.set ($cashBalanceAmountZero)
		end

		it "Click the Transaction button" do
			adminDealerCommandModalTransactionButton.flash(color: ["yellow"]).click
		end

		it "Verifies the Admin Dealer Dealer modal" do
			adminDealerUserModal.flash(color: ["yellow"])
		end

		it "Sets the Type option to Draw from dropdown" do
			adminDealerUserModalTypeDropdown.flash(color: ["yellow"]).click
			adminDealerUserModalTypeSearchTextField.flash(color: ["yellow"]).set ($typeOptionDraw)
			sendKeysEnter
			sendKeysTab
		end

		it "Sets the Amount in Amount text field" do
			adminDealerUserModalAmountTextfield.flash(color: ["yellow"]).set ($amountOneDollar)
			sendKeysEnter
		end

		it "Clicks on the Submit button" do
			adminDealerUserModalSubmitButton.flash(color: ["yellow"]).click
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
