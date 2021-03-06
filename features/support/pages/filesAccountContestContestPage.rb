## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module ContestPage
	include RSpec::Matchers
	include Selenium

	#### CONTEST MODAL METHODS / LOCATORS ####
	def contestConfigurationModal
		@browser.div(id: 'gridcontentFileContests-Select')
	end

	def contestConfigurationSettingButton
		@browser.button(id: 'FileContests-Manage')
	end

	def contestConfigurationUpdateButton
		@browser.button(id: 'FileContests-Update')
	end

	def contestConfigurationHelpButton
		@browser.button(id: 'FileContests-Help')
	end

	def contestConfigurationSortAscend
		@browser.button(id: 'sortascct1FileContests-Select')
	end

	def contestConfigurationSortDescend
		@browser.button(id: 'sortdescct1FileContests-Select')
	end

	def prizeConfigurationRowSelection(index)
		@browser.div(id: "row#{index}Fileprizes-Select")
	end

	#### DISPLAYED COLUMNS METHODS / LOCATORS #####
	def contestDispalyedColumnsModal
		@browser.button(id: 'GridColumns-Columns')
	end

	def contestDispalyedColumnsSaveButton
		@browser.button(id: 'GridColumns-Save')
	end

	def contestDispalyedColumnsCloseButton
		@browser.button(id: 'GridColumns-Close')
	end

	def contestDisplayedColumsModalIterateByRows
		@browser.table(id: "GridColumns-Columns").trs.collect{ |tr| tr[0].text.gsub!(/[\s!@%\/&"']/,'')}
	end
end
