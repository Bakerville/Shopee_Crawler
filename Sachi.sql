Create database Test

go

Create table Nhanvien
(
	Id int IDENTITY(1,1),
	Name varchar(35),
	Salary int,
	departmentId int
)

go 

Create table Phongban
(
	Id int IDENTITY(1,1),
	Name varchar(35)
)

INSERT INTO Nhanvien VALUES ('Joe', 85000, 1)
INSERT INTO Nhanvien VALUES ('Henry', 80000, 2)
INSERT INTO Nhanvien VALUES ('Sam', 60000, 2)
INSERT INTO Nhanvien VALUES ('Max', 90000, 1)
INSERT INTO Nhanvien VALUES ('Janet', 69000, 1)
INSERT INTO Nhanvien VALUES ('randy', 85000, 1)
INSERT INTO Nhanvien VALUES ('Will', 70000, 1)

Select * from Nhanvien

INSERT INTO Phongban VALUES ('IT')
INSERT INTO Phongban VALUES ('Sales')

use Test

SELECT tenphongban, Name, Salary
FROM 
(
	SELECT nv.Id, nv.Name, nv.Salary,pb.Id as maphongban, pb.Name as tenphongban, DENSE_RANK() Over (Partition by nv.departmentId Order by nv.Salary DESC) as rank from Nhanvien nv INNER JOIN Phongban pb ON nv.departmentId=pb.Id
) temp
WHERE rank<=3
