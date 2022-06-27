users = User.create!([
  {
    name: 'Soufiane',
    email: 'soufiane@gmail.com',
    password: '123123'
  },
  {
    name: 'Hicham',
    email: 'mwafrika@gmail.com',
    password: '123123'
  },
  {
    name: 'Leyla ',
    email: 'leyla@gmail.com',
    password: '123123'
  },
])


expenses = Expense.create!([
  {
    name: 'Expense 1',
    amount: 24.5,
    author: users.first
  },
  {
    name: 'Expense 2',
    amount: 100,
    author: users.first
  },
  {
    name: 'Expense 3',
    amount: 22,
    author: users.second
  },
  {
    name: 'Expense 4',
    amount: 45.5,
    author: users.last
  },
  {
    name: 'Expense 5',
    amount: 200,
    author: users.second
  },
  {
    name: 'Expense 6',
    amount: 360,
    author: users.last
  },
])



categories = Category.create!([
  {
    name: 'Category 1',
    icon: 'https://example.com/icon.jpg',    
    author: users.first
  },
  {
    name: 'Category 2',
    icon: 'https://example.com/icon.jpg',
    author: users.first
  },
  {
    name: 'Category 3',
    icon: 'https://example.com/icon.jpg',
    author: users.second
  },
  {
    name: 'Category 4',
    icon: 'https://example.com/icon.jpg',
    author: users.last
  },
  {
    name: 'Category 5',
    icon: 'https://example.com/icon.jpg',
    author: users.second
  },
  {
    name: 'Category 6',
    icon: 'https://example.com/icon.jpg',
    author: users.last
  },
])

