## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminDonationGroupId = "TL1"
$adminDonationGroupIdInvalid = "TNT"
$adminDonationAmountTwoDollar = "2.00"
$adminDonationWithdrawAmountOneDollar = "1.00"

module AdminDonationPage
	include RSpec::Matchers
	include Selenium

	#### ADMIN Donation METHODS / LOCATORS ####
	def adminDonationGroupModal
		@browser.div(id: 'AdminDonation-Select')
	end

	def adminDonationGroupModalHelpButton
		@browser.button(id: 'AdminDonation-Select-Help')
	end

	def adminDonationGroupModalGroupDropdown
		@browser.button(id: 'AdminDonation-Select-Group-mainbutton')
	end

	def adminDonationGroupModalGroupSearchTextField
		@browser.text_field(id: 'AdminDonation-Select-Group-search')
	end

	#### DONATION SELECTION CRITERIA MODAL####
	def donationSelectionCriteriaModal
		@browser.div(id: 'AdminDonation-Select-Group-FilterDivrows')
	end

	def donationSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'AdminDonation-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def donationSelectionCriteriaSearchTextField
		@browser.text_field(id: 'AdminDonation-Select-Group-FilterDiv1FilterField1-search')
	end

	def donationSelectionCriteriaOperandDropdown
		@browser.button(id: 'AdminDonation-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def donationSelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'AdminDonation-Select-Group-FilterDiv1FilterField2-search')
	end

	def donationSelectionCriteriaValueDropdown
		@browser.button(id: 'AdminDonation-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def donationSelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'AdminDonation-Select-Group-FilterDiv1FilterField3-search')
	end

	def donationSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def donationSelectionCriteriaCancelIcon
		@browser.button(id: 'AdminDonation-Select-Group-FilterDiv1CancelButton')
	end

	def donationSelectionCriteriaAddIcon
		@browser.button(id: 'AdminDonation-Select-Group-FilterDiv2OKButton')
	end

	def donationSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def donationSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def donationSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	##################################################

	def donationCharityResultModalByIndex(index)
		@browser.div(id: "AdminDonation-Charity#{index}")
	end

	def donationCharityResultModalDonateButtonByIndex(index)
		@browser.button(id: "AdminDonation-Charity#{index}-Donate")
	end

	def donationCharityResultModalWithdrawButtonByIndex(index)
		@browser.button(id: "AdminDonation-Charity#{index}-Withdraw")
	end
	#### DONATE TO MODAL ####
	def donationCharityDonateToModal
		@browser.div(xpath: "//*[@uttype='PopupBox']")
	end

	def donationCharityDonateToModalDonationAmountTextField
		@browser.text_field(id: 'Donation-Amount')
	end

	def donationCharityDonateToModalYesButton
		@browser.button(id: 'Donation-Yes')
	end

	def donationCharityDonateToModalNoButton
		@browser.button(id: 'Donation-No')
	end
	##########################

	#### WITHDRAW FROM MODAL ####
	def donationCharityWithdrawToModal
		@browser.div(xpath: "//*[@uttype='PopupBox']")
	end

	def donationCharityWithdrawToModalWithdrawAmountTextField
		@browser.text_field(id: 'Donation-Amount')
	end

	def donationCharityWithdrawToModalYesButton
		@browser.button(id: 'Donation-Yes')
	end

	def donationCharityWithdrawToModalNoButton
		@browser.button(id: 'Donation-No')
	end
	##########################

	#### GETTERS ####
	def getAdminDonationError
		@browser.li(id: 'ut-ms-opt-AdminDonation-Select-Group_noresults')
	end

	def getAdminDonationHistoryContent
		@browser.div(xpath: "//*[contains(@id,'AdminDonation-History-Container')]//*[contains(@id,'AdminDonation-History-Content')]")
	end

	#### VERIFIERS ####
	def verifyAdminDonationError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminDonationError.text).to include(expectedResult)
		getAdminDonationError.flash(color: ["yellow"])
	end

	def verifyAdminDonationCharityModal(index)
		sleep(1)
		expect(donationCharityResultModalByIndex(index).text).to be_truthy
		donationCharityResultModalByIndex(index).flash(color: ["yellow"])
	end
end
