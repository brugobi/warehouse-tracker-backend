class ItemRepresenter
  def initialize(item)
    @item = item
  end

  def as_json
    {
      id: item.id,
      name: item.name,
      code: item.code,
      ideal_quantity: item.ideal_quantity,
      current_quantity: item.current_quantity,
      user: item.user_id
    }
  end

  private

  attr_reader :item
end
