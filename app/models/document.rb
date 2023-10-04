class Document < ApplicationRecord
  belongs_to :student
  has_one_attached :adhar_card
  has_one_attached :paincard
  has_one_attached :image
end
