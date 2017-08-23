require_relative 'TestSetup.rb'

class PizzaOrder
    page = SiteSetup.new('http://pizzalviv.com/')
    sleep 0.2
    page.close_popup.click  
    page.locate_pizza.click
    page.select_pizza.click
    sleep 1.0
    page.gotobasket.click
    page.verifyammount
    page.checkout_link
    page.verify_error
    page.close_browser
end
