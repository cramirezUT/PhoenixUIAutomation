## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminSellerControlPage.rb"
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
  c.include AdminSellerControlPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Seller->Control: Admin Seller Control functionality test", :adminSeller do
  begin
    before(:all) do
      puts "adminSellerControlTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminSellerControl-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Control link" do
      eventMenuLinks("Control").wait_until_present.flash.click
    end

		it "Verifies Seller Control modal" do
			adminSellerControlModal.flash
		end

		it "Sets invalid Seller id in text field" do
			adminSellerControlModalSellerTextField.flash.set ($sellerIdInvalid)
			sendKeysTab
		end

		it "Verifies the Seller Balance invalid id error" do
			verifySellerControlError("Seller 'TNT' not found!")
		end

		it "Sets a valid Seller id in text field" do
			adminSellerControlModalSellerTextField.flash.click
			sendKeysClear
			adminSellerControlModalSellerTextField.flash.set ($sellerId)
			adminSellerControlModalSellerTextField.flash.set ($sellerId)
			sendKeysTab
		end

		it "Verifies the Seller Lock button" do
			adminSellerControlModalLockButton.flash
		end

		it "Clicks on the Lock button" do
			adminSellerControlModalLockButton.flash.click
		end

		it "Verifies the Lock Seller modal" do
			adminSellerControlLockSellerModal.flash
		end

		it "Sets the one character code in text field" do
			adminSellerControlLockSellerModalTextField.flash.set ($lockSellerOneCharacter)
			sendKeysTab
		end

		it "Clicks on the Yes button" do
			adminSellerControlLockSellerModalYesButton.flash.click
			adminSellerControlLockSellerModalYesButton.wait_while_present
		end

		it "Verifies the Locked icon" do
			adminSellerControlModalLockIcon.flash
		end

		it "Clicks on the Unlock button" do
			adminSellerControlModalUnlockButton.flash.click
		end

		it "Verifies the Unlock Seller modal" do
			adminSellerControlUnlockSellerModal.flash
		end

		it "Clicks on the Yes button" do
			adminSellerControlUnlockSellerModalYesButton.flash.click
		end

		it "Verifies the Unlock icon" do
			adminSellerControlModalUnlockIcon.flash
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
