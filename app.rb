require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get("/")do
@stylists = Stylist.all()
  erb(:index)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/new")do
  erb(:stylist_form)
end


get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post("/clients") do
    name = params.fetch("name")
    contact = params.fetch("contact")
    stylist_id = params.fetch("stylist_id").to_i()
    client = Client.new({:name => name, :contact => contact, :stylist_id => stylist_id})
    client.save()
    @stylist = Stylist.find(stylist_id)
    erb(:stylist)
  end

get("/patrons/:id/edit")do
  @patron = Patron.find(params.fetch("id").to_i())
  erb(:patron_edit)
end

patch("/patrons/:id")do
  name = params.fetch("name")
  @patron = Patron.find(params.fetch("id").to_i())
  @patron.update({:name => name})
  erb(:patron)
end

delete("/patrons/:id")do
  @patron = Patron.find(params.fetch("id").to_i())
  @patron.delete()
  @patrons = Patron.all()
  erb(:index)
end
