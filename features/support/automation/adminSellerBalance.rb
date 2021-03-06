## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminSellerBalancePage.rb"
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
  c.include AdminSellerBalancePage
  c.include WindowsHelpers
end

RSpec.describe "Admin-Seller->Balance: Admin Seller Balance functionality test", :adminSeller do
  begin
    before(:all) do
      puts "adminSellerBalanceTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminSellerBalance-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Balance link" do
      eventMenuLinks("Balance").wait_until_present.flash.click
    end

		it "Verifies Seller Balance modal" do
			adminSellerBalanceModal.flash
		end

		it "Sets an invalid Seller id in text field" do
			adminSellerBalanceModalSellerTextField.flash.set ($adminSellerBalanceSellerIdInvalid)
			sendKeysTab
		end

		it "Verifies the Seller Balance invalid id error" do
			verifySellerBalanceError("Seller number 'TNT' is invalid!")
		end

		it "Sets a valid Seller id in text field" do
      adminSellerBalanceModalSellerTextField.flash.click
      sendKeysBackspace
      sendKeysBackspace
      sendKeysBackspace
      sleep(1)
			adminSellerBalanceModalSellerTextField.flash.set ($adminSellerBalanceSellerId)
      sleep(1)
			sendKeysEnter
		end

		it "Verifies the Seller Balance Balance modal" do
			adminSellerBalanceResultModal.flash
		end

		it "Verifies the Beginning balance" do
			puts "Beginning Balance: #{adminSellerBalanceResultModalBeginningBalance.text}"
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
