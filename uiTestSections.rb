require 'page-object'

$page1 = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[1]/div/a[2]/b'
$page2 ='/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[2]/div/a[2]/b'
$page3 = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[3]/div/a[2]/b'
$page4 = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[4]/div/a[2]/b'
$page5 = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[5]/div/a[2]/b'
$clickTwiceButton = '/html/body/div[2]/div[2]/div[1]/div[4]/div/div/ul/li[4]/div/a[2]'
$clickButton = 'btn_thumb'

class UITestSections

    include PageObject

    def scrollThroughNewsOnce
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    driver.find_element(class: $clickButton).click
    pageNumber = driver.find_element(xpath: $page2).text
    return pageNumber
end

    def scrollThroughNewsTwice
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    driver.find_element(class: $clickButton).click
    wait = Selenium::WebDriver::Wait.new(timeout: 50) # seconds
    wait.until { driver.find_element(xpath: $clickTwiceButton).displayed?}
    driver.find_element(xpath: $clickTwiceButton).click
    pageNumber = driver.find_element(xpath: $page3).text
    return pageNumber
    end 
end