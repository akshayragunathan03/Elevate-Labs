use librarydb;

Insert into Authors(AuthorID,Name) values
(1001,'J.K.ROWLING'),
(1002,'George Orwell'),
(1003,'Agatha Christie');
select * from Authors;
Insert into Books(BookID,Title ,Genre,Published,AuthorID) values
(1,'Harry Potter and the sorcecor stone','Fantasy',1997,1001),
(2,'Animal Farm','Political Satire',1945,1002),
(3,'Murder on Orient Express','Mystery',1934,1003);
select * from Books;

Insert into Members (Name,Email) values
('Alice','Aliceska@gmail.com'),
('Bob smith','Bobsmith@gmail.com'),
('Charile Doppler','Charilesmart@gmail.com');
select * from Members;

insert into staff(StaffId,Name) values
(001,'David Miller'),
(015,'Eva Green');
insert into staff(StaffId,Name) values
(NULL,'Alwin jones');

select *from Staff;

insert into loans (Loanid,BookId,Email,StaffId,LoanDate, ReturnDate) values
(101,1,'Aliceska@gmail.com',001,'2027-07-15','2025-07-22'),
(102,2,'Aliceska@gmail.com',001,'2027-07-15','2025-07-22'),
(103,3,'Bobsmith@gmail.com',015,'2020-07-21',NULL);


select * from Authors;

select * from Books;

select * from Members;
select * from Staff;

select * from Loans;




select * from Books;

select * from Members;
select * from Staff;

select * from Loans;

Delete From Books 
where Title ='Animal Farm';

