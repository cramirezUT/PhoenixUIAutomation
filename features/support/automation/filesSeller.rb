## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/filesPage.rb"
require_relative "../pages/FilesSellerPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include FilesPage
  c.include FilesSellerPage
end

RSpec.describe "Files->Seller: Verify the table options in the Displayed Columns modal", :files do
  begin
    before(:all) do
      puts "filesAccountBlock"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/filesSeller-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
  	    @browser.driver.save_screenshot(screenshot_file)
        sleep 1
        @browser.quit
	    end
	  end

    it "Verifies the main system text in the header menu" do
      isMainSystemTextDisplayed
    end

		it "Clicks on the Files tab in the main menu" do
			mainMenuLinks("Files").wait_until_present.flash.click
		end

		it "Sets text in the Files Verification and Access Level fields" do
      filesVerificationAcessTextField.wait_until_present.flash.set ("change")
      sendKeysEnter
      filesVerificationAcessTextField.wait_until_present.flash.set ("edit")
      sendKeysEnter
		end

		it "Click the Seller sub tab in the commands menu" do
      filesCommandMenuLinks("Seller").wait_until_present.flash.click
		end

		it "Verifies the Seller Configuration modal is displayed" do
      verifySellerConfigurationModal
		end

		it "Sets the Seller group number" do
			sellerConfigurationModalSellerTextField.flash.set ($filesSellerGroupNumber)
			sendKeysEnter
		end

		it "Verifies the Seller modal" do
			sellerModal.flash
		end
  ensure
    after(:all) do
      logOutFuction
      close_browser
    end
  end
end
