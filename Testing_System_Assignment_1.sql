create database testting_system;
use testting_system;
create table Department(
	DepartmentID TINYINT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(20) NOT NULL
);
create table Positions(
	PositionID  TINYINT AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(20) NOT NULL
);
create table Accounts(
	AccountID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Email	 VARCHAR(30) NOT NULL,
    Username VARCHAR(30) NOT NULL,
    FullName VARCHAR(30) NOT NULL,
    DepartmentID TINYINT NOT NULL,
    PositionID TINYINT NOT NULL,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY(PositionID) REFERENCES Positions(PositionID) ON DELETE CASCADE
);
create table Groupss(
	GroupID TINYINT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(30) NOT NULL,
    CreatorID VARCHAR(10) NOT NULL,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create table GroupAccount(
	GroupID TINYINT NOT NULL,
    AccountID TINYINT NOT NULL,
	FOREIGN KEY(GroupID) REFERENCES Groupss(GroupID) ON DELETE CASCADE,
	FOREIGN KEY(AccountID) REFERENCES Accounts(AccountID) ON DELETE CASCADE,
	JoinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create table TypeQuestion(
	TypeID TINYINT AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay', 'Multiple-Choice')
);
create table CategoryQuestion(
	CategoryID TINYINT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(20) NOT NULL
);
create table Question(
	QuestionID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(100) NOT NULL,
    CategoryID TINYINT NOT NULL,
    TypeID TINYINT NOT NULL,
	CreatorID TINYINT NOT NULL,
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE,
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID) ON DELETE CASCADE,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create table Answer(
	AnswerID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(50) NOT NULL,
    QuestionID TINYINT NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE,
    isCorrect BOOLEAN
);
create table Exam(
	ExamID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Codes VARCHAR(10) NOT NULL,
    Title VARCHAR(20) NOT NULL,
    CategoryID TINYINT NOT NULL,
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE,
    Duration VARCHAR(10) NOT NULL,
    CreatorID TINYINT NOT NULL,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create table ExamQuestion(
	ExamID TINYINT NOT NULL,
    QuestionID TINYINT NOT NULL,
	FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);