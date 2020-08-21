require 'page-object'

$closeButton = 'btn_close'
$page1 = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[1]/div/a[2]/b'
$page2 ='/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[2]/div/a[2]/b'
$page3 = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[3]/div/a[2]/b'
$page4 = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[4]/div/a[2]/b'
$page5 = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[5]/div/a[2]/b'
$clickTwiceButton = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[4]/div/a[2]'
$clickButton = 'btn_thumb'
$musicVideoOption = '/html/body/div[2]/div[1]/div/div/div[2]/ul/li[1]/a'
$musicVideoLoaded = '/html/body/div/div[2]/div[2]'
$musicVideoToClick = '/html/body/div/div[2]/div[1]/div[2]/div/ul/li[1]/a/span[1]/span'
$playMusicVideoButton = '/html/body/div/div[2]/div[2]'
$exitVideoButton = '/html/body/div/div[2]/div[2]/a'

class UITestSections

    include PageObject

    def scrollThroughNewsOnce
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    driver.find_element(xpath: '/html/body/div[2]/a').click
    driver.find_element(class: $clickButton).click
    wait = Selenium::WebDriver::Wait.new(timeout: 50) # seconds
    wait.until { driver.find_element(xpath: $page2).displayed?}
    pageNumber = driver.find_element(xpath: $page2).text
    return pageNumber
end

    def scrollThroughNewsTwice
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    driver.find_element(xpath: '/html/body/div[2]/a').click
    driver.find_element(class: $clickButton).click
    wait = Selenium::WebDriver::Wait.new(timeout: 50) # seconds
    wait.until { driver.find_element(xpath: $clickTwiceButton).displayed?}
    driver.find_element(xpath: $clickTwiceButton).click
    pageNumber = driver.find_element(xpath: $page3).text
    return pageNumber
    end

    def closeVideo
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/mv'
    driver.find_element(xpath: $musicVideoToClick).click
    driver.find_element(xpath: $playMusicVideoButton).click
    driver.find_element(xpath: $exitVideoButton ).click
    sleep 10
    return driver.find_element(xpath: $musicVideoLoaded).displayed?
    end
    
end

