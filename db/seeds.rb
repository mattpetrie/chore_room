Chore.create!([
  {title: "Garbage Out Sunday 1", day: "Sunday"}
])
ChoreAssignment.create!([
  {user_id: 1, chore_id: 1, due_date: "2014-06-08 19:00:00", completed: false}
])
User.create!([
  {name: "Matt Petrie", uid: "3870201", email: "matthew.petrie@gmail.com", photo: "https://avatars.githubusercontent.com/u/3870201?", admin: false},
  {name: "Nathan H", uid: "6186377", email: "hsieh.nathan@gmail.com", photo: "https://avatars.githubusercontent.com/u/6186377?", admin: false}
])
