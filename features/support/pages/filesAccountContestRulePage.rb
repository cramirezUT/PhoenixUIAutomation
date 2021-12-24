## Class Page Helper file
## Auther: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module RulePage
	include RSpec::Matchers
	include Selenium

	#### RULES MODAL METHODS / LOCATORS ####
	def rulesConfigurationModal
		@browser.div(id: 'gridcontentFileRules-Select')
	end

	def ruleConfigurationSettingButton
		@browser.button(id: 'Filerules-Manage')
	end

	def ruleConfigurationEditButton
		@browser.button(id: 'Filerules-Edit')
	end

	def ruleConfigurationHelpButton
		@browser.button(id: 'Filerules-Help')
	end

	def ruleConfigurationSortAscend
		@browser.button(id: 'sortascct1Filerules-Select')
	end

	def ruleConfigurationSortDescend
		@browser.button(id: 'sortdescct1Filerules-Select')
	end

	def ruleConfigurationRowSelection(index)
		@browser.div(id: "row#{index}Filerules-Select")
	end

	#### SELECTION CRITERIA MODAL METHODS / LOCATORS ####
	def ruleSelectionCriteriaModal
		@browser.div(id: 'Filerules-Select-FilterDivrows')
	end

	def ruleSelectCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def ruleSelectionCriteriaModalCriteriaDopdown
		@browser.button(id: 'Filerules-Select-FilterDiv1FilterField1-mainbutton')
	end

	def ruleSelectionCriteriaModalCriteriaSearchTextField
		@browser.input(id: 'Filerules-Select-FilterDiv1FilterField1-search')
	end

	def ruleSelectionCriteriaModalOperandDropdown
		@browser.button(id: 'Filerules-Select-FilterDiv1FilterField2-mainbutton')
	end

	def ruleSelectionCriteriaModalOperandSearchTextField
		@browser.input(id: 'Filerules-Select-FilterDiv1FilterField2-search')
	end

	def ruleSelectionCriteriaModalSelectionValueDropdown
		@browser.button(id: 'Filerules-Select-FilterDiv1FilterField3-mainbutton')
	end

	def ruleSelectionCriteriaModalSelectionValueSearchTextField
		@browser.input(id: 'FileRules-Select-FilterDiv1FilterField3-search')
	end

	def ruleSelectionCriteriaModalCancelIcon
		@browser.button(id: 'Filerules-Select-FilterDiv2CancelButton')
	end

	def ruleSelectionCriteriaModalAddIcon
		@browser.button(id: 'FileRules-Select-FilterDiv2OKButton')
	end

	def ruleSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def ruleSelectionCriteriaApplyButton
		@browser.button(id: 'utApplyFilterButton')
	end

	def ruleSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end

	#### DISPLAYED COLUMNS METHODS / LOCATORS #####
	def ruleDispalyedColumnsModal
		@browser.button(id: 'GridColumns-Columns')
	end

	def ruleDispalyedColumnsSaveButton
		@browser.button(id: 'GridColumns-Save')
	end

	def ruleDispalyedColumnsCloseButton
		@browser.button(id: 'GridColumns-Close')
	end

	def ruleDisplayedColumsModalIterateByRows
		@browser.table(id: "GridColumns-Columns").trs.collect{ |tr| tr[0].text.gsub!(/[\s!@%\/&"']/,'')}
	end

	#### RULE EDIT METHODS / LOCATORS #####
	def ruleEditSaveButton
		@browser.button(id: 'Filerule-Data-Save')
	end

	def ruleEditCloseButton
		@browser.button(id: 'Filerule-Data-Close')
	end

	def ruleEditHelpButton
		@browser.button(id: 'Filerule-Data-Help')
	end

	def ruleEditIdTextField
		@browser.input(id: 'Filerule-Data-Id')
	end

	def ruleEditDescriptionTextField
		@browser.input(id: 'Filerule-Data-Description')
	end

	#### RULE WINNERS METHODS / LOCATORS #####
	def ruleWinnersBasisBalanceRadioButton
		@browser.td(xpath: "//td[@data-value='Balance']")
	end

	def ruleWinnersBasisWinningsRadioButton
		@browser.td(xpath: "//td[@data-value='Winnings']")
	end

	def ruleWinnersTieResolution1stDropdown
		@browser.button(id: 'FileRule-Data-Winners-First-mainbutton')
	end

	def ruleWinnersTieResolution2ndDropdown
		@browser.button(id: 'FileRule-Data-Winners-Second-mainbutton')
	end

	def ruleWinnersTieResolution3rdDropdown
		@browser.button(id: 'FileRule-Data-Winners-Third-mainbutton')
	end

	#### RULE NON-MANDATORY METHODS / LOCATORS #####
	def ruleNonMandatoryWagersTextField
		@browser.input(id: 'FileRule-Data-NonMandatory-Wagers')
	end

	def ruleNonMandatoryScratchesRefundRadioButton
		@browser.input(xpath: "//td[@data-value='Refund'][0]")
	end

	def ruleNonMandatoryScratchesLoserRadioButton
		@browser.input(xpath: "//td[@data-value='Loser'][0]")
	end

	def ruleNonMandatoryScratchesFavoriteRadioButton
		@browser.input(xpath: "//td[@data-value='Favorite'][0]")
	end

	#### RULE OPTIONS METHODS / LOCATORS #####
	def ruleOptionsCanCanlledCheckbox
		@browser.td(xpath: "//td[@data-value='(CAN) Cancelled']")
	end

	def ruleOptionsDBTMandatoryCheckbox
		@browser.td(xpath: "//td[@data-value='(DBT) Mandatory']")
	end

	def ruleOptionsDepDepositCheckbox
		@browser.td(xpath: "//td[@data-value='(DEP) Deposit']")
	end

	def ruleOptionsInpInPoolCheckbox
		@browser.td(xpath: "//td[@data-value='(INP) In Pool']")
	end

	def ruleOptionsMinMinimumCheckbox
		@browser.td(xpath: "//td[@data-value='(MIN) Minimum']")
	end

	def ruleOptionsWinWinningsCheckbox
		@browser.td(xpath: "//td[@data-value='(WIN) Winnings']")
	end

	def ruleOptionsWthWithdrawCheckbox
		@browser.td(xpath: "//td[@data-value='(WTH) Withdraw']")
	end

	#### RULE POOL METHODS / LOCATORS #####
	def rulePoolChoiceDropdown
		@browser.button(id: 'FileRule-Data-Pool-Pools-mainbutton')
	end

	def rulePoolChoiceDropdownSearchTextField
		@browser.input(id: 'FileRule-Data-Pool-Pools-search')
	end

	def rulePoolOptionsOnActiveCheckbox
		@browser.td(xpath: "//td[@data-value='(ON ) Active']")
	end

	def rulePoolOptionsCmbCombineCheckbox
		@browser.td(xpath: "//td[@data-value='(CMB) Combine']")
	end

	def rulePoolOptionsUnoUniqueCheckbox
		@browser.td(xpath: "//td[@data-value='(UNQ) Unique']")
	end

	def rulePoolOptionsWagersTextField
		@browser.input(id: 'FileRule-Data-Pool-Wagers')
	end

	def rulePoolOptionsMinimumTextField
		@browser.input(id: 'FileRule-Data-Pool-Minimum')
	end

	def rulePoolOptionsCapTextField
		@browser.input(id: 'FileRule-Data-Pool-Cap')
	end

	def rulePoolOptionsMaxiumTextField
		@browser.input(id: 'FileRule-Data-Pool-Maximum')
	end

	def rulePoolOptionsCutoffTextField
		@browser.input(id: 'FileRule-Data-Pool-Cutoff')
	end

	#### RULE MANDATORY METHODS / LOCATORS #####
	def ruleMandatoryWagersTextField
		@browser.input(id: 'FileRule-Data-Mandatory-Wagers')
	end

	def ruleMandatoryScratchesRefundRadioButton
		@browser.input(xpath: "//td[@data-value='Refund'][2]")
	end

	def ruleMandatoryScratchesLoserRadioButton
		@browser.input(xpath: "[//td[@data-value='Loser'][2]")
	end

	def ruleMandatoryScratchesFavoriteRadioButton
		@browser.input(xpath: "//td[@data-value='Favorite'][1]")
	end
end
