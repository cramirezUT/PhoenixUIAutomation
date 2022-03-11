## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestReviewPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestReviewPage
end

RSpec.describe "Admin->Contest->Review: Contest Review Date verification test", :regression do
  begin
    before(:all) do
      $continue = true
      puts "adminContestPlayerReviewDateTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
      puts "Current Time: #{$currentDateTime}"
      puts "Current Time Plus 1 Day: #{$currentDateTimePlus1Day}"
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
      contestPlayerReviewModalPlayerTextField.flash.set ($playerGroupdId)
      sendKeysEnter
		end

		it "Edits the Begin date" do
			contestPlayerBeginDateTextField.flash.click
      sendKeysSelectAll
      sendKeysDelete
			contestPlayerBeginDateTextField.flash.set ($currentDateTime)
      sendKeysTab
		end

    it "Edits the End date" do
      contestPlayerEndDateTextField.flash.click
      sendKeysSelectAll
      sendKeysDelete
      contestPlayerEndDateTextField.flash.set ($currentDateTimePlus1Day)
      sendKeysTab
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
