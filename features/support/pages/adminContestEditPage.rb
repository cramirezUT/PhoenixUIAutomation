## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$playerId = "1"
$playerIdInvalid = "TNT"
$playerActionOptionView = "View"
$playerActionOptionEdit = "Edit"
$playerActionOptionNew = "New"
$playerActionOptionDelete = "Delete"
$playerActionOptionUndelete = "Undelete"
$playerActionOptionNumber = "Number"
$playerActionOptionPin = "Pin"
$playerActionOptionPassword = "Password"

module ContestEditPage
	include RSpec::Matchers
	include Selenium

	#### CONTEST CONTROL METHODS / LOCATORS ####
	def playerEditModal
		@browser.div(id: 'PlayerEdit-Select')
	end

	def playerEditModalHelpButton
		@browser.button(id: 'PlayerEdit-Select-Help')
	end

	def playerEditModalActionDropdown
		@browser.button(id: 'PlayerEdit-Select-Action-mainbutton')
	end

	def playerEditModalActionSearchTextField
		@browser.text_field(id: 'PlayerEdit-Select-Action-search')
	end

	def playerEditModalGroupDropdown
		@browser.text_field(id: 'PlayerEdit-Select-Group-mainbutton')
	end

	def playerEditModalGroupSearchTextField
		@browser.text_field(id: 'PlayerEdit-Select-Group-search')
	end

	#### PLAYER EDIT SELECTION CRITERIA MODAL ####
	def playerEditGroupSelectionCriteriaModal
		@browser.div(id: 'PlayerEdit-Select-Group-FilterDivrows')
	end

	def playerEditGroupSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'PlayerEdit-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def playerEditGroupSelectionCriteriaSearchTextField
		@browser.text_field(id: 'PlayerEdit-Select-Group-FilterDiv1FilterField1-search')
	end

	def playerEditGroupSelectionCriteriaOperandDropdown
		@browser.button(id: 'PlayerEdit-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def playerEditGroupSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'PlayerEdit-Select-Group-FilterDiv1FilterField2-search')
	end

	def playerEditGroupSelectionCriteriaValueDropdown
		@browser.button(id: 'PlayerEdit-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def playerEditGroupSelectionCriteriaValueSearchTextField
		@browser.button(id: 'PlayerEdit-Select-Group-FilterDiv1FilterField3-search')
	end

	def playerEditGroupSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def playerEditGroupSelectionCriteriaCancelIcon
		@browser.button(id: 'PlayerEdit-Select-Group-FilterDiv1CancelButton')
	end

	def playerEditGroupSelectionCriteriaAddIcon
		@browser.button(id: 'PlayerEdit-Select-Group-FilterDiv2OKButton')
	end

	def playerEditGroupSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def playerEditGroupSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def playerEditGroupSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	#############################################
	def playerEditPlayerTextField
		@browser.text_field(id: 'PlayerEdit-Select-Account')
	end

	def playerEditAccountModal
		@browser.div(id: 'Account')
	end

	def playerEditAccountModalCancelButton
		@browser.button(id: 'Account-Cancel')
	end

	#### GETTERS ####
	def getPlayerEditError
		@browser.label(id: 'PlayerEdit-Error')
	end

	#### VERIFIERS ####
	def verifyPlayerEditError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getPlayerEditError.text).to include(expectedResult)
		getPlayerEditError.flash(color: ["yellow"])
	end
end
