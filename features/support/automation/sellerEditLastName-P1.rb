## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/filesSellerEditPage.rb"
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
  c.include AdminSellerFindPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Seller->Edit admin Seller Edit Last Name-P1", :sellerEdit do
  begin
    before(:all) do
      puts "adminSellerEditLastName-P1"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminSellerFind-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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


		it "Navigate to Seller Edit" do
			filesVerificationEnter.flash.click
			filesVerificationEnter.flash(color: ["yelllow"]).set ("change")
      sendKeysTab
      filesVerificationEnter.flash(color: ["yelllow"]).set ("edit")
			sendKeysTab
		end

		it "Click on Seller" do
			sellerEditMenu.flash.click
		end

		it "enter Seller group Number" do
			enterSellerGroupNumber.flash(color: ["yelllow"]).set ("UTS-3")
      sendKeysTab
		end

    it "enter edit button" do
			sellerEdit.flash(color: ["yelllow"]).click
		end

    it "Edit Last Name" do
			sellerLastName.flash(color: ["yelllow"]).clear
      sellerLastName.flash(color: ["yelllow"]).set ("Aron5")
      sendKeysTab
		end

    it "Enter Save Button" do
      sellerSave.flash(color: ["yelllow"]).click
    end

	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
