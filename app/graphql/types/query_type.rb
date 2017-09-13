UserType = GraphQL::ObjectType.define do
  name "User"
  description "An User"
  field :id, types.ID
  field :name, types.String
  field :email, types.String
  field :todos do
    type types[TodoType]
    argument :size, types.Int, default_value: 10
    resolve -> (user, args, ctx) {
      user.todos.limit(args[:size])
    }
  end
end

ItemType = GraphQL::ObjectType.define do
 name "Item"
  description "An Item"
  field :id, types.ID
  field :name, types.String
  
end

TodoType = GraphQL::ObjectType.define do
 name "Todo"
  description "A Todo"
  field :id, types.ID
  field :title, types.String
  field :user, UserType
  field :items do
    type types[ItemType]
    argument :size, types.Int, default_value: 10
    resolve -> (todo, args, ctx) {
      todo.items.limit(args[:size])
    }
  end
end

Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :user do
    type UserType
    argument :id, !types.String
    resolve -> (root, args, ctx) {
      User.find(args[:id])
    }
  end

  field :todo do
    type TodoType
    argument :id, !types.String
    resolve -> (root, args, ctx) {
      Todo.find(args[:id])
    }
  end

end
