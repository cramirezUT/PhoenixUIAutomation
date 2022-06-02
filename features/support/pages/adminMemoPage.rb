## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

@random = rand(9999)
@randomMemoGreaterThan96Char = (rand(96..9999))
@randomMemoGreaterThan79Char = (rand(80..9999))
@randomMemoGreaterThan1000Char = (rand(1001..9999))
$newMemoText = "new test memo"
$newSubjectText = "New Subject #{@random}"
$newBodyText = "Body Text #{@random}"
$newMemoTextGreaterThan95Char = "#{@randomMemoGreaterThan95Char}"
$memoErrorText ="!!!!"


module AdminMemoPage
	include RSpec::Matchers
	include Selenium

	#### MEMO METHODS / LOCATORS ####
	def adminMemoModal
		@browser.div(id: 'AdminMemo-Select')
	end

	def adminMemoModalHelpButton
		@browser.button(id: 'AdminMemo-Select-Help')
	end

	def adminMemoModalMemoLabelField
		@browser.label(id: 'AdminMemo-Select-Memo')
	end

	def adminMemoModalClearButton
		@browser.button(id: 'AdminMemo-Select-Clear')
	end

	def adminMemoModalRenameButton
		@browser.button(id: 'AdminMemo-Select-Rename')
	end

	def adminMemoModalEditButton
		@browser.button(id: 'AdminMemo-Select-Edit')
	end

	def adminMemoModalAddButton
		@browser.button(id: 'AdminMemo-Select-Add')
	end

	def adminMemoModalDeleteButton
		@browser.button(id: 'AdminMemo-Select-Delete')
	end

	def adminMemoModalPrintButton
		@browser.button(id: 'AdminMemo-Select-Print')
	end

	def adminMemoModalRefreshButton
		@browser.button(id: 'AdminMemo-Select-Refresh')
	end

	def adminMemoModalPrintCatalogButton
		@browser.button(id: 'AdminMemo-Select-pCatalog')
	end

	def adminMemoModalMemoByIndex(index)
		@browser.div(id: "AdminMemo-Select-Catalog-#{index}-0")
	end

	#### NEW MEMO MODAL ####
	def adminMemoNewMemoModal
		@browser.div(id: 'Confirm')
	end

	def adminMemoNewMemoModalMemoNameField
		@browser.text_field(id: 'Confirm-Text')
	end

	def adminMemoNewMemoModalYesButton
		@browser.button(id: 'Confirm-Yes')
	end

	def adminMemoNewMemoModalNoButton
		@browser.button(id: 'Confirm-No')
	end

	def adminMemoNewMemoModalErrorText
		@browser.button(id: 'Confirm-Error')
	end
	#######################

	#### SUBJECT MODAL ####
	def adminMemoSubjectModal
		@browser.div(id: 'EditMemo')
	end

	def adminMemoSubjectModalSubjectTextField
		@browser.text_field(id: 'EditMemo-Subject')
	end

	def adminMemoSubjectModalBodyTextArea
		@browser.textarea(id: 'EditMemo-Body')
	end

	def adminMemoSubjectModalSaveButton
		@browser.button(id: 'EditMemo-Save')
	end

	def adminMemoSubjectModalCloseButton
		@browser.button(id: 'EditMemo-Close')
	end
	####################

	#### DELETE MEMO MODAL ####
	def adminMemoDeleteModal
		@browser.div(id: 'Confirm')
	end

	def adminMemoDeleteModalYesButton
		@browser.button(id: 'Confirm-Yes')
	end

	def adminMemoDeleteModalNoButton
		@browser.button(id: 'Confirm-No')
	end
	###########################

	#### GETTERS ####
	def adminMemoDeletedSuccessMessage
		@browser.element(xpath: "//*[@id='AdminMemo-Error']")
	end

	def adminMemoDeletedByText(value)
		@browser.element(xpath: "//*[@text()='"+value+"']")
	end

	#### VERIFIERS ####

	def verifyNewMemoBodyText(result)
		expectedResult = "#{result}"
		expect(adminMemoSubjectModalBodyTextArea.text).to include(expectedResult)
		adminMemoSubjectModalBodyTextArea.flash(color: ["yellow"])
	end

	def verifyNewMemoSubjectText(result)
		expectedResult = "#{result}"
		expect(adminMemoSubjectModalSubjectTextField.text).to include(expectedResult)
    adminMemoSubjectModalSubjectTextField.flash(color: ["yellow"])
	end

	def verifyNewMemoText(index, result)
		expectedResult = "#{result}"
		expect(adminMemoModalMemoByIndex(index).text).to include(expectedResult)
		adminMemoModalMemoByIndex(index).flash(color: ["yellow"])
	end

	def verifyErrorMemoText(result)
		expectedResult = "#{result}"
		expect(adminMemoNewMemoModalErrorText.text).to include(expectedResult)
		adminMemoModalMemoByIndex(index).flash(color: ["yellow"])
	end

	def verifyNewMemoTextMoreThanGivenChar(result)
		expectedResult = "#{result}"
		expect(adminMemoNewMemoModalErrorText.text).to eq(expectedResult)
		adminMemoNewMemoModalErrorText.flash(color: ["yellow"])
	end

	def verifyDeletedSuccessMessageText(message)
		sleep(1)
		expectedMessage = "#{message} deleted!"
		expect(adminMemoDeletedSuccessMessage.text).to eq(expectedMessage)
		adminMemoDeletedSuccessMessage.flash(color: ["yellow"])
	end
end
