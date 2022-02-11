## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$groupId = "TL1"
$groupIdInvalid = "TNT"

module AdminTerminalCouponsPage
	include RSpec::Matchers
	include Selenium

	#### TERMINAL COUPONS METHODS / LOCATORS ####
	def adminTerminalCouponsModal
		@browser.div(id: 'TerminalCoupons-Select')
	end

	def adminTerminalCouponsModalRefreshButton
		@browser.button(id: 'TerminalCoupons-Select-Refresh')
	end

	def adminTerminalCouponsModalHelpButton
		@browser.button(id: 'TerminalCoupons-Select-Help')
	end

	def adminTerminalCouponsModalGroupDropdown
		@browser.button(id: 'TerminalCoupons-Select-Group-mainbutton')
	end

	def adminTerminalCouponsModalGroupSearchTextField
		@browser.text_field(id: 'TerminalCoupons-Select-Group-search')
	end

	def adminTerminalCouponsModalGroupFitlerButton
		@browser.text_field(id: 'TerminalCoupons-Select-Group-filterbutton')
	end

	#### TERMINAL SELECTION FILTER SELECTION CRITERIA MODAL####
	def adminTerminalCouponsSelectionCriteriaModal
		@browser.div(id: 'TerminalCoupons-Select-Group-FilterDivrows')
	end

	def adminTerminalCouponsSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'TerminalCoupons-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def adminTerminalCouponsSelectionCriteriaSearchTextField
		@browser.text_field(id: 'TerminalCoupons-Select-Group-FilterDiv1FilterField1-search')
	end

	def adminTerminalCouponsSelectionCriteriaOperandDropdown
		@browser.button(id: 'TerminalCoupons-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def adminTerminalCouponsSelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'TerminalCoupons-Select-Group-FilterDiv1FilterField2-search')
	end

	def adminTerminalCouponsSelectionCriteriaValueDropdown
		@browser.button(id: 'TerminalCoupons-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def adminTerminalCouponsSelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'TerminalCoupons-Select-Group-FilterDiv1FilterField3-search')
	end

	def adminTerminalCouponsSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def adminTerminalCouponsSelectionCriteriaCancelIcon
		@browser.button(id: 'TerminalCoupons-Select-Group-FilterDiv1CancelButton')
	end

	def adminTerminalCouponsSelectionCriteriaAddIcon
		@browser.button(id: 'TerminalCoupons-Select-Group-FilterDiv2OKButton')
	end

	def adminTerminalCouponsSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def adminTerminalCouponsSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def adminTerminalCouponsSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	##################################################

	def adminTerminalCouponsResultModal
		@browser.div(id: 'TerminalCoupons-Coupon0')
	end

	def adminTerminalCouponsResultModalEditButton
		@browser.button(id: 'TerminalCoupons-Coupon0-Edit')
	end

	def adminTerminalCouponsResultModalOffOnToggle
		@browser.path(id: 'path2')
	end

	#### GETTERS ####
	def getAdminTerminalCouponsResultError
		@browser.li(id: 'ut-ms-opt-TerminalCoupons-Select-Group_noresults')
	end

	#### VERIFIERS ####
	def verifyTerminalCouponsResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalCouponsResultError.text).to include(expectedResult)
		getAdminTerminalCouponsResultError.flash(color: ["yellow"])
	end
end
