create table contentTbl(
	contentNumber INT NOT NULL AUTO_INCREMENT,
    historyNumber INT NOT NULL,
    taskNumber	TINYINT ,
    taskType TINYINT NOT NULL,
    taskWeight INT,
    taskDate VARCHAR(35),
    taskGoalTitle VARCHAR(70),
    taskGoalDescription VARCHAR(11100),
    taskCompetency VARCHAR(5000),
    taskEvaluationComment VARCHAR(5000),
    taskRate INT,
    primary key(contentNumber)
);