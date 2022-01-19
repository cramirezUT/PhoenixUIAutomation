## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestEditPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestEditPage
end

RSpec.describe "Admin->Contest->Edit: Contest Edit verification test", :regression do
  begin
    before(:all) do
      puts "adminContestEditTest"
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

		it "Clicks on the Contest tab" do
      adminMenuLinks("Contest").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Edit link" do
			eventMenuLinks("Edit").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Verifies the Player Edit modal" do
			playerEditModal.flash(color: ["yellow"])
		end

		it "Sets the View option in the Action search text field" do
			playerEditModalActionDropdown.flash(color: ["yellow"]).click
			playerEditModalActionSearchTextField.flash(color: ["yellow"]).set ($playerActionOptionView)
			sendKeysEnter
			sendKeysTab
		end

		it "Sets an invalid Player id" do
			playerEditPlayerTextField.flash(color: ["yellow"]).set ($playerIdInvalid)
			sendKeysEnter
			sendKeysTab
		end

		it "Verifies the Player Edit error" do
			verifyPlayerEditError("Invalid account number 'TNT'!")
		end

		it "Sets a valid Player id" do
			playerEditPlayerTextField.flash(color: ["yellow"]).click
			sendKeysClear
			playerEditPlayerTextField.flash(color: ["yellow"]).set ($playerId)
			sendKeysEnter
		end

		it "Verifies the Player account info" do
			playerEditAccountModal.flash(color: ["yellow"])
		end

		it "Clicks on the close button for the Player account info modal" do
			playerEditAccountModalCancelButton.flash(color: ["yellow"]).click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
