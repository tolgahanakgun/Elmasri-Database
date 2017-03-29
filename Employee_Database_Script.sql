CREATE TABLE Department (
  d_name         char(20)    NOT NULL,
  d_number       numeric(1)  NOT NULL,  
  mgr_ssn        numeric(9)  NOT NULL,   
  mgr_startdate  date        NOT NULL, 
  PRIMARY KEY   (d_number), 
  UNIQUE        (d_name)
);

CREATE TABLE Employee (
  f_name    char(10)    NOT NULL, 
  l_name    char(20)    NOT NULL, 
  ssn       numeric(9)  NOT NULL,   
  bdate     date        NOT NULL, 
  address   char(30)    NOT NULL, 
  sex       char(1)     NOT NULL,
  salary    numeric(5)  NOT NULL, 
  super_ssn numeric(9),
  d_no      numeric(1)  NOT NULL, 
  PRMARY KEY  (ssn), 
  FOREIGN KEY (d_no) REFERENCES Department(d_number)
); 

CREATE TABLE Project (
  p_name      char(20)    NOT NULL, 
  p_number    numeric(2)  NOT NULL, 
  p_location  char(20)    NOT NULL, 
  d_num       numeric(1)  NOT NULL, 
  PRIMARY KEY (p_number), 
  UNIQUE      (p_name), 
  FOREIGN KEY (d_num) REFERENCES Department(d_number)
); 

CREATE TABLE Works_on (
  essn        numeric(9) NOT NULL, 
  p_no        numeric(2) NOT NULL,  
  hours       numeric(5,1),  
  PRIMARY KEY (essn, p_no), 
  FOREIGN KEY (essn) REFERENCES Employee(ssn),
  FOREIGN KEY (p_no) REFERENCES Project(p_number)
);

CREATE TABLE Dependent (
  essn            numeric(9)  NOT NULL,   
  dependent_name  char(10)    NOT NULL, 
  sex             char(1)     NOT NULL, 
  bdate           date        NOT NULL, 
  relationship    char(30)    NOT NULL, 
  PRIMARY KEY     (essn, dependent_name),
  FOREIGN KEY     (essn) REFERENCES Employee(ssn)
); 

create table Dept_locations (
  d_number    numeric(1)  NOT NULL, 
  d_location  char (15)   NOT NULL, 
  PRIMARY KEY (d_number, d_location), 
  FOREIGN KEY (d_number) REFERENCES Department(d_number)
);

INSERT INTO Department VALUES   ('Research',5,333445555,'1988-05-22'),
                                ('Administration',4,987654321,'1995-01-01'),
                                ('Headquarters',1,888665555,'1981-06-19');

INSERT INTO Employee VALUES     ('John','Smith',123456789,'1965-01-09','731 Fondren, Houston TX','M',30000,333445555,5),
                                ('Franklin','Wong',333445555,'1965-12-08','638 Voss, Houston TX','M',40000,888665555,5),
                                ('Alicia','Zelaya',999887777,'1968-01-19','3321 Castle, Spring TX','F',25000,987654321,4),
                                ('Jennifer','Wallace',987654321,'1941-06-20','291 Berry, Bellaire TX','F',43000,888665555,4),
                                ('Ramesh','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble TX','M',38000,333445555,5),
                                ('Joyce','English',453453453,'1972-07-31','5631 Rice, Houston TX','F',25000,333445555,5),
                                ('Ahmad','Jabbar',987987987,'1969-03-29','980 Dallas, Houston TX','M',25000,987654321,4),
                                ('James','Borg',888665555,'1937-11-10','450 Stone, Houston TX','M',55000,null,1);

INSERT INTO Project VALUES      ('ProductX',1,'Bellaire',5),
                                ('ProductY',2,'Sugarland',5),
                                ('ProductZ',3,'Houston',5),
                                ('Computerization',10,'Stafford',4),
                                ('Reorganization',20,'Houston',1),
                                ('Newbenefits',30,'Stafford',4);

INSERT INTO Works_on VALUES     (123456789,1,32.5),
                                (123456789,2,7.5),
                                (666884444,3,40.0),
                                (453453453,1,20.0),
                                (453453453,2,20.0),
                                (333445555,2,10.0),
                                (333445555,3,10.0),
                                (333445555,10,10.0),
                                (333445555,20,10.0),
                                (999887777,30,30.0),
                                (999887777,10,10.0),
                                (987987987,10,35.0),
                                (987987987,30,5.0),
                                (987654321,30,20.0),
                                (987654321,20,15.0),
                                (888665555,20,null);

INSERT INTO Dependent VALUES    (333445555,'Alice','F','1986-04-04','Daughter'),
                                (333445555,'Theodore','M','1983-10-25','Son'),
                                (333445555,'Joy','F','1958-05-03','Spouse'),
                                (987654321,'Abner','M','1942-02-28','Spouse'),
                                (123456789,'Michael','M','1988-01-04','Son'),
                                (123456789,'Alice','F','1988-12-30','Daughter'),
                                (123456789,'Elizabeth','F','1967-05-05','Spouse');

INSERT INTO dept_locations VALUES (1,'Houston'),
                                  (4,'Stafford'),
                                  (5,'Bellaire'),
                                  (5,'Sugarland'), 
                                  (5,'Houston');

ALTER TABLE Department 
 ADD Constraint Dep_emp FOREIGN KEY (mgr_ssn) REFERENCES Employee(ssn);

ALTER TABLE Employee   
 ADD Constraint Emp_emp FOREIGN KEY (super_ssn) REFERENCES Employee(ssn);
