select * from authors;
select * from books;
select * from loans;
select * from members;

SELECT b.BookID, b.Title
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
WHERE a.Name = 'Chinua Achebe'
ORDER BY b.BookID;


-- 2.	Find the total number of books in the library.
select count(books.BookID) as total 
from books
order by total;

-- 3.	Retrieve all members who joined after January 1, 2025.
SELECT m.MemberID, m.Name, m.MembershipDate
FROM Members m
WHERE m.MembershipDate > '2025-01-01'
ORDER BY m.MemberID;


-- 4.	Show all books currently on loan (not yet returned).
select bo.BookID, bo.Title
from books bo
join loans
on bo.BookID=loans.BookID
where ReturnDate is null
order by bo.BookID;

-- 5.	Find the most borrowed book in the library.
select bo.BookID, bo.Title,
count(lo.BookID) as  borrow
from books bo
join loans lo 
on bo.BookID = lo.BookID
group by bo.BookID
order by borrow desc
limit 1;

-- 6.	Display all authors who have published books after the year 2000.
select distinct authors.AuthorID, authors.Name
from authors
join books on
authors.AuthorID = books.AuthorID
where books.PublishedYear > 2000
order by authors.AuthorID;

-- 7.	List members who borrowed more than 5 books.
select me.MemberID, me.Name,
count(lo.BookID) as brrowed 
from members me 
join loans lo 
on me.MemberID = lo.MemberID
group by me.MemberID
having  count(lo.BookID) > 5
order by brrowed desc;


-- 8.	Retrieve all books in the "Science Fiction" genre.
select books.BookID, books.Title
from books
where books.Genre = 'science friction'
order by books.BookID;

-- 9.	Find overdue loans (where ReturnDate is NULL and LoanDate > 30 days ago).
SELECT l.LoanID, l.BookID, l.MemberID, l.LoanDate
FROM Loans l
WHERE l.ReturnDate IS NULL
  AND l.LoanDate < CURDATE() - INTERVAL 30 DAY
ORDER BY l.BookID;

-- 10.	Show the top 3 authors with the highest number of books in the library.
select authors.AuthorID, authors.Name, 
authors.Nationality,
count(books.BookID) as highest
from authors
join books
on authors.AuthorID=books.AuthorID
group by authors.AuthorID, authors.Name
order by highest desc
limit 3;




