## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminMemoPage.rb"
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
  c.include AdminMemoPage
  c.include WindowsHelpers
end

RSpec.describe "Admin->Memo: Admin Memo Add and delete functionality test", :adminMemo do
  begin
    before(:all) do
      puts "adminMemoAddDeleteTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    after(:each) do |example|
	    if example.exception
  	    screenshot_file = "features/support/automation_screenshots/adminMemoAddDelete-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
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

		it "Clicks on the Memo tab" do
      adminMenuLinks("Memo").wait_until_present.flash.click
		end

    it "Verifies if there is an existing memo present" do
      if (adminMemoModalMemoByIndex(0).present?) == true
        deleteMemoFuncationality
      else
        puts "There is no existing memo present"
      end
    end
    #### ADD NEW MEMO ####
    it "Adds a new memo" do
      addNewMemoFunctionality
    end

		it "Verifies the memo was set" do
			adminMemoModalMemoByIndex(0).flash
			verifyNewMemoText($adminMemoRandom.to_s.concat(" test"))
		end
    #### DELETE NEW MEMO ####
    it "Deletes the newly created memo" do
      deleteMemoFuncationality
    end

    it "Verifies the newly created memo deleted success message" do
      verifyDeletedSuccessMessageText($adminMemoRandom.to_s.concat(" test"))
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
