## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountTransactionPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountTransactionPage
end

RSpec.describe "Account Transaction verification test", :regression do
  begin
    before(:all) do
      puts "adminAccountTransactionTest"
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

		it "Clicks on the Account tab" do
      adminMenuLinks("Account").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Transaction link" do
			eventMenuLinks("Transaction").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Sets an invalid Event id" do
			accountTransactionsSourceGroupDropdown.flash(color: ["yellow"]).click
			accountTransactionsSourceGroupSearchTextField.wait_until_present.flash(color: ["yellow"]).click
      accountTransactionsSourceGroupSearchTextField.flash(color: ["yellow"]).set ($accountSourceGroupIdInvalid)
		end

		it "Verifies the No matches found error" do
			verifyAccountTransactionErrorSearchResults('No matches found')
		end

		it "Sets a valid Source Group id" do
			accountTransactionsSourceGroupDropdown.flash(color: ["yellow"]).click
			accountTransactionsSourceGroupDropdown.flash(color: ["yellow"]).click
      accountTransactionsSourceGroupSearchTextField.flash(color: ["yellow"]).click
			accountTransactionsSourceGroupSearchTextField.flash(color: ["yellow"]).set ($accountSourceGroupId)
      accountTransactionsSourceGroupSearchTextField.flash(color: ["yellow"]).set ($accountSourceGroupId)
			sendKeysEnter
      sendKeysTab
		end

		it "Sets a Transaction type Deposit" do
			accountTransactionTransactionDropdown.flash(color: ["yellow"]).click
			accountTransactionTransactionSearchTextField.wait_until_present.flash(color: ["yellow"]).set ($accountTransactionIdDeposit)
			sendKeysEnter
      sendKeysTab
		end

		it "Sets an Account Id" do
			accountTransactionAccountSearchTextField.flash(color: ["yellow"]).set ($accountGroupId)
			sendKeysTab
		end

		it "Verifies the valid search result" do
      verifyAccountTransactionSearchResultsName('Lamonte Lampkin')
    end

		it "Sets a Transaction type Withdraw" do
			accountTransactionTransactionDropdown.flash(color: ["yellow"]).click
			accountTransactionTransactionSearchTextField.wait_until_present.flash(color: ["yellow"]).set ($accountTransactionIdWithdraw)
			sendKeysEnter
      sendKeysTab
		end

		it "Sets an Account Id" do
			accountTransactionAccountSearchTextField.flash(color: ["yellow"]).set ($accountGroupId)
			sendKeysTab
		end

		it "Verifies the valid search result" do
      verifyAccountTransactionSearchResultsName('Lamonte Lampkin')
    end

		it "Sets a Transaction type Adjust" do
			accountTransactionTransactionDropdown.flash(color: ["yellow"]).click
			accountTransactionTransactionSearchTextField.wait_until_present.flash(color: ["yellow"]).set ($accountTransactionIdAdjust)
			sendKeysEnter
      sendKeysTab
		end

		it "Sets an Account Id" do
			accountTransactionAccountSearchTextField.flash(color: ["yellow"]).set ($accountGroupId)
			sendKeysTab
		end

		it "Verifies the valid search result" do
      verifyAccountTransactionSearchResultsName('Lamonte Lampkin')
    end

		it "Sets a Transaction type Transfer" do
			accountTransactionTransactionDropdown.flash(color: ["yellow"]).click
			accountTransactionTransactionSearchTextField.wait_until_present.flash(color: ["yellow"]).set ($accountTransactionIdTransfer)
			sendKeysEnter
      sendKeysTab
		end

		it "Sets the Account From number" do
			accountTransactionAccountFromTextfield.flash(color: ["yellow"]).set ($accountGroupId)
		end

		it "Clicks on the view from account button" do
			accountTransactionViewButton.wait_until_present.flash(color: ["yellow"]).click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
