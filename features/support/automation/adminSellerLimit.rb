## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminSellerLimitPage.rb"
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
  c.include AdminSellerLimitPage
  c.include WindowsHelpers
end

RSpec.describe "Admin Seller Limit functionality test", :regression do
  begin
    before(:all) do
      puts "adminSellerLimitTest"
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

		it "Clicks on the Seller tab" do
      adminMenuLinks("Seller").wait_until_present.flash.click
		end

		it "Clicks on the Limit link" do
      eventMenuLinks("Limit").wait_until_present.flash.click
    end

		it "Verifies Seller Over Limit modal" do
			adminSellerLimitModal.flash
		end

		it "Clicks on the Terminals filter button" do
			adminSellerLimitModalTerminalsFilterButton.flash.click
		end

		it "Verifies the Terminal Selection Filter modal" do
			adminSellerTerminalSelectionFilterModal.flash
		end

		it "Clicks on the close button in the Terminal Selection Fitler modal" do
			adminSellerTerminalSelectionFilterModalCloseButton.flash.click
		end

		it "Clicks on the Count View button" do
			adminSellerLimitModalSelectViewButton.flash.click
		end

    it "Verifies the Selected Terminals modal" do
      adminSellersSelectedTerminalsModal.flash
    end

    it "Closes the Selected Terminals modal" do
      adminSellersSelectedTerminalsModalCloseButton.flash.click
    end

    it "Clicks on the Margin button" do
      adminSellerLimitModalMarginButton.flash.click
    end

    it "Verifies the Edit Margin Amount modal" do
      adminSellerEditMarginAmountModal.flash
    end

    it "Clicks on the close button" do
      adminSellerEditMarginAmountModalCloseButton.flash.click
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
