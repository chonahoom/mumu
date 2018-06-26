create table userTbl(
	employeeNumber	INT 	NOT NULL,
    password	VARCHAR(50) NOT NULL,
    name 		VARCHAR(50) NOT NULL,
    grade		VARCHAR(8),
    supervisorNumber 	INT,
    sessionKey VARCHAR(50) NOT NULL DEFAULT 'none',
    sessionLimit TIMESTAMP,
    PRIMARY KEY(employeeNumber)
);
insert into userTbl (employeeNumber, password, name, supervisorNumber) values(100014192,"skgna","nahoom.jo",100013191);
insert into userTbl (employeeNumber, password, name, supervisorNumber) values(100014191,"skgna","chikaso.hemeri",100013191);
insert into userTbl (employeeNumber, password, name, supervisorNumber) values(100014190,"skgna","nguyen.bach",100013192);
insert into userTbl (employeeNumber, password, name, supervisorNumber) values(100013192,"skgna","jungu.han",100012191);
insert into userTbl (employeeNumber, password, name, supervisorNumber) values(100013191,"skgna","aram.lee",100012191);
insert into userTbl (employeeNumber, password, name, supervisorNumber) values(100012191,"skgna","shojiro.ishii",100011191);
insert into userTbl (employeeNumber, password, name, supervisorNumber) values(100011191,"skgna","kazuaki.ban",000000000);