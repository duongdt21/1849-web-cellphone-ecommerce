USE master
GO
IF EXISTS(select * from sys.databases where name='demo_web')
DROP DATABASE demo_web
GO
CREATE DATABASE demo_web
GO
USE demo_web
GO


create table [Account] (
user_mail varchar(100) primary key,
[password] varchar(64) not null, --MD5 hasing
[account_role] int not null, -- 0 for shipper, 1 for admin, 2 for user
[user_name] nvarchar(50) not null,
[user_address] nvarchar(255),
user_phone varchar(10),
[account_verify] bit not null -- 0 for not yet, 1 for verify
)

-- Adding data to Account table admin1, admin2, user -- ngocnb, huynv shipper: hoangngu.  pass all is: password
insert into Account(user_mail,[password],[account_role],[user_name],[user_address],[user_phone],account_verify)
values('duongdt@fpt.com.vn','5f4dcc3b5aa765d61d8327deb882cf99',1,N'Đinh Tùng Dương',N'Đại học FPT','0765870407',1)

insert into Account(user_mail,[password],[account_role],[user_name],[user_address],[user_phone],account_verify)
values('datdq@fpt.com.vn','5f4dcc3b5aa765d61d8327deb882cf99',1,N'Đỗ Quang Đạt',N'Đại học FPT','0765870407',1)

insert into Account(user_mail,[password],[account_role],[user_name],[user_address],[user_phone],account_verify)
values('ngocnb@fpt.com.vn','5f4dcc3b5aa765d61d8327deb882cf99',2,N'Nguyễn Bảo Ngọc',N'Đại học FPT','0765870407',1)

insert into Account(user_mail,[password],[account_role],[user_name],[user_address],[user_phone],account_verify)
values('huynv@fpt.com.vn','5f4dcc3b5aa765d61d8327deb882cf99',2,N'Nguyễn Văn Huy',N'Đại học FPT','0765870407',1)

insert into Account(user_mail,[password],[account_role],[user_name],[user_address],[user_phone],account_verify)
values('hoangnm@fpt.com.vn','5f4dcc3b5aa765d61d8327deb882cf99',0,N'Nguyễn Minh Hoàng',N'Đại học FPT','0765870407',1)
--Select * from Account

create table Discount_code (
code_name varchar(8) primary key,
discount_value int
)

insert into Discount_code(code_name,discount_value)
values('IA1304',20)

insert into Discount_code(code_name,discount_value)
values('DUONG1',25)

insert into Discount_code(code_name,discount_value)
values('HUY1',30)

insert into Discount_code(code_name,discount_value)
values('NGOC',50)

insert into Discount_code(code_name,discount_value)
values('HOANG1',15)

insert into Discount_code(code_name, discount_value)
values('HARUHARU', 0)

insert into Discount_code(code_name,discount_value)
values('DATDQ',20) 

--select * from Discount_code 

create table Products (
[product_id] int identity(1,1) primary key,
[product_name] nvarchar(100) not null,
[product_des] nvarchar(255),
[product_price] float not null, -- VNĐ
[product_img_source] varchar(255),
[product_type] varchar(100),
[product_brand] varchar(100) 
)
-- Adding Cellphone

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 11 Pro Max 512GB',N'Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',43.990,'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 11 Pro Max 256GB',N'Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',37.990,'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xs Max 256GB',N'Màn hình: 6.5", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',32.990,'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone X 256GB',N'Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',27.990,'https://cdn.tgdd.vn/Products/Images/42/190324/iphone-xs-256gb-white-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xs 64GB',N'Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',24.990,'https://cdn.tgdd.vn/Products/Images/42/190321/iphone-xs-max-gold-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xr 128GB',N'Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xr 128GB',N'Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 8 Plus 64GB',N'Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',16.590,'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-hh-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 7 Plus 32GB',N'Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 3 GB, ROM: 32 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',12.490,'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-32gb-gold-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 7 32GB',N'Màn hình: 4.7", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 2 GB, ROM: 32 GB
Camera: 12 MP, Selfie: 7 MP',10.490,'https://cdn.tgdd.vn/Products/Images/42/74110/iphone-7-gold-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 6s Plus 32GB',N'Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A9 2 nhân 64-bit
RAM: 2 GB, ROM: 32 GB
Camera: 12 MP, Selfie: 5 MP',8.490,'https://cdn.tgdd.vn/Products/Images/42/87846/iphone-6s-plus-32gb-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('Samsung Galaxy S10+ (512GB)',N'Màn hình: 6.4", Quad HD+ (2K+)
HĐH: Android 9.0 (Pie)
CPU: Exynos 9820 8 nhân 64-bit
RAM: 8 GB, ROM: 512 GB
Camera: Chính 12 MP & Phụ 12 MP, 16 MP, Selfie: Chính 10 MP & Phụ 8 MP',26.990,'https://cdn.tgdd.vn/Products/Images/42/198986/sieu-pham-galaxy-s-moi-2-512gb-black-600x600.jpg','cellphone',
'samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('Samsung Galaxy Note 10+',N'Màn hình: 6.8", Quad HD+ (2K+)
HĐH: Android 9.0 (Pie)
CPU: Exynos 9825 8 nhân 64-bit
RAM: 12 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, 16 MP, TOF 3D, Selfie: 10 MP',26.990,
'https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-white-600x600.jpg','cellphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('Samsung Galaxy Note 9',N'Màn hình: 6.4", Quad HD+ (2K+)
HĐH: Android 8.1 (Oreo)
CPU: Exynos 9810 8 nhân 64-bit
RAM: 6 GB, ROM: 128 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 8 MP',16.990,
'https://cdn.tgdd.vn/Products/Images/42/154897/samsung-galaxy-note-9-black-600x600.jpg','cellphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('Samsung Galaxy Note 10',N'Màn hình: 6.3", Full HD+
HĐH: Android 9.0 (Pie)
CPU: Exynos 9825 8 nhân 64-bit
RAM: 8 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, 16 MP, Selfie: 10 MP',22.990,
'https://cdn.tgdd.vn/Products/Images/42/191276/samsung-galaxy-note-10-pink-600x600.jpg','cellphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('Samsung Galaxy S10+',N'Màn hình: 6.4", Quad HD+ (2K+)
HĐH: Android 9.0 (Pie)
CPU: Exynos 9820 8 nhân 64-bit
RAM: 8 GB, ROM: 128 GB
Camera: Chính 12 MP & Phụ 12 MP, 16 MP, Selfie: Chính 10 MP & Phụ 8 MP',22.990,
'https://cdn.tgdd.vn/Products/Images/42/179530/samsung-galaxy-s10-plus-black-600x600.jpg','cellphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('Samsung Galaxy S10',N'Màn hình: 6.1", Quad HD+ (2K+)
HĐH: Android 9.0 (Pie)
CPU: Exynos 9820 8 nhân 64-bit
RAM: 8 GB, ROM: 128 GB
Camera: Chính 12 MP & Phụ 12 MP, 16 MP, Selfie: 10 MP',17.990,
'https://cdn.tgdd.vn/Products/Images/42/161554/samsung-galaxy-s10-white-600x600.jpg','cellphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('Samsung Galaxy A80',N'Màn hình: 6.7", Full HD+
HĐH: Android 9.0 (Pie)
CPU: Snapdragon 730 8 nhân
RAM: 8 GB, ROM: 128 GB
Camera: Chính 48 MP & Phụ 8 MP, TOF 3D, Selfie: Chính 48 MP & Phụ 8 MP, TOF 3D',14.990,
'https://cdn.tgdd.vn/Products/Images/42/201228/samsung-galaxy-a80-gold-600x600.jpg','cellphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('Samsung Galaxy A9 (2018)',N'Màn hình: 6.3", Full HD+
HĐH: Android 8.0 (Oreo)
CPU: Qualcomm Snapdragon 660 8 nhân
RAM: 6 GB, ROM: 128 GB
Camera: Chính 24 MP & Phụ 10 MP, 8 MP, 5 MP, Selfie: 24 MP',10.990,
'https://cdn.tgdd.vn/Products/Images/42/192003/samsung-galaxy-a9-2018-blue-600x600.jpg','cellphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('OPPO Reno 10x Zoom Edition',N'Màn hình: 6.6", Full HD+
HĐH: Android 9.0 (Pie)
CPU: Snapdragon 855 8 nhân 64-bit
RAM: 8 GB, ROM: 256 GB
Camera: Chính 48 MP & Phụ 13 MP, 8 MP, Selfie: 16 MP',16.990,
'https://cdn.tgdd.vn/Products/Images/42/201235/oppo-reno-10x-zoom-edition-black-600x600.jpg','cellphone','oppo')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('OPPO Reno2',N'Màn hình: 6.5", Full HD+
HĐH: Android 9.0 (Pie)
CPU: Snapdragon 730G 8 nhân
RAM: 8 GB, ROM: 256 GB
Camera: Chính 48 MP & Phụ 13 MP, 8 MP, 2 MP, Selfie: 16 MP',14.990,
'https://cdn.tgdd.vn/Products/Images/42/209798/oppo-reno2-600x600.jpg','cellphone','oppo')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('OPPO Reno',N'Màn hình: 6.4", Full HD+
HĐH: Android 9.0 (Pie)
CPU: Snapdragon 710 8 nhân 64-bit
RAM: 6 GB, ROM: 256 GB
Camera: Chính 48 MP & Phụ 5 MP, Selfie: 16 MP',10.990,
'https://cdn.tgdd.vn/Products/Images/42/200438/oppo-reno-pink-600x600.jpg','cellphone','oppo')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('OPPO Reno2 F',N'HĐH: Android 9.0 (Pie)
CPU: MediaTek Helio P70 8 nhân
RAM: 8 GB, ROM: 128 GB
Camera: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP, Selfie: 16 MP',7.990,
'https://cdn.tgdd.vn/Products/Images/42/209800/oppo-reno2-f-green-mtp-600x600.jpg','cellphone','oppo')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('OPPO F11 Pro 128GB',N'Màn hình: 6.5", Full HD+
HĐH: Android 9.0 (Pie)
CPU: MediaTek Helio P70 8 nhân
RAM: 6 GB, ROM: 128 GB
Camera: Chính 48 MP & Phụ 5 MP, Selfie: 16 MP',7.490,
'https://cdn.tgdd.vn/Products/Images/42/202703/oppo-f11-pro-128gb-600x600.jpg','cellphone','oppo')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('OPPO F11',N'Màn hình: 6.5", Full HD+
HĐH: Android 9.0 (Pie)
CPU: MediaTek Helio P70 8 nhân
RAM: 6 GB, ROM: 64 GB
Camera: Chính 48 MP & Phụ 5 MP, Selfie: 16 MP',6.290,
'https://cdn.tgdd.vn/Products/Images/42/199801/oppo-f11-mtp-600x600.jpg','cellphone','oppo')

-- Adding Ear Phone 
insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe nhét trong Earpods Apple MNHF2',N'',0.790,
'https://cdn.tgdd.vn/Products/Images/54/76061/tai-nghe-earpods-apple-md827fea-1-600x600.jpg','earphone','apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe EarPods Lightning Apple MMTN2',N'',0.790,
'https://cdn.tgdd.vn/Products/Images/54/88053/tai-nghe-earpods-cong-lightning-apple-mmtn2-1-1-600x600.jpg','earphone','apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe Bluetooth AirPods 2 Apple MV7N2 Trắng',N'',5.990,
'https://cdn.tgdd.vn/Products/Images/54/200785/tai-nghe-bluetooth-airpods-2-apple-mv7n2-trang-avatar-1-600x600.jpg','earphone','apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe nhét trong Samsung EG920B',N'',0.280,
'https://cdn.tgdd.vn/Products/Images/54/113118/tai-nghe-nhet-trong-samsung-eg920b-2-1-600x600.jpg','earphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe nhét trong Samsung IG935B',N'',0.300,
'https://cdn.tgdd.vn/Products/Images/54/113116/tai-nghe-nhet-trong-samsung-ig935b-2-1-600x600.jpg','earphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe Bluetooth Samsung MG900E',N'',0.800,
'https://cdn.tgdd.vn/Products/Images/54/113119/tai-nghe-bluetooth-samsung-mg900e-add-600x600.jpg','earphone','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe Bluetooth Samsung Level U Pro BN920C',N'',1.450,
'https://cdn.tgdd.vn/Products/Images/54/113117/tai-nghe-bluetooth-samsung-level-u-pro-bn920c-add-600x600.jpg','earphone','samsung')
---
insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe chụp tai Sony MDR - ZX310AP',N'',0.990,
'https://cdn.tgdd.vn/Products/Images/54/75430/tai-nghe-sony-mdr-zx110ap-2-1-600x600.jpg','earphone','sony')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe Bluetooth Sony WI-C300',N'',0.990,
'https://cdn.tgdd.vn/Products/Images/54/169300/tai-nghe-bluetooth-sony-wi-c300-avatar-600x600.jpg','earphone','sony')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe Bluetooth Sony WH-CH400',N'',1.190,
'https://cdn.tgdd.vn/Products/Images/54/169272/tai-nghe-chup-tai-bluetooth-sony-wh-ch400-avatar-600x600.jpg','earphone','sony')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe chụp tai Sony MDR-XB550AP',N'',1.190,
'https://cdn.tgdd.vn/Products/Images/54/106996/tai-nghe-chup-tai-sony-mdr-xb550ap-1-1-600x600.jpg','earphone','sony')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe Bluetooth Sony WI-SP500',N'',2.990,
'https://cdn.tgdd.vn/Products/Images/54/169274/tai-nghe-bluetooth-sony-wi-sp500-avatar-600x600.jpg','earphone','sony')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe Bluetooth TWS Sony WF-SP700N',N'',2.990,
'https://cdn.tgdd.vn/Products/Images/54/212112/tai-nghe-bluetooth-tws-sony-wf-sp700n-ava-600x600.jpg','earphone','sony')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe Bluetooth JBL INSP500BLK Đen',N'',1.390,
'https://cdn.tgdd.vn/Products/Images/54/207451/tai-nghe-bluetooth-the-thao-jbl-insp500blk-den-add-1-600x600-1-600x600.jpg','earphone','jbl')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Tai nghe Bluetooth JBL V110GABT',N'',2.450,
'https://cdn.tgdd.vn/Products/Images/54/207453/tai-nghe-bluetooth-the-thao-jbl-v110gabtgml-add-1-600x600-1-600x600.jpg','earphone','jbl')

-- adding speaker 
insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Loa Bluetooth JBL GO2',N'',0.850,
'https://cdn.tgdd.vn/Products/Images/382/206702/loa-bluetooth-jbl-go2blk-den-add-600x600-1-600x600.jpg',
'speaker','jbl')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Loa Bluetooth JBL FLIP4',N'',2.690,
'https://cdn.tgdd.vn/Products/Images/382/207242/loa-bluetooth-jbl-flip4blu-add-600x600-1-600x600.jpg',
'speaker','jbl')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Loa Bluetooth JBL PULSE2BLKAS Đen',N'',3.690,
'https://cdn.tgdd.vn/Products/Images/382/207246/loa-bluetooth-jbl-pulse2blkas-den-add-600x600-1-600x600.jpg',
'speaker','jbl')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Loa Bluetooth Sony SRS-XB10',N'',1.190,
'https://cdn.tgdd.vn/Products/Images/382/106821/loa-bluetooth-sony-srs-xb10-avatar-5-600x600.jpg',
'speaker','sony')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Loa Bluetooth Sony SRS-XB21',N'',1.990,
'https://cdn.tgdd.vn/Products/Images/382/168314/loa-bluetooth-sony-srs-xb21-avatar-2-600x600.jpg',
'speaker','sony')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Loa bluetooth Sony SRS-XB22',N'',2.390,
'https://cdn.tgdd.vn/Products/Images/382/206660/loa-bluetooth-sony-srs-xb22-600x600-1-600x600.jpg',
'speaker','sony')

--powerbank
insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Pin sạc dự phòng 7.500 mAh eSaver Safari 3S',N'',0.400,
'https://cdn.tgdd.vn/Products/Images/57/145725/pin-sac-du-phong-7500mah-esaver-safari-3s-anh-dai-dien-600x600.jpg',
'powerbank','esaver')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Pin sạc dự phòng 7.500 mAh eSaver LA A33 Đen',N'',0.400,
'https://cdn.tgdd.vn/Products/Images/57/195150/pin-sac-du-phong-7500mah-esaver-la-a33-den-1-600x600.jpg',
'powerbank','esaver')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Pin sạc dự phòng Polymer 10.000 mAh Type C eSaver PJ JP106S',N'',0.650,
'https://cdn.tgdd.vn/Products/Images/57/145723/polymer-10000-mah-type-c-esaver-pj-jp106s-avatar-1-600x600.jpg',
'powerbank','esaver')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Pin sạc dự phòng Polymer 10.000 mAh eValu PA L10S',N'',0.650,
'https://cdn.tgdd.vn/Products/Images/57/145558/pin-sac-du-phong-polymer-10000mah-evalu-pa-l10s-add-600x600.jpg',
'powerbank','esaver')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Pin sạc dự phòng Polymer 10.000 mAh Energizer UE10046 Xám',N'',0.550,
'https://cdn.tgdd.vn/Products/Images/57/204250/pin-du-phong-polymer-10000mah-energizer-ue10046-xa-1-4-600x600.jpg',
'powerbank','energizer')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Pin sạc dự phòng không dây Energizer 10.000 mAh QE10000GY Xám',N'',0.990,
'https://cdn.tgdd.vn/Products/Images/57/204418/pin-du-phong-c-wireless-energizer-qc10000gy-xam-1-3-600x600.jpg',
'powerbank','energizer')


insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Pin sạc dự phòng 7.500 mAh AVA Cat 3S Cam Trắng',N'',0.250,
'https://cdn.tgdd.vn/Products/Images/57/204428/pin-sac-du-phong-7500mah-ava-cat-3s-cam-trang-1-600x600.jpg',
'powerbank','ava')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Pin sạc dự phòng 10.000 mAh AVA TS-D151',N'',0.350,
'https://cdn.tgdd.vn/Products/Images/57/197286/pin-sac-du-phong-10000mah-ava-ts-d151-add-1-600x600.jpg',
'powerbank','ava')

-- Adding screen stickers
insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán màn hình Oppo Reno 2F',N'',0.050,
'https://cdn.tgdd.vn/Products/Images/1363/212234/mieng-dan-man-hinh-oppo-reno-2f-ava-2-600x600.jpg',
'screenstickers')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán màn hình Galaxy A20s',N'',0.050,
'https://cdn.tgdd.vn/Products/Images/1363/212225/mieng-dan-man-hinh-galaxy-a20s-600x600.jpg',
'screenstickers')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán lưng iPhone 11',N'',0.050,
'https://cdn.tgdd.vn/Products/Images/1363/212224/mieng-dan-lung-iphone-11-ava-600x600.jpg',
'screenstickers')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán màn hình Galaxy Note 10',N'',0.050,
'https://cdn.tgdd.vn/Products/Images/1363/210075/mieng-dan-man-hinh-galaxy-note-10-600x600.jpg',
'screenstickers')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán màn hình Galaxy Note 10 Plus',N'',0.050,
'https://cdn.tgdd.vn/Products/Images/1363/210073/mieng-dan-man-hinh-galaxy-note-10-plus-ava-600x600.jpg',
'screenstickers')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán lưng Galaxy Note 10_GOS',N'',0.050,
'https://cdn.tgdd.vn/Products/Images/1363/210071/mieng-dan-lung-galaxy-note-10gos-ava-600x600.jpg',
'screenstickers')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán kính iPhone Xs Max JCPAL',N'',0.390,
'https://cdn.tgdd.vn/Products/Images/1363/203676/mieng-dan-kinh-iphone-xs-max-jcpal-avatar-2-600x600.jpg',
'screenstickers')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán kính iPhone X/Xs JCPAL',N'',0.390,
'https://cdn.tgdd.vn/Products/Images/1363/203675/mieng-dan-kinh-iphone-x-xs-jcpal-avatar-600x600.jpg',
'screenstickers')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán full màn hình UB T100-75-GN Galaxy S10',N'',0.100,
'https://cdn.tgdd.vn/Products/Images/1363/208865/mieng-dan-full-man-hinh-ub-t100-75-gn-galaxy-s10-avatar-600x600.jpg',
'screenstickers')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Miếng dán full màn hình UB T100-75-GN Galaxy S10 Plus',N'',0.100,
'https://cdn.tgdd.vn/Products/Images/1363/208866/mieng-full-man-hinh-ub-t100-75-gn-galaxy-s10-plus-600x600.jpg',
'screenstickers')

-- cable-charger

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Adapter sạc 5W Apple MD813ZM-A',N'',0.490,
'https://cdn.tgdd.vn/Products/Images/58/76056/adapter-sac-5w-iphone-ipad-ipod-apple-md813zma-12-600x600.jpg',
'cable-charger','apple')
insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Cáp Lightning 1 m Apple MQUE2',N'',0.490,
'https://cdn.tgdd.vn/Products/Images/58/161269/cap-lightning-1m-apple-mque2-trang-1-1-600x600.jpg',
'cable-charger','apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Cáp Lightning 0.5 m Apple ME291 Trắng',N'',0.490,
'https://cdn.tgdd.vn/Products/Images/58/203758/cap-lightning-05m-apple-me291-trang-5-1-600x600.jpg',
'cable-charger','apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Adapter sạc 12W Apple MD836ZM',N'',0.590,
'https://cdn.tgdd.vn/Products/Images/58/76055/adapter-sac-12w-iphone-ipad-ipod-apple-md836zm-a-4-600x600.jpg',
'cable-charger','apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Cáp Type-C - Type-C 1 m Apple MUF72 Trắng',N'',0.590,
'https://cdn.tgdd.vn/Products/Images/58/203760/cap-type-c-type-c-1m-apple-muf72-trang-600x600.jpg',
'cable-charger','apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Adapter sạc không dây Apple Watch MU9K2 Trắng',N'',0.790,
'https://cdn.tgdd.vn/Products/Images/58/199097/adapter-sac-apple-watch-magnetic-type-c-30cm-apple-avatar-600x600.jpg',
'cable-charger','apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Adapter Sạc Type-C 18W Apple MU7V2 Trắng',N'',0.990,
'https://cdn.tgdd.vn/Products/Images/58/200482/adapter-sac-type-c-18w-apple-mu7v2-trang-9-600x600.jpg',
'cable-charger','apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Adapter chuyển đổi lightning sang cổng HDMI Apple',N'',1.490,
'https://cdn.tgdd.vn/Products/Images/58/76060/hub-chuyen-cong-lightning-sang-hdmilightning-1-600x600.jpg',
'cable-charger','apple')


insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Cáp 2 in 1 Micro Type-C 1.5 m Samsung EP-DG930D',N'',0.190,
'https://cdn.tgdd.vn/Products/Images/58/113123/cap-2-in-1-micro-type-c-15m-samsung-ep-dg930d-ava-600x600.jpg',
'cable-charger','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Bộ Adapter sạc kèm cáp Micro Samsung TA20HW',N'',0.290,
'https://cdn.tgdd.vn/Products/Images/58/113120/bo-adapter-sac-kem-cap-micro-samsung-ta20hw-1-3-600x600.jpg',
'cable-charger','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Bộ Adapter sạc kèm cáp Type C Samsung TA20EW',N'',0.320,
'https://cdn.tgdd.vn/Products/Images/58/174572/bo-adapter-sac-kem-cap-type-c-samsung-ta20ew-1-1-600x600.jpg',
'cable-charger','samsung')


insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Sạc xe hơi 2 cổng Samsung kèm cáp Micro LN920',N'',0.400,
'https://cdn.tgdd.vn/Products/Images/58/113131/bo-sac-xe-hoi-2-cong-2a-kem-cap-micro-ln920-ava-600x600.jpg',
'cable-charger','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Cáp 3 đầu 3 Micro 1 Type-C 1.3 m Samsung MN930G',N'',0.500,
'https://cdn.tgdd.vn/Products/Images/58/113122/cap-3-dau-3-micro-1-type-c-13m-samsung-mn930g-ava-600x600.jpg',
'cable-charger','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Sạc không dây 9W Qi Type C Samsung EP-P1100 Đen',N'',0.500,
'https://cdn.tgdd.vn/Products/Images/58/211866/sac-khong-day-9w-qi-type-c-samsung-ep-p1100-den-add-600x600.jpg',
'cable-charger','samsung')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Cáp Micro 0.9 m Anker A8132',N'',0.100,
'https://cdn.tgdd.vn/Products/Images/58/209397/cap-micro-09m-anker-a8132-add-fix-600x600.jpg',
'cable-charger','anker')


insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Adapter sạc 2.4A Dual Anker A2620 Trắng',N'',0.255,
'https://cdn.tgdd.vn/Products/Images/58/209396/adapter-sac-2a-dual-anker-a2620-trang-add-600x600.jpg',
'cable-charger','anker')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Cáp Micro USB 1.8 m Anker A8143 Xám',N'',0.260,
'https://cdn.tgdd.vn/Products/Images/58/205786/cap-micro-usb-1m8-anker-a8143-xam-add-fixx1-600x600.jpg',
'cable-charger','anker')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Cáp Lightning MFI 0.9 m Anker A8121xx2 Đỏ',N'',0.370,
'https://cdn.tgdd.vn/Products/Images/58/205792/cap-lightning-mfi-09m-anker-a8121xx2-do-1-fix1-600x600.jpg',
'cable-charger','anker')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Cáp Lightning MFI 1.8 m Anker A8122xx2 Xám',N'',0.420,
'https://cdn.tgdd.vn/Products/Images/58/205793/cap-lightning-mfi-1m8-anker-a8122xx2-xam-1-fix1-600x600.jpg',
'cable-charger','anker')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Adapter sạc 2 cổng USB 2.4A Type-C PD 3A Anker A2626 Trắng',N'',0.650,
'https://cdn.tgdd.vn/Products/Images/58/205794/sac-2-cong-usb-24a-type-c-pd-3a-anker-a2626-trang-1-2-600x600.jpg',
'cable-charger','anker')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values(N'Adapter sạc 2 cổng 3A Anker A2025 Đen',N'',0.730,
'https://cdn.tgdd.vn/Products/Images/58/211572/adapter-sac-2-cong-3a-anker-a2025-den-1-600x600.jpg',
'cable-charger','anker')

-- Adding Case

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng Oppo A5 nhựa dẻo UV printing OSMIA CKAC247 May mắn Navy',N'',0.070,
'https://cdn.tgdd.vn/Products/Images/60/212929/op-lung-oppo-a5-nhua-deo-uv-printing-osmia-ckac247-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng Galaxy A50/A50s Nhựa dẻo Skycloud II JM Đỏ',N'',0.070,
'https://cdn.tgdd.vn/Products/Images/60/212308/op-lung-galaxy-a50-a50s-nhua-deo-skycloud-ii-jm-do-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng Galaxy A50/A50s Nhựa dẻo Nake Slim JM Nude',N'',0.050,
'https://cdn.tgdd.vn/Products/Images/60/212306/op-lung-galaxy-a50-a50s-nhua-deo-nake-slim-jm-nude-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone 11 Pro Max Nhựa cứng viền dẻo Glass Simple II JM viền Navy',N'',0.200,
'https://cdn.tgdd.vn/Products/Images/60/212071/op-iphone-11-pro-max-vien-deo-glass-simple-ii-navy-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone 11 Pro Max Nhựa cứng viền dẻo Glass Duo JM Trắng',N'',0.200,
'https://cdn.tgdd.vn/Products/Images/60/212069/op-iphone-11-pro-max-cung-vien-deo-glass-duo-trang-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone 11 Nhựa dẻo UV printing OSMIA CKTG549 Xương rồng Trắng',N'',0.070,
'https://cdn.tgdd.vn/Products/Images/60/212007/op-lung-iphone-11-nhua-deo-cktg549-xuong-rong-tran-1-600x600.jpg',
'case')
insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone 11 Pro Nhựa dẻo UV printing OSMIA CKTG550 Lá Trắng',N'',0.070,
'https://cdn.tgdd.vn/Products/Images/60/212006/op-lung-iphone-11-pro-nhua-deo-uv-printing-osmia-c-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone 7/8+ nhựa cứng viền dẻo TPU+PC UV printing OSMIA Vân lính sọc Xám',N'',0.090,
'https://cdn.tgdd.vn/Products/Images/60/211991/op-lung-iphone-7-8-plus-vien-deo-van-linh-soc-xam-1-600x600.jpg',
'case')
insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone 7/8+ nhựa cứng viền dẻo TPU+PC UV printing OSMIA CKTG420 Sọc trắng Đen',N'',0.090,
'https://cdn.tgdd.vn/Products/Images/60/211990/op-iphone-7-8-plus-nhua-cung-cktg420-soc-trang-den-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone 7/8+ nhựa cứng viền dẻo TPU+PC UV printing OSMIA CKTG330 Vân lính Xanh lá',N'',0.090,
'https://cdn.tgdd.vn/Products/Images/60/211989/op-iphone-7-8-plus-vien-deo-cktg330-van-linh-xanh-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone XS Max Nhựa cứng viền dẻo Glass printing JM Gấu Đen trắng',N'',0.200,
'https://cdn.tgdd.vn/Products/Images/60/211983/op-iphone-xs-max-vien-deo-glass-jm-gau-den-trang-1-600x600.jpg',
'case')
--
insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone 7/8+ Nhựa dẻo Glossy IMD Printing JM 19E116 Kẻ dâu',N'',0.100,
'https://cdn.tgdd.vn/Products/Images/60/211977/op-lung-iphone-7-8-plus-deo-glossy-19e116-ke-dau-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone 7/8+ Nhựa dẻo Glossy IMD Printing JM 19E025 Lá xanh',N'',0.100,
'https://cdn.tgdd.vn/Products/Images/60/211976/op-lung-iphone-7-8-plus-deo-glossy-19e025-la-xanh-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone XS Max Nhựa cứng viền dẻo Tempered Glass COSANO SRM511 Trắng Đen',N'',0.200,
'https://cdn.tgdd.vn/Products/Images/60/211919/op-iphone-xs-max-cung-vien-deo-srm511-trang-den-1-600x600.jpg',
'case')

insert into Products(product_name,product_des,product_price,product_img_source,product_type)
values(N'Ốp lưng iPhone X/Xs Nhựa dẻo UV Printing OSMIA CKTG413 Sọc xanh Đen',N'',0.090,
'https://cdn.tgdd.vn/Products/Images/60/211916/op-lung-iphone-x-xs-nhua-deo-cktg413-soc-xanh-den-1-600x600.jpg',
'case')



create table Amount_product (
[product_id] int FOREIGN KEY REFERENCES Products([product_id]) primary key,
[product_amount] int not null
)
-- Adding number of each product
insert into Amount_product(product_id,product_amount)
values(1,50)
insert into Amount_product(product_id,product_amount)
values(2,16)
insert into Amount_product(product_id,product_amount)
values(3,26)
insert into Amount_product(product_id,product_amount)
values(4,28)
insert into Amount_product(product_id,product_amount)
values(5,22)
insert into Amount_product(product_id,product_amount)
values(6,21)
insert into Amount_product(product_id,product_amount)
values(7,45)
insert into Amount_product(product_id,product_amount)
values(8,10)
insert into Amount_product(product_id,product_amount)
values(9,28)
insert into Amount_product(product_id,product_amount)
values(10,7)
insert into Amount_product(product_id,product_amount)
values(11,17)
insert into Amount_product(product_id,product_amount)
values(12,32)
insert into Amount_product(product_id,product_amount)
values(13,36)
insert into Amount_product(product_id,product_amount)
values(14,2)
insert into Amount_product(product_id,product_amount)
values(15,23)
insert into Amount_product(product_id,product_amount)
values(16,41)
insert into Amount_product(product_id,product_amount)
values(17,27)
insert into Amount_product(product_id,product_amount)
values(18,48)
insert into Amount_product(product_id,product_amount)
values(19,18)
insert into Amount_product(product_id,product_amount)
values(20,20)
insert into Amount_product(product_id,product_amount)
values(21,39)
insert into Amount_product(product_id,product_amount)
values(22,44)
insert into Amount_product(product_id,product_amount)
values(23,48)
insert into Amount_product(product_id,product_amount)
values(24,40)
insert into Amount_product(product_id,product_amount)
values(25,6)
insert into Amount_product(product_id,product_amount)
values(26,19)
insert into Amount_product(product_id,product_amount)
values(27,30)
insert into Amount_product(product_id,product_amount)
values(28,17)
insert into Amount_product(product_id,product_amount)
values(29,18)
insert into Amount_product(product_id,product_amount)
values(30,11)
insert into Amount_product(product_id,product_amount)
values(31,37)
insert into Amount_product(product_id,product_amount)
values(32,33)
insert into Amount_product(product_id,product_amount)
values(33,46)
insert into Amount_product(product_id,product_amount)
values(34,37)
insert into Amount_product(product_id,product_amount)
values(35,31)
insert into Amount_product(product_id,product_amount)
values(36,7)
insert into Amount_product(product_id,product_amount)
values(37,3)
insert into Amount_product(product_id,product_amount)
values(38,33)
insert into Amount_product(product_id,product_amount)
values(39,16)
insert into Amount_product(product_id,product_amount)
values(40,35)
insert into Amount_product(product_id,product_amount)
values(41,47)
insert into Amount_product(product_id,product_amount)
values(42,49)
insert into Amount_product(product_id,product_amount)
values(43,27)
insert into Amount_product(product_id,product_amount)
values(44,46)
insert into Amount_product(product_id,product_amount)
values(45,19)
insert into Amount_product(product_id,product_amount)
values(46,4)
insert into Amount_product(product_id,product_amount)
values(47,7)
insert into Amount_product(product_id,product_amount)

values(48,16)
insert into Amount_product(product_id,product_amount)
values(49,21)
insert into Amount_product(product_id,product_amount)
values(50,0)
insert into Amount_product(product_id,product_amount)
values(51,49)
insert into Amount_product(product_id,product_amount)
values(52,39)
insert into Amount_product(product_id,product_amount)
values(53,13)
insert into Amount_product(product_id,product_amount)
values(54,7)
insert into Amount_product(product_id,product_amount)
values(55,9)
insert into Amount_product(product_id,product_amount)
values(56,28)
insert into Amount_product(product_id,product_amount)
values(57,14)
insert into Amount_product(product_id,product_amount)
values(58,14)
insert into Amount_product(product_id,product_amount)
values(59,34)
insert into Amount_product(product_id,product_amount)
values(60,26)
insert into Amount_product(product_id,product_amount)
values(61,10)
insert into Amount_product(product_id,product_amount)
values(62,49)
insert into Amount_product(product_id,product_amount)
values(63,19)
insert into Amount_product(product_id,product_amount)
values(64,19)
insert into Amount_product(product_id,product_amount)
values(65,12)
insert into Amount_product(product_id,product_amount)
values(66,11)
insert into Amount_product(product_id,product_amount)
values(67,37)
insert into Amount_product(product_id,product_amount)
values(68,30)
insert into Amount_product(product_id,product_amount)
values(69,8)
insert into Amount_product(product_id,product_amount)
values(70,31)
insert into Amount_product(product_id,product_amount)
values(71,8)
insert into Amount_product(product_id,product_amount)
values(72,47)
insert into Amount_product(product_id,product_amount)
values(73,42)
insert into Amount_product(product_id,product_amount)
values(74,1)
insert into Amount_product(product_id,product_amount)
values(75,28)
insert into Amount_product(product_id,product_amount)
values(76,20)
insert into Amount_product(product_id,product_amount)
values(77,33)
insert into Amount_product(product_id,product_amount)
values(78,38)
insert into Amount_product(product_id,product_amount)
values(79,9)
insert into Amount_product(product_id,product_amount)
values(80,22)
insert into Amount_product(product_id,product_amount)
values(81,49)
insert into Amount_product(product_id,product_amount)
values(82,46)
insert into Amount_product(product_id,product_amount)
values(83,16)
insert into Amount_product(product_id,product_amount)
values(84,40)
insert into Amount_product(product_id,product_amount)
values(85,22)
insert into Amount_product(product_id,product_amount)
values(86,12)
insert into Amount_product(product_id,product_amount)
values(87,49)
insert into Amount_product(product_id,product_amount)
values(88,37)
insert into Amount_product(product_id,product_amount)
values(89,30)
insert into Amount_product(product_id,product_amount)
values(90,8)
insert into Amount_product(product_id,product_amount)
values(91,7)
insert into Amount_product(product_id,product_amount)
values(92,6)
insert into Amount_product(product_id,product_amount)
values(93,20)
insert into Amount_product(product_id,product_amount)
values(94,37)
insert into Amount_product(product_id,product_amount)
values(95,37)
insert into Amount_product(product_id,product_amount)
values(96,22)
insert into Amount_product(product_id,product_amount)
values(97,4)
insert into Amount_product(product_id,product_amount)
values(98,29)
insert into Amount_product(product_id,product_amount)
values(99,28)
insert into Amount_product(product_id,product_amount)
values(100,13)	


create table Orders (
user_mail varchar(100) FOREIGN KEY REFERENCES [Account]([user_mail]),
[order_id] int identity(1,1) primary key,
[total_price] float not null,
[order_status] int, -- 1 for success, 2 for not yet, 3 for cancel
[order_date] date default GETDATE() not null,  --YYYY/MM/dd,
[order_discount_code] varchar(8) FOREIGN KEY REFERENCES Discount_code([code_name]),
[order_address] nvarchar(255) not null,
)

--Adding order
insert into Orders(user_mail,total_price,order_status,order_date,order_discount_code,order_address)
values('ngocnb@fpt.com.vn',0.217,2,'2019/10/27','DUONG1',N'Đại học FPT Hòa Lạc')


create table Orders_detail (
[order_id] int FOREIGN KEY REFERENCES Orders([order_id]),
[product_id] int FOREIGN KEY REFERENCES Products([product_id]),
[amount_product] int,
primary key ([order_id],[product_id]),
)

-- Adding order detail
insert into Orders_detail(order_id,product_id,amount_product)
values(1,99,1)
insert into Orders_detail(order_id,product_id,amount_product)
values(1,100,1)


create table Vote (
[product_id] int FOREIGN KEY REFERENCES Products([product_id]) primary key,
total_vote int,
)

insert into Vote(product_id,total_vote)
values(1,0)
insert into Vote(product_id,total_vote)
values(2,0)
insert into Vote(product_id,total_vote)
values(3,0)
insert into Vote(product_id,total_vote)
values(4,0)
insert into Vote(product_id,total_vote)
values(5,0)
insert into Vote(product_id,total_vote)
values(6,0)
insert into Vote(product_id,total_vote)
values(7,0)
insert into Vote(product_id,total_vote)
values(8,1)
insert into Vote(product_id,total_vote)
values(9,0)
insert into Vote(product_id,total_vote)
values(10,0)
insert into Vote(product_id,total_vote)
values(11,1)
insert into Vote(product_id,total_vote)
values(12,0)
insert into Vote(product_id,total_vote)
values(13,0)
insert into Vote(product_id,total_vote)
values(14,0)
insert into Vote(product_id,total_vote)
values(15,0)
insert into Vote(product_id,total_vote)
values(16,0)
insert into Vote(product_id,total_vote)
values(17,0)
insert into Vote(product_id,total_vote)
values(18,1)
insert into Vote(product_id,total_vote)
values(19,0)
insert into Vote(product_id,total_vote)
values(20,0)
insert into Vote(product_id,total_vote)
values(21,0)
insert into Vote(product_id,total_vote)
values(22,0)
insert into Vote(product_id,total_vote)
values(23,0)
insert into Vote(product_id,total_vote)
values(24,0)
insert into Vote(product_id,total_vote)
values(25,0)
insert into Vote(product_id,total_vote)
values(26,0)
insert into Vote(product_id,total_vote)
values(27,0)
insert into Vote(product_id,total_vote)
values(28,0)
insert into Vote(product_id,total_vote)
values(29,0)
insert into Vote(product_id,total_vote)
values(30,0)
insert into Vote(product_id,total_vote)
values(31,0)
insert into Vote(product_id,total_vote)
values(32,0)
insert into Vote(product_id,total_vote)
values(33,0)
insert into Vote(product_id,total_vote)
values(34,1)
insert into Vote(product_id,total_vote)
values(35,0)
insert into Vote(product_id,total_vote)
values(36,0)
insert into Vote(product_id,total_vote)
values(37,0)
insert into Vote(product_id,total_vote)
values(38,0)
insert into Vote(product_id,total_vote)
values(39,0)
insert into Vote(product_id,total_vote)
values(40,0)
insert into Vote(product_id,total_vote)
values(41,0)
insert into Vote(product_id,total_vote)
values(42,0)
insert into Vote(product_id,total_vote)
values(43,0)
insert into Vote(product_id,total_vote)
values(44,0)
insert into Vote(product_id,total_vote)
values(45,0)
insert into Vote(product_id,total_vote)
values(46,0)
insert into Vote(product_id,total_vote)
values(47,0)
insert into Vote(product_id,total_vote)
values(48,1)
insert into Vote(product_id,total_vote)
values(49,0)
insert into Vote(product_id,total_vote)
values(50,0)
insert into Vote(product_id,total_vote)
values(51,0)
insert into Vote(product_id,total_vote)
values(52,0)
insert into Vote(product_id,total_vote)
values(53,0)
insert into Vote(product_id,total_vote)
values(54,0)
insert into Vote(product_id,total_vote)
values(55,0)
insert into Vote(product_id,total_vote)
values(56,0)
insert into Vote(product_id,total_vote)
values(57,0)
insert into Vote(product_id,total_vote)
values(58,0)
insert into Vote(product_id,total_vote)
values(59,0)
insert into Vote(product_id,total_vote)
values(60,1)
insert into Vote(product_id,total_vote)
values(61,0)
insert into Vote(product_id,total_vote)
values(62,0)
insert into Vote(product_id,total_vote)
values(63,0)
insert into Vote(product_id,total_vote)
values(64,0)
insert into Vote(product_id,total_vote)
values(65,0)
insert into Vote(product_id,total_vote)
values(66,0)
insert into Vote(product_id,total_vote)
values(67,0)
insert into Vote(product_id,total_vote)
values(68,0)
insert into Vote(product_id,total_vote)
values(69,0)
insert into Vote(product_id,total_vote)
values(70,0)
insert into Vote(product_id,total_vote)
values(71,0)
insert into Vote(product_id,total_vote)
values(72,0)
insert into Vote(product_id,total_vote)
values(73,0)
insert into Vote(product_id,total_vote)
values(74,0)
insert into Vote(product_id,total_vote)
values(75,0)
insert into Vote(product_id,total_vote)
values(76,0)
insert into Vote(product_id,total_vote)
values(77,0)
insert into Vote(product_id,total_vote)
values(78,0)
insert into Vote(product_id,total_vote)
values(79,1)
insert into Vote(product_id,total_vote)
values(80,0)
insert into Vote(product_id,total_vote)
values(81,0)
insert into Vote(product_id,total_vote)
values(82,0)
insert into Vote(product_id,total_vote)
values(83,0)
insert into Vote(product_id,total_vote)
values(84,0)
insert into Vote(product_id,total_vote)
values(85,0)
insert into Vote(product_id,total_vote)
values(86,0)
insert into Vote(product_id,total_vote)
values(87,0)
insert into Vote(product_id,total_vote)
values(88,0)
insert into Vote(product_id,total_vote)
values(89,0)
insert into Vote(product_id,total_vote)
values(90,0)
insert into Vote(product_id,total_vote)
values(91,0)
insert into Vote(product_id,total_vote)
values(92,1)
insert into Vote(product_id,total_vote)
values(93,0)
insert into Vote(product_id,total_vote)
values(94,0)
insert into Vote(product_id,total_vote)
values(95,0)
insert into Vote(product_id,total_vote)
values(96,0)
insert into Vote(product_id,total_vote)
values(97,0)
insert into Vote(product_id,total_vote)
values(98,1)
insert into Vote(product_id,total_vote)
values(99,0)
insert into Vote(product_id,total_vote)
values(100,0)

create table Comment(
[comment_id] int identity(1,1) primary key,
[product_id] int FOREIGN KEY REFERENCES Products([product_id]),
user_mail varchar(100) FOREIGN KEY REFERENCES [Account]([user_mail]),
[comment_content] nvarchar(255) not null,
[comment_time] datetime default GETDATE() not null
)

--Adding comment
insert into Comment(product_id,user_mail,comment_content)
values(1,'ngocnb@fpt.com.vn',N'Đẹp quá')
insert into Comment(product_id,user_mail,comment_content)
values(2,'ngocnb@fpt.com.vn',N'Ai mua cho tôi đi')



create table Reply (
[reply_id] int identity(1,1) primary key,
[comment_id] int FOREIGN KEY REFERENCES Comment([comment_id]),
user_mail varchar(100) FOREIGN KEY REFERENCES [Account]([user_mail]),
[reply_content] nvarchar(255) not null,
[reply_time] datetime default GETDATE() not null
)

-- Adding reply

insert into Reply(comment_id,user_mail,reply_content)
values(2,'huynv@fpt.com.vn',N'Em thích à')


ALTER TABLE Account
ALTER COLUMN account_verify int;

create table token_verify (
user_mail varchar(100) FOREIGN KEY REFERENCES [Account]([user_mail]),
token varchar(100) primary key,
create_time date default getdate()
)





ALTER TABLE Orders
 ADD user_phone VARCHAR(12);

ALTER TABLE Orders
 ADD received_date date;

UPDATE Orders
SET user_phone = '0913085002'
WHERE order_id=1;

insert into Comment(product_id,user_mail,comment_content)
values(2,'ngocnb@fpt.com.vn',N'Sản phẩm đẹp, sài tốt khỏi bàn luôn. Ông giao hàng vui vẻ giao lúc 1h chiều Nắng nóng vẫn chờ mình. Nói chung cực kì hài lòng')



use demo_web
go

create proc GetProducts
@u int,
@v int
as
begin
 SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as row 
  FROM Products p
 ) p WHERE p.row >= @u and p.row <= @v
end
go
create proc GetProductsType
@u int,
@v int,
@b varchar(50)
as
begin
 SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as row 
  FROM Products p where p.product_type = @b
 ) p WHERE p.row >= @u and p.row <= @v
end



-- IA1304 group 1849 
-- Dear, teacher DuyDT
-- Hopefully, the best things will come to you and your family in new land !!! Thankyou so much!!!  
