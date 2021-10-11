class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3 }
  validates :ideal_quantity, :current_quantity, presence: true
  validates :code, uniqueness: { case_sensitive: false }, presence: true
end
