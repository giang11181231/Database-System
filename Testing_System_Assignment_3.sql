/*Question 1*/
INSERT INTO testting_system.Department(DepartmentName)
VALUES 	('maketing1'	),
		('sale1'		),
		('Bảo vệ1'		),
        ('Nhân sự1' 	),
        ('Kĩ thuật1'	),
        ('maketing2'	),
		('sale12'		),
		('Bảo vệ2'		),
        ('Nhân sự2' 	),
        ('Kĩ thuật2'	);
INSERT INTO testting_system.Positions( PositionName)
VALUES 	('Dev1'			),
		('Test1'			),
        ('Scrum Master1'	),
        ('PM1'			),
        ('D-A1'			),
        ('Dev2'			),
		('Test2'			),
        ('Scrum Master2'	),
        ('PM2'			),
        ('D-A2'			);
INSERT INTO testting_system.Accounts( Email, Username, FullName, DepartmentID, PositionID )
VALUES 	('email6@gmail.com', 'account6', 'Nguyễn HOÀNG AA', 1, 1),
		('email7@gmail.com', 'account7', 'Nguyễn Thị B', 2, 2),
        ('email8@gmail.com', 'account8', 'Nguyễn Thị C', 3, 3),
        ('email9@gmail.com', 'account9', 'Nguyễn Thị D', 4, 4),
        ('email10@gmail.com', 'account10', 'Nguyễn Thị E', 5, 5),
        ('email11@gmail.com', 'account11', 'Nguyễn Hoàng A', 1, 1),
		('email12@gmail.com', 'account12', 'Nguyễn Hoàng B', 2, 2),
        ('email13@gmail.com', 'account13', 'Nguyễn Hoàng C', 3, 3),
        ('email14@gmail.com', 'account14', 'Nguyễn Hoàng D', 4, 4),
        ('email15@gmail.com', 'account15', 'Nguyễn Hoàng E', 5, 5);
INSERT INTO testting_system.Groupss( GroupName, CreatorID )
VALUES 	('A1', 1),
		('B1', 2),
        ('C1', 3),
        ('D1', 4),
        ('E1', 5),
        ('A2', 1),
		('B2', 2),
        ('C2', 3),
        ('D2', 4),
        ('E2', 5);
INSERT INTO testting_system.GroupAccount(GroupID, AccountID)
VALUES 	(1,1),
		(2,2),
		(3,3),
		(4,4),
		(5,5),
        (1,1),
		(2,2),
		(3,3),
		(4,4),
		(5,5);
INSERT INTO testting_system.TypeQuestion(TypeName)
VALUES 	('Essay'			), 
		('Multiple-Choice'	),
		('Essay'			), 
		('Multiple-Choice' 	),
		('Essay'			),
        ('Essay'			), 
		('Multiple-Choice'	),
		('Essay'			), 
		('Multiple-Choice' 	),
		('Essay'			);
INSERT INTO testting_system.CategoryQuestion( CategoryName)
VALUES 	('Java'		),
		('.NET'		),
        ('SQL'		),
        ('Postman'	),
        ('Ruby'		),
        ('Java'		),
		('.NET'		),
        ('SQL'		),
        ('Postman'	),
        ('Ruby'		);
INSERT INTO testting_system.Question( Content, CategoryID, TypeID, CreatorID)
VALUES 	('Question6', 1, 1, 1),
		('Question7', 2, 2, 2),
        ('Question8', 3, 3, 3),
        ('Question9', 4, 4, 4),
        ('Question10', 5, 5, 5),
        ('Question11', 1, 1, 1),
		('Question12', 2, 2, 2),
        ('Question13', 3, 3, 3),
        ('Question14', 4, 4, 4),
        ('Question15', 5, 5, 5);
INSERT INTO testting_system.Answer( Content, QuestionID,isCorrect)
VALUES 	('Answer6', 6, TRUE),
		('Answer7', 7, TRUE),
        ('Answer8', 8, TRUE),
        ('Answer9', 9, TRUE),
        ('Answer10', 10, TRUE),
        ('Answer11', 11, TRUE),
		('Answer12', 12, TRUE),
        ('Answer13', 13, TRUE),
        ('Answer14', 14, TRUE),
        ('Answer15', 15, TRUE);
INSERT INTO testting_system.Exam(Codes, Title, CategoryID, Duration, CreatorID)
VALUES 	('Codes6', 'Title6', 1,'100m', 1),
		('Codes7', 'Title7', 2,'101m', 2),
        ('Codes8', 'Title8', 3,'100m', 3),		 	 
        ('Codes9', 'Title9', 4,'100m', 4),
        ('Codes10', 'Title10', 5,'102m', 5),
        ('Codes11', 'Title11', 1,'100m', 1),
		('Codes12', 'Title12', 2,'101m', 2),
        ('Codes13', 'Title13', 3,'100m', 3),		 	 
        ('Codes14', 'Title14', 4,'100m', 4),
        ('Codes15', 'Title15', 5,'102m', 5);
INSERT INTO testting_system.ExamQuestion(ExamID, QuestionID)
VALUES 	(1,1),
		(2,2),
		(3,3),
		(4,4),
        (3,3),
		(5,5),
        (1,1),
		(2,2),
		(4,4),
		(5,5);
        
/*Question 2*/
SELECT * FROM testting_system.department;

/*Question 3*/
SELECT DepartmentID FROM testting_system.Department
WHERE DepartmentName = "sale";

/*Question 4*/
SELECT * FROM testting_system.Accounts
ORDER BY LENGTH(FullName) DESC
LIMIT 1;

/*Question 5*/
SELECT * FROM testting_system.Accounts
WHERE DepartmentID = 3
ORDER BY LENGTH(FullName) DESC
LIMIT 1;

/*Question 6*/
SELECT GroupName FROM testting_system.Groupss
WHERE CreateDate < '2019-12-20 00:00:00';

/*Question 7*/
SELECT QuestionID , COUNT(AnswerID) AS TotalAnswers FROM testting_system.Answer
GROUP BY QuestionID
HAVING TotalAnswers >= 4;

/*Question 8*/
SELECT ExamID FROM testting_system.Exam
WHERE Duration >= 60 AND CreateDate < '2019-12-20 00:00:00'; 

/*Question 9*/
SELECT * FROM testting_system.Groupss
ORDER BY CreateDate DESC
LIMIT 5;

/*Question 10*/
SELECT COUNT(AccountID) FROM testting_system.accounts
WHERE DepartmentID =2;

/*Question 11*/
SELECT * FROM testting_system.accounts
WHERE  'D%o';

/*Question 12*/
DELETE FROM testting_system.exam
WHERE CreateDate < '2019-12-20 00:00:00'; 

/*Question 13*/
DELETE FROM testting_system.Question
WHERE Content LIKE 'cau hoi%';

/*Question 14*/
UPDATE testting_system.Accounts
SET Fullname = N'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

/*Question 15*/
UPDATE testting_system.groupaccount
SET AccountID = 5
WHERE GroupID = 4 ;

/*Safe Update Mode */
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
