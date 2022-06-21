## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountBalancePage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountBalancePage
end

RSpec.describe "Admin->Account->Balance: Account balance validation", :adminAccount do
  begin
    before(:all) do
      puts "adminAccountBalanceTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    before :all do
      $continue = true
    end

    around :each do |example|
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
  	    screenshot_file = "features/support/automation_screenshots/adminAccountBlock-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
  	    @browser.driver.save_screenshot(screenshot_file)
        sleep 1
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

    it "Clicks on the Balance link" do
      eventMenuLinks("Balance").wait_until_present.flash.click
    end

    it "Sets the Account Group Number" do
      accountBalanceModal.wait_until_present.flash
      accountBalanceSearchTextField.wait_until_present.flash.set ($adminAccountBalanceInvalidGroupId)
      sendKeysEnter
    end

		it "Verifies the account balance error" do
			verifyAccountBalanceError('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild account balance group id" do
			accountBalanceModal.wait_until_present.flash
			accountBalanceSearchTextField.click
			sendKeysClear
      accountBalanceSearchTextField.wait_until_present.flash.set ($adminAccountBalanceGroupId)
      sendKeysEnter
		end

		it "Verifies the account balance amount" do
			verifyAccountBalanceAmount('$73,419.02')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
