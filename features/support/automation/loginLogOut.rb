require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
end

RSpec.describe "Tote Log in Log out test", :smoke do
  begin
    before(:all) do
      puts "ToteloginLogoutTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/ToteloginLogoutTest-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
  	    @browser.driver.save_screenshot(screenshot_file)
        sleep 1
        @browser.quit
	    end
	  end

    it "Verify the main system text in the header" do
      isMainSystemTextDisplayed
    end

    it "Hovers on the main user menu dropdown" do
      mainUserMenu.flash(color: ["yellow"]).hover
    end

    it "Clicks on the logout link under the menu dropdown" do
      logOutLink.wait_until_present.flash(color: ["yellow"]).hover
      logOutLink.wait_until_present.flash(color: ["yellow"]).click
    end

    it "Clicks on the Yes button to end session for the user" do
      endSesstionButtonOption("Yes").wait_until_present.hover
      endSesstionButtonOption("Yes").wait_until_present.click
      endSesstionButtonOption("Yes").wait_while_present
    end
  ensure
    after(:all) do
      close_browser
    end
  end
end
