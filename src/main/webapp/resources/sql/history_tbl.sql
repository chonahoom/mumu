create table historyTbl(
	historyNumber INT NOT NULL AUTO_INCREMENT,
    historyWriter INT NOT NULL,
    historyTitle VARCHAR(70) NOT NULL,
    historyTerm	TINYINT NOT NULL,
    historyVersion TINYINT NOT NULL,
    historyYear INT NOT NULL,
    historyUpdatedDate DATETIME DEFAULT NOW(),

    PRIMARY KEY(historyNumber)
);