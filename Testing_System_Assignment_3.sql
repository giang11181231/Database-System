/*ASS1*/
create table Department(
	DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(20) NOT NULL
);
create table Positions(
	PositionID  INT AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(20) NOT NULL
);
create table Accounts(
	AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(30) NOT NULL,
    Username VARCHAR(20) NOT NULL,
    FullName VARCHAR(30) NOT NULL,
    DepartmentID INT,
    PositionID INT,
    CreateDate TIMESTAMP NOT NULL,
	FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES Positions(PositionID)
);
create table Groupss(
	GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(15) NOT NULL,
    CreatorID INT,
    FOREIGN KEY(CreatorID) REFERENCES Accounts(AccountID),
    CreateDate TIMESTAMP NOT NULL
);
create table GroupAccount(
	GroupID INT,
    AccountID INT,
	FOREIGN KEY(GroupID) REFERENCES Groupss(GroupID),
	FOREIGN KEY(AccountID) REFERENCES Accounts(AccountID),
	JoinDate TIMESTAMP NOT NULL
);
create table TypeQuestion(
	TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(20) NOT NULL
);
create table CategoryQuestion(
	CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(20) NOT NULL
);
create table Question(
	QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(50) NOT NULL,
    CategoryID INT,
    TypeID INT,
	CreatorID INT,
    FOREIGN KEY(CreatorID) REFERENCES Accounts(AccountID),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    CreateDate TIMESTAMP NOT NULL
);
create table Answer(
	AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(50) NOT NULL,
    QuestionID INT NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    isCorrect BOOLEAN NOT NULL
    
);
create table Exam(
	ExamID INT AUTO_INCREMENT PRIMARY KEY,
    Codes VARCHAR(10) NOT NULL,
    Title VARCHAR(20) NOT NULL,
    CategoryID INT,
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    Duration VARCHAR(3) NOT NULL,
    CreatorID INT,
    FOREIGN KEY(CreatorID) REFERENCES Accounts(AccountID),
    CreateDate TIMESTAMP NOT NULL
);
create table ExamQuestion(
	ExamID INT,
    QuestionID INT,
	FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
/*ASS2*/
INSERT INTO Department(DepartmentID, DepartmentName)
VALUES 	(1,		N'maketing'	),
		(2,		N'sale'		),
		(3,		N'Bảo vệ'	),
        (4,		N'Nhân sự'	),
        (5,		N'Kĩ thuật'	);
INSERT INTO Positions(PositionID, PositionName)
VALUES 	(1,		N'Dev'			),
		(2,		N'Test'			),
        (3,		N'Scrum Master'	),
        (4,		N'PM'			),
        (5,		N'D-A'			);
INSERT INTO Accounts(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES 	(1,		N'email1@gmail.com', 'account1', 'Nguyễn Văn A', 1, 1, 1/10/2020	),
		(2,		N'email2@gmail.com', 'account2', 'Nguyễn Văn B', 2, 2, 1/10/2020	),
        (3,		N'email3@gmail.com', 'account3', 'Nguyễn Văn C', 3, 3, 1/10/2020	),
        (4,		N'email4@gmail.com', 'account4', 'Nguyễn Văn D', 4, 4, 1/10/2020	),
        (5,		N'email5@gmail.com', 'account5', 'Nguyễn Văn E', 5, 5, 1/10/2020	),
        (6,		N'email6@gmail.com', 'account6', 'Nguyễn Văn F', 1, 1, 1/10/2020	),
		(7,		N'email7@gmail.com', 'account7', 'Nguyễn Văn G', 2, 2, 1/10/2020	),
        (8,		N'email8@gmail.com', 'account8', 'Nguyễn Văn H', 3, 3, 1/10/2020	),
		(9,		N'email8@gmail.com', 'account9', 'Nguyễn Văn I', 4, 4, 1/10/2020	),
        (0,		N'email9@gmail.com', 'account0', 'Nguyễn Văn K', 5, 5, 1/10/2020	);
INSERT INTO Groupss(GroupID, GroupName, CreatorID, CreateDate)
VALUES 	(0,		N'A', 1,2/10/2020	),
		(1,		N'B', 2,2/10/2020	),
        (2,		N'C', 3,2/10/2020	),
        (3,		N'D', 4,2/10/2020	),
        (4,		N'E', 5,2/10/2020	);
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate)
VALUES 	(0, 1,2/10/2020),
		(0, 6,3/10/2020),
        (1, 2,2/10/2020),
        (1, 7,3/10/2020),
        (2, 3,2/10/2020),
        (2, 8,3/10/2020),
        (3, 4,2/10/2020),
        (3, 9,3/10/2020),
        (4, 5,2/10/2020),
        (4, 0,3/10/2020);
INSERT INTO TypeQuestion(TypeID, TypeName)
VALUES 	(1,	N'Yes/No question'			),
		(2,	N'Multiple Choice question'	),
        (3,	N'Rating Scales question)'	),
        (4,	N'Likert Scales question'	),
        (5,	N'Ranking questions'		);
INSERT INTO CategoryQuestion(CategoryID, CategoryName)
VALUES 	(1,	N'Java'		),
		(2,	N'.NET'		),
        (3,	N'SQL'		),
        (4,	N'Postman'	),
        (5,	N'Ruby'		);
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES 	(1,	N'Question1', 1, 1, 1, 4/10/2020	),
		(2,	N'Question2', 2, 2, 2, 4/10/2020	),
        (3,	N'Question3', 3, 3, 3, 4/10/2020	),
        (4,	N'Question4', 4, 4, 4, 4/10/2020	),
        (5,	N'Question5', 5, 5, 5, 4/10/2020	);
INSERT INTO Answer(AnswerID, Content, QuestionID,isCorrect)
VALUES 	(1,	N'Answer1', 1, TRUE),
		(2,	N'Answer2', 2, TRUE),
        (3,	N'Answer3', 3, TRUE),
        (4,	N'Answer4', 4, FALSE),
        (5,	N'Answer5', 5, FALSE);
INSERT INTO Exam(ExamID, Codes, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES 	(1,	N'Codes1', N'Title1', 1,N'100', 1, 5/10/2020),
		(2,	N'Codes2', N'Title2', 2,N'100', 2, 5/10/2020),
        (3,	N'Codes3', N'Title3', 3,N'100', 3, 5/10/2020),		 	 
        (4,	N'Codes4', N'Title4', 4,N'100', 4, 5/10/2020),
        (5,	N'Codes5', N'Title5', 5,N'100', 5, 5/10/2020);
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES 	(1,1),
		(1,2),
        (1,3),
        (2,2),
		(2,3),
        (2,4),
        (3,3),
		(3,4),
        (3,5),
        (4,5),
		(4,1),
        (4,2),
        (5,2),
		(5,3),
        (5,5);
/*ASS3*/
SELECT DepartmentID,DepartmentName
FROM 	Department;

SELECT DepartmentID
FROM 	Department
WHERE 	DepartmentName= ‘sale’;

SELECT MAX(FullName)
FROM Accounts;

SELECT MAX(FullName)
FROM Accounts
WHERE DepartmentID= 3;
 
SELECT Groupss
FROM GroupName
WHERE CreateDate< 20/12/2019;

SELECT QuestionID
FROM Question
INNER JOIN (
    SELECT AnswerID, MAX(AnswerID)
    FROM AnswerID
    GROUP BY AnswerID
) AnswerID ON Question.QuestionID = Answer.QuestionID;
