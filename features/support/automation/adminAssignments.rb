## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAssignmentsPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AdminAssignmentsPage
end

RSpec.describe "Admin->Assignments:  Assignments validation", :regression do
  begin
    before(:all) do
      $continue = true
      puts "AdminAssignmentsPage"
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
      adminMenuLinks("Assignments").wait_until_present.flash.click
		end

    it "Verifies Admin Assignments modal" do
      adminAssignmentsResultsModal.wait_until_present.flash
    end
		#### ADD ASSIGNMENT ####
		it "Clicks on the Add icon" do
			adminAssignmentsAddButton.flash.click
		end

		it "Verifies the Add Assignment modal" do
			verifyAdminAssignmentAddModal
		end

		it "Clicks on the Add Assignment modal save button" do
			adminAssignmentsAddAssignmentModalSaveButton.flash.click
		end

		it "Clicks on the next day label for the newly added Assignment" do
			adminAssignmentsResultsCheckboxByDate($nextDay).flash.click
		end
		#### EDIT ASSIGNMENT ####
		it "Clicks on the Edit icon" do
			adminAssignmentsEditButton.flash.click
		end

		it "Verifies the Edit modal" do
			verifyAdminAssignmentEditModal
		end

		it "Closes the edit modal" do
			adminAssignmentsEditModalCloseButton.flash.click
		end
		#### COPY ASSIGNMENT ####
		it "Clicks on the next day label for the newly added Assignment" do
			adminAssignmentsResultsCheckboxByDate($nextDay).flash.click
		end

		it "Clicks on the Copy icon" do
			adminAssignmentsCopyButton.flash.click
		end

		it "Verifies the Copy Assignment modal" do
			verifyAdminAssignmentCopyModal
		end

		it "Clicks on the save button within the Copy Assignment modal" do
			adminAssignmentsCopyAssignmentModalSaveButton.flash.click
		end

		it "Clicks the newly copied Assignment date" do
			adminAssignmentsResultsCheckboxByDate($twoDaysFromNow).flash.click
		end
		#### DELETE ASSIGNMENTS ####
		it "Clicks on the trash can icon" do
			adminAssignmentsDeleteButton.wait_until_present.flash.click
		end

		it "Verifies the Confirm Deletion modal" do
			verifyAdminAssignmentDeletionModal
		end

		it "Clicks on the Yes button with the Confirm Deletion modal" do
			adminAssignmentsConfirmDeletionModalYesButton.flash.click
		end

		it "Clicks on the next day label for the newly added Assignment" do
			adminAssignmentsResultsCheckboxByDate($nextDay).flash.click
		end

		it "Clicks on the trash can icon" do
			adminAssignmentsDeleteButton.wait_until_present.flash.click
		end

		it "Verifies the Confirm Deletion modal" do
			verifyAdminAssignmentDeletionModal
		end

		it "Clicks on the Yes button with the Confirm Deletion modal" do
			adminAssignmentsConfirmDeletionModalYesButton.flash.click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
