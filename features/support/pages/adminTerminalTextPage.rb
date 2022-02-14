## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$grouplId = "UTS"
$grouplIdInvalid = "TNT"
$randomNum = rand(9999)
$testBlurb1Text = "Test blurb 1 #{$randomNum}"
$testBlurb2Text = "Test blurb 2 #{$randomNum}"
$testWelcomText = "Test welcome #{$randomNum}"
$testAdvertisementText = "Test advertisement"
$testSurchargeText = "Test surcharge"
$testPictureText = "Test picture"

module AdminTerminalTextPage
	include RSpec::Matchers
	include Selenium

	#### TERMINAL Text METHODS / LOCATORS ####
	def adminTerminalTextModal
		@browser.div(id: 'AdminText-Select')
	end

	def adminTerminalTextModalHelpButton
		@browser.button(id: 'AdminText-Select-Help')
	end

	def adminTerminalTextModalGroupDropdown
		@browser.button(id: 'AdminText-Select-Group-mainbutton')
	end

	def adminTerminalTextModalGroupSearchTextField
		@browser.text_field(id: 'AdminText-Select-Group-search')
	end

	def adminTerminalTextModalGroupFilterButton
		@browser.button(id: 'AdminText-Select-Group-filterbutton')
	end

	#### TERMINAL TEXT SELECTION CRITERIA MODAL####
	def adminTerminalTextSelectionCriteriaModal
		@browser.div(id: 'AdminText-Select-Group-FilterDivrows')
	end

	def adminTerminalTextSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'AdminText-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def adminTerminalTextSelectionCriteriaSearchTextField
		@browser.text_field(id: 'AdminText-Select-Group-FilterDiv1FilterField1-search')
	end

	def adminTerminalTextSelectionCriteriaOperandDropdown
		@browser.button(id: 'AdminText-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def adminTerminalTextSelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'AdminText-Select-Group-FilterDiv1FilterField2-search')
	end

	def adminTerminalTextSelectionCriteriaValueDropdown
		@browser.button(id: 'AdminText-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def adminTerminalTextSelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'AdminText-Select-Group-FilterDiv1FilterField3-search')
	end

	def adminTerminalTextSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def adminTerminalTextSelectionCriteriaCancelIcon
		@browser.button(id: 'AdminText-Select-Group-FilterDiv1CancelButton')
	end

	def adminTerminalTextSelectionCriteriaAddIcon
		@browser.button(id: 'AdminText-Select-Group-FilterDiv2OKButton')
	end

	def adminTerminalTextSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def adminTerminalTextSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def adminTerminalTextSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	##################################################

	#### TEXT DATA MODAL ####
	def adminTerminalTextDataModal
		@browser.div(id: 'TextData')
	end

	def adminTerminalTextDataModalSaveButton
		@browser.button(id: 'TextData-Save')
	end

	def adminTerminalTextDataModalCancelButton
		@browser.button(id: 'TextData-Cancel')
	end

	def adminTerminalTextDataModalHelpButton
		@browser.button(id: 'TextData-Help')
	end

	def adminTerminalTextDataModalBlurb1TextField
		@browser.text_field(id: 'TextData-Blurb0')
	end

	def adminTerminalTextDataModalBlurb2TextField
		@browser.text_field(id: 'TextData-Blurb1')
	end

	def adminTerminalTextDataModalWelcomeTextField
		@browser.text_field(id: 'TextData-Welcome0')
	end

	def adminTerminalTextDataModalAdvertismentTextField
		@browser.text_field(id: 'TextData-Advertisement')
	end

	def adminTerminalTextDataModalSurchargeTextField
		@browser.text_field(id: 'TextData-Surcharge')
	end

	def adminTerminalTextDataModalPictureTextField
		@browser.text_field(id: 'TextData-Picture')
	end
	#########################

	def adminTerminalTextResultModal
		@browser.div(id: 'AdminText-Select')
	end

	#### GETTERS ####
	def getAdminTerminalGroupTextResultError
		@browser.li(id: 'ut-ms-opt-AdminText-Select-Group_noresults')
	end

	#### VERIFIERS ####
	def verifyTerminalGroupTextResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalGroupTextResultError.text).to include(expectedResult)
		getAdminTerminalGroupTextResultError.flash(color: ["yellow"])
	end
end
