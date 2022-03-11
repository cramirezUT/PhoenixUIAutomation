## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTES: Need to find out how to get checks "held" in
## order to see more functionality open
## go to transactions tab and set the source group as Test
## select Deposit then select the checkbox
## then set the Account to : TST-8683
## Amount above $500
## You can see the check help in the Checks tab

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountChecksPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountChecksPage
end

RSpec.describe "Admin->Account->Checks: Account Checks validation", :regression do
  begin
    before(:all) do
      $continue = true
      puts "adminAccountChecksTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    around(:each) do |example|
      if $continue
        $continue = false
        example.run
        $continue = true unless example.exception
      else
        example.skip
      end
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

    it "Clicks on the Checks link" do
      eventMenuLinks("Checks").wait_until_present.flash.click
    end

    it "Sets an invalid Account Group Number" do
      accountChecksModal.wait_until_present.flash
      accountChecksSearchTextField.wait_until_present.flash.set ($accountGroupIdInvalid)
      sendKeysEnter
    end

		it "Verifies the account Checks error" do
			verifyAccountChecksError('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild account Checks group id" do
			accountChecksModal.wait_until_present.flash
			accountChecksSearchTextField.click
			sendKeysClear
      accountChecksSearchTextField.flash.set ($accountGroupId)
      accountChecksSearchTextField.flash.set ($accountGroupId)
      sendKeysEnter
		end

    it "Verifies the Account Held Checks result table" do
      accountChecksResultTable.flash
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
