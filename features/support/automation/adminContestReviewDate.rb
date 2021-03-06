## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestReviewPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestReviewPage
end

RSpec.describe "Admin->Contest->Review: Contest Review Date verification test", :adminContest do
  begin
    before(:all) do
      puts "adminContestPlayerReviewDateTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
      puts "Current Time: #{$adminContestReviewCurrentDateTime}"
      puts "Current Time Plus 1 Day: #{$adminContestReviewCurrentDateTimePlus1Day}"
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminContestReviewDate-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Contest tab" do
      adminMenuLinks("Contest").wait_until_present.flash.click
		end

		it "Clicks on the Review link" do
			eventMenuLinks("Review").wait_until_present.flash.click
		end

		it "Verifies the Contest Player Review modal" do
			contestPlayerReviewModal.flash
		end

		it "Sets a vaild Player id" do
			contestPlayerReviewModalPlayerTextField.flash.click
      contestPlayerReviewModalPlayerTextField.flash.set ($adminContestReviewPlayerGroupdId)
      sendKeysEnter
		end

		it "Edits the Begin date" do
			contestPlayerBeginDateTextField.flash.click
      sendKeysSelectAll
      sendKeysDelete
			contestPlayerBeginDateTextField.flash.set ($adminContestReviewCurrentDateTime)
      sendKeysTab
		end

    it "Edits the End date" do
      contestPlayerEndDateTextField.flash.click
      sendKeysSelectAll
      sendKeysDelete
      contestPlayerEndDateTextField.flash.set ($adminContestReviewCurrentDateTimePlus1Day)
      sendKeysTab
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
