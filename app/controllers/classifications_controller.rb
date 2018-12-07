class ClassificationsController < ApplicationController


  def index
    @classifications = Classification.all
  end

  def show
    @classification = Classification.all.find(params["id"].to_i)
    @categories = @classification.categories
  end

  def classify
    @classification =  Classification.find(params["classification_id"].to_i)
    render json: {:error_message => "Not a valid sentence"}, status:422 unless params["Classify"].present?
    @sentence = params["Classify"]
  end

  def train
    Classification.train(params)
    classification =  Classification.find(params["classification_id"].to_i)
    redirect_to classifications_show_path(:id => params["classification_id"])
  end
end