
# Seed data for bookclub_books table
#bookclub = Bookclub.create(name: "Example Bookclub")

# Add some books to the bookclub
book1 = Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald")
book2 = Book.create(title: "To Kill a Mockingbird", author: "Harper Lee")
book3 = Book.create(title: "1984", author: "George Orwell")

bookclub3.bookclub_books.create(book: book1, suggested_by: "John")
bookclub2.bookclub_books.create(book: book2, suggested_by: "Jane", current: true)
bookclub1.bookclub_books.create(book: book3, suggested_by: "Bob", archived: true, status: "Read")

puts "Seed data for bookclub_books table created!"

# Seed data for bookclub_profiles table
user1 = User.create(name: "John")
user2 = User.create(name: "Jane")
user3 = User.create(name: "Bob")

bookclub1 = Bookclub.create(name: "Example Bookclub 1")
bookclub2 = Bookclub.create(name: "Example Bookclub 2")

bookclub1.bookclub_profiles.create(user: user1)
bookclub1.bookclub_profiles.create(user: user2)
bookclub2.bookclub_profiles.create(user: user2)
bookclub2.bookclub_profiles.create(user: user3)

puts "Seed data for bookclub_profiles table created!"

# Seed data for bookclub_users table
user1 = User.create(name: "John")
user2 = User.create(name: "Jane")
user3 = User.create(name: "Bob")

bookclub1 = Bookclub.create(name: "Example Bookclub 1")
bookclub2 = Bookclub.create(name: "Example Bookclub 2")

bookclub1.bookclub_users.create(user: user1, is_admin: true)
bookclub1.bookclub_users.create(user: user2, is_admin: false)
bookclub2.bookclub_users.create(user: user2, is_admin: true)
bookclub2.bookclub_users.create(user: user3, is_admin: false)

puts "Seed data for bookclub_users table created!"

# Seed data for bookclubs table
bookclub1 = Bookclub.create(name: "Example Bookclub 1")
bookclub2 = Bookclub.create(name: "Example Bookclub 2")
bookclub3 = Bookclub.create(name: "Example Bookclub 3")

puts "Seed data for bookclubs table created!"

# Seed data for books table
book1 = Book.create(
  imageURL: "https://example.com/book1.jpg",
  title: "Example Book 1",
  series: "Example Series",
  description: "This is an example book",
  pages: 300,
  publicationDate: "2022-01-01",
  genres: "Fiction",
  author: "Jane Doe"
)

book2 = Book.create(
  imageURL: "https://example.com/book2.jpg",
  title: "Example Book 2",
  series: nil,
  description: "This is another example book",
  pages: 250,
  publicationDate: "2022-02-01",
  genres: "Non-fiction",
  author: "John Smith"
)

book3 = Book.create(
  imageURL: "https://example.com/book3.jpg",
  title: "Example Book 3",
  series: nil,
  description: "This is a third example book",
  pages: 400,
  publicationDate: "2022-03-01",
  genres: "Mystery",
  author: "Amy Lee"
)

puts "Seed data for books table created!"

# Create some users and guide questions first

user1 = User.create(name: "John")
user2 = User.create(name: "Jane")
question1 = GuideQuestion.create(title: "What's your favorite book?", content: "Share with us the title of your favorite book.")

# Create some comments
Comment.create(user: user1, guide_question: question1, comment: "My favorite book is 'To Kill a Mockingbird'")
Comment.create(user: user2, guide_question: question1, comment: "I love 'Pride and Prejudice' by Jane Austen")
Comment.create(user: user1, guide_question: question1, comment: "I haven't read 'Pride and Prejudice' yet, but it's on my list!")



# Create goals
BookclubBook.all.each do |bookclub_book|
  Goal.create!(
    bookclub_book_id: bookclub_book.id,
    pages: "Read chapters 1-5",
    deadline: Date.today + 14.days,
    complete: false,
    notes: "I'm looking forward to discussing these chapters in our next meeting.",
    meetingURL: "https://example.com/meeting"
  )
end

# create some bookclub_books first
bookclub_books = BookclubBook.all

# create some guide questions for each bookclub_book
bookclub_books.each do |bookclub_book|
  GuideQuestion.create!(
    question: "What did you think about chapter #{rand(1..10)}?",
    chapter: rand(1..10),
    bookclub_book_id: bookclub_book.id
  )
end

User.create!(
  email: 'user1@example.com',
  password: 'password123',
  first_name: 'John',
  last_name: 'Doe',
  location: 'New York',
  profile_color: '#ff0000'
)

User.create!(
  email: 'user2@example.com',
  password: 'password456',
  first_name: 'Jane',
  last_name: 'Smith',
  location: 'Los Angeles',
  profile_color: '#00ff00'
)

# Create additional users as needed...


