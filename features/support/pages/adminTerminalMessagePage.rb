## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminTerminalMessageTerminalId = "1"
$adminTerminalMessageTerminalIdInvalid = "100"
$adminTerminalMessageTestMessage = "Testing Outgoing Messages"

module AdminTerminalMessagePage
	include RSpec::Matchers
	include Selenium

	#### TERMINAL Message METHODS / LOCATORS ####
	def adminTerminalMessageModal
		@browser.div(id: 'AdminMessage-Command')
	end

	def adminTerminalMessageModalHelpButton
		@browser.button(id: 'TerminalMessage-Select-Help')
	end

	def adminTerminalMessageModalTerminalsTextField
		@browser.text_field(id: 'AdminMessage-Command-Terminal')
	end

	def adminTerminalMessageModalGroupsDropdown
		@browser.button(id: 'AdminMessage-Command-Groups-mainbutton')
	end

	def adminTerminalMessageModalGroupsSearchTextField
		@browser.text_field(id: 'AdminMessage-Command-Groups-search')
	end

	def adminTerminalMessageModalGroupsFilterButton
		@browser.button(id: 'AdminMessage-Command-Groups-filterbutton')
	end

	def adminTerminalMessageModalGroupsDoneButton
		@browser.button(id: 'AdminMessage-Command-Groups-donebutton')
	end

	def adminTerminalMessageModalMessageTextField
		@browser.text_field(id: 'AdminMessage-Command-Message')
	end

	def adminTerminalMessageModalSendButton
		@browser.button(id: 'AdminMessage-Command-Send')
	end

	def adminTerminalMessageModalClearButton
		@browser.button(id: 'AdminMessage-Command-Clear')
	end

	#### TERMINAL MESSAGE SELECTION CRITERIA MODAL####
	def adminTerminalMessageSelectionCriteriaModal
		@browser.div(id: 'AdminMessage-Command-Groups-FilterDivrows')
	end

	def adminTerminalMessageSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'AdminMessage-Command-Groups-FilterDiv1FilterField1-mainbutton')
	end

	def adminTerminalMessageSelectionCriteriaSearchTextField
		@browser.text_field(id: 'AdminMessage-Command-Groups-FilterDiv1FilterField1-search')
	end

	def adminTerminalMessageSelectionCriteriaOperandDropdown
		@browser.button(id: 'AdminMessage-Command-Groups-FilterDiv1FilterField2-mainbutton')
	end

	def adminTerminalMessageSelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'AdminMessage-Command-Groups-FilterDiv1FilterField2-search')
	end

	def adminTerminalMessageSelectionCriteriaValueDropdown
		@browser.button(id: 'AdminMessage-Command-Groups-FilterDiv1FilterField3-mainbutton')
	end

	def adminTerminalMessageSelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'AdminMessage-Command-Groups-FilterDiv1FilterField3-search')
	end

	def adminTerminalMessageSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def adminTerminalMessageSelectionCriteriaCancelIcon
		@browser.button(id: 'AdminMessage-Command-Groups-FilterDiv1CancelButton')
	end

	def adminTerminalMessageSelectionCriteriaAddIcon
		@browser.button(id: 'AdminMessage-Command-Groups-FilterDiv2OKButton')
	end

	def adminTerminalMessageSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def adminTerminalMessageSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def adminTerminalMessageSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	##################################################

	#### GETTERS ####
	def getAdminTerminalMessageResultError
		@browser.label(id: 'AdminMessage-Error')
	end

	def getAdminTerminalMessageHistory
		@browser.div(xpath: "//*[contains(@id,'AdminMessage-History-Container')]//*[contains(@id,'AdminMessage-History-Content')]")
	end

	#### VERIFIERS ####
	def verifyTerminalMessageResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalMessageResultError.text).to include(expectedResult)
		getAdminTerminalMessageResultError.flash(color: ["yellow"])
	end

	def verifyTerminalMessageHistory(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalMessageHistory.text).to include(expectedResult)
		getAdminTerminalMessageHistory.flash(color: ["yellow"])
	end
end
