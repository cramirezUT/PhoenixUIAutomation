## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountSummaryPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountSummaryPage
end

RSpec.describe "Admin->Account->Summary: Account Summary verify summaries for various options", :adminAccount do
  begin
    before(:all) do
      puts "adminAccountSummaryTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminAccountSummary-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

    it "Clicks on the Summary link" do
      eventMenuLinks("Summary").wait_until_present.flash.click
    end

		it "Sets invalid currency" do
			summaryAccountCurrencyDropdown.flash.click
			summaryAccountCurrencySearchTextField.wait_until_present.flash.set ($currencyInvalid)
		end

		it "Verifies invalid currency error" do
			verifySummaryAccountErrorSearchResults('No matches found')
		end

    it "Sets currency to USD" do
			summaryAccountCurrencyDropdown.flash.click
			summaryAccountCurrencyDropdown.flash.click
			summaryAccountCurrencySearchTextField.wait_until_present.flash.set ($currencyUSD)
			sendKeysEnter
			sendKeysTab
    end

		it "Clicks on the Deposit button" do
			summaryAccountDepositButton.flash.click
		end

		it "Clicks on the Cash button" do
			summaryAccountCashButton.wait_until_present.flash.click
		end

		it "Verifies the account Summary for Cash" do
			verifySummaryAccountSearchResults('Cash Deposit')
		end

		it "Clicks on the Check button" do
			summaryAccountCheckButton.flash.click
		end

		it "Verifies the account Summary for Check" do
			verifySummaryAccountSearchResults('Check Deposit')
		end

		it "Clicks on the Total button" do
			summaryAccountTotalButton.flash.click
		end

		it "Verifies the account Summary for Totals" do
			verifySummaryAccountSearchResults('Deposits')
		end

		it "Clicks on the Withdraw button" do
			summaryAccountWithdrawButton.flash.click
		end

		it "Clicks on the Cash button" do
			summaryAccountCashButton.flash.click
		end

		it "Verifies the account Summary for Totals" do
			verifySummaryAccountSearchResults('Cash Withdraws')
		end

		it "Clicks on the Check button" do
			summaryAccountCheckButton.flash.click
		end

		it "Verifies the account Summary for Check" do
			verifySummaryAccountSearchResults('Check Withdraws')
		end

		it "Clicks on the Total button" do
			summaryAccountTotalButton.flash.click
		end

		it "Verifies the account Summary for Totals" do
			verifySummaryAccountSearchResults('Withdraws')
		end

		it "Clicks on the Adjust button" do
			summaryAccountAdjustButton.flash.click
		end

		it "Verifies the account Summary for Adjust" do
			verifySummaryAccountSearchResults('Adjusts')
		end

		it "Clicks on the Cancel button" do
			summaryAccountCancelButton.flash.click
		end

		it "Verifies the account Summary for Adjust" do
			verifySummaryAccountSearchResults('Cancels')
		end

		it "Clicks on the Pay button" do
			summaryAccountPayButton.flash.click
		end

		it "Verifies the account Summary for Pay" do
			verifySummaryAccountSearchResults('Winnings')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
