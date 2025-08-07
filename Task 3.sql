use librarydb;

select * from Authors;

select AuthorID from Authors
where Name in ('J.K.ROWLING');

Select AuthorID from Authors
where AuthorID IS NOT NULL
order by AuthorID desc;

select * from Books;

select Title from Books
where BookID = 2;

Select Genre from Books 
where Title LIKE 'H%';


Select * from Members
where name ='Alice'; 
select * from loans;
Select Email from Loans
where LoanDate Between '2027-02-01' AND '2027-07-22';

Select LoanID from Loans
where LoanID = 101 OR 102;

Select Email from Loans 
where Email like '__b%';

