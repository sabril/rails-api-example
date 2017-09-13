ItemType = GraphQL::ObjectType.define do
 name "Item"
  description "An Item"
  field :id, types.ID
  field :title, types.String
  
end