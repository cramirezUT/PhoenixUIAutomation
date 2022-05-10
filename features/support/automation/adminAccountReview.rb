## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountReviewPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountReviewPage
end

RSpec.describe "Account Review verification test", :regression do
  begin
    before(:all) do
      puts "adminAccountReviewTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminAccountReview-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Review link" do
			eventMenuLinks("Review").wait_until_present.flash.click
		end

		it "Sets an invalid Account id" do
			accountReviewModal.wait_until_present.flash
			accountReviewSearchTextField.flash.click
      accountReviewSearchTextField.flash.set ($invalidGroupId)
      sendKeysEnter
		end

		it "Verifies the No matches found error" do
			verifyReviewEventErrorSearchResults('A group must be specified! <group id>-<number>')
		end

		it "Sets the valid Account id" do
			accountReviewSearchTextField.flash.click
      accountReviewSearchTextField.flash.set ($accountGroupId)
      sendKeysEnter
			sendKeysTab
		end

		it "Verifies the filter bar is displayed" do
      accountReviewFilterBar.flash
    end

		it "Verifies the results box by index" do
			accountReviewResultsBoxByIndex(0).flash
			accountReviewResultsBoxByIndex(1).flash
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
