class Classification < ActiveRecord::Base

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :words

  def self.train(params)
    @classification =  Classification.find(params["classification_id"].to_i)
    words = Word.word_hash(params["sentence"])
    @classification.categories.each do |category|
      if (category.name == params["answer"] && params["success"] == "true") ||
          (category.name != params["answer"] && params["success"] == "false")
        category.add_success_counts(words)
      else
        category.add_failure_counts(words)
      end
    end
  end

  private

  def self.create_from_categories(categories)
    classification_name = categories.first.name + " or " + categories.second.name
    classification_identifier = categories.first.identifier + " or " + categories.second.identifier
    classification = Classification.find_or_create_by(identifier: classification_identifier, name: classification_name)
    classification.categories << categories
    classification
  end
end