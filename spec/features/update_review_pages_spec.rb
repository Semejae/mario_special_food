require 'rails_helper'

describe "update review process", type: :feature do 
  it "update product review" do
    test_product = Product.create(name: 'Mic', cost: '15', country_of_origin: 'USA')
    test_review = Review.create(author: 'Anthony', content_body: 'Est qui est commodi praesentium unde omnis aut est cupiditate veniam pariatur iusto tempora et harum omnis non nihil quasi et quos a ab non.', rating: 5, product_id: test_product.id)
    visit product_review_path(test_product, test_review)
    click_on 'Edit review'
    fill_in 'Author', with: 'Kacie'
    fill_in 'Content body', with: 'Est qui est commodi praesentium unde omnis aut est cupiditate veniam pariatur iusto tempora et harum omnis non nihil quasi et quos a ab non.'
    fill_in 'Rating', with: 5
    click_on 'Update Review'
    expect(page).to have_content 'Est qui est commodi praesentium unde omnis aut est cupiditate veniam pariatur iusto tempora et harum omnis non nihil quasi et quos a ab non.'
  end
end