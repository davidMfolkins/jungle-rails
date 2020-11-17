require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Click one of the product and see it" do
    # ACT
    visit root_path

    first('h4').click
    expect(page).to have_content 'Description'
    # DEBUG
    puts page.html
    save_screenshot('test_2.png')

    # VERIFY
  end
end