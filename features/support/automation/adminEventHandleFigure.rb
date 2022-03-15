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

RSpec.describe "Event Handle figure validation on the Phoenix application", :regression do
  begin
    before(:all) do
      $continue = true
      puts "adminEventHandleFigureTest"
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

		it "Clicks on the Event tab" do
      adminMenuLinks("Event").wait_until_present.flash.click
		end

    it "Clicks on the Handle link" do
      eventMenuLinks("Handle").wait_until_present.flash.click
    end

    it "Sets the Group ID" do
      eventHandleGourpDropdown.wait_until_present.flash.click
      eventHandleGroupSerachTextField.wait_until_present.flash.set ($groupUtsId)
      sendKeysEnter
    end

    it "Clicks on the Done button" do
      eventHandleGroupDropdownDoneButton.flash.click
    end

    it "Verifes the Handle price" do
      puts "Event Handle Price: #{getEventHandleViewBoxPrice.flash.text}"
    end

    it "Clicks on the Event name" do
      eventHandlEventLink.flash.click
    end

    it "Verifies the race handle bar chart" do
      verifyEventHandleBarChartTitle('Race handles for CHF - CHURCHILL DOWNS')
    end

    it "Clicks the close button in the bar chart modal" do
      eventRaceHandleModalCloseButton.flash.click
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
