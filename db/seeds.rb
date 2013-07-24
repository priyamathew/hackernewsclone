priya = User.create(username:"pri1229", password: "password", password_confirmation: "password")
brett = User.create(username:"beazler", password: "password", password_confirmation: "password")

priya.posts.create(title:"Getting enough sleep",url:"sleep.com")
priya.posts.create(title:"Things to do in Chicago",url:"metromix.com")
priya.posts.create(title:"Wasting time",url:"https://news.ycombinator.com")

brett.posts.create(title:"DevBootcamp Jobs?",url:"devbootcamp.com")
brett.posts.create(title:"Socrates useful?",url:"socrates.devbootcamp.com")
brett.posts.create(title:"Amazing new site",url:"youtube.com")

brett.posts.first.comments.create(text:"Cool.", user_id: priya.id)
priya.posts.last.comments.create(text:"Very Cool.", user_id: brett.id)


