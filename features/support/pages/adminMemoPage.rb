## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminMemoRandom = rand(9999)
@adminMemoRandomMemoGreaterThan96Char = 100.times.map { rand(10)  }
@adminMemoRandomMemoGreaterThan79Char = 80.times.map { rand(10)  }
@adminMemoRandomMemoGreaterThan1000Char = 1001.times.map { rand(10)  }
$adminMemoNewSubjectText = "New Subject #{$adminMemoRandom}"
$adminMemoNewBodyText = "Body Text #{$adminMemoRandom}"
$adminMemoNewMemoTextGreaterThan96Char = "#{@adminMemoRandomMemoGreaterThan96Char}"
$adminMemoNewMemoTextGreaterThan79Char = "#{@adminMemoRandomMemoGreaterThan79Char}"
$adminMemoNewMemoTextGreaterThan1000Char = "#{@adminMemoRandomMemoGreaterThan1000Char}"
$adminMemoRan = "#{$adminMemoRandom}"
$adminMemoNewMemoText = "new test memo" + $adminMemoRan
$adminMemoErrorText = "!!!!**..."

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
		sleep(1)
		@browser.div(id: "AdminMemo-Select-Catalog-#{index}-0")
	end

	def adminMemoModalMemoByValue(value)
		@browser.element(xpath: "//*[text()='#{value}']")
	end

	def adminMemoModalMemoSubjectByIndex(index)
		@browser.div(id: "AdminMemo-Select-Catalog-#{index}-1")
	end

	#### NEW MEMO MODAL ####
	def adminMemoNewMemoModal
		@browser.div(id: 'Confirm')
	end

	def adminMemoNewMemoModalMemoNameField
		@browser.text_field(id: 'Confirm-Text')
	end

	def adminMemoNewMemoModalYesButton
		sleep(1)
		@browser.button(id: 'Confirm-Yes')
	end

	def adminMemoNewMemoModalNoButton
		@browser.button(id: 'Confirm-No')
	end

	def adminMemoNewMemoModalErrorText
		@browser.label(id: 'Confirm-Error')
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
		sleep(1)
		@browser.button(id: 'EditMemo-Save')
	end

	def adminMemoSubjectModalCloseButton
		sleep(1)
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
		@browser.element(xpath: "//*[@text()='#{value}']")
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

	def verifyNewMemoText(result)
		expectedResult = "#{result}"
		expect(adminMemoModalMemoByValue(expectedResult).text).to include(result)
		adminMemoModalMemoByValue(expectedResult).flash(color: ["yellow"])
	end

	def verifyNewMemoTextByIndex(index,result)
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
		sleep(1)
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
