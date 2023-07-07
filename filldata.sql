/****** Script for SelectTopNRows command from SSMS  ******/



  go
  insert into Account (Username, Password, name, role)
  values('admin','12345','admin','admin')
   insert into Account (Username, Password, name, role)
  values('user1','12345','u1','sale')
   insert into Account (Username, Password, name, role)
  values('user2','12345','u2','sale')
   insert into Account (Username, Password, name, role)
  values('user3','12345','u3','sale')
   insert into Account (Username, Password, name, role)
  values('user4','12345','u4','cashier')
  insert into Account (Username, Password, name, role)
  values('user5','12345','u4','sale')
  go

  go
  Insert into Event (Name, Image, Description, BeginDate, EndDate, Area, Username)
Values('Hội xuân','hoi xuan.jpg','Hội xuân lang cóc năm 2023','2023-01-10','2023-01-17','FPT','admin')
  Insert into Event (Name, Image, Description, BeginDate, EndDate, Area, Username)
Values('back to school','bts.jpg','Back to school 2020=2023','2023-02-10','2023-02-17','FPT','admin')

	go
	Insert into Shop(Id, EventId, Name, Description, Area)
values('FEV','1','CLb to chuc su kien','to kien this sk that','sảnh 1')
	Insert into Shop(Id, EventId, Name, Description, Area)
values('FVC','1','CLb vovinam','thể dục thể thao sức khỏe là số 1 ','tầng G')
	Insert into Shop(Id, EventId, Name, Description, Area)
values('FFC','2','clb bóng đá','đá bóng để ghi thật nhiều bàn thắng','tầng 4')
	Insert into Shop(Id, EventId, Name, Description, Area)
values('CSG','2','CLb truyền thông Cóc Sài Gòn','Quảng bá FPT đến với mọi người','sảnh 2')

	go
	Insert into AccountShop(Username, ShopId, Status)
	Values ('user1','FEV','true')
	Insert into AccountShop(Username, ShopId, Status)
	Values ('user2','FFC','true')
	Insert into AccountShop(Username, ShopId, Status)
	Values ('user3','FVC','true')
	Insert into AccountShop(Username, ShopId, Status)
	Values ('user5','CSG','true')
	




	go
	
	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('FEV','Bánh tráng','20000','banhs trang.jpg','banh trang cuốn bơ','Food')
	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('FEV','Teramisu','50000','teramisu chanh leo.jpg','teramisu chanh leo','Food')
	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('FEV','combo1','80000','comboFEV1.jpg','2 Bánh tráng + Teramisu','Combo')
	Insert into Combo(Id, IdMake, Quantity)
	Values('3','1','2')
	Insert into Combo(Id, IdMake, Quantity)
	Values('3','2','1')

	go

	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('FVC','Hambuger','30000','Hambuger.jpg','Hambuger bò xốt cay','Food')
	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('FVC','Coca','10000','cocacola.jpg','nước ngọt có gas cocke','Drink')
	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('FVC','combo1','45000','burka.jpg','cocacola + hamburger bò','Combo')
	Insert into Combo(Id, IdMake, Quantity)
	Values('6','4','2')
	Insert into Combo(Id, IdMake, Quantity)
	Values('6','5','2')

	go

	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('FFC','bánh mì kem','20000','banhmikem.jpg','bánh mì nhân kẹp vani','Food')
	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('FFC','xoài lắc','15000','huxoailac.jpg','xoài lắc siêu cay sieu ngonn','Food')
	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('FFC','combo1','32000','comboFFC','2 bánh mì kem + 1 hũ xoài','Combo')
	Insert into Combo(Id, IdMake, Quantity)
	Values('9','7','2')
	Insert into Combo(Id, IdMake, Quantity)
	Values('9','8','1')
	
	go

	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('CSG','Trà sữa','20000','lytraf.jpg','trà sữa trân châu đường  đen','Drink')
	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('CSG','Nước cam','15000','nuoccam.jpg','cam ép','Drink')
	Insert into Product(ShopId, Name, Price, Image, Description, category)
	Values('CSG','Combo nước','45000','nuoc.jpg','2nươc cam + 1tra sữa','Combo')
	Insert into Combo(Id, IdMake, Quantity)
	Values('12','10','1')
	Insert into Combo(Id, IdMake, Quantity)
	Values('12','11','2')

	go



