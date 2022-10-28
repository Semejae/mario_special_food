require "rails_helper"

describe "add a product review path", type: :feature do 
  it "adds a review to the product through product page" do 

    test_product = Product.create(name: 'Mic', cost: '15', country_of_origin: 'USA')
    visit product_path(test_product)
    click_on 'Add a review to propduct page'
    fill_in 'Author', with: 'Anthony'
    fill_in 'Rating', with: '5'
    fill_in 'Content body', with: 'blah'
    click_on 'Create Review'
    expect(page).to have_content 'review added'
    expect(page).to have_content 'blah'
  end

  it "gives a error message when no author is entered" do
    test_product = Product.create(name: 'Mic', cost: '15', country_of_origin: 'USA')
    visit new_product_review_path(test_product)
    click_on 'Create Review'
    expect(page).to have_content "No Author name entered"
  end
end
