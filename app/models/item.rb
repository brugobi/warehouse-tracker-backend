class Item < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :code, :ideal_quantity, :current_quantity, presence: true
  validates_uniqueness_of :code, case_sensitive: false
  belongs_to :user
end
