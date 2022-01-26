## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminDonationPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AdminDonationPage
end

RSpec.describe "Admin Donation verification test", :regression do
  begin
    before(:all) do
      puts "adminDonationTest"
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
			mainMenuLinks("Admin").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Donation tab" do
      adminMenuLinks("Donation").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Verifies the Admin Donation modal" do
			adminDonationGroupModal.flash(color: ["yellow"])
		end

		it "Sets an invalid Group id" do
      adminDonationGroupModalGroupDropdown.flash(color: ["yellow"]).click
      adminDonationGroupModalGroupSearchTextField.flash(color: ["yellow"]).set ($groupIdInvalid)
		end

		it "Verifies invalid Group Id error" do
			verifyAdminDonationError('No matches found')
		end

		it "Sets a valid Group id" do
			adminDonationGroupModal.flash(color: ["yellow"])
      adminDonationGroupModalGroupDropdown.flash(color: ["yellow"]).click
			adminDonationGroupModalGroupDropdown.flash(color: ["yellow"]).click
      adminDonationGroupModalGroupSearchTextField.flash(color: ["yellow"]).set ($groupId)
			sendKeysEnter
    	sendKeysTab
		end

		it "Verifies the 1st Donation Charity modal" do
			verifyAdminDonationCharityModal(0)
		end

		it "Clicks on the 1st Donate button" do
			donationCharityResultModalDonateButtonByIndex(0).flash(color: ["yellow"]).click
		end

		it "Verifies the Donate to modal" do
			donationCharityDonateToModal.flash(color: ["yellow"])
		end

		it "Sets $2.00 dollar in the Donation Amount text field" do
			donationCharityDonateToModalDonationAmountTextField.flash(color: ["yellow"]).set ($donationAmountTwoDollar)
			sendKeysTab
		end

		it "Clicks on the Yest button" do
			donationCharityDonateToModalYesButton.flash(color: ["yellow"]).click
		end

		it "Clicks on the Withdraw button" do
			donationCharityResultModalWithdrawButtonByIndex(0).flash(color: ["yellow"]).click
		end

		it "Verifies the Withdraw From modal" do
			donationCharityWithdrawToModal.flash(color: ["yellow"])
		end

		it "Sets $1.00 dollar in the Withdraw Amount text field" do
			donationCharityWithdrawToModalWithdrawAmountTextField.flash(color: ["yellow"]).set ($withdrawAmountOneDollar)
			sendKeysTab
		end

		it "Clicks on the Yest button" do
			donationCharityWithdrawToModalYesButton.flash(color: ["yellow"]).click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
