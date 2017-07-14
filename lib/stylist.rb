class Stylist

attr_reader(:name, :id)

define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @id = attributes.fetch(:id)
end


define_method(:stylists) do
  stylist_clients = []
  clients = DB.exec("SELECT * FROM clientss WHERE stylist_id = #{self.id()};")
      clients.each() do |client|
        name = client.fetch("name")
        contact = contact.fetch("contact")
        stylist_id = client.fetch("stylist_id").to_i()
        stylist_clients.push(Client.new({:name => name, :contact => contact, :stylist_id => stylist_id}))
      end
      stylist_clients
end

define_method(:save) do
      result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end


end
