class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :category

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true


end
