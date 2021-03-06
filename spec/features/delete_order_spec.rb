describe "Deleting an order" do
  before do 
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "destroys the movie and shows the movie listing without the deleted movie" do
    order = Order.create(order_attributes)

    visit order_path(order)

    click_link 'Delete'

    expect(current_path).to eq(orders_path)
    expect(page).not_to have_text(order.customer_company)
    expect(page).to have_text("Order successfully deleted!")
    
  end
end