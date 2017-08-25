require_relative 'TestSetup.rb'

class PizzaOrder
    page = SiteSetup.new
    page.close_popup 
    page.locate_pizza.click
    page.select_pizza.click
    page.gotobasket.click
    page.verifyammount
    page.checkout_link
    page.verify_error
    page.close_browser
end
