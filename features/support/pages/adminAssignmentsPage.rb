## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'date'

$time = Time.now + 86400
$nextDay = $time.strftime("%a %d-%b-%Y")
$twoDays = $time + 86400
$twoDaysFromNow = $twoDays.strftime("%a %d-%b-%Y")

module AdminAssignmentsPage
	include RSpec::Matchers
	include Selenium

	#### ASSIGNMENTS METHODS / LOCATORS ####
	def adminAssignmentsResultsModal
		@browser.div(id: "AdminAssignments-Select")
	end

	def adminAssignmentsHelpButton
		@browser.button(id: 'AdminAssignments-Select-Help')
	end

	def adminAssignmentsEditButton
		@browser.button(id: 'AdminAssignments-Select-Edit')
	end

	#### EDIT ASSIGNMENT MODAL####
	def adminAssignmentsEditModal
		@browser.div(id: 'EditAssignment')
	end

	def adminAssignmentsEditModalEditButton
		@browser.button(id: 'EditAssignment-Check')
	end

	def adminAssignmentsEditModalCloseButton
		@browser.button(id: 'EditAssignment-Cancel')
	end

	def adminAssignmentsEditModalTerminalTextField
		@browser.text_field(id: 'EditAssignment-Terminal')
	end

	def adminAssignmentsEditModalSellerTextField
		@browser.text_field(id: 'EditAssignment-Seller')
	end

	def adminAssignmentsEditModalSellerTextField
		@browser.text_field(id: 'EditAssignment-Seller')
	end

	def adminAssignmentsEditModalTypeCheckbox
		@browser.button(id: 'EditAssignment-All')
	end

	def adminAssignmentsEditModalSeller2TextField
		@browser.text_field(id: 'EditAssignment-Assignments-2-Seller')
	end

	def adminAssignmentsEditModalCommentsTextfield
		@browser.text_field(id: 'EditAssignment-Assignments-3-Comment')
	end

	def adminAssignmentsEditModal1TerminalDropdown
		@browser.text_field(id: 'EditAssignment-Division-mainbutton')
	end

	def adminAssignmentsEditModal1TerminalSearchTextField
		@browser.text_field(id: 'EditAssignment-Division-search')
	end
	##############################

	def adminAssignmentsCopyButton
		@browser.button(id: 'AdminAssignments-Select-Copy')
	end

	#### COPY ASSIGNMENT MODAL ####
	def adminAssignmentsCopyAssignmentModal
		@browser.div(id: 'Edit')
	end

	def adminAssignmentsCopyAssignmentModalDateTextField
		@browser.text_field(id: 'inputEdit-DateTime')
	end

	def adminAssignmentsCopyAssignmentModalCloseButton
		@browser.button(id: 'Edit-Cancel')
	end

	def adminAssignmentsCopyAssignmentModalSaveButton
		@browser.button(id: 'Edit-Save')
	end
	###############################

	def adminAssignmentsAddButton
		@browser.button(id: 'AdminAssignments-Select-Add')
	end

	#### ADD ASSIGNMENT MODAL####
	def adminAssignmentsAddAssignmentModal
		@browser.div(id: 'Edit')
	end

	def adminAssignmentsAddAssignmentModalCloseButton
		@browser.div(id: 'BorderedTitledBox')
	end

	def adminAssignmentsAddAssignmentModalDateTextField
		@browser.text_field(id: 'inputEdit-DateTime')
	end

	def adminAssignmentsAddAssignmentModalTemplateDropdown
		@browser.button(id: 'Edit-AuxSelect-mainbutton')
	end

	def adminAssignmentsAddAssignmentModalTemplateSearchTextField
		@browser.text_field(id: 'Edit-AuxSelect-search')
	end

	def adminAssignmentsAddAssignmentModalSaveButton
		@browser.button(id: 'Edit-Save')
	end
	#############################

	def adminAssignmentsDeleteButton
		@browser.button(id: 'AdminAssignments-Select-Delete')
	end

	#### CONFIRM DELETION MODAL ####
	def adminAssignmentsConfirmDeletionModal
		@browser.div(id: 'Confirm')
	end

	def adminAssignmentsConfirmDeletionModalYesButton
		@browser.button(id: 'Confirm-Yes')
	end

	def adminAssignmentsConfirmDeletionModalNoButton
		@browser.button(id: 'Confirm-No')
	end
	################################

	def adminAssignmentsLoadButton
		@browser.button(id: 'AdminAssignments-Select-Load')
	end

	def adminAssignmentsSelectButton
		@browser.button(id: 'AdminAssignments-Select-Template')
	end

	def adminAssignmentsClearButton
		@browser.button(id: 'AdminAssignments-Select-Clear')
	end

	def adminAssignmentsRepairButton
		@browser.button(id: 'AdminAssignments-Select-Repair')
	end

	def adminAssignmentsResultsCheckboxByDate(date)
		@browser.element(xpath: "//label[contains(text(),'#{date}')]")
	end

	#### GETTERS ####

	#### VERIFIERS ####
	def verifyAdminAssignmentAddModal
		expect(adminAssignmentsAddAssignmentModal).to be_truthy
		adminAssignmentsAddAssignmentModal.flash(color: ["yellow"])
	end

	def verifyAdminAssignmentDeletionModal
		expect(adminAssignmentsConfirmDeletionModal).to be_truthy
		adminAssignmentsConfirmDeletionModal.flash(color: ["yellow"])
	end

	def verifyAdminAssignmentEditModal
		expect(adminAssignmentsEditModal).to be_truthy
		adminAssignmentsEditModal.flash(color: ["yellow"])
	end

	def verifyAdminAssignmentCopyModal
		expect(adminAssignmentsCopyAssignmentModal).to be_truthy
		adminAssignmentsCopyAssignmentModal.flash(color: ["yellow"])
	end
end
