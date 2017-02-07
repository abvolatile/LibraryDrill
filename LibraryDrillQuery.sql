--How many copies of The Lost Tribe does the 'Sharpstown' branch have?
SELECT BOOK.Title, BC.No_Of_Copies
FROM BOOK_COPIES BC 
JOIN BOOK ON BC.BookID=BOOK.BookID
WHERE BC.BranchID = 2
AND BOOK.Title = 'The Lost Tribe';


--How many copies of The Lost Tribe does each branch have?
SELECT BOOK.Title, LB.BranchName, BC.No_Of_Copies
FROM BOOK_COPIES BC 
JOIN BOOK ON BC.BookID=BOOK.BookID
JOIN LIBRARY_BRANCH LB ON BC.BranchID=LB.BranchID
WHERE BOOK.Title = 'The Lost Tribe';


--Get all borrowers who don't have any books checked out.
SELECT B.Name 
FROM BORROWER B
LEFT JOIN BOOK_LOANS BL ON B.CardNo=BL.CardNo
WHERE BL.CardNo IS NULL;


--Get book title, borrower's name and address for books loaned from Sharpstown due today
SELECT BOOK.Title, B.Name, B.[Address], BL.DueDate
FROM BORROWER B
JOIN BOOK_LOANS BL ON B.CardNo=BL.CardNo
JOIN BOOK ON BL.BookID=BOOK.BookID
JOIN LIBRARY_BRANCH LB ON BL.BranchID=LB.BranchID
WHERE LB.BranchName = 'Sharpstown'
AND BL.DueDate = '2/5/17';


--Get all branch names and # of books checked out from each.
SELECT LB.BranchName, COUNT(BL.BookID) AS 'BooksOut'
FROM LIBRARY_BRANCH LB
JOIN BOOK_LOANS BL ON LB.BranchID=BL.BranchID
GROUP BY LB.BranchName;


--Get Name, Address and # of books checked out for borrowers with > 5 books out
SELECT B.Name, B.[Address], COUNT(BL.BookID) AS 'BooksOut'
FROM BORROWER B
JOIN BOOK_LOANS BL ON B.CardNo=BL.CardNo
GROUP BY B.Name, B.[Address]
HAVING COUNT(BL.BookID) > 5;


--Get title and # of copies of Stephen King books owned by Central branch
SELECT BOOK.Title, BC.No_Of_Copies
FROM BOOK
JOIN BOOK_COPIES BC ON BOOK.BookID=BC.BookID
JOIN BOOK_AUTHORS BA ON BOOK.BookID=BA.BookID
WHERE BA.AuthorName = 'Stephen King'
AND BC.BranchID = 1;
