require('capybara/rspec')
require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature})do
  it('allows the user to click a stylist and see clients and details for him/her')do
    visit('/')
    # click_link('Add New Patron')
    fill_in('Stylist Name', :with => 'betty')
    click_button('Add stylist')
    expect(page).to have_content('Welcome to the Hair Salon')
  end
end

describe('viewing all the stylists', {:type => :feature})do
  it ('allows the user to see all the stylists that have been created')do
    stylist = Stylist.new({:name => 'betty', :id =>nil})
    stylist.save()
    visit('/')
    # click_link('View All Patrons')
    expect(page).to have_content(stylist.name)
  end
end
describe('seeing details for a single stylist', {:type => :feature})do
  it ('allows an administrator to click a stylist to see the clients and their details') do
    test_stylist = Stylist.new({:name => "betty", :id => nil})
    test_stylist.save()
    test_client = Client.new({:name => "shiro", :contact => "contact", :stylist_id => test_stylist.id()})
    test_client.save()
    visit('/')
    click_link(test_stylist.name())
    expect(page).to have_content(test_client.name)
  end
end

  describe('adding clients to a stylist', {:type => :feature}) do
    it('allows an administrator to add a client to a stylist') do
      test_stylist = Stylist.new({:name => 'betty', :id => nil})
      test_stylist.save()
      visit('/')
      fill_in("Name of the client", {:with => "shiro"})
      fill_in("Tel no", {:with => "0726"})
      click_button("Add client")
      expect(page).to have_content("Clients")
    end
  end
