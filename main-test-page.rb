require 'selenium-webdriver'
require 'webdrivers'
require 'rspec'
require_relative 'SearchSections'
driver = Selenium::WebDriver.for :chrome
persons = SearchSections.new(driver)


describe persons do 
    it "navigates to musicians section" do
         headline = persons.searchMusicians
         expect(headline).to eql('Musicians')
    end
end

describe persons  do 
    it "navigates to actors section" do
         headline = persons.searchActors
         expect(headline).to eql('Actors')
    end
end

    describe persons  do 
    it "navigates to entertainers section" do
         headline = persons.searchEntertainers
         expect(headline).to eql('Entertainers')
    end
end