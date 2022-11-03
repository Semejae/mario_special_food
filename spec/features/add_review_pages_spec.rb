require "rails_helper"

describe "add a product review path", type: :feature do 
  it "adds a review to the product through product page" do 

    test_product = Product.create(name: 'Mic', cost: '15', country_of_origin: 'USA')
    visit product_path(test_product)
    click_on 'Add Review to Product'
    fill_in 'Author', with: 'Anthony'
    fill_in 'Rating', with: '5'
    fill_in 'Content body', with: 'Est qui est commodi praesentium unde omnis aut est cupiditate veniam pariatur iusto tempora et harum omnis non nihil quasi et quos a ab non.'
    click_on 'Create Review'
    expect(page).to have_content "Est qui est commodi praesentium unde omnis aut est cupiditate veniam pariatur iusto tempora et harum omnis non nihil quasi et quos a ab non."
  end

  it "gives a error message when no author is entered" do
    test_product = Product.create(name: 'Mic', cost: '15', country_of_origin: 'USA')
    visit new_product_review_path(test_product)
    click_on 'Create Review'
    expect(page).to have_content "Rating can't be blank"
    expect(page).to have_content "Author can't be blank"
    expect(page).to have_content "Content body can't be blank"
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
    expect(page).to have_content "Rating is not a number"
  end
end
