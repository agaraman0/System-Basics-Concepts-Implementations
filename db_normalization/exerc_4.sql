CREATE TABLE library_records (
    id INTEGER PRIMARY KEY,
    book_title VARCHAR(255),
    author_name VARCHAR(255),
    author_email VARCHAR(255),
    genre VARCHAR(255),
    published_date DATE,
    member_name VARCHAR(255),
    member_email VARCHAR(255),
    borrow_date DATE,
    return_date DATE
);

INSERT INTO library_records VALUES
    (1, 'Book A', 'Author 1', 'author1@email.com', 'Fiction', 
'2020-01-01', 'Member 1', 'member1@email.com', '2022-01-01', 
'2022-01-15'),
    (2, 'Book B', 'Author 1', 'author1@email.com', 'Fiction', 
'2020-06-01', 'Member 2', 'member2@email.com', '2022-01-03', 
'2022-01-20'),
    (3, 'Book C', 'Author 2', 'author2@email.com', 
'Non-fiction', '2019-05-01', 'Member 1', 'member1@email.com', 
'2022-01-10', '2022-01-30'),
    (4, 'Book D', 'Author 3', 'author3@email.com', 'Fiction', 
'2021-03-01', 'Member 3', 'member3@email.com', '2022-01-15', 
'2022-02-01');


-- Create authors table
CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
);

INSERT INTO authors VALUES
    (1, 'Author 1', 'author1@email.com'),
    (2, 'Author 2', 'author2@email.com'),
    (3, 'Author 3', 'author3@email.com');

-- Create books table
CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    author_id INTEGER,
    genre VARCHAR(255),
    published_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

INSERT INTO books VALUES
    (1, 'Book A', 1, 'Fiction', '2020-01-01'),
    (2, 'Book B', 1, 'Fiction', '2020-06-01'),
    (3, 'Book C', 2, 'Non-fiction', '2019-05-01'),
    (4, 'Book D', 3, 'Fiction', '2021-03-01');

-- Create members table
CREATE TABLE members (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
);

INSERT INTO members VALUES
    (1, 'Member 1', 'member1@email.com'),
    (2, 'Member 2', 'member2@email.com'),
    (3, 'Member 3', 'member3@email.com');

-- Create borrow_records table
CREATE TABLE borrow_records (
    id INTEGER PRIMARY KEY,
    book_id INTEGER,
    member_id INTEGER,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

INSERT INTO borrow_records VALUES
    (1, 1, 1, '2022-01-01', '2022-01

