## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminSellerBalancePage.rb"
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
  c.include AdminSellerBalancePage
  c.include WindowsHelpers
end

RSpec.describe "Admin Seller Balance functionality test", :regression do
  begin
    before(:all) do
      $continue = true
      puts "adminSellerBalanceTest"
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
			adminSellerBalanceModalSellerTextField.flash.set ($sellerIdInvalid)
			sendKeysTab
		end

		it "Verifies the Seller Balance invalid id error" do
			verifySellerBalanceError("Seller 'TNT' not found!")
		end

		it "Sets a valid Seller id in text field" do
			adminSellerBalanceModalSellerTextField.flash.set ($sellerId)
			sendKeysTab
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
