## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

@random = rand(9999)
$newMemoText = "new test memo #{@random}"
$newSubjectText = "New Subject #{@random}"
$newBodyText = "Body Text #{@random}"


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
	#######################

	#### SUBJECT MODAL ####
	def adminMemoSubjectModal
		@browser.div(id: 'Memo')
	end

	def adminMemoSubjectModalSubjectTextField
		@browser.text_field(id: 'Memo-Subject')
	end

	def adminMemoSubjectModalBodyTextArea
		@browser.textarea(id: 'Memo-Body')
	end

	def adminMemoSubjectModalSaveButton
		@browser.button(id: 'Memo-Save')
	end

	def adminMemoSubjectModalCloseButton
		@browser.button(id: 'Memo-Close')
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

	#### VERIFIERS ####
	def verifyNewMemoText(index, result)
		expectedResult = "#{result}"
		expect(adminMemoModalMemoByIndex(index).text).to include(expectedResult)
		adminMemoModalMemoByIndex(index).flash(color: ["yellow"])
	end

	def verifyDeletedSuccessMessageText(message)
		sleep(1)
		expectedMessage = "#{message} deleted!"
		expect(adminMemoDeletedSuccessMessage.text).to eq(expectedMessage)
		adminMemoDeletedSuccessMessage.flash(color: ["yellow"])
	end
end
