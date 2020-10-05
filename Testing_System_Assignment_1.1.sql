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