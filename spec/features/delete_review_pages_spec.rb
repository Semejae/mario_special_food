require "rails_helper"

describe "the delete a review process", type: :feature do 
  it "delete product review" do 
    test_product = Product.create(name: 'Mic', cost: '15', country_of_origin: 'USA')
    test_review = Review.create(author: 'Anthony', content_body: 'blah', rating: 5, product_id: test_product.id)
    visit product_review_path(test_product, test_review)
    click_on 'Delete review'
    expect(page).not_to have_content 'blah'
  end 
end