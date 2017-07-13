require("spec_helper")

describe(Client)

describe("#save")do
  it("save a new client")do
    test_client= Client.new({:name => "betty", :contact => "0725", :stylist_id => 1})
    test_client.save()
    expect(Client.all()).to(eq([test_client]))
  end
end

describe("#name")do
  it("lets you read the name of the client")do
    test_client = Client.new({:name => "betty", :contact => "0725", :stylist_id => 1})
    expect(test_client.name()).to(eq("betty"))
  end
end
describe("#contact")do
  it("lets you read the contact of the client")do
    test_client = Client.new({:name => "betty", :contact => "0725", :stylist_id => 1})
    expect(test_client.contact()).to(eq("0725"))
  end
end
describe("#stylist_id")do
  it("lets you read the id of the client")do
    test_client = Client.new({:name => "betty", :contact => "0725", :stylist_id => 1})
    expect(test_client.client_id()).to(eq(1))
  end
end
