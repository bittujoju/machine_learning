class ClassificationsController < ApplicationController


  def index
    @classifications = Classification.all
  end

  def show
    @classification = Classification.all.find(params["id"].to_i)
    @categories = @classification.categories
  end

  def classify
    render json: {:error_message => "Not a valid sentence"}, status:422 unless params["Classify"].present?
    @classification =  Classification.find(params["classification_id"].to_i)
    @sentence = params["Classify"]
    words = Word.sentence_to_word(@sentence)
    Word.create_words(words)
    category = @classification.categories.max {|category| category.category_score(words)}

    @answer = category.name

  end

  def train
    Classification.train(params)
    redirect_to classifications_show_path(:id => params["classification_id"])
  end
end