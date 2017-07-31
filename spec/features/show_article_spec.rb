require 'rails_helper'

RSpec.feature "Show article" do

  before do
    @article = Article.create(title: "Something Article", body: "This is the first article.")
  end

  scenario "Show individual Article" do

    visit "/"

    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
