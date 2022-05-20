## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTES: There is a bug in the edit donation settings modal
## setting the number of days works, but deleting and trying to
## the days blanks always sets the donation days to "0" which
## will set the donation period to never ending.
## verified with Charley this is a bug!

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountDonationPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountDonationPage
end

RSpec.describe "Admin->Account->Donation: Account Group Number validation", :regression do
  begin
    before(:all) do
      puts "adminAccountDonationTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminAccountDonation-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

    it "Clicks on the Donation link" do
      eventMenuLinks("Donation").wait_until_present.flash.click
    end

    it "Sets the Account Group Number" do
      accountDonationModal.wait_until_present.flash
      accountDonationSearchTextField.wait_until_present.flash.set ($invalidAccountGroupId)
      sendKeysEnter
    end

		it "Verifies the account Donation error" do
			verifyAccountDonationError('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild account Donation group id" do
			accountDonationModal.wait_until_present.flash
			accountDonationSearchTextField.click
			sendKeysClear
      accountDonationSearchTextField.flash.set ($accountGroupId)
			accountDonationSearchTextField.flash.set ($accountGroupId)
      sendKeysEnter
		end

		it "Clicks on the Edit button" do
			accountDonationEditButton.flash.click
		end

    it "Verifies the Auto Donation Modal" do
      autoDonationSettingsModal.flash
    end

		it "Sets text in the Days text field" do
			if (getAcountDonationDaysLabel.text) == ('AUTO DONATE ON FOREVER')
        autoDonationSettingsModalDaysTextField.flash.click
  			sendKeysBackspace
  			autoDonationSettingsModalDaysTextField.flash.click
  			autoDonationSettingsModalDaysTextField.flash.set ($numberOfDays1)
        sendKeysEnter
        autoDonationSettingsModalSaveButton.flash.click
        verifyAccountDonationDays('AUTO DONATE ON FOR 1 DAYS')
      else if (getAcountDonationDaysLabel.text) == ('AUTO DONATE ON FOR 1 DAYS')
        autoDonationSettingsModalDaysTextField.flash.click
  			sendKeysBackspace
  			autoDonationSettingsModalDaysTextField.flash.click
  			autoDonationSettingsModalDaysTextField.flash.set ($numberOfDays1)
        autoDonationSettingsModalCheckbox.flash.click
        autoDonationSettingsModalCheckbox.flash.click
        autoDonationSettingsModalSaveButton.flash.click
        verifyAccountDonationDays('AUTO DONATE ON FOREVER')
      end
      end
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
