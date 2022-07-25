## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTE: Any time a user enters an amount for "Winnings" the
## amount is the same as the previous amount and not the new
## amount entered. And entry fee doens't add or subtract from
## the balance

## Need to add a user in the Edit tab
## Need a PIN and Tournament

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestTransactionPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestTransactionPage
end

RSpec.describe "Admin->Contest->Transaction: Contest Transaction verification test", :adminContest do
  begin
    before(:all) do
      puts "adminContestTransactionTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminContestTransaction-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks over the Transaction link" do
			eventMenuLinks("Transaction").wait_until_present.flash.click
		end

		it "Verifies the Player Transaction modal" do
			playerTransactionsModal.flash
		end

		it "Sets a group id" do
			playerTransactionsModalGroupDropdown.flash.click
			playerTransactionsModalGroupSearchTextField.flash.set ($adminContestTransactionGroupId)
			sendKeysEnter
			sendKeysTab
		end

		it "Selects the Transaction type of Deposit" do
			playerTransactionsModalTransactionDropdown.flash.click
			playerTransactionsModalTransactionSearchTextField.flash.set ($adminContestTransactionOptionDeposit)
			sendKeysEnter
			sendKeysTab
			sendKeysTab
		end

		it "Sets an invalid Player id" do
			playerTransactionsModalPlayerTextField.flash.set ($adminContestTransactionPlayerIdInvalid)
			sendKeysEnter
		end

		it "Verifies the invalid error message" do
			verifyPlayerTransactionResultError('Player TNT is invalid')
		end

		it "Sets a valid Player id" do
			playerTransactionsModalPlayerTextField.flash.set ($adminContestTransactionPlayerId)
			sendKeysEnter
		end
    #### DEPOSIT OPTION ####
		it "Sets a USD Amount of $1.01" do
			playerTransactionsModalAountTextField.flash.set ($adminContestTransactionDepositAmount101Dollar)
			sendKeysTab
		end

		it "Clicks sumbit button" do
			playerTransactionsModalSubmitButton.flash.click
		end

		it "Verifies the deposit amount" do
			puts "Transaction Deposit: #{getDepositAmountTotal.text}"
			verifyDepositAmount('1.01')
		end
    #### WITHDRAW OPTION ####
    it "Selects the Transaction type of Withdraw" do
			playerTransactionsModalTransactionDropdown.flash.click
			playerTransactionsModalTransactionSearchTextField.flash.set ($adminContestTransactionOptionWithdraw)
			sendKeysEnter
			sendKeysTab
			sendKeysTab
		end

    it "Sets a valid Player id" do
			playerTransactionsModalPlayerTextField.flash.set ($adminContestTransactionPlayerId)
			sendKeysEnter
		end

		it "Sets a USD Amount of $-1.02" do
			playerTransactionsModalAountTextField.flash.set ($adminContestTransactionWithdrawAmount102Dollar)
			sendKeysTab
		end

		it "Clicks sumbit button" do
			playerTransactionsModalSubmitButton.flash.click
		end

		it "Verifies the withdraw amount" do
			puts "Transaction deposit: #{getDepositAmountTotal.text}"
			verifyDepositAmount('-1.02')
		end
    #### BALANCE OPTION ####
    it "Selects the Transaction type of Withdraw" do
			playerTransactionsModalTransactionDropdown.flash.click
			playerTransactionsModalTransactionSearchTextField.flash.set ($adminContestTransactionOptionBalance)
			sendKeysEnter
			sendKeysTab
			sendKeysTab
		end

    it "Sets a valid Player id" do
			playerTransactionsModalPlayerTextField.flash.set ($adminContestTransactionPlayerId)
			sendKeysEnter
		end

		it "Sets a USD Amount of $1.03" do
			playerTransactionsModalAountTextField.flash.set ($adminContestTransactionBalanceAmount103Dollar)
			sendKeysTab
		end

		it "Clicks sumbit button" do
			playerTransactionsModalSubmitButton.flash.click
		end

		it "Verifies the balance amount" do
			puts "Transaction balance: #{getDepositAmountTotal.text}"
			verifyDepositAmount('1.03')
		end
    #### WINNINGS OPTION ####
    it "Selects the Transaction type of Withdraw" do
			playerTransactionsModalTransactionDropdown.flash.click
			playerTransactionsModalTransactionSearchTextField.flash.set ($adminContestTransactionOptionWinnings)
			sendKeysEnter
			sendKeysTab
			sendKeysTab
		end

    it "Sets a valid Player id" do
			playerTransactionsModalPlayerTextField.flash.set ($adminContestTransactionPlayerId)
			sendKeysEnter
		end

		it "Sets a USD Amount of $1.04" do
			playerTransactionsModalAountTextField.flash.set ($adminContestTransactionWinningsAmount104Dollar)
			sendKeysTab
		end

		it "Clicks sumbit button" do
			playerTransactionsModalSubmitButton.flash.click
		end

		it "Verifies the winnings amount" do
			puts "Transaction winnings: #{getDepositAmountTotal.text}"
			verifyDepositAmount('1.04')
		end
    #### ENTRY OPTION ####
    it "Selects the Transaction type of Withdraw" do
			playerTransactionsModalTransactionDropdown.flash.click
			playerTransactionsModalTransactionSearchTextField.flash.set ($adminContestTransactionOptionWinnings)
			sendKeysEnter
			sendKeysTab
			sendKeysTab
		end

    it "Sets a valid Player id" do
			playerTransactionsModalPlayerTextField.flash.set ($adminContestTransactionPlayerId)
			sendKeysEnter
		end

		it "Sets a USD Amount of $1.05" do
			playerTransactionsModalAountTextField.flash.set ($adminContestTransactionEntryAmount105Dollar)
			sendKeysTab
		end

		it "Clicks sumbit button" do
			playerTransactionsModalSubmitButton.flash.click
		end

		it "Verifies the entry amount" do
			puts "Transaction entry: #{getDepositAmountTotal.text}"
			verifyDepositAmount('1.05')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
