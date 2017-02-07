USE master;
GO

--Code to create LibraryDrill database
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'LibraryDrill')
	DROP DATABASE LibraryDrill;
	GO

CREATE DATABASE LibraryDrill;
GO

USE LibraryDrill;
GO


--Create LIBRARY_BRANCH table and enter records
CREATE TABLE LIBRARY_BRANCH (
BranchID int PRIMARY KEY, 
BranchName nvarchar(50) NOT NULL, 
[Address] nvarchar(75) NOT NULL);
GO

INSERT INTO LIBRARY_BRANCH VALUES 
(1, 'Central', '1234 56th Ave'), 
(2, 'Sharpstown', '789 Altavista Dr'), 
(3, 'Spokane', '906 W. Main Ave'), 
(4, 'Seattle', '1000 4th Ave'), 
(5, 'Richland', '955 Northgate Dr');
GO


--Create BOOK table and enter records
CREATE TABLE BOOK (
BookID int PRIMARY KEY, 
Title nvarchar(75) NOT NULL, 
PublisherName nvarchar(75) NOT NULL);
GO

INSERT INTO BOOK VALUES
(312186951, 'The Lost Tribe', 'Picador USA'), 
(615303765, 'But How Do It Know?', 'John C. Scott'), 
(735611313, 'CODE', 'Microsoft Press'), 
(385121675, 'The Shining', 'Doubleday'), 
(670868360, 'Desperation', 'Viking'), 
(307743688, 'The Stand', 'Anchor'),
(451150639, 'Different Seasons', 'Signet'),
(446353205, 'The Charm School', 'Warner Books'), 
(446679084, 'Plum Island', 'Warner Books'), 
(385293228, 'The Talbot Odyssey', 'Delacorte Press'),
(553381689, 'A Game of Thrones', 'Bantam'), 
(345535412, 'A Clash of Kings', 'Bantam'), 
(553381702, 'A Storm of Swords', 'Bantam'),
(553582031, 'A Feast for Crows', 'Bantam'), 
(553385953, 'A Dance With Dragons', 'Bantam'), 
(590353403, 'Harry Potter and the Sorcerer''s Stone', 'Scholastic Press'), 
(439064866, 'Harry Potter and the Chamber of Secrets', 'Scholastic Press'), 
(439136358, 'Harry Potter and the Prisoner of Azkaban', 'Scholastic Press'), 
(439139595, 'Harry Potter and the Goblet of Fire', 'Scholastic Press'), 
(439358064, 'Harry Potter and the Order of the Phoenix', 'Arthur A. Levine Books'), 
(439784542, 'Harry Potter and the Half-Blood Prince', 'Arthur A. Levine Books'), 
(545010221, 'Harry Potter and the Deathly Hallows', 'Arthur A. Levine Books'),
(399588174, 'Born a Crime: Stories From a South African Childhood', 'Spiegel & Grau'), 
(544916081, 'The Man in the High Castle', 'Houghton Mifflin Harcourt'),
(581952155, 'After Dachau', 'Steerforth');
GO


--Create BOOK_AUTHORS table and enter records
CREATE TABLE BOOK_AUTHORS (
BookID int FOREIGN KEY REFERENCES BOOK(BookID),
AuthorName nvarchar(50) NOT NULL);
GO

INSERT INTO BOOK_AUTHORS VALUES
(312186951, 'Mark Lee'), 
(615303765, 'J. Clark Scott'), 
(735611313, 'Charles Petzold'), 
(385121675, 'Stephen King'), 
(670868360, 'Stephen King'), 
(307743688, 'Stephen King'),
(451150639, 'Stephen King'),
(446353205, 'Nelson DeMille'), 
(446679084, 'Nelson DeMille'), 
(385293228, 'Nelson DeMille'),
(553381689, 'George R.R. Martin'), 
(345535412, 'George R.R. Martin'), 
(553381702, 'George R.R. Martin'),
(553582031, 'George R.R. Martin'), 
(553385953, 'George R.R. Martin'), 
(590353403, 'J.K. Rowling'), 
(439064866, 'J.K. Rowling'), 
(439136358, 'J.K. Rowling'), 
(439139595, 'J.K. Rowling'), 
(439358064, 'J.K. Rowling'), 
(439784542, 'J.K. Rowling'), 
(545010221, 'J.K. Rowling'), 
(399588174, 'Trevor Noah'), 
(544916081, 'Philip K. Dick'), 
(581952155, 'Daniel Quinn');
GO


--Create PUBLISHER table and enter records
CREATE TABLE PUBLISHER (
Name nvarchar(75) PRIMARY KEY, 
[Address] nvarchar(75) NULL, 
Phone nvarchar(15) NULL);
GO

INSERT INTO PUBLISHER VALUES
('Anchor', '1745 Broadway Ave', '212-572-2882'), 
('Arthur A. Levine Books', '557 Broadway', '212-343-4436'), 
('Bantam', '1745 Broadway Ave', '212-782-9000'), 
('Delacorte Press', '1745 Broadway Ave', '212-782-9000'), 
('Doubleday', '1745 Broadway Ave', '212-572-2662'), 
('Houghton Mifflin Harcourt', '9205 Southpark Center Loop', NULL),
('John C. Scott', NULL, NULL), 
('Microsoft Press', 'One Microsoft Way', NULL),
('Picador USA', '175 Fifth Ave', '646-307-5629'),
('Scholastic Press', '557 Broadway Ave', '212-343-6100'),
('Signet', NULL, '212-366-2385'),
('Spiegel & Grau', '1745 Broadway Ave', '212-784-8482'),
('Steerforth', '45 Lyme Rd', '603-643-4787'),
('Viking', '375 Hudson Street', '212-366-2795'),
('Warner Books', '1271 Avenue of the Americas', '212-522-7200');
GO


--Add PublisherName as foreign key to BOOK
ALTER TABLE BOOK 
ADD FOREIGN KEY (PublisherName)
REFERENCES PUBLISHER(Name);
GO



--Create table BOOK_COPIES and enter records
CREATE TABLE BOOK_COPIES (
BookID int FOREIGN KEY REFERENCES BOOK(BookID), 
BranchID int FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID), 
No_of_Copies int NULL);
GO

INSERT INTO BOOK_COPIES VALUES
(312186951, 4, 2), 
(312186951, 2, 25), 
(615303765, 1, 3), 
(735611313, 1, 2), 
(615303765, 3, 4), 
(735611313, 3, 5), 
(615303765, 4, 24), 
(735611313, 4, 32), 
(385121675, 1, 2), 
(385121675, 2, 5),
(385121675, 3, 12),
(385121675, 5, 8),
(670868360, 5, 7), 
(307743688, 1, 5),
(307743688, 2, 5),
(307743688, 3, 5),
(307743688, 4, 5),
(307743688, 5, 5),
(451150639, 2, 15),
(451150639, 3, 3),
(446353205, 1, 2), 
(446679084, 1, 4), 
(385293228, 1, 2),
(446353205, 3, 6), 
(446679084, 3, 3), 
(385293228, 3, 4),
(446353205, 5, 2), 
(446679084, 5, 2), 
(385293228, 5, 2),
(553381689, 3, 2), 
(345535412, 3, 5), 
(553582031, 3, 3), 
(553385953, 3, 4),
(553381689, 4, 12), 
(345535412, 4, 10), 
(553381702, 4, 13),
(553582031, 4, 11), 
(553385953, 4, 12),
(590353403, 1, 8), 
(439064866, 1, 5), 
(439136358, 1, 5), 
(439139595, 1, 6), 
(439358064, 1, 4), 
(439784542, 1, 3), 
(545010221, 1, 2),
(590353403, 2, 2), 
(439064866, 2, 2), 
(439136358, 2, 2), 
(439139595, 2, 2), 
(439358064, 2, 2), 
(439784542, 2, 2), 
(545010221, 2, 2),
(590353403, 3, 4), 
(439064866, 3, 3), 
(439136358, 3, 4), 
(439139595, 3, 2), 
(439358064, 3, 2), 
(439784542, 3, 3), 
(545010221, 3, 5),
(545010221, 4, 14),
(590353403, 4, 12), 
(439064866, 4, 13), 
(439136358, 4, 13), 
(439139595, 4, 12), 
(439358064, 4, 13), 
(439784542, 4, 13), 
(545010221, 4, 12),
(590353403, 5, 3), 
(439064866, 5, 3), 
(439136358, 5, 3), 
(439139595, 5, 3), 
(439358064, 5, 3), 
(439784542, 5, 3), 
(545010221, 5, 3), 
(399588174, 1, 2), 
(399588174, 4, 4), 
(544916081, 2, 35),
(581952155, 3, 2), 
(581952155, 5, 2);
GO


--Create table BORROWER and enter records
CREATE TABLE BORROWER (
CardNo int PRIMARY KEY, 
Name nvarchar(25) NOT NULL, 
[Address] nvarchar(75) NULL, 
Phone nvarchar(15) NULL);
GO

INSERT INTO BORROWER VALUES
(100001, 'Jack Handey', '231 Liberty Road', NULL), 
(103005, 'Alicia Allen', NULL, '363-3945'), 
(200102, 'David Julian', '87012 148th Lane', '202-4058'),
(201047, 'Franklin Albright', NULL, '271-9800'), 
(324092, 'Victoria Blane', '1623 E 35th Ave', '509-723-1047'),
(356704, 'Ken Marino', '20045 Country Homes Blvd S', NULL), 
(400291, 'Barbara Walters', '975 Aberdeen Ave', '425-328-2980'), 
(425011, 'Russ Wilson', NULL, NULL),
(515023, 'Santana Green', '32 Northway Ave', '509-239-2837'), 
(590126, 'Eileen Dover', 'PO Box 2087', NULL);
GO


--Create BOOK_LOANS table and enter records
CREATE TABLE BOOK_LOANS (
BookID int FOREIGN KEY REFERENCES BOOK(BookID), 
BranchID int FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID), 
CardNo int FOREIGN KEY REFERENCES BORROWER(CardNo), 
DateOut date NOT NULL, 
DueDate date NOT NULL);
GO

INSERT INTO BOOK_LOANS VALUES
(615303765, 1, 100001, '3/14/06', '4/14/06'), 
(735611313, 1, 100001, '3/14/06', '4/14/06'),
(385121675, 1, 100001, '3/14/06', '4/14/06'),
(307743688, 1, 100001, '3/14/06', '4/14/06'),
(446353205, 1, 100001, '3/14/06', '4/14/06'),
(446679084, 1, 100001, '3/14/06', '4/14/06'),
(385293228, 1, 100001, '3/14/06', '4/14/06'), 
(590353403, 1, 100001, '3/14/06', '4/14/06'),
(439064866, 1, 100001, '3/14/06', '4/14/06'),
(439136358, 1, 100001, '3/14/06', '4/14/06'),
(439139595, 1, 100001, '3/14/06', '4/14/06'),
(439358064, 1, 100001, '3/14/06', '4/14/06'),
(439784542, 1, 100001, '3/14/06', '4/14/06'),
(545010221, 1, 100001, '3/14/06', '4/14/06'),
(312186951, 2, 103005, '1/31/17', '3/3/17'),
(307743688, 2, 103005, '1/31/17', '3/3/17'),
(451150639, 2, 201047, '1/5/17', '2/5/17'),
(553582031, 3, 324092, '2/1/17', '3/1/17'), 
(553385953, 3, 324092, '2/1/17', '3/1/17'),
(385121675, 3, 356704, '1/15/17', '2/15/17'), 
(451150639, 3, 356704, '1/18/17', '2/18/17'),
(446353205, 3, 356704, '1/18/17', '2/18/17'), 
(446679084, 3, 356704, '1/21/17', '2/21/17'), 
(385293228, 3, 356704, '1/21/17', '2/21/17'), 
(553381689, 4, 400291, '12/20/16', '1/20/17'), 
(345535412, 4, 400291, '12/20/16', '1/20/17'), 
(553381702, 4, 400291, '12/20/16', '1/20/17'),
(553582031, 4, 400291, '12/20/16', '1/20/17'), 
(553385953, 4, 400291, '1/10/17', '2/10/17'),
(735611313, 4, 400291, '1/10/17', '2/10/17'),
(615303765, 4, 400291, '1/10/17', '2/10/17'),
(590353403, 4, 425011, '2/1/17', '3/1/17'), 
(307743688, 4, 425011, '2/1/17', '3/1/17'), 
(553381702, 4, 425011, '2/1/17', '3/1/17'),
(590353403, 4, 425011, '2/1/17', '3/1/17'), 
(439064866, 4, 425011, '2/1/17', '3/1/17'), 
(439136358, 4, 425011, '2/1/17', '3/1/17'),
(385121675, 5, 590126, '2/3/17', '3/3/17'),
(670868360, 5, 590126, '2/3/17', '3/3/17'), 
(307743688, 5, 590126, '2/3/17', '3/3/17'),
(446353205, 5, 590126, '2/3/17', '3/3/17'), 
(446679084, 5, 590126, '2/3/17', '3/3/17'), 
(385293228, 5, 590126, '2/3/17', '3/3/17'), 
(590353403, 5, 590126, '2/3/17', '3/3/17'), 
(439064866, 5, 590126, '2/3/17', '3/3/17'), 
(439136358, 5, 590126, '2/3/17', '3/3/17'), 
(439139595, 5, 590126, '2/3/17', '3/3/17'), 
(439358064, 5, 590126, '2/3/17', '3/3/17'), 
(439784542, 5, 590126, '2/3/17', '3/3/17'), 
(545010221, 5, 590126, '2/3/17', '3/3/17');
GO