require "rails_helper"

describe "delete a product", type: :feature do 
  it "delete a product" do 
    test_product = Product.create(name: 'Mic', cost: '15', country_of_origin: 'USA')
    visit product_path(test_product)
    click_on 'Delete product'
    expect(page).not_to have_content 'Mic'
  end
end
