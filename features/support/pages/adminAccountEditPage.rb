## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$accountGroupId = "TST - UNITED TOTE SYSTEM"
$accountId = "8683"
$accountIdInvalid = "TNT"
$accountActionOptionView = "View"
$accountActionOptionEdit = "Edit"
$accountActionOptionNew = "New"
$accountActionOptionDelete = "Delete"
$accountActionOptionUndelete = "Undelete"
$accountActionOptionNumber = "Number"
$accountActionOptionPin = "PIN"
$accountActionOptionPassword = "Password"


module AccountEditPage
	include RSpec::Matchers
	include Selenium

	#### ACCOUNT Edit METHODS / LOCATORS ####
	def accountEditModal
		@browser.div(id: 'AccountEdit-Select')
	end

	def accountEditHelpButton
		@browser.button(id: 'AccountEdit-Select-Help')
	end

  def accountEditActionDropdown
    @browser.button(id: 'AccountEdit-Select-Action-mainbutton')
  end

  def accountEditActionSearchTextField
    @browser.text_field(id: 'AccountEdit-Select-Action-search')
  end

  def accountEditGroupDropdown
    @browser.button(id: 'AccountEdit-Select-Group-mainbutton')
  end

  def accountEditGroupSearchTextField
    @browser.text_field(id: 'AccountEdit-Select-Group-search')
  end

  def accountEditAccountSearchTextField
    @browser.text_field(id: 'AccountEdit-Select-Account')
  end

	def accountEditResultModalCloseButton
		@browser.button(id: 'Account-Cancel')
	end

	def accountEditResultModalSaveButton
		@browser.button(id: 'Account-Save')
	end

  #### EDIT SELECTION CRITERIA MODAL ####
	def editSelectionCriteriaModal
		@browser.div(id: 'AccountEdit-Select-Group-FilterDivrows')
	end

	def editSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'AccountEdit-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def editSelectionCriteriaSearchTextField
		@browser.text_field(id: 'AccountEdit-Select-Group-FilterDiv1FilterField1-search')
	end

	def editSelectionCriteriaOperandDropdown
		@browser.button(id: 'AccountEdit-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def editSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'AccountEdit-Select-Group-FilterDiv1FilterField2-search')
	end

	def editSelectionCriteriaValueDropdown
		@browser.button(id: 'AccountEdit-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def editSelectionCriteriaValueSearchTextField
		@browser.button(id: 'AccountEdit-Select-Group-FilterDiv1FilterField3-search')
	end

	def editSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def editSelectionCriteriaCancelIcon
		@browser.button(id: 'AccountEdit-Select-Group-FilterDiv1CancelButton')
	end

	def editSelectionCriteriaAddIcon
		@browser.button(id: 'AccountEdit-Select-Group-FilterDiv2OKButton')
	end

	def eventChannelSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def eventChannelSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def eventChannelSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	#############################################

	#### GETTERS ####
	def getAccountEditError
		@browser.label(id: 'AccountEdit-Error')
	end

	def getAccountExistingAccountAlert
		@browser.label(id: 'Account-Error')
	end

	#### VERIFIERS ####
	def verifyAccountEditError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountEditError.text).to include(expectedResult)
		getAccountEditError.flash(color: ["yellow"])
	end

	def verifyAccountEditExistingAlert(result)
		sleep(2)
		expectedResult = "#{result}"
		sleep(2)
		expect(getAccountExistingAccountAlert.text).to include(expectedResult)
		getAccountExistingAccountAlert.flash(color: ["yellow"])
	end
end
