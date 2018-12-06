class ClassificationsController < ApplicationController


  def index
    @classifications = Classification.all
  end

  def show
    @classification = Classification.all.find_by_identifier(params["identifier"])
    @categories = @classification.categories
  end

  def classify
    render json: {:error_message => "Not a valid sentence"}, status:422 unless params["Classify"].present?
    @sentence = params["Classify"]
  end

  def train
    binding.pry
    Word.word_hash(params["sentence"])
    redirect_to root_path
  end
end