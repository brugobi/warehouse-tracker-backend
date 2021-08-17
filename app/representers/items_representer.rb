class ItemsRepresenter
  def initialize(items)
    @items = items
  end

  def as_json
    items.map do |item|
      {
        id: item.id,
        name: item.name,
        code: item.code,
        ideal_quantity: item.ideal_quantity,
        current_quantity: item.current_quantity,
        user: item.user_id
      }
    end
  end

  private

  attr_reader :items
end
