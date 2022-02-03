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

RSpec.describe "Admin Seller Control functionality test", :regression do
  begin
    before(:all) do
      puts "adminSellerControlTest"
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

		it "Clicks on the Seller tab" do
      adminMenuLinks("Seller").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Control link" do
      eventMenuLinks("Control").wait_until_present.flash(color: ["yellow"]).click
    end

		it "Verifies Seller Control modal" do
			adminSellerControlModal.flash(color: ["yellow"])
		end

		it "Sets invalid Seller id in text field" do
			adminSellerControlModalSellerTextField.flash(color: ["yellow"]).set ($sellerIdInvalid)
			sendKeysTab
		end

		it "Verifies the Seller Balance invalid id error" do
			verifySellerControlError("Seller 'TNT' not found!")
		end

		it "Sets a valid Seller id in text field" do
			adminSellerControlModalSellerTextField.flash(color: ["yellow"]).click
			sendKeysClear
			adminSellerControlModalSellerTextField.flash(color: ["yellow"]).set ($sellerId)
			adminSellerControlModalSellerTextField.flash(color: ["yellow"]).set ($sellerId)
			sendKeysTab
		end

		it "Verifies the Seller Lock button" do
			adminSellerControlModalLockButton.flash(color: ["yellow"])
		end

		it "Clicks on the Lock button" do
			adminSellerControlModalLockButton.flash(color: ["yellow"]).click
		end

		it "Verifies the Lock Seller modal" do
			adminSellerControlLockSellerModal.flash(color: ["yellow"])
		end

		it "Sets the one character code in text field" do
			adminSellerControlLockSellerModalTextField.flash(color: ["yellow"]).set ($lockSellerOneCharacter)
			sendKeysTab
		end

		it "Clicks on the Yes button" do
			adminSellerControlLockSellerModalYesButton.flash(color: ["yellow"]).click
			adminSellerControlLockSellerModalYesButton.wait_while_present
		end

		it "Verifies the Locked icon" do
			adminSellerControlModalLockIcon.flash(color: ["yellow"])
		end

		it "Clicks on the Unlock button" do
			adminSellerControlModalUnlockButton.flash(color: ["yellow"]).click
		end

		it "Verifies the Unlock Seller modal" do
			adminSellerControlUnlockSellerModal.flash(color: ["yellow"])
		end

		it "Clicks on the Yes button" do
			adminSellerControlUnlockSellerModalYesButton.flash(color: ["yellow"]).click
		end

		it "Verifies the Unlock icon" do
			adminSellerControlModalUnlockIcon.flash(color: ["yellow"])
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
