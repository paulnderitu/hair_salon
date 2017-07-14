require("spec_helper")

describe(Stylist)do

describe("#save")do
it("lets you save a new stylist to the database")do
  stylist = Stylist.new({:name => "betty", :id => nil})
  stylist.save()
  expect(Stylist.all()).to(eq([stylist]))
end
end

end
