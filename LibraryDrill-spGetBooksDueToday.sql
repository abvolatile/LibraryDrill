--Get book title, borrower's name and address for books due today at particular branch
CREATE PROC spGetBooksDueToday @BranchName nvarchar(75) = NULL
AS
	SELECT BOOK.Title, B.Name, B.[Address], BL.DueDate
	FROM BORROWER B
	JOIN BOOK_LOANS BL ON B.CardNo=BL.CardNo
	JOIN BOOK ON BL.BookID=BOOK.BookID
	JOIN LIBRARY_BRANCH LB ON BL.BranchID=LB.BranchID
	WHERE LB.BranchName = ISNULL(@BranchName, LB.BranchName)
	AND BL.DueDate = GETDATE();
GO

