require 'rails_helper'

RSpec.feature 'Deleting an Article' do

  before do
    @article = Article.create(title: "An Article to be deleted", body: "This will be deleted")
  end

  scenario 'User Delete an Article' do

    visit "/"

    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end
end
