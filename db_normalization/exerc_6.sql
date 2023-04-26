-- Create the initial unnormalized table
CREATE TABLE IF NOT EXISTS books_authors_publishers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(255) NOT NULL,
    author_name VARCHAR(255) NOT NULL,
    author_birth_year INT,
    publisher_name VARCHAR(255) NOT NULL,
    publisher_city VARCHAR(255) NOT NULL,
    publication_year INT NOT NULL
);

-- Insert data into the unnormalized table
INSERT INTO books_authors_publishers (book_title, 
author_name, author_birth_year, publisher_name, 
publisher_city, publication_year) VALUES
('Book A', 'Author 1', 1970, 'Publisher 1', 'New York', 
2020),
('Book B', 'Author 1', 1970, 'Publisher 2', 'San Francisco', 
2021),
('Book C', 'Author 2', 1980, 'Publisher 1', 'New York', 
2019),
('Book D', 'Author 3', 1990, 'Publisher 3', 'Chicago', 2021);

-- Normalize to 1NF: Separate authors and books into 
different tables
CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birth_year INT
);

CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    publisher_name VARCHAR(255) NOT NULL,
    publisher_city VARCHAR(255) NOT NULL,
    publication_year INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Normalize to 2NF: Separate publishers and books into 
different tables
CREATE TABLE publishers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);

CREATE TABLE books_2NF (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    publisher_id INT,
    publication_year INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);

-- Normalize to 3NF: Separate publication years and books 
into different tables
CREATE TABLE publications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    publisher_id INT,
    publication_year INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books_2NF(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);

-- Normalize to 4NF: Separate multi-valued dependencies, such 
as books with multiple authors
CREATE TABLE book_authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    author_id INT,
    FOREIGN KEY (book_id) REFERENCES books_2NF(id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

