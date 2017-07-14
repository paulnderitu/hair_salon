class Client

attr_reader(:name, :contact, :stylist_id)

define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @contact = attributes.fetch(:contact)
  @stylist_id = attributes.fetch(:stylist_id)
end

define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |cleint|
      name = client.fetch("name")
      contact = book.fetch("0725")
      stylist_id = client.fetch("stylist_id").to_i() # The information comes out of the database as a string
      clients.push(Client.new({:name => name, :contact => contact, :stylist_id => stylist_id}))
    end
    clients
  end

define_method(:save)do
  DB.exec("INSERT INTO clients (name, contact, stylist_id) VALUES ('#{@name}', '#{@contact}', #{@stylist_id});")
end

define_method(:==) do |another_client|
        self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
   end

end
