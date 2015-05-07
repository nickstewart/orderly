describe "Viewing a list of products" do
  
  it "shows the products for a specific order" do
    order1 = Order.create(order_attributes(customer: "Bluedog"))
    product1 = order1.products.create(review_attributes(code: "O-22"))
    product2 = order1.products.create(review_attributes(code: "F-35 IR/RW"))

    order2 = Order.create(order_attributes(customer: "TFOA"))
    product3 = order2.products.create(review_attributes(code: "F-38"))
    
    visit order_products_url(order1)
        
    expect(page).to have_text(product1.code)
    expect(page).to have_text(product2.code)
    expect(page).not_to have_text(product3.code)
  end
end