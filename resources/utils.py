from robot.libraries.BuiltIn import BuiltIn

def hello_world(self):
    print("Hello World")

def add_items_to_cart_and_checkout(products):
    driver = BuiltIn().get_library_instance("SeleniumLibrary")
    i = 1
    actual_products = driver.get_webelements("css:.card-title")
    for product in actual_products:
        if product.text in products:
            driver.click_button(f"xpath:(//*[@class='card-footer'])[{str(i)}]/button")
        i = i + 1
