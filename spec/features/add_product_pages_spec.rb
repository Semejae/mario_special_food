require "rails_helper"

describe "the add a product process" do 
  it "adds a new product" do
    visit products_path
    click_button 'Create new product'
    fill_in 'Name', :with => 'Mic'
    fill_in 'Country of origin', :with => 'USA'
    fill_in 'Cost', :with => '5'
    click_on 'Create Product'
    expect(page).to have_content 'product created!'
    expect(page).to have_content 'Mic'
  end

  it "gives a error message when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "No name entered"
  end
end