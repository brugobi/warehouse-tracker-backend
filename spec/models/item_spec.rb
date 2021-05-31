require 'rails_helper'

RSpec.describe Item, type: :model do
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:ideal_quantity) }
  it { should validate_presence_of(:current_quantity) }
  it { should validate_length_of(:name).is_at_least(3) }
end
