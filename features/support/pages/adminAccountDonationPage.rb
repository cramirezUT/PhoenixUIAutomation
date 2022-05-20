## Class Page Helper file
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$accountGroupId = "TST-8683"
$invalidAccountGroupId = "99"
$numberOfDays1 = "1"
$donateAmount = "1"

module AccountDonationPage
	include RSpec::Matchers
	include Selenium

	#### Account Donation METHODS / LOCATORS ####
	def accountDonationModal
		@browser.div(id: 'AccountDonation-Select')
	end

	def accountDonationSearchTextField
		@browser.text_field(id: 'AccountDonation-Select-Account')
	end

	def accountDonationRefreshButton
		@browser.button(id: 'AccountDonation-Select-Refresh')
	end

	def accountDonationHelpButton
		@browser.button(id: 'AccountDonation-Select-Help')
	end

	def accountDonationResultModal
		@browser.div(id: 'AccountDonation-Amounts')
	end

	def accountDonationResultsModal
		@browser.div(id: 'AccountDonation-Charity0')
	end

	def accountDonationEditButton
		@browser.button(id: 'AccountDonation-Select-Edit')
	end

	#### AUTO DONATION SETTINGS #####
	def autoDonationSettingsModal
		@browser.div(id: 'Edit')
	end

	def autoDonationSettingsModalCloseButton
		@browser.button(id: 'Edit-Cancel')
	end

	def autoDonationSettingsModalDaysTextField
		@browser.text_field(id: 'Edit-Text')
	end

	def autoDonationSettingsModalCheckbox
		@browser.element(xpath: "//label[contains(text(),'Auto donate change from each winnings')]")
	end

	def autoDonationSettingsModalSaveButton
		@browser.button(id: 'Edit-Save')
	end
	#################################

	def accountDonationDonateButton
		@browser.button(id: 'AccountDonation-Charity0-Donate')
	end

	#### DONATION CONFIRMATION MODAL ####
	def accountDonationConfirmationModal
		@browser.div(id: 'Donation')
	end

	def accountDonationConfirmationModalTextField
		@browser.text_field(id: 'Donation-Amount')
	end

	def accountDonationConfirmationModalYesButton
		@browser.button(id: 'Donation-Yes')
	end

	def accountDonationConfirmationModalNoButton
		@browser.button(id: 'Donation-No')
	end
	#### ZERO AUTO DONATE MODAL####
	def accountDonationZeroDonateWarningModal
		@browser.div(id: 'Inform-Message')
	end

	def accountDonationZeroDonateWarningModalCloseButton
		@browser.button(id: 'Inform-OK')
	end
	###########################
	#################################

	#### GETTERS ####
	def getAccountDonationError
		@browser.label(id: 'AccountDonation-Error')
	end

	def getAccountDonation
		@browser.label(id: 'AccountDonation-Amounts-Donation')
	end

	def getAcountDonationDaysLabel
		@browser.label(id: 'AccountDonation-Select-Auto')
	end

	#### VERIFIERS ####
	def verifyAccountDonationError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountDonationError.text).to include(expectedResult)
		getAccountDonationError.flash(color: ["yellow"])
	end

	def verifyAccountDonationAmount(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountDonation.text).to include(expectedResult)
		getAccountDonation.flash(color: ["yellow"])
	end

	def verifyAccountDonationDays(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAcountDonationDaysLabel.text).to include(expectedResult)
		getAcountDonationDaysLabel.flash(color: ["yellow"])
	end
end
