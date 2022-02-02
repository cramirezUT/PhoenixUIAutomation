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

RSpec.describe "Admin Memo Add and delete functionality test", :regression do
  begin
    before(:all) do
      puts "adminMemoAddDeleteTest"
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

		it "Clicks on the Memo tab" do
      adminMenuLinks("Memo").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Add button" do
			adminMemoModalAddButton.wait_until_present.flash(color: ["yellow"]).click
		end
    #### ADD NEW MEMO ####
		it "Verifies the New Memo modal" do
			adminMemoNewMemoModal.flash(color: ["yellow"])
		end

		it "Sets a new Memo name in text field" do
			adminMemoNewMemoModalMemoNameField.flash(color: ["yellow"]).set ($newMemoText)
			sendKeysTab
		end

		it "Clicks on the Yes button" do
			adminMemoNewMemoModalYesButton.wait_until_present.flash(color: ["yellow"]).click
      adminMemoNewMemoModalYesButton.wait_while_present
		end

		it "Verifies the subject modal" do
			adminMemoSubjectModal.flash(color: ["yellow"])
		end

		it "Sets a new subject in text field" do
			adminMemoSubjectModalSubjectTextField.flash(color: ["yellow"]).set ($newSubjectText)
		end

		it "Sets body text" do
      adminMemoSubjectModalBodyTextArea.flash(color: ["yellow"]).click
			adminMemoSubjectModalBodyTextArea.flash(color: ["yellow"]).set ($newBodyText)
		end

		it "Clicks on the save button" do
			adminMemoSubjectModalSaveButton.flash(color: ["yellow"]).click
		end

		it "Verifies the memo was set" do
			adminMemoModalMemoByIndex(0).flash(color: ["yellow"])
			verifyNewMemoText(0, $newMemoText)
		end
    #### DELETE NEW MEMO ####
    it "Clicks on the new memo line" do
      adminMemoModalMemoByIndex(0).flash(color: ["yellow"]).click
    end

    it "Clicks on the trash can icon" do
      adminMemoModalDeleteButton.flash(color: ["yellow"]).click
    end

    it "Verifies the Delete Modal" do
      adminMemoDeleteModal.flash(color: ["yellow"])
    end

    it "Clicks on the Yes button" do
      adminMemoDeleteModalYesButton.flash(color: ["yellow"]).click
    end

    it "Verifies the newly created memo deleted success message" do
      verifyDeletedSuccessMessageText($newMemoText)
    end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
