## e2e RSpec/Ruby Test
## Author: Carlos Ramirez
## NOTES: Need to find out how to get a user that does not have
## missing data. And I need to find out how to create more account
## users in order to "pay" a ticket.

## Can't complete functionality in Phoenix need a wagering system
## To place a wager and split the wager between two races

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountPayPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountPayPage
end

RSpec.describe "Admin->Account->Pay: Account Pay Ticket validation", :adminAccount do
  begin
    before(:all) do
      puts "adminAccountPayTest"
      # launchToteBrowser
      # selectSiteTable
      # logInFunction
    end

    # after(:each) do |example|
	  #   if example.exception
  	#     screenshot_file = "features/support/automation_screenshots/adminAccountPay-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
  	#     @browser.driver.save_screenshot(screenshot_file)
    #     sleep 1
    #     @browser.quit
	  #   end
	  # end

    it "Verifies the main system text in the header menu" do
      # isMainSystemTextDisplayed
      puts "NOTE: NEED TO COMPLETE TEST DUE TO FIGURING OUT HOW"
      puts "NOTE: TO REPEAT BUYING/CANCELLING A TICKET"
    end

	# 	it "Clicks on the Admin tab in the main menu" do
	# 		mainMenuLinks("Admin").wait_until_present.flash.click
	# 	end
  #
	# 	it "Clicks on the Account tab" do
  #     adminMenuLinks("Account").wait_until_present.flash.click
	# 	end
  #
  #   it "Clicks on the Pay link" do
  #     eventMenuLinks("Pay").wait_until_present.flash.click
  #   end
  #
  #   it "Sets an invalid Account Group Number" do
  #     accountPayModal.wait_until_present.flash
  #     accountPaySearchTextField.wait_until_present.flash.set ($adminAccountPayGroupIdInvalid)
  #     sendKeysEnter
  #   end
  #
	# 	it "Verifies the account Pay error" do
	# 		adminAccountPayVerifyEventInformationResult('A group must be specified! <group id>-<number>')
	# 	end
  #
	# 	it "Sets a vaild account Pay group id" do
	# 		accountPayModal.wait_until_present.flash
	# 		accountPaySearchTextField.click
	# 		sendKeysClear
  #     accountPaySearchTextField.wait_until_present.flash.set ($adminAccountPayGroupId)
  #     sendKeysEnter
	# 	end
  #
	# 	it "Verifies the account Payee information mdoal" do
	# 		getAccountPayeeInformationModal.flash
	# 	end
  #
	# 	it "Clicks on the ticket by index" do
	# 		getAccountPayTicketByIndex(0).flash.click
	# 	end
  #
	# 	it "Verifies if information is missing from Payee Information modal" do
	# 		adminAccountPayVerifyAccountPayError
	# 	end
	# ensure
	# after(:all) do
	# 	logOutFuction
	# 	close_browser
	# end
	end
end
