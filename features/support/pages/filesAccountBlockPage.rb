## Class Page Helper file
## Auther: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module FilesAccountBlockPage
	include RSpec::Matchers
	include Selenium

	#### BLOCK DISPLAYED COLUMNS MODAL METHODS / LOCATORS ####
	def blockDisplayedColumsModalCloseButton
		@browser.button(id: 'GridColumns-Close')
	end

	def blockDisplayedColumsModalTable
		@browser.table(id: "GridColumns-Columns").row.cells.length
	end

	def blockDisplayedColumsModalAllRows
		@browser.table(id: "GridColumns-Columns")
	end

	def blockDisplayedColumsModalIterateByRows
		@browser.table(id: "GridColumns-Columns").trs.collect{ |tr| tr[0].text.gsub!(/[\s!@%\/&"']/,'')}
	end

	#### BLOCK CONFIGURATION MODAL METHODS / LOCATORS####
	def blockConfigurationModal
		sleep 1
		@browser.div(id: 'gridcontentFileBlocks-Select')
	end

	def blockConfigurationDisplayedColumsPopup
		sleep 1
		@browser.div(id: 'GridColumns')
	end

	def blockConfigurationSettingsButton
		@browser.button(id: 'FileBlocks-Manage')
	end

	#### BLOCK PAGE VERIFIERS ####
	def verifyDisplayedColumnsRowsText
		if expect(blockDisplayedColumsModalIterateByRows[2]).to eql ("Id") and expect(blockDisplayedColumsModalIterateByRows[3]).to eql ("Description") and expect(blockDisplayedColumsModalIterateByRows[4]).to eql ("Conditions") and expect(blockDisplayedColumsModalIterateByRows[5]).to eql ("Number")
			blockConfigurationDisplayedColumsPopup.flash(color: ["green"])
			puts "Text For All Rows Are A Match"
		else
			expect { raise StandardError, "Text For All Rows Are NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Text For All Rows Are NOT A Match')
		end
	end

	def verifyBlockConfigurationModal
		if expect(blockConfigurationModal.visible?).to eql true
			then
				blockConfigurationModal.flash(color: ["yellow"])
				puts "#{true}: Displayed Columns Popup IS Displayed"
			else
				expect { raise StandardError, "Displayed Columns Popup NOT Displayed: Step FAILED"}.to raise_error('PLEASE VERIFY: Displayed Columns Popup NOT Displayed')
		end
	end

	def verifyBlockConfigurationDisplayColumsPopup
		if expect(blockConfigurationDisplayedColumsPopup.visible?).to eql true
			then
				blockConfigurationDisplayedColumsPopup.flash(color: ["yellow"])
				puts "#{true}: Displayed Columns Popup IS Displayed"
			else
				expect { raise StandardError, "Displayed Columns Popup NOT Displayed: Step FAILED"}.to raise_error('PLEASE VERIFY: Displayed Columns Popup NOT Displayed')
		end
	end
end
