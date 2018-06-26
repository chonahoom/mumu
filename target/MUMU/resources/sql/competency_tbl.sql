create table competencyTbl(
	competencyNumber	INT NOT NULL AUTO_INCREMENT,
    historyNumber	INT NOT NULL,
    competenciesCount TINYINT,
    competencyTitle TINYINT,
    overallPerformanceComment VARCHAR(8000),
    competencyRate TINYINT,
    PRIMARY KEY(competencyNumber)
);