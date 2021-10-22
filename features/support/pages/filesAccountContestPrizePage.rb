require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module PrizePage
	include RSpec::Matchers
	include Selenium

	#### PRIZE MODAL METHODS / LOCATORS ####
	def prizeConfigurationModal
		@browser.div(id: 'gridcontentFileprizes-Select')
	end

	def prizeConfigurationSettingButton
		@browser.button(id: 'Fileprizes-Manage')
	end

	def prizeConfigurationEditButton
		@browser.button(id: 'FilePrizes-Edit')
	end

	def prizeConfigurationHelpButton
		@browser.button(id: 'Fileprizes-Help')
	end

	def prizeConfigurationSortAscend
		@browser.button(id: 'sortascct1Fileprizes-Select')
	end

	def prizeConfigurationSortDescend
		@browser.button(id: 'sortdescct1Fileprizes-Select')
	end

	def prizeConfigurationRowSelection(index)
		@browser.div(id: "row#{index}Fileprizes-Select")
	end

	def prizeConfigurationFilterButton
		@browser.button(id: 'FilePrizes-Select-gridFilterBtn')
	end

	#### SELECTION CRITERIA MODAL METHODS / LOCATORS ####
	def prizeSelectionCriteriaModal
		@browser.div(id: 'FilePrizes-Select-FilterDivrows')
	end

	def prizeSelectCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def prizeSelectionCriteriaModalCriteriaDopdown
		@browser.button(id: 'FilePrizes-Select-FilterDiv1FilterField1-mainbutton')
	end

	def prizeSelectionCriteriaModalCriteriaSearchTextField
		@browser.input(id: 'FilePrizes-Select-FilterDiv1FilterField1-search')
	end

	def prizeSelectionCriteriaModalOperandDropdown
		@browser.button(id: 'FilePrizes-Select-FilterDiv1FilterField2-mainbutton')
	end

	def prizeSelectionCriteriaModalOperandSearchTextField
		@browser.input(id: 'FilePrizes-Select-FilterDiv1FilterField2-search')
	end

	def prizeSelectionCriteriaModalSelectionValueDropdown
		@browser.button(id: 'FilePrizes-Select-FilterDiv1FilterField3-mainbutton')
	end

	def prizeSelectionCriteriaModalSelectionValueSearchTextField
		@browser.input(id: 'FilePrizes-Select-FilterDiv2FilterField3-search')
	end

	def prizeSelectionCriteriaModalCancelIcon
		@browser.button(id: 'FilePrizes-Select-FilterDiv2CancelButton')
	end

	def prizeSelectionCriteriaModalAddIcon
		@browser.button(id: 'FilePrizes-Select-FilterDiv3OKButton')
	end

	def prizeSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def prizeSelectionCriteriaApplyButton
		@browser.button(id: 'utApplyFilterButton')
	end

	def prizeSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end

	#### DISPLAYED COLUMNS METHODS / LOCATORS #####
	def prizeDispalyedColumnsModal
		@browser.button(id: 'GridColumns-Columns')
	end

	def prizeDispalyedColumnsSaveButton
		@browser.button(id: 'GridColumns-Save')
	end

	def prizeDispalyedColumnsCloseButton
		@browser.button(id: 'GridColumns-Close')
	end

	def prizeDisplayedColumsModalIterateByRows
		@browser.table(id: "GridColumns-Columns").trs.collect{ |tr| tr[0].text.gsub!(/[\s!@%\/&"']/,'')}
	end

	#### PRIZE EDIT METHODS / LOCATORS #####
	def prizeEditSaveButton
		@browser.button(id: 'FilePrize-Data-Save')
	end

	def prizeEditCloseButton
		@browser.button(id: 'FilePrize-Data-Close')
	end

	def prizeEditHelpButton
		@browser.button(id: 'FilePrize-Data-Help')
	end

	def prizeEditIdTextField
		@browser.input(id: 'FilePrize-Data-Id')
	end

	def prizeEditDescriptionTextField
		@browser.input(id: 'FilePrize-Data-Description')
	end

	#### PRIZE PRIZES METHODS / LOCATORS #####
	def prizePrizesRadioButtonByIndex(index) #The index starts from 1
		@browser.td(xpath: "//td[@data-value='#{index}']")
	end

	def prizePrizesOnActiveCheckbox
		@browser.td(xpath: "//td[@data-value='(ON ) Active'][0]")
	end

	def prizePrizesPRZPrizeCheckbox
		@browser.td(xpath: "//td[@data-value='(PRZ) Prize'][0]")
	end

	def prizePrizesSplitTextField
		@browser.input(id: "FilePrize-Data-Prize-Split")
	end

	def prizePrizesWinnerTextField
		@browser.input(id: "FilePrize-Data-Prize-Winners")
	end

	def prizePrizesBreakToTextField
		@browser.input(id: "FilePrize-Data-Prize-Break")
	end

	def prizePrizesRoundDropdown
		@browser.button(id: "FilePrize-Data-Prize-Round-mainbutton")
	end

	def prizePrizesRoundSearchTextField
		@browser.input(id: "FilePrize-Data-Prize-Round-search")
	end

	def prizePrizesMinimumTextField
		@browser.input(id: "FilePrize-Data-Prize-Minimum")
	end

	def prizePrizesPrizeTextField
		@browser.input(id: "FilePrize-Data-Prize-Prize")
	end

	#### PRIZE CONSOLATION METHODS / LOCATORS #####
	def prizeConsolationTextField
		@browser.input(id: "FilePrize-Data-Prize-Prize")
	end

	def prizeConsolationOptionsOnActiveCheckbox
		@browser.td(xpath: "//td[@data-value='(ON ) Active'][1]")
	end

	def prizeConsolationOptionsLsrLosersCheckbox
		@browser.td(xpath: "//td[@data-value='(LSR) Losers'][0]")
	end

	def prizeConsolationOptionsMinMimimumCheckbox
		@browser.td(xpath: "//td[@data-value='(MIN) Minimum'][0]")
	end

	def prizeConsolationOptionsPrzPrizeCheckbox
		@browser.td(xpath: "//td[@data-value='(PRZ) Prize'][1]")
	end

	def prizeConsolationWinnersTextField
		@browser.input(id: "FilePrize-Data-Consolation-Winners")
	end

	def prizeConsolationBreakToTextField
		@browser.input(id: "FilePrize-Data-Consolation-Break")
	end

	def prizeConsolationRoundDropdown
		@browser.button(id: "FilePrize-Data-Consolation-Round-mainbutton")
	end

	def prizeConsolationRoundSearchTextField
		@browser.input(id: "FilePrize-Data-Consolation-Round-search")
	end

	def prizeConsolationMinimumTextField
		@browser.input(id: "FilePrize-Data-Consolation-Minimum")
	end

	def prizeConsolationFrequencyTextField
		@browser.input(id: "FilePrize-Data-Consolation-Frequency")
	end

	def prizeConsolationPrizeTextField
		@browser.input(id: "FilePrize-Data-Consolation-Prize")
	end

	#### PRIZE FREE ENTRY METHODS / LOCATORS #####
	def prizeFreeEntryOnActiveCheckbox
		@browser.td(xpath: "//td[@data-value='(ON ) Active'][2]")
	end

	def prizeFreeEntryLsrLosersCheckbox
		@browser.td(xpath: "//td[@data-value='(LSR) Losers'][1]")
	end

	def prizeFreeEntryMinMinimumCheckbox
		@browser.td(xpath: "//td[@data-value='(MIN) Minimum'][1]")
	end

	def prizeFreeEntryWinnersTextField
		@browser.input(id: "FilePrize-Data-Free-Winners")
	end

	def prizeFreeEntryFrequencyTextField
		@browser.input(id: "FilePrize-Data-Free-Frequency")
	end

	#### CONFIRM CLOSE PRIZE CHANGE MODAL METHODS / LOCATORS #####
	def prizeConfirmClosePrizeModal
		@browser.div(id: "Confirm")
	end

	def prizeConfirmClosePrizeModalYesButton
		@browser.div(id: "Confirm-Yes")
	end

	def prizeConfirmClosePrizeModalNoButton
		@browser.div(id: "Confirm-No")
	end
end
