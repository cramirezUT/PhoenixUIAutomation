## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminSellerSummaryPage.rb"
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
  c.include AdminSellerSummaryPage
  c.include WindowsHelpers
end

RSpec.describe "Admin Seller Summary functionality test", :regression do
  begin
    before(:all) do
      puts "adminSellerSummaryTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminSellerSummary-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Summary link" do
      eventMenuLinks("Summary").wait_until_present.flash.click
    end

		it "Verifies Seller Over Summary modal" do
			adminSellerGroupSummaryModal.flash
		end

		it "Sets an invalid Group id in text field" do
			adminSellerGroupSummaryModalGroupsDropdown.flash.click
			adminSellerGroupSummaryModalGroupsSearchTextField.flash.set ($groupsIdInvalid)
		end

		it "Verifies the invalid Seller id error" do
			verifySellerSummaryError("No matches found")
		end

		it "Sets a valid Seller id in text field" do
			adminSellerGroupSummaryModalGroupsDropdown.flash.click
			adminSellerGroupSummaryModalGroupsDropdown.flash.click
			adminSellerGroupSummaryModalGroupsSearchTextField.flash.set ($groupsId)
			sendKeysEnter
			sendKeysEnter
			sendKeysTab
		end

		it "Verifies the Seller Group result modal" do
			sellerGroupSummarySearchResultModal.flash
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
