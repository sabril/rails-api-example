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