create table library.books (
    book_seq_nbr number generated always as identity (start with 1 increment by 1 cache 100),
    book_isbn number not null,
    book_title varchar2(32767) not null,
    book_author varchar2(1000) not null,
    book_pages number
    );

create unique index library.books_u1 on books(book_isbn);


    
