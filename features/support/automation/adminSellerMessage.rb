## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminSellerMessagePage.rb"
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
  c.include AdminSellerMessagePage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Seller->Message: Admin Seller Message functionality test", :adminSeller do
  begin
    before(:all) do
      puts "adminSellerMessageTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminSellerMessage-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Message link" do
      eventMenuLinks("Message").wait_until_present.flash.click
    end

		it "Verifies Seller Over Message modal" do
			adminSellerMessageModal.flash
		end

		it "Sets an invalid Seller id in text field" do
			adminSellerMessageModalSellerTextField.flash.set ($adminSellerMessageSellerIdInvalid)
			sendKeysTab
		end

		it "Verifies the invalid Seller id error" do
			verifySellerMessageError("Seller 'TNT' not found")
		end

		it "Sets a valid Seller id in text field" do
			adminSellerMessageModalSellerTextField.flash.click
			sendKeysClear
			adminSellerMessageModalSellerTextField.flash.set ($adminSellerMessageSellerId)
			adminSellerMessageModalSellerTextField.flash.set ($adminSellerMessageSellerId)
			sendKeysTab
		end

		it "Verifies the Seller is not logged on error" do
			verifySellerNotLoggedOnError('Seller UTS1-Goode, Johnny B is not logged on to any terminal')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
