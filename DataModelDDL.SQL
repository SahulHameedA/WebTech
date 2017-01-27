#This is for MySQL database

drop schema sahuldb;

create schema sahuldb;

use sahuldb;

CREATE TABLE Account
(
	Acct_Id              INTEGER NOT NULL AUTO_INCREMENT,
	Acct_No              VARCHAR(50) NOT NULL,
	Branch_Id            INTEGER NOT NULL,
	Acct_CCY_Cd          CHAR(3) NOT NULL DEFAULT "INR",
	Acct_Typ_Cd          CHAR(2) NOT NULL,
	Open_Dt              DATE NOT NULL,
	Close_Dt             DATE NULL,
	Stat_Cd              CHAR(3) NOT NULL,
	PRIMARY KEY (Acct_Id)
);


CREATE TABLE Account_Feature
(
	Acct_Featr_Id        INTEGER NOT NULL AUTO_INCREMENT,
	Acct_Id              INTEGER NOT NULL,
	Acct_Featr_Cd        CHAR(2) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NULL,
	Fee                  DECIMAL(15,2) NULL DEFAULT 0,
	Fee_CCY_Code         CHAR(3) NOT NULL DEFAULT "INR",
	PRIMARY KEY (Acct_Featr_Id)
);




CREATE TABLE Account_Features_List
(
	Acct_Featr_Cd        CHAR(2) NOT NULL,
	Acct_Featr_Name      VARCHAR(50) NOT NULL
);



ALTER TABLE Account_Features_List
ADD PRIMARY KEY (Acct_Featr_Cd);



CREATE TABLE Account_Type_List
(
	Acct_Typ_Cd          CHAR(2) NOT NULL,
	Acct_Typ_Name        VARCHAR(50) NOT NULL
);



ALTER TABLE Account_Type_List
ADD PRIMARY KEY (Acct_Typ_Cd);



CREATE TABLE Address
(
	Addr_Id              INTEGER NOT NULL AUTO_INCREMENT,
	Line_1               VARCHAR(50) NULL,
	Line_2               VARCHAR(50) NULL,
	City                 CHAR(18) NOT NULL,
	State                CHAR(18) NULL,
	Zip_Cd               CHAR(18) NOT NULL,
	Country_Cd           CHAR(2) NOT NULL DEFAULT "IN",
	Line_3               VARCHAR(50) NULL,
	PRIMARY KEY (Addr_Id)
);


CREATE TABLE Address_Type_List
(
	Addr_Typ_Cd          CHAR(3) NOT NULL,
	Addr_Typ_Name        VARCHAR(50) NOT NULL
);



ALTER TABLE Address_Type_List
ADD PRIMARY KEY (Addr_Typ_Cd);



CREATE TABLE Bank
(
	Bank_Cd              CHAR(10) NOT NULL,
	Bank_Name            VARCHAR(50) NOT NULL,
	Website              VARCHAR(100) NULL
);



ALTER TABLE Bank
ADD PRIMARY KEY (Bank_Cd);



CREATE TABLE Bank_Branch
(
	Branch_Id            INTEGER NOT NULL AUTO_INCREMENT,
	Branch_Name          VARCHAR(50) NOT NULL,
	Bank_Cd              CHAR(10) NOT NULL,
	RTE_Cd               CHAR(18) NULL,
	IFSC_Cd              CHAR(18) NULL,
	SWIFT_Cd             CHAR(18) NULL,
	Addr_Line_1          VARCHAR(50) NULL,
	Addr_Line_2          VARCHAR(50) NULL,
	Addr_Line_3          VARCHAR(50) NULL,
	City                 CHAR(18) NOT NULL,
	State                CHAR(18) NULL,
	Country_Cd           CHAR(2) NOT NULL DEFAULT "IN",
	Zip_Cd               CHAR(18) NULL,
	PRIMARY KEY (Branch_Id)
);


CREATE TABLE Bill_Component_List
(
	Bill_Cmpnt_Id        INTEGER NOT NULL AUTO_INCREMENT,
	Bill_Cmpnt_Descr      VARCHAR(100) NOT NULL,
	Freq_Cd              CHAR(1) NOT NULL DEFAULT "M",
	Elgbl_Amt            DECIMAL(15,2) NOT NULL DEFAULT 0,
	CCY_Cd               CHAR(3) NOT NULL DEFAULT "INR",
	PRIMARY KEY (Bill_Cmpnt_Id)
);


CREATE TABLE Biller_List
(
	Biller_Cd            CHAR(18) NOT NULL,
	Biller_Name          VARCHAR(50) NOT NULL
);



ALTER TABLE Biller_List
ADD PRIMARY KEY (Biller_Cd);



CREATE TABLE Card
(
	Card_No              CHAR(16) NOT NULL,
	Name_On_Card         VARCHAR(50) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NOT NULL,
	Acct_Featr_Id        INTEGER NOT NULL,
	CVV                  CHAR(3) NOT NULL,
	Card_Typ_Cd          CHAR(1) NOT NULL,
	Visa_Master_Flag     CHAR(1) NOT NULL,
	Partner_Cd           CHAR(18) NULL
);



ALTER TABLE Card
ADD PRIMARY KEY (Card_No);



CREATE TABLE Card_PIN
(
	Card_No              CHAR(16) NOT NULL,
	PIN                  VARCHAR(10) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NOT NULL
);



ALTER TABLE Card_PIN
ADD PRIMARY KEY (Card_No,PIN);



CREATE TABLE Card_Type_List
(
	Card_Typ_Cd          CHAR(1) NOT NULL,
	Card_Typ_Name        VARCHAR(50) NOT NULL
);



ALTER TABLE Card_Type_List
ADD PRIMARY KEY (Card_Typ_Cd);



CREATE TABLE Cheque
(
	Cheque_Id            INTEGER NOT NULL AUTO_INCREMENT,
	Start_No             CHAR(18) NOT NULL,
	Cheque_Leaves_Count  INTEGER NOT NULL,
	Acct_Featr_Id        INTEGER NOT NULL,
	PRIMARY KEY (Cheque_Id)
);



CREATE TABLE Company_Branch
(
	Branch_Id            INTEGER NOT NULL AUTO_INCREMENT,
	Company_Cd           CHAR(10) NOT NULL,
	Addr_Line_1          VARCHAR(50) NULL,
	Addr_Line_2          VARCHAR(50) NULL,
	Addr_Line_3          VARCHAR(50) NULL,
	City                 CHAR(18) NOT NULL,
	State                CHAR(18) NULL,
	Zip_Cd               CHAR(18) NULL,
	Country_Cd           CHAR(2) NOT NULL DEFAULT "IN",
	PRIMARY KEY (Branch_Id)
);


CREATE TABLE Company_List
(
	Company_Cd           CHAR(10) NOT NULL,
	Company_Name         VARCHAR(50) NOT NULL
);



ALTER TABLE Company_List
ADD PRIMARY KEY (Company_Cd);


CREATE TABLE Country_List
(
	Country_Cd           CHAR(2) NOT NULL,
	Country_Name         VARCHAR(50) NOT NULL,
    Alpha3_Cd            CHAR(3) NOT NULL,
    M49_Num_Cd           CHAR(3) NOT NULL
);



ALTER TABLE Country_List
ADD PRIMARY KEY (Country_Cd);



CREATE TABLE Currency_List
(
	CCY_Cd               CHAR(3) NOT NULL,
	CCY_Name             VARCHAR(50) NOT NULL
);



ALTER TABLE Currency_List
ADD PRIMARY KEY (CCY_Cd);



CREATE TABLE Department_List
(
	Dept_Cd              CHAR(18) NOT NULL,
	Dept_Name            VARCHAR(50) NOT NULL,
	Branch_Id            INTEGER NOT NULL
);



ALTER TABLE Department_List
ADD PRIMARY KEY (Dept_Cd);



CREATE TABLE Designation_List
(
	Dsgntn_Cd            CHAR(18) NOT NULL,
	Dsgntn_Name          VARCHAR(50) NOT NULL
);



ALTER TABLE Designation_List
ADD PRIMARY KEY (Dsgntn_Cd);

CREATE TABLE Employee
(
	Company_Cd           CHAR(10) NOT NULL,
	Empl_Id              CHAR(18) NOT NULL,
	Person_Id            INTEGER NOT NULL,
	Join_Dt              DATE NOT NULL,
	Resign_Dt            DATE NULL
);



ALTER TABLE Employee
ADD PRIMARY KEY (Company_Cd,Empl_Id);



CREATE TABLE Employee_Department
(
	Company_Cd           CHAR(10) NOT NULL,
	Empl_Id              CHAR(18) NOT NULL,
	Dept_Cd              CHAR(18) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NULL
);



ALTER TABLE Employee_Department
ADD PRIMARY KEY (Company_Cd,Empl_Id,Dept_Cd,Valid_From);



CREATE TABLE Employee_Designation
(
	Company_Cd           CHAR(10) NOT NULL,
	Empl_Id              CHAR(18) NOT NULL,
	Dsgntn_Cd            CHAR(18) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NULL
);



ALTER TABLE Employee_Designation
ADD PRIMARY KEY (Company_Cd,Empl_Id,Dsgntn_Cd,Valid_From);



CREATE TABLE Employee_Salary
(
	Company_Cd           CHAR(10) NOT NULL,
	Empl_Id              CHAR(18) NOT NULL,
	Wage_Cd              VARCHAR(50) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NULL
);



ALTER TABLE Employee_Salary
ADD PRIMARY KEY (Company_Cd,Empl_Id,Wage_Cd);



CREATE TABLE Employee_Wage_Dtl
(
	Pay_Dt               DATE NOT NULL,
	Company_Cd           CHAR(10) NOT NULL,
	Empl_Id              CHAR(18) NOT NULL,
	Debit_Credit_Typ     CHAR(2) NOT NULL,
	Amt                  DECIMAL(15,2) NOT NULL DEFAULT 0,
	Wage_Cd              VARCHAR(50) NOT NULL,
	Wage_Cmpnt_Id        INTEGER NOT NULL,
	CCY_Cd               CHAR(3) NOT NULL DEFAULT "INR"
);



ALTER TABLE Employee_Wage_Dtl
ADD PRIMARY KEY (Pay_Dt,Company_Cd,Empl_Id,Wage_Cd,Wage_Cmpnt_Id);



CREATE TABLE Family
(
	Husband_Id           INTEGER NOT NULL,
	Wife_Id              INTEGER NOT NULL,
	Child_Id             INTEGER NOT NULL
);



ALTER TABLE Family
ADD PRIMARY KEY (Husband_Id,Wife_Id,Child_Id);

CREATE TABLE Frequency_List
(
	Freq_Cd              CHAR(1) NOT NULL,
	Freq_Descr            VARCHAR(100) NOT NULL
);



ALTER TABLE Frequency_List
ADD PRIMARY KEY (Freq_Cd);



CREATE TABLE Grid_Sequence
(
	Grid_Seq_Id          INTEGER NOT NULL AUTO_INCREMENT,
	Grid_Key             VARCHAR(10) NOT NULL,
	Value                VARCHAR(20) NOT NULL,
	Card_No              CHAR(16) NOT NULL,
	PRIMARY KEY (Grid_Seq_Id)
);




CREATE TABLE Account_Holding
(
	Acct_Id              INTEGER NOT NULL,
	Txn_Id               INTEGER NOT NULL,
	As_of_Dt             DATE NOT NULL,
	Balance_Amt          DECIMAL(15,2) NOT NULL DEFAULT 0,
	CCY_Cd               CHAR(3) NULL DEFAULT "INR"
);


ALTER TABLE Account_Holding
ADD PRIMARY KEY (Acct_Id,Txn_Id);

CREATE TABLE Account_Balance
(
	Acct_Id              INTEGER NOT NULL,
	Txn_Id               INTEGER NOT NULL,
	As_of_Dt             DATE NOT NULL,
	Balance_Amt          DECIMAL(15,2) NOT NULL DEFAULT 0,
	CCY_Cd               CHAR(3) NULL DEFAULT "INR"
);


ALTER TABLE Account_Balance
ADD PRIMARY KEY (Acct_Id);

CREATE TABLE ISD_Code_List
(
	ISD_Cd               CHAR(3) NOT NULL,
	Country_Cd           CHAR(2) NOT NULL
);



ALTER TABLE ISD_Code_List
ADD PRIMARY KEY (ISD_Cd);



CREATE TABLE Partner_List
(
	Partner_Cd           CHAR(18) NOT NULL,
	Partner_Descr         VARCHAR(100) NOT NULL
);



ALTER TABLE Partner_List
ADD PRIMARY KEY (Partner_Cd);



CREATE TABLE Person
(
	Person_Id            INTEGER NOT NULL AUTO_INCREMENT,
	First_Name           VARCHAR(50) NOT NULL,
	Middle_Name          VARCHAR(50) NULL,
	Last_Name            VARCHAR(50) NOT NULL,
	Birth_Dt             DATE NOT NULL,
	Gender               CHAR(1) NOT NULL,
	Death_Dt             DATE NULL,
	PRIMARY KEY (Person_Id)
);


CREATE TABLE Person_Address
(
	Person_Id            INTEGER NOT NULL,
	Addr_Id              INTEGER NOT NULL,
	Addr_Typ_Cd          CHAR(3) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NULL
);



ALTER TABLE Person_Address
ADD PRIMARY KEY (Person_Id,Addr_Id,Addr_Typ_Cd);



CREATE TABLE Person_Bill
(
	Biller_Cd            CHAR(18) NOT NULL,
	Person_Id            INTEGER NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NULL,
	Bill_Code            CHAR(18) NOT NULL,
	Due_Dt               DATE NULL
);



ALTER TABLE Person_Bill
ADD PRIMARY KEY (Biller_Cd,Person_Id,Bill_Code);



CREATE TABLE Person_Bill_Detail
(
	Bill_Dt              DATE NOT NULL,
	Biller_Cd            CHAR(18) NOT NULL,
	Person_Id            INTEGER NOT NULL,
	Bill_Code            CHAR(18) NOT NULL,
	Bill_Cmpnt_Id        INTEGER NOT NULL,
	Invoice_Amt          DECIMAL(15,2) NOT NULL DEFAULT 0,
	Debit_Credit_Typ     CHAR(2) NULL,
	CCY_Cd               CHAR(3) NULL DEFAULT "INR"
);



ALTER TABLE Person_Bill_Detail
ADD PRIMARY KEY (Bill_Dt,Biller_Cd,Person_Id,Bill_Code,Bill_Cmpnt_Id);

CREATE TABLE Person_Email
(
	Seq_Id               INTEGER NOT NULL AUTO_INCREMENT,
	Person_Id            INTEGER NOT NULL,
	Wrk_Bus_Per_Typ      CHAR(1) NOT NULL DEFAULT "P",
	Prim_Alt_Typ         CHAR(1) NOT NULL DEFAULT "A",
	Email_Id             VARCHAR(100) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NULL,
	PRIMARY KEY (Seq_Id)
);



CREATE TABLE Person_Phone
(
	Phone_Id             INTEGER NOT NULL AUTO_INCREMENT,
	Wrk_Bus_Per_Typ      CHAR(1) NOT NULL DEFAULT "P",
	Prim_Alt_Typ         CHAR(1) NOT NULL DEFAULT "A",
	ISD_Cd               CHAR(3) NOT NULL DEFAULT "091",
	STD_Cd               CHAR(6) NULL,
	Phone_No             CHAR(10) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NULL,
	Person_Id            INTEGER NOT NULL,
	PRIMARY KEY (Phone_Id)
);


CREATE TABLE Person_Social
(
	Seq_Id               INTEGER NOT NULL AUTO_INCREMENT,
	Person_Id            INTEGER NOT NULL,
	Social_Cd            VARCHAR(10) NOT NULL,
	Social_Id            VARCHAR(50) NOT NULL,
	Valid_From           DATE NOT NULL,
	Valid_Thru           DATE NULL,
	PRIMARY KEY (Seq_Id)
);



CREATE TABLE Project_Responsibility_List
(
	Resp_Cd              CHAR(10) NOT NULL,
	Resp_Descr            VARCHAR(100) NOT NULL
);



ALTER TABLE Project_Responsibility_List
ADD PRIMARY KEY (Resp_Cd);



CREATE TABLE Project_Role_List
(
	Project_Role_Cd      CHAR(2) NOT NULL,
	Project_Role_Name    VARCHAR(50) NOT NULL
);



ALTER TABLE Project_Role_List
ADD PRIMARY KEY (Project_Role_Cd);



CREATE TABLE Relation_Type_List
(
	Relation_Typ_Cd      CHAR(3) NOT NULL,
	Relation_Name        VARCHAR(50) NOT NULL
);



ALTER TABLE Relation_Type_List
ADD PRIMARY KEY (Relation_Typ_Cd);



CREATE TABLE Reminder
(
	Rmndr_Id             INTEGER NOT NULL AUTO_INCREMENT,
	Rmndr_Typ_Cd         CHAR(3) NOT NULL,
	Due_Dt               DATE NOT NULL,
	Notify_Email_Id      VARCHAR(50) NOT NULL,
	Person_Id            INTEGER NOT NULL,
	Stat_Cd              CHAR(3) NOT NULL,
	PRIMARY KEY (Rmndr_Id)
);




CREATE TABLE Reminder_Type_List
(
	Rmndr_Typ_Cd         CHAR(3) NOT NULL,
	Rmndr_Typ_Descr       VARCHAR(100) NOT NULL
);



ALTER TABLE Reminder_Type_List
ADD PRIMARY KEY (Rmndr_Typ_Cd);



CREATE TABLE Skill_List
(
	Skill_Cd             CHAR(10) NOT NULL,
	Skill_Name           VARCHAR(50) NOT NULL
);



ALTER TABLE Skill_List
ADD PRIMARY KEY (Skill_Cd);



CREATE TABLE Social_List
(
	Social_Cd            VARCHAR(10) NOT NULL,
	Descr                 VARCHAR(100) NOT NULL,
	Website              VARCHAR(100) NOT NULL
);



ALTER TABLE Social_List
ADD PRIMARY KEY (Social_Cd);



CREATE TABLE Status_List
(
	Stat_Cd              CHAR(3) NOT NULL,
	Stat_Descr            VARCHAR(100) NOT NULL
);



ALTER TABLE Status_List
ADD PRIMARY KEY (Stat_Cd);



CREATE TABLE Technology_List
(
	Tech_Cd              CHAR(10) NOT NULL,
	Tech_Name            VARCHAR(50) NOT NULL
);



ALTER TABLE Technology_List
ADD PRIMARY KEY (Tech_Cd);



CREATE TABLE Transaction
(
	Txn_Id               INTEGER NOT NULL AUTO_INCREMENT,
	Acct_Id              INTEGER NOT NULL,
	Txn_Dt               DATE NOT NULL,
	Descr                 VARCHAR(100) NOT NULL,
	Amt                  DEC(15,2) NOT NULL DEFAULT 0,
	Debit_Credit_Typ     CHAR(2) NOT NULL DEFAULT "DR",
	CCY_Cd               CHAR(3) NOT NULL DEFAULT "INR",
	Txn_Ctg_Cd           CHAR(10) NULL,
	Txn_Mode_Cd          CHAR(3) NOT NULL,
	PRIMARY KEY (Txn_Id,Acct_Id)
);



CREATE TABLE Transaction_Category_List
(
	Txn_Ctg_Cd           CHAR(10) NOT NULL,
	Txn_Ctg_Name         VARCHAR(50) NOT NULL
);



ALTER TABLE Transaction_Category_List
ADD PRIMARY KEY (Txn_Ctg_Cd);



CREATE TABLE Transaction_Mode_List
(
	Txn_Mode_Cd          CHAR(3) NOT NULL,
	Txn_Mode_Descr        VARCHAR(100) NOT NULL
);



ALTER TABLE Transaction_Mode_List
ADD PRIMARY KEY (Txn_Mode_Cd);



CREATE TABLE Wage_Component_List
(
	Wage_Cmpnt_Id        INTEGER NOT NULL AUTO_INCREMENT,
	Wage_Cmpnt_Descr      VARCHAR(100) NOT NULL,
	Fixed_Variable_Typ   CHAR(1) NOT NULL,
	Elgbl_Amt            DECIMAL(15,2) NOT NULL DEFAULT 0,
	CCY_Cd               CHAR(3) NOT NULL DEFAULT "INR",
	Debit_Credit_Typ     CHAR(2) NOT NULL DEFAULT "CR",
	Freq_Cd              CHAR(1) NOT NULL DEFAULT "M",
	PRIMARY KEY (Wage_Cmpnt_Id)
);



ALTER TABLE Account
ADD FOREIGN KEY R_8 (Branch_Id) REFERENCES Bank_Branch (Branch_Id);



ALTER TABLE Account
ADD FOREIGN KEY R_10 (Acct_CCY_Cd) REFERENCES Currency_List (CCY_Cd);



ALTER TABLE Account
ADD FOREIGN KEY R_11 (Acct_Typ_Cd) REFERENCES Account_Type_List (Acct_Typ_Cd);



ALTER TABLE Account
ADD FOREIGN KEY R_14 (Stat_Cd) REFERENCES Status_List (Stat_Cd);



ALTER TABLE Account_Feature
ADD FOREIGN KEY R_12 (Acct_Id) REFERENCES Account (Acct_Id);



ALTER TABLE Account_Feature
ADD FOREIGN KEY R_13 (Acct_Featr_Cd) REFERENCES Account_Features_List (Acct_Featr_Cd);



ALTER TABLE Account_Feature
ADD FOREIGN KEY R_18 (Fee_CCY_Code) REFERENCES Currency_List (CCY_Cd);



ALTER TABLE Address
ADD FOREIGN KEY R_6 (Country_Cd) REFERENCES Country_List (Country_Cd);



ALTER TABLE Bank_Branch
ADD FOREIGN KEY R_1 (Bank_Cd) REFERENCES Bank (Bank_Cd);



ALTER TABLE Bank_Branch
ADD FOREIGN KEY R_5 (Country_Cd) REFERENCES Country_List (Country_Cd);



ALTER TABLE Bill_Component_List
ADD FOREIGN KEY R_91 (Freq_Cd) REFERENCES Frequency_List (Freq_Cd);



ALTER TABLE Bill_Component_List
ADD FOREIGN KEY R_92 (CCY_Cd) REFERENCES Currency_List (CCY_Cd);



ALTER TABLE Card
ADD FOREIGN KEY R_16 (Acct_Featr_Id) REFERENCES Account_Feature (Acct_Featr_Id);



ALTER TABLE Card
ADD FOREIGN KEY R_17 (Card_Typ_Cd) REFERENCES Card_Type_List (Card_Typ_Cd);



ALTER TABLE Card
ADD FOREIGN KEY R_22 (Partner_Cd) REFERENCES Partner_List (Partner_Cd);



ALTER TABLE Card_PIN
ADD FOREIGN KEY R_79 (Card_No) REFERENCES Card (Card_No);



ALTER TABLE Cheque
ADD FOREIGN KEY R_15 (Acct_Featr_Id) REFERENCES Account_Feature (Acct_Featr_Id);



ALTER TABLE Company_Branch
ADD FOREIGN KEY R_65 (Company_Cd) REFERENCES Company_List (Company_Cd);



ALTER TABLE Company_Branch
ADD FOREIGN KEY R_66 (Country_Cd) REFERENCES Country_List (Country_Cd);



ALTER TABLE Department_List
ADD FOREIGN KEY R_67 (Branch_Id) REFERENCES Company_Branch (Branch_Id);



ALTER TABLE Employee
ADD FOREIGN KEY R_28 (Company_Cd) REFERENCES Company_List (Company_Cd);



ALTER TABLE Employee
ADD FOREIGN KEY R_29 (Person_Id) REFERENCES Person (Person_Id);



ALTER TABLE Employee_Department
ADD FOREIGN KEY R_61 (Company_Cd, Empl_Id) REFERENCES Employee (Company_Cd, Empl_Id);



ALTER TABLE Employee_Department
ADD FOREIGN KEY R_62 (Dept_Cd) REFERENCES Department_List (Dept_Cd);



ALTER TABLE Employee_Designation
ADD FOREIGN KEY R_54 (Company_Cd, Empl_Id) REFERENCES Employee (Company_Cd, Empl_Id);



ALTER TABLE Employee_Designation
ADD FOREIGN KEY R_55 (Dsgntn_Cd) REFERENCES Designation_List (Dsgntn_Cd);



ALTER TABLE Employee_Salary
ADD FOREIGN KEY R_63 (Company_Cd, Empl_Id) REFERENCES Employee (Company_Cd, Empl_Id);



ALTER TABLE Employee_Wage_Dtl
ADD FOREIGN KEY R_43 (Company_Cd, Empl_Id, Wage_Cd) REFERENCES Employee_Salary (Company_Cd, Empl_Id, Wage_Cd);



ALTER TABLE Employee_Wage_Dtl
ADD FOREIGN KEY R_44 (Wage_Cmpnt_Id) REFERENCES Wage_Component_List (Wage_Cmpnt_Id);



ALTER TABLE Employee_Wage_Dtl
ADD FOREIGN KEY R_46 (CCY_Cd) REFERENCES Currency_List (CCY_Cd);



ALTER TABLE Family
ADD FOREIGN KEY R_73 (Husband_Id) REFERENCES Person (Person_Id);



ALTER TABLE Family
ADD FOREIGN KEY R_74 (Wife_Id) REFERENCES Person (Person_Id);



ALTER TABLE Family
ADD FOREIGN KEY R_75 (Child_Id) REFERENCES Person (Person_Id);



ALTER TABLE Grid_Sequence
ADD FOREIGN KEY R_100 (Card_No) REFERENCES Card (Card_No);



ALTER TABLE Account_Holding
ADD FOREIGN KEY R_51 (CCY_Cd) REFERENCES Currency_List (CCY_Cd);


ALTER TABLE Account_Holding
ADD FOREIGN KEY R_99 (Acct_Id) REFERENCES Account (Acct_Id);


ALTER TABLE Account_Balance
ADD FOREIGN KEY R_50 (CCY_Cd) REFERENCES Currency_List (CCY_Cd);


ALTER TABLE Account_Balance
ADD FOREIGN KEY R_98 (Acct_Id) REFERENCES Account (Acct_Id);


ALTER TABLE ISD_Code_List
ADD FOREIGN KEY R_82 (Country_Cd) REFERENCES Country_List (Country_Cd);


ALTER TABLE Person_Address
ADD FOREIGN KEY R_76 (Person_Id) REFERENCES Person (Person_Id);

CREATE TRIGGER ib_Txn BEFORE INSERT ON Transaction
  FOR EACH ROW  
		UPDATE Account_Balance
				SET Txn_Id=NEW.Txn_Id,					
                    As_Of_Dt=NEW.Txn_Dt,
                    Balance_Amt=Balance_Amt+NEW.Amt
		WHERE Acct_Id=NEW.Acct_Id 
          AND CCY_Cd=NEW.CCY_Cd
  ;
  
  CREATE TRIGGER ua_Bal AFTER UPDATE ON Account_Balance
  FOR EACH ROW  
		INSERT Account_Holding
				SET Txn_Id=NEW.Txn_Id,					
		            Acct_Id=NEW.Acct_Id, 
                    As_Of_Dt=NEW.As_Of_Dt,                    
                    CCY_Cd=NEW.CCY_Cd,                    
                    Balance_Amt=NEW.Balance_Amt
  ;
  
  
  #LOAD DATA INFILE 'E:\SourceCodeBase\ErwinModeler\Country_List.csv' INTO TABLE Country_List
  #FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  #LINES TERMINATED BY '\r\n'
  #;
  
  #LOAD DATA INFILE 'E:\SourceCodeBase\ErwinModeler\Currency_List.csv' INTO TABLE Currency_List
  #FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  #LINES TERMINATED BY '\r\n'
  #;
  
  #LOAD DATA INFILE 'E:\SourceCodeBase\ErwinModeler\Frequency_List.csv' INTO TABLE Frequency_List
  #FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  #LINES TERMINATED BY '\r\n'
  #;
  
  
  #LOAD DATA INFILE 'E:\SourceCodeBase\ErwinModeler\Acct_Type_List.csv' INTO TABLE Account_Type_List
  #FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  #LINES TERMINATED BY '\r\n'
  #;
  
  #LOAD DATA INFILE 'E:\SourceCodeBase\ErwinModeler\Acct_Featr_List.csv' INTO TABLE Account_Feature_List
  #FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  #LINES TERMINATED BY '\r\n'
  #;
  
  #LOAD DATA INFILE 'E:\SourceCodeBase\ErwinModeler\Addr_Typ_List.csv' INTO TABLE Address_Type_List
  #FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  #LINES TERMINATED BY '\r\n'
  #;
  
  #LOAD DATA INFILE 'E:\SourceCodeBase\ErwinModeler\Biller_List.csv' INTO TABLE Biller_List
  #FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  #LINES TERMINATED BY '\r\n'
  #;
  
  #LOAD DATA INFILE 'E:\SourceCodeBase\ErwinModeler\Card_Type_List.csv' INTO TABLE Card_Type_List
  #FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  #LINES TERMINATED BY '\r\n'
  #;
  
  #LOAD DATA INFILE 'E:\SourceCodeBase\ErwinModeler\Company_List.csv' INTO TABLE Company_List
  #FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  #LINES TERMINATED BY '\r\n'
  #;