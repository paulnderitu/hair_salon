require("spec_helper")

describe(Stylist)do

describe(".all")do
    it("starts off with no stylists")do
      expect(Stylist.all()).to(eq([]))
    end
  end

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

describe("#==") do
    it("is the same stylist if has the same name") do
      stylist1 = Stylist.new({:name => "betty", :id => nil})
      stylist2 = Stylist.new({:name => "betty", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find")do
  it("returns a stylist by stylist ID") do
    test_stylist = Stylist.new({:name => "betty", :id => nil})
    test_stylist.save()
    test_stylist2 = Stylist.new({:name => "andy", :id => nil})
    test_stylist2.save()
    expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
  end
end

end
