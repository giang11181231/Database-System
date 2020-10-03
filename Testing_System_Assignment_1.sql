create table Department(
	DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(20)
);
create table Positions(
	PositionID  INT AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(20)
);
create table Account(
	AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(30),
    Username VARCHAR(20),
    FullName VARCHAR(30),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID)  REFERENCES Positions(PositionID),
    CreateDate TIMESTAMP
);
create table Groupss(
	GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(15),
    FOREIGN KEY(CreatorID) REFERENCES Account(AccountID),
    CreateDate TIMESTAMP
);
create table GroupAccount(
	FOREIGN KEY(GroupID) REFERENCES Groupss(GroupID),
	FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	JoinDate TIMESTAMP
);
create table TypeQuestion(
	TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(20)
);
create table CategoryQuestion(
	CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(20)
);
create table Question(
	QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(50),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) REFERENCES CategoryQuestion(CreatorID),
    CreateDate TIMESTAMP
);
create table Answer(
	AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(50),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    isCorrect BOOLEAN
    
);
create table Exam(
	ExamID INT AUTO_INCREMENT PRIMARY KEY,
    Code VARCHAR(10),
    Title VARCHAR(20),
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    Duration VARCHAR(3),
    CreatorID INT AUTO_INCREMENT PRIMARY KEY,
    CreateDate TIMESTAMP
);
create table ExamQuestion(
	FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);