## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminSellerFindFirstName = "Johnny"
$adminSellerFindFirstNameInvalid = "TNT"
$adminSellerFindMiddleName = "B"
$adminSellerFindLastName = "Goode"
$adminSellerFindLastNameInvalid = "TNT"

module AdminSellerFindPage
	include RSpec::Matchers
	include Selenium

	#### SELLER FIND METHODS / LOCATORS ####
	def adminSellerFindModal
		@browser.div(id: 'SellerFind-Command')
	end

	def adminSellerFindModalClearButton
		@browser.button(id: 'SellerFind-Command-Clear')
	end

	def adminSellerFindModalSearchButton
		@browser.button(id: 'SellerFind-Command-Search')
	end

	def adminSellerFindModalHelpButton
		@browser.button(id: 'SellerFind-Command-Help')
	end

	def filesVerificationEnter
		@browser.text_field(id: 'VerifyAccess-Text')
	end

	def adminSellerFindModalInitialTextField
		@browser.text_field(id: 'SellerFind-Command-Middle')
	end

	def sellerEditMenu
		@browser.element(xpath: "//*[@id='Command-Menu-Seller']/a/span")
	end

	def enterSellerGroupNumber
		@browser.text_field(id: 'FileSellers-Select-Seller-Number')
	end

  def sellerPopUpBox
		@browser.text_field(id: 'FileSeller')
	end

	def sellerDelete
		@browser.button(id: 'FileSeller-Delete')
	end

	def sellerDeleteConfirmYes
		@browser.button(id: 'Confirm-Yes')
	end

	def sellerDeleteConfirmNo
		@browser.button(id: 'Confirm-No')
	end

	def sellerLock
		@browser.button(id: 'FileSeller-Lock')
	end

	def sellerEdit
		@browser.button(id: 'FileSeller-Edit')
	end

	def sellerCancel
		@browser.button(id: 'FileSeller-Cancel')
	end

	def sellerSave
		@browser.button(id: 'FileSeller-Save')
	end

	def sellerClear
		@browser.button(id: 'FileSeller-Clear')
	end

	def sellerError
		@browser.label(id: 'FileSeller-Error')
	end

	def sellerConfirmMessage
		@browser.text_field(id: 'Confirm-Text')
	end

	def sellerFirstName
		@browser.text_field(id: 'FileSeller-First')
	end

	def sellerLastName
		@browser.text_field(id: 'FileSeller-Last')
	end

	def sellerPIN
		@browser.text_field(id: 'FileSeller-PIN')
	end

	def sellerTaxID
		@browser.text_field(id: 'FileSeller-TaxId')
	end

	def sellerFingerPrint
		@browser.text_field(id: 'FileSeller-Fingerprint')
	end

	def sellerTerminals
		@browser.text_field(id: 'FileSeller-Terminals')
	end

	def sellerSeniority
		@browser.text_field(id: 'FileSeller-Seniority')
	end

	def sellerExpires
		@browser.text_field(id: 'FileSeller-Expires')
	end

	#### MATCHING SELLERS MODAL ####
	def adminSellerFindMatchingSellersModal
		@browser.div(id: 'contentSellerFind-List')
	end
	#######################

	#### GETTERS ####
	def getSellerFindError
		@browser.label(id: 'SellerFind-Error')
	end

	def getSellerFindSuccessMessage
		@browser.label(id: 'SellerFind-Error')
	end

	def verifyError(result)
		expectedResult = "#{result}"
		expect(sellerError.text).to include(expectedResult)
		sellerError.flash(color: ["yellow"])
	end
	#### VERIFIERS ####
	def verifySellerisPresent()
		sleep(1)
		expect(sellerPopUpBox).to be_true
		getSellerFindError.flash(color: ["yellow"])
	end

	def verifySellerFindSuccesMessafge(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerFindSuccessMessage.text).to include(expectedResult)
		getSellerFindSuccessMessage.flash(color: ["yellow"])
	end
end
