class Review < ApplicationRecord
  belongs_to :product
  validates :rating, presence: true
  validates :author, presence: true
  validates :content_body, presence: true
  validates_lenght_of :content_body, minimum:50, maximum: 250
  validates :rating, numericality: { in: 1..5}

  private
    def titleize_author
      self.author = self.author.titleize
    end

    def titleize_content_body
      self.content_body = self.content_body.titleize
    end
end