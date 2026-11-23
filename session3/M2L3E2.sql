CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL
);

CREATE TABLE readers (
    reader_id INT PRIMARY KEY,
    reader_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE borrowings (
    borrowing_id INT PRIMARY KEY,
    reader_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE,
    return_date DATE,

    FOREIGN KEY (reader_id)
        REFERENCES readers(reader_id),

    FOREIGN KEY (book_id)
        REFERENCES books(book_id)
);