use demoTest;
CREATE TABLE `phong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_phong` varchar(45) NOT NULL,
  `ma_phong` varchar(45) NOT NULL,
  `chg_who` varchar(45) NOT NULL,
  `chg_date` datetime NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `chuyen_nganh_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from phong;

CREATE TABLE `chuyen_nganh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_nganh` varchar(45) NOT NULL,
  `ten_nganh` varchar(45) NOT NULL,
  `status` varchar(1) NOT NULL,
  `chg_who` varchar(45) NOT NULL,
  `chg_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from chuyen_nganh;

insert into chuyen_nganh(ma_nganh, ten_nganh, status, chg_who, chg_date)
values ('DEV', 'Lập trình', '1', 'ADMIN', sysdate());

insert into chuyen_nganh(ma_nganh, ten_nganh, status, chg_who, chg_date)
values ('TEST', 'Kiểm thử', '1', 'ADMIN', sysdate());

insert into chuyen_nganh(ma_nganh, ten_nganh, status, chg_who, chg_date)
values ('HR', 'Tuyển dụng', '1', 'ADMIN', sysdate());

insert into phong(ten_phong, ma_phong, chg_who, chg_date, status, chuyen_nganh_id) 
values ('Lập trình 1', 'LT1', 'ADMIN', sysdate(), '1', 1);

insert into phong(ten_phong, ma_phong, chg_who, chg_date, status, chuyen_nganh_id) 
values ('Lập trình 2', 'LT2', 'ADMIN', sysdate(), '1', 1);

insert into phong(ten_phong, ma_phong, chg_who, chg_date, status, chuyen_nganh_id) 
values ('Kiểm thử 1', 'KT1', 'ADMIN', sysdate(), '1', 2);

select a.*, b.ten_nganh
from phong as a inner join chuyen_nganh as b
on a.chuyen_nganh_id = b.id
where a.status = '1'
order by b.id;

insert into phong
(ten_phong,
ma_phong,
chg_who,
chg_date,
status,
chuyen_nganh_id)
values (?, ?, ?, sysdate(), ?, ?);

update
phong
SET ten_phong = ?,
ma_phong = ?,
chg_who = ?,
chg_date = sysdate(),
chuyen_nganh_id = ?
where id = ? and status = '1';

Delete from phong where id = ? and status = '1';

CREATE TABLE `nhan_vien_1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(20) NOT NULL,
  `dia_chi` varchar(50) DEFAULT NULL,
  `luong` decimal(18,2) NOT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `id_phong` int DEFAULT NULL,
  `dien_thoai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_phong_idx` (`id_phong`),
  CONSTRAINT `id_phong` FOREIGN KEY (`id_phong`) REFERENCES `phong` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from nhan_vien_1;
select * from nhan_vien_1 where id_phong = ? order by ten;

insert into nhan_vien_1
(ten,
dia_chi,
luong,
ngay_sinh,
dien_thoai,
id_phong)
values (?,?,?,?,?,?);

insert into nhan_vien(ten, dia_chi, luong, ngay_sinh, dien_thoai, id_phong)
values ('Nguyễn Văn A','Hà Nội' , 500, STR_TO_DATE('01/01/2000', "%d/%m/%Y"), '984031908', 6);

insert into nhan_vien(ten, dia_chi, luong, ngay_sinh, dien_thoai, id_phong)
values ('Nguyễn Văn B','HCM' , 400, STR_TO_DATE('22/12/2000', "%d/%m/%Y"), '984031988', 6);

CREATE TABLE `ngay_lam_viec` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ngay_lam_vieccol_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from ngay_lam_viec;

CREATE TABLE `ngay_lam_viec_map` (
  `id_nhan_vien` int NOT NULL,
  `id_ngay_lam_viec` int NOT NULL,
  PRIMARY KEY (`id_nhan_vien`,`id_ngay_lam_viec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from ngay_lam_viec_map;

insert into ngay_lam_viec_map values (2, 5);
insert into ngay_lam_viec_map values (2, 6);
insert into ngay_lam_viec_map values (2, 7);

insert into ngay_lam_viec values (2,'Thứ 2', 'T2', '1');
insert into ngay_lam_viec values (3,'Thứ 3', 'T3', '1');
insert into ngay_lam_viec values (4,'Thứ 4', 'T4', '1');
insert into ngay_lam_viec values (5,'Thứ 5', 'T5', '1');
insert into ngay_lam_viec values (6,'Thứ 6', 'T6', '1');
insert into ngay_lam_viec values (7,'Thứ 7', 'T7', '1');
insert into ngay_lam_viec values (1,'Chủ nhật', 'CN', '1');

select * from ngay_lam_viec_map where id_nhan_vien_1 = ?;
insert into ngay_lam_viec_map values(?,?);

CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from position;

CREATE TABLE `employee` (
  `id` int NOT NULL,
  `emp_code` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `birtday` datetime NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `gender` varchar(45) NOT NULL DEFAULT '1',
  `position_id` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_code_UNIQUE` (`emp_code`),
  CONSTRAINT `fk_position` FOREIGN KEY (`id`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from employee;

select a.*, b.name
from employee as a inner join position as b
on a.position_id = b.id
where a.status = '1'
order by b.id;

insert into employee
(emp_code,
name,
birtday,
address,
gender,
position_id,
status)
values(?,?,?,?,?,?,?);

update
employee
SET emp_code = ?,
name = ?,
birtday = ?,
address = ?,
gender = ?,
position_id = ?
where id = ? and status = '1';

Delete * employee where id = ? and status = '1'









