TodoType = GraphQL::ObjectType.define do
 name "Todo"
  description "A Todo"
  field :id, types.ID
  field :title, types.String
  field :items do
    type types[ItemType]
    argument :size, types.Int, default_value: 10
    resolve -> (todo, args, ctx) {
      todo.items.limit(args[:size])
    }
  end
end