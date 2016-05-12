t = Time.now
x = Time.now + 5.hours

User.create!(username: 'Colin', email: 'test@example.com', password: 'password', street: '1801 Rio Grande St, Api 202', city: 'Austin', state: 'TX', zip: '78701', party: 'Democratic Party', admin: true)
User.create!(username: 'Justin', email: 'test1@example.com', password: 'password', street: '3601 S Congress Ave C304', city: 'Austin', state: 'TX', zip: '78704', party: 'Democratic Party', admin: false)
User.create!(username: 'Nagmeh', email: 'test2@example.com', password: 'password', street: '2809 S 1st St', city: 'Austin', state: 'TX', zip: '78704', party: 'Democratic Party', admin: false)
User.create!(username: 'Brent', email: 'test3@example.com', password: 'password', street: '524 Louis Henna Blvd', city: 'Round Rock', state: 'TX', zip: '78664', party: 'Democratic Party', admin: false)
User.create!(username: 'Jordan', email: 'test4@example.com', password: 'password', street: '11410 Century Oaks Terrace', city: 'Austin', state: 'TX', zip: '78758', party: 'Democratic Party', admin: false)
User.create!(username: 'Jared', email: 'test5@example.com', password: 'password', street: '615 Red River St', city: 'Austin', state: 'TX', zip: '78701', party: 'Republican Party', admin: false)
User.create!(username: 'Van', email: 'test6@example.com', password: 'password', street: '1715 W Cesar Chavez St', city: 'Austin', state: 'TX', zip: '78703', party: 'Republican Party', admin: false)
User.create!(username: 'Vivek', email: 'test7@example.com', password: 'password', street: '3825 Lake Austin Blvd', city: 'Austin', state: 'TX', zip: '78703', party: 'Republican Party', admin: false)
User.create!(username: 'Dane', email: 'test8@example.com', password: 'password', street: '6550 Comanche Trail', city: 'Austin', state: 'TX', zip: '78732', party: 'Republican Party', admin: false)

Post.create!(title: 'Column: We are going to miss Barack Obama when he is gone', body: 'http://www.chicagotribune.com/news/opinion/zorn/ct-missing-obama-already-perspec-zorn-0504-jm-20160503-column.html', user_id: 1, level: "national")
Post.create!(title: 'Joe Biden Jokes He Expects to Be Trumps VP Pick', body: 'http://abcnews.go.com/Politics/joe-biden-jokes-expects-trumps-vp-pick/story?id=38873659', user_id: 2, level: "national")
Post.create!(title: 'Mitsubishi moves U.S. headquarters to Houston', body: 'http://www.click2houston.com/news/mitsubishi-moves-us-headquarters-to-houston', user_id: 3, level: "state")
Post.create!(title: 'Ted Cruz Went To Washington To Run For President, John Cornyn Says', body: 'https://www.houstonpublicmedia.org/articles/news/2016/04/26/148035/ted-cruz-went-to-washington-to-run-for-president-john-cornyn-says/', user_id: 4, level: "state")
Post.create!(title: 'Ted Cruz drops presidential bid', body: 'http://www.cnn.com/2016/05/03/politics/ted-cruz-drops-out/', user_id: 5, level: "state")
Post.create!(title: 'Austin Mayor Steve Adler comes out against Prop. 1', body: 'http://www.statesman.com/news/news/austin-mayor-steve-adler-comes-out-against-prop-1/nrBbJ/', user_id: 6, level: "local")


Event.create!(title: 'Voter Registration', description: 'This is your last change to register to vote. Do not forget!', location: 'City Hall, Austin, TX', date: DateTime.strptime('06/04/2016', '%m/%d/%Y'), start_time: t.strftime("%I:%M%p"), end_time: x.strftime("%I:%M%p"), user_id: 1, level: "state")
Event.create!(title: 'Hillay Clinton Rally', description: 'Mrs. Clinton will be visiting our city for a special event to bring awareness to her campaign.', location: 'University of Texas Football Stadium', date: DateTime.strptime('06/07/2016', '%m/%d/%Y'), start_time: t.strftime("%I:%M%p"), end_time: x.strftime("%I:%M%p"), user_id: 2, level: "local")
Event.create!(title: 'Anti-Trump Protest', description: 'A group of University of Texas-Austin students will be leading a march dowh Congress Street to the Capitol in protest of Donald Trump and his campaign platform.', location: 'Congress Bridge', date: DateTime.strptime('06/18/2016', '%m/%d/%Y'), start_time: t.strftime("%I:%M%p"), end_time: x.strftime("%I:%M%p"), user_id: 3, level: "local")
Event.create!(title: 'Elizabeth Warren: A Session on Wall Street Banking', description: 'The famed senator from Massachusetts will be visiting to give a lecture on the dangers of allowing Wall St. to operate unregulated.', location: 'Bullock State Museum', date: DateTime.strptime('06/23/2016', '%m/%d/%Y'), start_time: t.strftime("%I:%M%p"), end_time: x.strftime("%I:%M%p"), user_id: 4, level: "national")
Event.create!(title: 'Republican Party Bake Sale', description: 'Visit to help raise funds for your local Republican Party!', location: 'your local gutter', date: DateTime.strptime('06/30/2016', '%m/%d/%Y'), start_time: '', end_time: x.strftime("%I:%M%p"), user_id: 5, level: "local")
