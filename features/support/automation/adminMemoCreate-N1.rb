## e2e RSpec/Ruby Test
## Author: Peri

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminMemoPage.rb"
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
  c.include AdminMemoPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Memo: Admin Memo Create functionality test", :adminMemo do
  begin
    before(:all) do
      puts "AdminMemoCreate-N1"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminMemoAddDelete-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Memo tab" do
      adminMenuLinks("Memo").wait_until_present.flash.click
		end

		it "Clicks on the Add button" do
			adminMemoModalAddButton.wait_until_present.flash.click
		end
    #### ADD NEW MEMO ####
		it "Verifies the New Memo modal" do
			adminMemoNewMemoModal.flash
		end

		it "Sets a new Memo name in text field" do
			adminMemoNewMemoModalMemoNameField.flash.set ($adminMemoErrorText)
			sendKeysTab
      verifyNewMemoTextMoreThanGivenChar("Invalid memo name")
		end

    it "Clicks on the No button in the New Memo modal" do
      adminMemoDeleteModalNoButton.flash.click
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
