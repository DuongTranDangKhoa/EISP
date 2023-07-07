drop database EIPS
Create database EIPS

Create database EISP
CREATE TABLE Account (
  Username varchar(100) NOT NULL, 
  Password varchar(100) NOT NULL, 
  Name     varchar(500) NULL, 
  Role     varchar(100) NOT NULL, 
  Status   bit DEFAULT 'true' NOT NULL, 
  PRIMARY KEY (Username));
CREATE TABLE AccountShop (
  Username varchar(100) NOT NULL, 
  ShopId   varchar(100) NOT NULL, 
  Status   bit NULL, 
  PRIMARY KEY (Username, 
  ShopId));
CREATE TABLE Card (
  Id          int IDENTITY NOT NULL, 
  EventId     int NOT NULL, 
  Balance     float(10) DEFAULT 0 NULL, 
  Usename     varchar(500) NULL, 
  PhoneNumber varchar(10) NULL, 
  Status      bit DEFAULT 'true' NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Combo (
  No      int IDENTITY NOT NULL, 
  Id      int NULL, 
  IdMake  int NULL, 
  Quantity int NULL, 
  PRIMARY KEY (No));
CREATE TABLE Event (
  ID          int IDENTITY NOT NULL, 
  Name        nvarchar(50) NOT NULL, 
  Description nvarchar(500) NULL, 
  BeginDate   date NULL, 
  EndDate     date NULL, 
  Area        varchar(500) NULL, 
  Username    varchar(100) NOT NULL, 
  Status      bit DEFAULT 'true' NULL, 
  Image       varchar(100) NULL, 
  PRIMARY KEY (ID));
CREATE TABLE ImageEvent (
  No      int IDENTITY NOT NULL, 
  EventId int NOT NULL, 
  Image   varchar(1000) NULL, 
  PRIMARY KEY (No));
CREATE TABLE [Order] (
  Id int  NOT NULL, 
  [Date]  datetime NULL, 
  ShopId  varchar(100) NULL, 
  CardId  int NULL, 
  Total   float(10) NULL, 
  PRIMARY KEY (OrderId));
CREATE TABLE OrderDetail (
  No        int IDENTITY NOT NULL, 
  OrderId   int NOT NULL, 
  ProductId int NOT NULL, 
  Quantity  int NULL, 
  Price     float(10) NULL, 
  Total     float(10) NULL, 
  PRIMARY KEY (No));
CREATE TABLE Product (
  Id          int IDENTITY NOT NULL, 
  ShopId      varchar(100) NOT NULL, 
  Name        nvarchar(500) NOT NULL, 
  Price       float(10) NOT NULL, 
  Image       varchar(1000) NULL, 
  Description nvarchar(700) NULL, 
  Category    varchar(10) NOT NULL, 
  Status      bit DEFAULT 'true' NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Shop (
  Id          varchar(100) NOT NULL, 
  EventId     int NOT NULL, 
  Name        nvarchar(500) NOT NULL, 
  Description nvarchar(700) NULL, 
  Area        varchar(100) NULL, 
  Status      bit DEFAULT 'true' NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE [Transaction] (
  Id      int IDENTITY NOT NULL, 
  CardId  int NOT NULL, 
  OrderId int NOT NULL, 
  PRIMARY KEY (Id));
ALTER TABLE [Transaction] ADD CONSTRAINT FKTransactio473547 FOREIGN KEY (CardId) REFERENCES Card (Id);
ALTER TABLE [Transaction] ADD CONSTRAINT FKTransactio687479 FOREIGN KEY (OrderId) REFERENCES [Order] (OrderId);
ALTER TABLE Card ADD CONSTRAINT FKCard585247 FOREIGN KEY (EventId) REFERENCES Event (ID);
ALTER TABLE Shop ADD CONSTRAINT FKShop68550 FOREIGN KEY (EventId) REFERENCES Event (ID);
ALTER TABLE Product ADD CONSTRAINT FKProduct527516 FOREIGN KEY (ShopId) REFERENCES Shop (Id);
ALTER TABLE OrderDetail ADD CONSTRAINT FKOrderDetai559638 FOREIGN KEY (ProductId) REFERENCES Product (Id);
ALTER TABLE OrderDetail ADD CONSTRAINT FKOrderDetai221089 FOREIGN KEY (OrderId) REFERENCES [Order] (OrderId);
ALTER TABLE AccountShop ADD CONSTRAINT FKAccountSho285522 FOREIGN KEY (ShopId) REFERENCES Shop (Id);
ALTER TABLE AccountShop ADD CONSTRAINT FKAccountSho782127 FOREIGN KEY (Username) REFERENCES Account (Username);
ALTER TABLE Combo ADD CONSTRAINT FKCombo475967 FOREIGN KEY (Id) REFERENCES Product (Id);
ALTER TABLE Combo ADD CONSTRAINT FKCombo475968 FOREIGN KEY (IdMake) REFERENCES Product (Id);

ALTER TABLE Event ADD CONSTRAINT FKEvent534795 FOREIGN KEY (Username) REFERENCES Account (Username);
ALTER TABLE ImageEvent ADD CONSTRAINT FKImageEvent227803 FOREIGN KEY (EventId) REFERENCES Event (ID);
