INSERT INTO Department( DepartmentName)
VALUES 	('maketing'	),
		('sale'		),
		('Bảo vệ'	),
        ('Nhân sự'  ),
        ('Kĩ thuật' );
INSERT INTO Positions( PositionName)
VALUES 	('Dev'			),
		('Test'			),
        ('Scrum Master'	),
        ('PM'			),
        ('D-A'			);
INSERT INTO Accounts( Email, Username, FullName, DepartmentID, PositionID )
VALUES 	('email1@gmail.com', 'account1', 'Nguyễn Văn A', 1, 1),
		('email2@gmail.com', 'account2', 'Nguyễn Văn B', 2, 2),
        ('email3@gmail.com', 'account3', 'Nguyễn Văn C', 3, 3),
        ('email4@gmail.com', 'account4', 'Nguyễn Văn D', 4, 4),
        ('email5@gmail.com', 'account5', 'Nguyễn Văn E', 5, 5);
INSERT INTO Groupss( GroupName, CreatorID )
VALUES 	('A', 1),
		('B', 2),
        ('C', 3),
        ('D', 4),
        ('E', 5);
INSERT INTO GroupAccount(GroupID, AccountID)
VALUES 	(1,1),
		(2,2),
		(3,3),
		(4,4),
		(5,5);
INSERT INTO TypeQuestion(TypeName)
VALUES 	('Essay'			), 
		('Multiple-Choice'	),
		('Essay'			), 
		('Multiple-Choice' 	),
		('Essay'			);
INSERT INTO CategoryQuestion( CategoryName)
VALUES 	('Java'		),
		('.NET'		),
        ('SQL'		),
        ('Postman'	),
        ('Ruby'		);
INSERT INTO Question( Content, CategoryID, TypeID, CreatorID)
VALUES 	('Question1', 1, 1, 1),
		('Question2', 2, 2, 2),
        ('Question3', 3, 3, 3),
        ('Question4', 4, 4, 4),
        ('Question5', 5, 5, 5);
INSERT INTO Answer( Content, QuestionID,isCorrect)
VALUES 	('Answer1', 1, TRUE),
		('Answer2', 2, TRUE),
        ('Answer3', 3, TRUE),
        ('Answer4', 4, TRUE),
        ('Answer5', 5, TRUE);
INSERT INTO Exam(Codes, Title, CategoryID, Duration, CreatorID)
VALUES 	('Codes1', 'Title1', 1,'100m', 1),
		('Codes2', 'Title2', 2,'101m', 2),
        ('Codes3', 'Title3', 3,'100m', 3),		 	 
        ('Codes4', 'Title4', 4,'100m', 4),
        ('Codes5', 'Title5', 5,'102m', 5);
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES 	(1,1),
		(2,2),
		(3,3),
		(4,4),
		(5,5);