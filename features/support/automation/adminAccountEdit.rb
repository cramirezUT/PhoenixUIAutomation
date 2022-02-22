## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTES: Need to find out how to get a valid account number
## just need to enter the end of the account number 8683

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountEditPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountEditPage
end

RSpec.describe "Admin->Account->Edit: Account Edit validation", :regression do
  begin
    before(:all) do
      puts "adminAccountEditTest"
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

		it "Clicks on the Account tab" do
      adminMenuLinks("Account").wait_until_present.flash.click
		end

    it "Clicks on the Edit link" do
      eventMenuLinks("Edit").wait_until_present.flash.click
    end

    it "Sets the Action option to View" do
      accountEditModal.wait_until_present.flash
			accountEditActionDropdown.flash.click
      accountEditActionSearchTextField.wait_until_present.flash.set ($accountActionOptionView)
      sendKeysEnter
			sendKeysTab
    end

		it "Sets the Group option" do
			accountEditGroupDropdown.flash.click
			accountEditGroupSearchTextField.flash.set ($accountGroupId)
			sendKeysEnter
			sendKeysTab
			sendKeysTab
		end

		it "Sets an invalid account id" do
			accountEditAccountSearchTextField.flash.set ($accountIdInvalid)
			sendKeysEnter
		end

		it "Verifies the account error" do
			verifyAccountEditError("Invalid account number 'TNT'!")
		end

		it "Sets a vaild account id" do
			accountEditAccountSearchTextField.flash.click
			sendKeysClear
      accountEditAccountSearchTextField.flash.set ($accountId)
      accountEditAccountSearchTextField.flash.set ($accountId)
      sendKeysEnter
		end

		it "Verifies the valid account id" do
			verifyAccountEditExistingAlert("Account TST-8683 has existing transactions!")
		end

    it "Clicks on the close button in the result modal" do
      accountEditResultModalCloseButton.flash.click
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
