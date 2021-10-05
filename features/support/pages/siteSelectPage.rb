require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'


module SiteSelectPage
	include RSpec::Matchers
	include Selenium

	#### METHODS / LOCATORS ####
	def siteSelectLink
		@browser.table(id: 'sitelist')
	end

	#### FUNCTIONS ####
	def selectSiteTable
		siteSelectLink.wait_until_present.flash(color: ["yellow"]).click
	end

	#### VERIFIERS ####
end
