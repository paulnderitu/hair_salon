require("spec_helper")

describe(Stylist)do

describe("#save")do
it("lets you save a new stylist to the database")do
  stylist = Stylist.new({:name => "betty", :id => nil})
  stylist.save()
  expect(Stylist.all()).to(eq([stylist]))
end
end

describe("#name")do
  it("tells you the name of the stylist") do
    stylist = Stylist.new({:name => "betty", :id => nil})
    expect(stylist.name()).to(eq("betty"))
  end
end

describe("#id")do
  it("sets the stylist ID when a new stylist added") do
    stylist = Stylist.new({:name => "betty", :id => nil})
    stylist.save()
    expect(stylist.id()).to(be_an_instance_of(Fixnum))
  end
end

end
