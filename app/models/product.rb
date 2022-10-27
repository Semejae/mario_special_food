class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save(:titleize_product)
  before_save(:titleize_country_of_origin)
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  validates_length_of :name, maximum:100
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
  scope :local_product, -> { where(country_of_origin: "United States Of America")}
  scope :most_recent, -> { order(created_at: :desc).limit(3)}

  private
    def titleize_product
      self.name = self.name.titleize
    end

    def titleize_country_of_origin
      self.country_of_origin = self.country_of_origin.titleize
    end

end