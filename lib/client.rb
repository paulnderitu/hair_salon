class Client

attr_reader(:name, :contact, :stylist_id)

define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @contact = attributes.fetch(:contact)
  @stylist_id = attributes.fetch(:stylist_id)
end
end
