## e2e RSpec/Ruby Test
## Author: Peri

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminMemoPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/sendKeys.rb"
require_relative "../lib/users.rb"
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

RSpec.describe "Admin->Memo: Admin Memo delete functionality test", :adminMemo do
  begin
    before(:all) do
      puts "adminMemoDeleteTest-P1"
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
      adminMemoModalMemoByIndex(0).flash.click
    end
    #### DELETE NEW MEMO ####
    it "Clicks on the trash can icon" do
      adminMemoModalDeleteButton.flash.click
    end

    it "Verifies the Delete Modal" do
      adminMemoDeleteModal.flash
    end

    it "Clicks on the Yes button" do
      adminMemoDeleteModalYesButton.flash.click
    end
    #### DELETE NEW MEMO AGAIN ####
    it "Verifies the deleted memo is no longer displayed" do
      if (adminMemoModalMemoByIndex(0).present?) && adminMemoModalMemoByIndex(0).text == ($adminMemoRandom.to_s)
        expect { raise StandardError, "The expected deleted memo with the random id of: #{$adminMemoRandom.to_s} is NOT deleted."}.should raise_error('STEP FAILED')
      else
        puts "The deleted memo with random id #{$adminMemoRandom.to_s} has been successfully deleted"
      end
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
