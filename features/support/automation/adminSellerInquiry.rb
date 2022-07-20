## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminSellerInquiryPage.rb"
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
  c.include AdminSellerInquiryPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Seller->Inquiry: Admin Seller Inquiry functionality test", :adminSeller do
  begin
    before(:all) do
      puts "adminSellerInquiryTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminSellerInquiry-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Inquiry link" do
      eventMenuLinks("Inquiry").wait_until_present.flash.click
    end

		it "Verifies Seller Inquiry modal" do
			adminSellerInquiryModal.flash
		end

		it "Sets an invalid Seller id" do
			adminSellerInquiryModalSellerTextField.flash.set ($adminSellerInquirySellerIdInvalid)
			sendKeysTab
		end

		it "Verifies the invalid name error messgae" do
			verifySellerInquiryError("Seller number 'TNT' is invalid!")
		end

		it "Sets a valid Seller id" do
			adminSellerInquiryModalSellerTextField.flash.click
			sendKeysBackspace
      sendKeysBackspace
      sendKeysBackspace
			adminSellerInquiryModalSellerTextField.flash.click
			adminSellerInquiryModalSellerTextField.flash.set ($adminSellerInquirySellerId)
			sendKeysTab
		end

		it "Verifies the search summary modal" do
			adminSellerInquirySummaryModal.flash
		end

		it "Verifies the date in summary modal" do
			puts "Summary Date: #{getSellerInquirySummaryDate}"
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
