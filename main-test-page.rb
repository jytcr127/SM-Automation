require 'selenium-webdriver'
require 'webdrivers'
require 'rspec'
require_relative 'SearchSections'
require 'capybara/rspec'
driver = Selenium::WebDriver.for :chrome
persons = SearchSections.new(driver)


describe persons do 
    it "Test 1: navigates to musicians section" do
         headline = persons.searchMusicians
         expect(headline).to eql('Musicians')
    end
end

describe persons  do 
    it "Test 2: navigates to actors section" do
         headline = persons.searchActors
         expect(headline).to eql('Actors')
    end
end

    describe persons  do 
    it "Test 3: navigates to entertainers section" do
         headline = persons.searchEntertainers
         expect(headline).to eql('Entertainers')
    end
end

    describe persons  do 
    it "Test 4: Search for a group" do
         groupname = persons.searchGroup
         expect(groupname).to eql('NCT Musicians')
    end
end

    describe persons do
    it 'Test 5: Search for a music video' do
        musicvideosection = persons.searchMusicVideo
        expect(musicvideosection).to eql ('Music Video')
    end
end

describe persons do 
    it 'Test 6:  Music video selected should load' do
        playvideo = persons.loadMusicVideo
        expect(playvideo).to eql (true)
    end
end

