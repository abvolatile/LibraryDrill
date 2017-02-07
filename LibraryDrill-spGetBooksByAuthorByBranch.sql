CREATE PROC spGetBooksByAuthorByBranch @Author nvarchar(50), @Branch nvarchar(50)
AS
	SELECT BOOK.Title, BC.No_Of_Copies
	FROM BOOK
	JOIN BOOK_COPIES BC ON BOOK.BookID=BC.BookID
	JOIN BOOK_AUTHORS BA ON BOOK.BookID=BA.BookID
	JOIN LIBRARY_BRANCH LB ON BC.BranchID=LB.BranchID
	WHERE BA.AuthorName LIKE '%'+@Author+'%'
	AND LB.BranchName = @Branch;
GO