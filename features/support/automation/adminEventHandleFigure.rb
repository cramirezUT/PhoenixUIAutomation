## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminEventHandlePage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include HandlePage
end

RSpec.describe "Admin->Event->Handle->Figure: Event Handle figure validation on the Phoenix application", :adminEvent do
  begin
    before(:all) do
      puts "adminEventHandleFigureTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminEventHandleFigure-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Event tab" do
      adminMenuLinks("Event").wait_until_present.flash.click
		end

    it "Clicks on the Handle link" do
      eventMenuLinks("Handle").wait_until_present.flash.click
    end

    it "Sets the Group ID" do
      eventHandleGourpDropdown.wait_until_present.flash.click
      eventHandleGroupSerachTextField.wait_until_present.flash.set ($adminEventHandleGroupUtsId)
      sendKeysEnter
    end

    it "Verifes the Handle price" do
      puts "Event Handle Price: #{getEventHandleViewBoxPrice.flash.text}"
      puts "NEED THE RACE PRICE TO VALIDATE THE EVENT HANDLE PRICE AGAINST"
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
