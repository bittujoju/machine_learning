class ClassificationsController < ApplicationController


  def index
    @classifications = Classification.all
  end

  def show
    @classification = Classification.all.find(params["id"].to_i)
    @categories = @classification.categories
  end

  def create
    category_1 = Category.find_or_create_by(name: params["Category 1"], identifier: Word.snake_case(params["Category 1"]))
    category_2 = Category.find_or_create_by(name: params["Category 2"], identifier: Word.snake_case(params["Category 2"]))
    classification = Classification.create_from_categories([category_1, category_2])
    redirect_to classifications_show_path(id: classification.id)
  end
  def classify
    render json: {:error_message => "Not a valid sentence"}, status:422 unless params["Classify"].present?
    @classification =  Classification.find(params["classification_id"].to_i)
    @sentence = params["Classify"]
    words = Word.sentence_to_word(@sentence)
    Word.create_words(words)
    category = @classification.categories.max {|category_1, category_2| category_1.category_score(words) <=> category_2.category_score(words)}
    @answer = category.name
  end

  def train
    Classification.train(params)
    redirect_to classifications_show_path(:id => params["classification_id"])
  end

end