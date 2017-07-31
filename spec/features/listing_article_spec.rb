require 'rails_helper'

RSpec.feature "Listing Articles" do

  before do
    @article1 = Article.create(title: "the first article", body: "Lorem ipsum dolor sit amet")

    @article2 = Article.create(title: "Iam second article", body: "Merlo muspi rolod tis tema")
  end

  scenario "Show article list" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end

  scenario "Has no articles" do
    Article.delete_all

    visit "/"

    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)

    within("h3#no-articles") do
      expect(page).to have_content("No Article created yet.")
    end
  end

end
