require 'rails_helper'

RSpec.describe "Articles", type: :request do
  before do
    @article = Article.create(title: "Something Article", body: "This is is a sample article to check the request to go to a proper route.")
  end

  describe 'Get /articles/:id' do

    context 'with existing article' do
      before { get "/articles/#{@article.id}" }

      it "handles existing article" do
        expect(response.status).to eq 200
      end
    end

    context 'with a non existing article' do
      before { get "/articles/xxxx}" }

      it "handles non existing article" do
        expect(response.status).to eq 404
        flash_message = "The article you are looking for could not be found."
        expect(flash[:alert]).to eq flash_message
      end
    end

  end

end
