## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountFindPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountFindPage
end

RSpec.describe "Admin->Account->Find: Account find account holder by name", :regression do
  begin
    before(:all) do
      $continue = true
      puts "adminAccountFindTest"
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

    it "Clicks on the Find link" do
      eventMenuLinks("Find").wait_until_present.flash.click
    end

    it "Sets an invalid first and last name to search" do
      findAccountFirstNameTextField.flash.set ($findAccountFirstNameInvalid)
      sendKeysTab
      findAccountLastNameTextField.flash.set ($findAccountLastNameInvalid)
      sendKeysTab
    end

		it "Clicks on the Search button" do
			findAccountSearchButton.flash.click
		end

		it "Verifies the account Find error" do
			verifyFindAccountErrorSearchResults('No accounts match specified criteria!')
		end

		it "Sets an valid first and last name to search" do
			findAccountFirstNameTextField.flash.click
			sendKeysClear
      findAccountFirstNameTextField.flash.set ($findAccountFirstName)
      findAccountFirstNameTextField.flash.set ($findAccountFirstName)
      sendKeysTab
      findAccountLastNameTextField.flash.click
      sendKeysClear
      findAccountLastNameTextField.flash.set ($findAccountLastName)
      findAccountLastNameTextField.flash.set ($findAccountLastName)
      sendKeysTab
    end

		it "Clicks on the Search button" do
			findAccountSearchButton.flash.click
		end

		it "Verifies the account Find search result" do
			getFindAccountAccountModal.flash
			verifyFindAccountSearchResults('Julie Anchorsteam')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
