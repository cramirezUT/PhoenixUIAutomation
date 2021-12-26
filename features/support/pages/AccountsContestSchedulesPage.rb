## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module SchedulesPage
	include RSpec::Matchers
	include Selenium

	#### SCHEDULES MODAL METHODS / LOCATORS ####
	def schedulesModal
		@browser.div(id: 'gridcontentFileschedules-Select')
	end

	def scheduleTournamentButton
		@browser.button(id: 'FileSchedules-Tournament-mainbutton')
	end

	def scheduleTournamentSearchTextField
		@browser.div(id: 'FileSchedules-Tournament-searchdiv')
	end

	def schedulesSettingButton
		@browser.button(id: 'Fileschedules-Manage')
	end

	def schedulesEditButton
		@browser.button(id: 'Fileschedules-Edit')
	end

	def schedulesHelpButton
		@browser.button(id: 'Fileschedules-Help')
	end

	def schedulesSortAscend
		@browser.button(id: 'sortascct1Fileschedules-Select')
	end

	def schedulesSortDescend
		@browser.button(id: 'sortdescct1Fileschedules-Select')
	end

	def schedulesRowSelection(index)
		@browser.div(id: "row#{index}Fileschedules-Select")
	end

	#### SELECTION CRITERIA MODAL METHODS / LOCATORS ####
	def scheduleselectionCriteriaModal
		@browser.div(id: 'Fileschedules-Select-FilterDivrows')
	end

	def scheduleselectCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def scheduleselectionCriteriaModalCriteriaDopdown
		@browser.button(id: 'Fileschedules-Select-FilterDiv1FilterField1-mainbutton')
	end

	def scheduleselectionCriteriaModalCriteriaSearchTextField
		@browser.input(id: 'Fileschedules-Select-FilterDiv1FilterField1-search')
	end

	def scheduleselectionCriteriaModalOperandDropdown
		@browser.button(id: 'Fileschedules-Select-FilterDiv1FilterField2-mainbutton')
	end

	def scheduleselectionCriteriaModalOperandSearchTextField
		@browser.input(id: 'Fileschedules-Select-FilterDiv1FilterField2-search')
	end

	def scheduleselectionCriteriaModalSelectionValueDropdown
		@browser.button(id: 'Fileschedules-Select-FilterDiv1FilterField3-mainbutton')
	end

	def scheduleselectionCriteriaModalSelectionValueSearchTextField
		@browser.input(id: 'Fileschedules-Select-FilterDiv1FilterField3-search')
	end

	def scheduleselectionCriteriaModalCancelIcon
		@browser.button(id: 'FileSchedules-Select-FilterDiv1CancelButton')
	end

	def scheduleselectionCriteriaModalAddIcon
		@browser.button(id: 'Fileschedules-Select-FilterDiv2OKButton')
	end

	def scheduleselectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def scheduleselectionCriteriaApplyButton
		@browser.button(id: 'utApplyFilterButton')
	end

	def scheduleselectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end

	#### DISPLAYED COLUMNS METHODS / LOCATORS #####
	def schedulesDispalyedColumnsModal
		@browser.button(id: 'GridColumns-Columns')
	end

	def schedulesDispalyedColumnsSaveButton
		@browser.button(id: 'GridColumns-Save')
	end

	def schedulesDispalyedColumnsCloseButton
		@browser.button(id: 'GridColumns-Close')
	end

	def schedulesDisplayedColumsModalIterateByRows
		@browser.table(id: "GridColumns-Columns").trs.collect{ |tr| tr[0].text.gsub!(/[\s!@%\/&"']/,'')}
	end

	#### SCHEDULE EDIT METHODS / LOCATORS #####
	def scheduleEditSaveButton
		@browser.button(id: 'Fileschedule-Data-Save')
	end

	def scheduleEditCloseButton
		@browser.button(id: 'Fileschedule-Data-Close')
	end

	def scheduleEditHelpButton
		@browser.button(id: 'Fileschedule-Data-Help')
	end

	def scheduleEditIdTextField
		@browser.input(id: 'Fileschedule-Data-Id')
	end

	def scheduleEditNameTextField
		@browser.input(id: 'FileSchedule-Data-Name')
	end

	def scheduleEditDescriptionTextField
		@browser.input(id: 'Fileschedules-Data-Description')
	end

	def scheduleEditFreeEntryDropdown
		@browser.button(id: 'FileSchedule-Data-Free-mainbutton')
	end

	def scheduleEditFreeEntrySearchTextField
		@browser.input(id: 'FileSchedule-Data-Free-searchdiv')
	end

	def scheduleEditPrizeDropdown
		@browser.button(id: 'FileSchedule-Data-Prize-mainbutton')
	end

	def scheduleEditPrizeSearchTextField
		@browser.div(id: 'FileSchedule-Data-Prize-searchdiv')
	end

	def scheduleEditAddinTextField
		@browser.input(id: 'FileSchedule-Data-Addin')
	end

	def scheduleEditExternalTextField
		@browser.input(id: 'FileSchedule-Data-External')
	end

	def scheduleEditUrlTextField
		@browser.input(id: 'FileSchedule-Data-URL')
	end

	#### SCHEDULE EDIT DATES METHODS / LOCATORS #####
	def scheduleEditDatesBeignTextField
		@browser.input(id: 'inputFileSchedule-Data-Dates-Begin')
	end

	def scheduleEditDatesEndTextField
		@browser.input(id: 'inputFileSchedule-Data-Dates-End')
	end

	def scheduleEditDatesNoEntryTextField
		@browser.input(id: 'inputFileSchedule-Data-Dates-NoEntry')
	end

	def scheduleEditDatesBeginCalendarButton
		@browser.div(id: 'FileSchedule-Data-Dates-Begin-seconddiv')
	end

	def scheduleEditDatesEndCalendarButton
		@browser.div(id: 'FileSchedule-Data-Dates-End-seconddiv')
	end

	def scheduleEditDatesNoEntryCalendarButton
		@browser.div(id: 'FileSchedule-Data-Dates-NoEntry-seconddiv')
	end

	def scheduleEditDatesBeginTimeButton
		@browser.div(id: 'FileSchedule-Data-Dates-Begin-fourthdiv')
	end

	def scheduleEditDatesEndTimeButton
		@browser.div(id: 'FileSchedule-Data-Dates-End-fourthdiv')
	end

	def scheduleEditDatesNoEntryTimeButton
		@browser.div(id: 'FileSchedule-Data-Dates-NoEntry-fourthdiv')
	end

	#### SCHEDULE EDIT ENTRY METHODS / LOCATORS #####
	def scheduleEditEntryFeeTextField
		@browser.input(id: 'FileSchedule-Data-Entry-Fee')
	end

	def scheduleEditEntrySplitTextField
		@browser.input(id: 'FileSchedule-Data-Entry-Split')
	end

	def scheduleEditEntryBalanceTextField
		@browser.input(id: 'FileSchedule-Data-Entry-Balance')
	end

	def scheduleEditEntryCommissionTextField
		@browser.input(id: 'FileSchedule-Data-Entry-Commission')
	end

	#### SCHEDULE EDIT TRACKS METHODS / LOCATORS #####
	def scheduleEditTracksDropdown
		@browser.input(id: 'FileSchedule-Data-Participating-Tracks-mainbutton')
	end

	def scheduleEditTracksSearchTextField
		@browser.input(id: 'FileSchedule-Data-Participating-Tracks-searchdiv')
	end

	def scheduleEditTracksFilterButton
		@browser.button(id: 'FileSchedule-Data-Participating-Tracks-filterbutton')
	end

	def scheduleEditTracksDoneButton
		@browser.button(id: 'FileSchedule-Data-Participating-Tracks-donebutton')
	end

	def scheduleEditTracksRowByIndex(index)
		@browser.button(id: "FileSchedule-Data-Participating-List-#{index}-0")
	end

	#### SCHEDULE EDIT TRACKS SELECTION CRITERIA METHODS / LOCATORS #####
	def scheduleSelectionCriteriaModal
		@browser.div(id: 'FileSchedule-Data-Participating-Tracks-FilterDiv1FilterField1-mainbutton')
	end

	def scheduleSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def scheduleSelectionCriteriaModalCriteriaDopdown
		@browser.button(id: 'Fileschedules-Select-FilterDiv1FilterField1-mainbutton')
	end

	def scheduleSelectionCriteriaModalCriteriaSearchTextField
		@browser.input(id: 'FileSchedule-Data-Participating-Tracks-FilterDiv1FilterField1-search')
	end

	def scheduleSelectionCriteriaModalOperandDropdown
		@browser.button(id: 'FileSchedule-Data-Participating-Tracks-FilterDiv1FilterField2-mainbutton')
	end

	def scheduleSelectionCriteriaModalOperandSearchTextField
		@browser.input(id: 'FileSchedule-Data-Participating-Tracks-FilterDiv1FilterField2-search')
	end

	def scheduleSelectionCriteriaModalSelectionValueDropdown
		@browser.button(id: 'FileSchedule-Data-Participating-Tracks-FilterDiv1FilterField3-mainbutton')
	end

	def scheduleSelectionCriteriaModalSelectionValueSearchTextField
		@browser.input(id: 'FileSchedule-Data-Participating-Tracks-FilterDiv1FilterField3-search')
	end

	def scheduleSelectionCriteriaModalCancelIcon
		@browser.button(id: 'FileSchedule-Data-Participating-Tracks-FilterDiv1CancelButton')
	end

	def scheduleSelectionCriteriaModalAddIcon
		@browser.button(id: 'FileSchedule-Data-Participating-Tracks-FilterDiv2OKButton')
	end

	def scheduleSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def scheduleSelectionCriteriaApplyButton
		@browser.button(id: 'utApplyFilterButton')
	end

	def scheduleSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
end
