## e2e RSpec/Ruby Test
## Author: Peri

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

		it "Clicks on the Add button" do
			adminMemoModalAddButton.wait_until_present.flash.click
		end
    #### ADD NEW MEMO ####
		it "Verifies the New Memo modal" do
			adminMemoNewMemoModal.flash
		end

		it "Sets a new Memo name in text field" do
			adminMemoNewMemoModalMemoNameField.flash.set ("test")
			sendKeysTab
		end

		it "Clicks on the Yes button" do
			adminMemoNewMemoModalYesButton.wait_until_present.flash.click
      adminMemoNewMemoModalYesButton.wait_while_present
		end

		it "Verifies the subject modal" do
			adminMemoSubjectModal.flash
		end

		it "Sets a new subject in text field" do
			adminMemoSubjectModalSubjectTextField.flash.set ("test")
		end

		it "Sets body text" do
      adminMemoSubjectModalBodyTextArea.flash.click
			adminMemoSubjectModalBodyTextArea.flash.set ("test")
		end

		it "Clicks on the save button" do
			adminMemoSubjectModalSaveButton.flash.click
		end

		it "Verifies the memo was set" do
			adminMemoModalMemoByIndex(0).flash
			verifyNewMemoText(0, "test")
		end
    #### DELETE NEW MEMO ####
    it "Clicks on the new memo line" do
      adminMemoDeletedByText("test").flash.click
    end

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
    it "Clicks on the new memo line" do
      adminMemoDeletedByText("test").flash.click
    end

    it "Clicks on the trash can icon" do
      adminMemoModalDeleteButton.flash.click
    end

    it "Verifies the Delete Modal" do
      adminMemoDeleteModal.flash
    end

    it "Clicks on the Yes button" do
      adminMemoDeleteModalYesButton.flash.click
    end

    it "Verifies the newly created memo deleted error message" do
      verifyDeletedSuccessMessageText("memo doesn't exist")
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end