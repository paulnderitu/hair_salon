require("spec_helper")

describe(Client)do

describe(".all")do
    it("is empty at first")do
      expect(Client.all()).to(eq([]))
    end
  end

describe("#save")do
  it("save a new client")do
    test_client= Client.new({:client_name => "betty", :contact => "0725", :stylist_id => 1})
    test_client.save()
    expect(Client.all()).to(eq([test_client]))
  end
end

describe("#client_name")do
  it("lets you read the name of the client")do
    test_client = Client.new({:client_name => "betty", :contact => "0725", :stylist_id => 1})
    expect(test_client.client_name()).to(eq("betty"))
  end
end
describe("#contact")do
  it("lets you read the contact of the client")do
    test_client = Client.new({:client_name => "betty", :contact => "0725", :stylist_id => 1})
    expect(test_client.contact()).to(eq("0725"))
  end
end
describe("#stylist_id")do
  it("lets you read the id of the client")do
    test_client = Client.new({:client_name => "betty", :contact => "0725", :stylist_id => 1})
    expect(test_client.stylist_id()).to(eq(1))
  end
end

describe("#==") do
  it("is the same client if has same name, contact and stylist ID")do
    client1 = Client.new({:client_name => "betty", :contact => "0725", :stylist_id => 1})
    client2 = Client.new({:client_name => "betty", :contact => "0725", :stylist_id => 1})
    expect(client1).to(eq(client2))
  end
  end
end
