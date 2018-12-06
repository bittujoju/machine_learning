class Word < ActiveRecord::Base

  has_and_belongs_to_many :categories

  def self.word_hash(sentence)
    words = sentence_to_word(sentence)
    words.uniq
  end

  private

  def self.sentence_to_word(sentence)
    sentence.to_s.gsub(/[^\w\s]/,"").split
  end
end