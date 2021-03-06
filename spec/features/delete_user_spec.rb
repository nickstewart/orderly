require 'spec_helper'

describe 'deleting a user' do
  before do
    admin = User.create!(user_attributes(name: "Admin", admin: true, email: "admin@xmpl.com"))
    sign_in(admin)
  end

  it 'destroys the user account and redirects to the home page' do
    user = User.create!(user_attributes)

    visit user_path(user)

    click_link 'Delete Account'

    expect(current_path).to eq(root_path)
    expect(page).to have_text("Account successfully deleted!")

    visit users_path

    expect(page).not_to have_text(user.name) 
  end

  #it 'automatically signs out user' do
   # user = User.create!(user_attributes)

    #sign_in(user)

    #visit user_path(user)

    #click_link 'Delete Account'

    #expect(page).to have_link('Sign In')
    #expect(page).not_to have_link('Sign Out')
  #end
end