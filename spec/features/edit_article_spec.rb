require 'rails_helper'

RSpec.feature "Editing an Article" do

  before do
    @article = Article.create(title: "This is a new article for editing", body: "Lorem ipsum edit this article")
  end

  scenario "User Successfully Edit an Article" do

    visit "/"

    click_link "Edit Article"

    fill_in "article_title", with: "Updated Title"
    fill_in "article_body", with: "Updated Body"

    click_button "Update Article"


    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "User Fails to Edit an Article" do

    visit "/"

    click_link "Edit Article"

    fill_in "article_title", with: ""
    fill_in "article_body", with: ""

    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
    expect(page.current_path).to eq(article_path(@article))
  end

end
