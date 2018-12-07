class Category < ActiveRecord::Base

  has_and_belongs_to_many :classifications

  def add_success_counts(words)
    words.each do |w|
      word = Word.find_by_identifier(w)
      cw = CategoriesWords.find_or_create_by(category_id: self.id, word_id: word.id)
      cw.success_count += 1
      cw.save
    end
    self.word_count += words.count
  end

  def add_failure_counts(words)
    words.each do |w|
      word = Word.find_by_identifier(w)
      cw = CategoriesWords.find_or_create_by(category_id: self.id, word_id: word.id)
      cw.failure_count += 1
      cw.save
    end
    self.word_count += words.count
  end
end