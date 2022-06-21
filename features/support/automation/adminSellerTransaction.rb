## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminSellerTransactionPage.rb"
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
  c.include AdminSellerTransactionPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Seller->Transaction: Admin Seller Transaction functionality test", :adminSeller do
  begin
    before(:all) do
      puts "adminSellerTransactionTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminSellerTransaction-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Seller tab" do
      adminMenuLinks("Seller").wait_until_present.flash.click
		end

		it "Clicks on the Transaction link" do
      eventMenuLinks("Transaction").wait_until_present.flash.click
    end

		it "Verifies Seller Transaction modal" do
			adminSellerTransactionModal.flash
		end
		#### TYPE PAYMENT ####
		it "Selects the Payment Type" do
			adminSellerTransactionModalTypeDropdown.flash.click
			adminSellerTransactionModalTypeSearchTextField.flash.set ($adminSellerTransactionSellerTypeOptionPayment)
			sendKeysEnter
			sendKeysTab
		end

		it "Sets the Seller id in text field" do
			adminSellerTransactionModalSellerTextField.flash.set ($adminSellerTransactionSellerId)
			adminSellerTransactionModalSellerTextField.flash.set ($adminSellerTransactionSellerId)
			sendKeysTab
		end

		it "Sets an amount in the amount text field" do
			adminSellerTransactionModalCurrencyAmountTextField.flash.set ($adminSellerTransactionSellerAmountOneDollar)
			sendKeysTab
		end

		it "Clicks on the Submit button" do
			adminSellerTransactionModalSubmitButton.flash.click
		end

		it "Verifies the transaction amount was summited" do
			verifySellerTransactionHistrory('PAYMENT $1.00 for seller (UTS1)')
		end
		#### TYPE ADUJUST ####
		it "Selects the Adjust Type" do
			adminSellerTransactionModalTypeDropdown.flash.click
			adminSellerTransactionModalTypeSearchTextField.flash.set ($adminSellerTransactionSellerTypeOptionAdjust)
			sendKeysEnter
			sendKeysTab
		end

		it "Sets the Seller id in text field" do
			adminSellerTransactionModalSellerTextField.flash.set ($adminSellerTransactionSellerId)
			adminSellerTransactionModalSellerTextField.flash.set ($adminSellerTransactionSellerId)
			sendKeysTab
		end

		it "Sets an amount in the amount text field" do
			adminSellerTransactionModalCurrencyAmountTextField.flash.set ($adminSellerTransactionSellerAmountOneDollar)
			sendKeysTab
		end

		it "Clicks on the Submit button" do
			adminSellerTransactionModalSubmitButton.flash.click
		end

		it "Verifies the transaction amount was summited" do
			verifySellerTransactionHistrory('ADJUST $1.00 for seller (UTS1)')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
