# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'Colin', email: 'test@example.com', password: 'password', address: '1801 Rio Grande St, Api 202, Austin, TX 78701', party: 'Democratic Party')
User.create!(username: 'Justin', email: 'test1@example.com', password: 'password', address: '3601 S Congress Ave C304, Austin, TX 78704', party: 'Democratic Party')
User.create!(username: 'Nagmeh', email: 'test2@example.com', password: 'password', address: '2809 S 1st St, Austin, TX 78704', party: 'Democratic Party')
User.create!(username: 'Brent', email: 'test3@example.com', password: 'password', address: '524 Louis Henna Blvd, Round Rock, TX 78664', party: 'Democratic Party')
User.create!(username: 'Jordan', email: 'test4@example.com', password: 'password', address: '11410 Century Oaks Terrace, Austin, TX 78758', party: 'Democratic Party')
User.create!(username: 'Jared', email: 'test5@example.com', password: 'password', address: '615 Red River St, Austin, TX 78701, Austin, TX 78701', party: 'Republican Party')
User.create!(username: 'Van', email: 'test6@example.com', password: 'password', address: '1715 W Cesar Chavez St, Austin, TX 78703', party: 'Republican Party')
User.create!(username: 'Vivek', email: 'test7@example.com', password: 'password', address: '3825 Lake Austin Blvd, Austin, TX 78703', party: 'Republican Party')
User.create!(username: 'Dane', email: 'test8@example.com', password: 'password', address: '6550 Comanche Trail, Austin, TX 78732', party: 'Republican Party')

Post.create!(title: 'Column: We are going to miss Barack Obama when he is gone', body: 'http://www.chicagotribune.com/news/opinion/zorn/ct-missing-obama-already-perspec-zorn-0504-jm-20160503-column.html', user_id: 1)
Post.create!(title: 'Joe Biden Jokes He Expects to Be Trumps VP Pick', body: 'http://abcnews.go.com/Politics/joe-biden-jokes-expects-trumps-vp-pick/story?id=38873659', user_id: 2)
Post.create!(title: 'Mitsubishi moves U.S. headquarters to Houston', body: 'http://www.click2houston.com/news/mitsubishi-moves-us-headquarters-to-houston', user_id: 3)
Post.create!(title: 'Ted Cruz Went To Washington To Run For President, John Cornyn Says', body: 'https://www.houstonpublicmedia.org/articles/news/2016/04/26/148035/ted-cruz-went-to-washington-to-run-for-president-john-cornyn-says/', user_id: 4)
Post.create!(title: 'Ted Cruz drops presidential bid', body: 'http://www.cnn.com/2016/05/03/politics/ted-cruz-drops-out/', user_id: 5)
Post.create!(title: 'Austin Mayor Steve Adler comes out against Prop. 1', body: 'http://www.statesman.com/news/news/austin-mayor-steve-adler-comes-out-against-prop-1/nrBbJ/', user_id: 6)
