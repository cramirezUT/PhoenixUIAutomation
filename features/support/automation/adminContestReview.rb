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

RSpec.describe "Admin->Contest->Review: Contest Review verification test", :regression do
  begin
    before(:all) do
      puts "adminContestPlayerReviewTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminContestReview-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Sets an invalid Player id in search text field" do
			contestPlayerReviewModalPlayerTextField.flash.set ($playerGroupdIdInvalid)
			sendKeysEnter
		end

		it "Verifies the Player group most be specified error" do
			verifyContestInquiryError('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild Player id" do
			contestPlayerReviewModalPlayerTextField.flash.click
      contestPlayerReviewModalPlayerTextField.flash.set ($playerGroupdId)
      sendKeysEnter
		end
		#### ENTRY RESULT ####
		it "Clicks on the Player Transaction search result for Entry" do
			contestPlayerTransactionResultByIndex(0).flash.click
		end

		it "Verifies the Transaction result header for Entry" do
			verifyContestPlayerReviewHeaderResult('Entry')
		end
		#### ADJUST RESULT ####
		it "Clicks on the Player Transaction search result for Adjust" do
			contestPlayerTransactionResultByIndex(1).flash.click
		end

		it "Verifies the Transaction result header for Adjust" do
			verifyContestPlayerReviewHeaderResult('Adjust')
		end
		#### WITHDRAW RESULT ####
		it "Clicks on the Player Transaction search result for Withdraw" do
			contestPlayerTransactionResultByIndex(3).flash.click
		end

		it "Verifies the Transaction result header for Withdraw" do
			verifyContestPlayerReviewHeaderResult('Withdraw')
		end
		#### DEPOSIT RESULT ####
		it "Clicks on the Player Transaction search result for Deposit" do
			contestPlayerTransactionResultByIndex(4).flash.click
		end

		it "Verifies the Transaction result header for Deposit" do
			verifyContestPlayerReviewHeaderResult('Deposit')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
