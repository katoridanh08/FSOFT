--- TAO BANG MOVIE ---
CREATE TABLE Movie (
	MaMovie INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(100),
	Duration TINYINT,
	Genre TINYINT,
	Director NVARCHAR(100),
	MoneyBox DECIMAL(10,2),
	Comments VARCHAR(200),
	
)
--- TAO RANG BUOC GENRE 1->8 ---
ALTER TABLE Movie
ADD CONSTRAINT check_Genre CHECK (Genre >=1 AND Genre <=8 )
--- TAO RANG BUOC THOI LUONG LON HON = 1H ---
ALTER TABLE Movie
ADD CONSTRAINT check_Duration CHECK (Duration >=1)
--- TAO BANG ACTOR ---
CREATE TABLE ACTOR(
	MaActor INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(100),
	Age  INT,
	Salary DECIMAL(10,2),
	Nationality NVARCHAR(100),
	)
--- TAO BANG ActedIn  ---
CREATE TABLE ActedIn(
	Ma_ActedIn INT IDENTITY(1,1) PRIMARY KEY,
	MaActor INT FOREIGN KEY REFERENCES ACTOR(MaActor),
	MaMovie INT FOREIGN KEY REFERENCES Movie(MaMovie),
	)
--- THEM TRUONG ImageLink VAO BANG MOVIE VA DAM BAO K TRUNG
ALTER TABLE Movie 
ADD ImageLink VARCHAR(200) UNIQUE
--- THEM DU LIEU VAO BANG ---
INSERT INTO Movie(Name,Duration,Genre,Director,Comments,ImageLink)
VALUES ('SKY',2,1,'danh@@@','sky oi','hhhh')
		,('@#$%d',3,5,'danh@@@','sky oi','dadd')
		,(N'ánh!!!',2,7,'danh@@@','sky oi','alv')
		,('SKY',1,6,'danh@@@','sky oi','ads')
		,('SKY',3,3,'danh@@@','sky oi','que')
INSERT INTO ACTOR(Name,Age,Salary,Nationality)
VALUES (N'!@#ÁNH ỘP',18,1000,N'VIỆT NAM')
		,(N'!@#DANH',36,8000,N'MỸ')
		,(N'!@#NHUNG',43,9000,N'PHÁP')
		,(N'!@#HOÀNG HẢI',57,10000,N'HÀN QUỐC')
		,(N'!@#ÁNH ỘP',18,10070,N'NHẬT BẢN')
INSERT INTO ActedIn(MaMovie,MaActor)
VALUES ('3','1')
		,('4','2')
		,('5','3')
		,('6','4')
		,('7','5')
---  CAP NHAT THAY TEN DIEN VIEN ---
UPDATE Movie
SET Name = 'lê danh'
WHERE MaMovie =7;
-- XUATDU LIEU CAC TAC NHAN LON HON 50 AGE
SELECT * FROM ACTOR
WHERE (Age >=50)
--Mức lương trung bình từ ACTOR và sắp xếp kết quả theo mức lương trung bình ---
SELECT Name,Salary,Nationality FROM ACTOR
ORDER BY Salary
--- tên của tất cả các phim mà diễn viên đó đã đóng.
SELECT Movie.Name,ACTOR.Name
FROM ActedIn
INNER JOIN Movie ON Movie.MaMovie = ActedIn.MaMovie
INNER JOIN ACTOR ON ACTOR.MaActor = ActedIn.MaActor

