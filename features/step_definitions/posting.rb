Given(/^I have an existing admin account$/) do
  user = User.create!(
    username: "theironyardadmin",
    email: "admin@theironyard.com",
    password: "password",
    street: "1801 Rio Grande St",
    city: "Austin",
    state: "TX",
    zip: "78701",
    party: "Fun",
    admin: true,
  )
end
