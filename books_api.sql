create or replace package library.books_api as

    type book_rec is record of library.books%rowtype;
    type book_tbl is table of book_rec;
    type isbn_tbl is table of number;
    
begin
 
    procedure add(p_book book_tbl);
    procedure del(p_isbn isbn_tbl);
    procedure upd(p_book book_tbl);
    
end;
/
show errors

create or replace package body books_api as
begin

    procedure add(p_book book_rec) is
    begin
        null;
    end;
    
    procedure del(p_book book_rec) is
    begin
        null;
    end;
    
    procedure upd(p_book book_rec) is
    begin
        null;
    end;

end;
/
show errors

