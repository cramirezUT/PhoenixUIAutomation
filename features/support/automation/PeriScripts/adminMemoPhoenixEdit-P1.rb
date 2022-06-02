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
      puts "adminMemoAddCreateTest"
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

    it "Clicks on the Memo tab" do
      adminMenuLinks("Memo").wait_until_present.flash.click
		end

    it "Select a memo" do
    adminMemoModalMemoByIndex(0).wait_until_present.flash.click
		end


		it "Verifies the subject modal" do
			adminMemoSubjectModal.flash
		end

		it "Sets a new subject in text field" do
			adminMemoSubjectModalSubjectTextField.flash.set ($newSubjectText)
		end

		it "Sets body text" do
      adminMemoSubjectModalBodyTextArea.flash.click
			adminMemoSubjectModalBodyTextArea.flash.set ($newBodyText+"Edit")
		end

		it "Clicks on the close button" do
			adminMemoSubjectModalCloseButton.flash.click
		end

		it "Click memo Confirm No " do
		   adminMemoDeleteModalNoButton.flash.click
		end

    it "Clicks on the save button" do
			adminMemoSubjectModalSaveButton.flash.click
		end

    it "Verifies the memo was set" do
      adminMemoModalMemoByIndex(0).flash.Click
      verifyNewMemoBodyText($newMemoText)
    end


	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end