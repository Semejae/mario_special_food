require 'rails_helper'

describe "update prodect process", type: :feature do 
  it "updates product"
    test_product = Product.create(name: 'Mic', cost: '15', country_of_origin: 'USA')
    visit product_path(test_product)
    click_on 'Edit product'
    fill_in 'Name', with: 'Keyboard'
    fill_in 'Cost', with: '12'
    fill_in 'Country of origin', with: 'Japan'
    click_on 'Update Product'
    expect(page).to have_content 'product updated'
    expect(page).to have_content 'Keyboard'
  end
end
