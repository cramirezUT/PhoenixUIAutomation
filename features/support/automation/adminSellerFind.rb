## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminSellerFindPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"
require_relative "../lib/windows.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AdminSellerFindPage
  c.include WindowsHelpers
end

RSpec.describe "Admin Seller Find functionality test", :regression do
  begin
    before(:all) do
      $continue = true
      puts "adminSellerFindTest"
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

		it "Clicks on the Seller tab" do
      adminMenuLinks("Seller").wait_until_present.flash.click
		end

		it "Clicks on the Find link" do
      eventMenuLinks("Find").wait_until_present.flash.click
    end

		it "Verifies Seller Find modal" do
			adminSellerFindModal.flash
		end

		it "Sets an invalid First name in the text field" do
			adminSellerFindModalFirstNameTextField.flash.click
			adminSellerFindModalFirstNameTextField.flash(color: ["yelllow"]).set ($firstNameInvalid)
			sendKeysTab
		end

		it "Sets an invalid Last name in the text field" do
			adminSellerFindModalLastNameTextField.flash.click
			adminSellerFindModalLastNameTextField.flash(color: ["yelllow"]).set ($lastNameInvalid)
			sendKeysTab
		end

		it "Clicks on the Search button" do
			adminSellerFindModalSearchButton.flash.click
		end

		it "Verifies the invalid name error messgae" do
			verifySellerFindError('No sellers found matching specified parameters')
		end

		it "Sets a valid First name in the text field" do
			adminSellerFindModalFirstNameTextField.flash.click
			adminSellerFindModalFirstNameTextField.flash.set ($firstName)
			adminSellerFindModalFirstNameTextField.flash.set ($firstName)
			sendKeysTab
		end

		it "Sets a valid Middle Initial in the text field" do
			adminSellerFindModalInitialTextField.flash.click
			adminSellerFindModalInitialTextField.flash.set ($middleName)
			sendKeysTab
		end

		it "Sets a valid Last name in the text field" do
			adminSellerFindModalLastNameTextField.flash.click
			adminSellerFindModalLastNameTextField.flash.set ($lastName)
			adminSellerFindModalLastNameTextField.flash.set ($lastName)
			sendKeysTab
		end

		it "Clicks Search button" do
			adminSellerFindModalSearchButton.flash.click
		end

		it "Verifies the search result modal" do
			verifySellerFindSuccesMessafge('1 seller found')
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
