--
-- Sergio Torró
-- 26/05/2013
--

DROP TABLE IF EXISTS 'discipline';
DROP TABLE IF EXISTS 'difficulty';
DROP TABLE IF EXISTS 'language';
DROP TABLE IF EXISTS 'questions';
DROP TABLE IF EXISTS 'answers';
DROP TABLE IF EXISTS 'ans_que';


CREATE TABLE 'discipline' (
	'pkid' INTEGER PRIMARY KEY  NOT NULL , 
	'name' VARCHAR NOT NULL
);

INSERT INTO 'discipline' ('name') VALUES ('History');
INSERT INTO 'discipline' ('name') VALUES ('Geography');
INSERT INTO 'discipline' ('name') VALUES ('Politics');
INSERT INTO 'discipline' ('name') VALUES ('Technology');
INSERT INTO 'discipline' ('name') VALUES ('Physics');
INSERT INTO 'discipline' ('name') VALUES ('Chemistry');
INSERT INTO 'discipline' ('name') VALUES ('Literature');
INSERT INTO 'discipline' ('name') VALUES ('Music');
INSERT INTO 'discipline' ('name') VALUES ('Art');

CREATE TABLE 'difficulty' (
	'pkid' INTEGER PRIMARY KEY  NOT NULL , 
	'name' VARCHAR NOT NULL
);

INSERT INTO 'difficulty' ('name') VALUES ('Easy');
INSERT INTO 'difficulty' ('name') VALUES ('Normal');
INSERT INTO 'difficulty' ('name') VALUES ('Hard');

CREATE TABLE 'language' (
	'pkid' INTEGER PRIMARY KEY  NOT NULL , 
	'name' VARCHAR NOT NULL
);

INSERT INTO 'language' ('name') VALUES ('Spanish');
INSERT INTO 'language' ('name') VALUES ('English');
INSERT INTO 'language' ('name') VALUES ('French');
INSERT INTO 'language' ('name') VALUES ('German');

CREATE TABLE 'questions' (
	'pkid' INTEGER PRIMARY KEY  NOT NULL , 
	'statement' VARCHAR NOT NULL, 
	'language' INTEGER NOT NULL, 
	'difficulty' INTEGER NOT NULL, 
	'discipline' INTEGER NOT NULL,
	FOREIGN KEY(language) REFERENCES language(pkid),
	FOREIGN KEY(difficulty) REFERENCES difficulty(pkid),
	FOREIGN KEY(discipline) REFERENCES discipline(pkid)
) ;

CREATE TABLE 'answers' (
	'pkid' INTEGER PRIMARY KEY  NOT NULL , 
	'text' VARCHAR NOT NULL
) ;

CREATE TABLE 'ans_que' (
	'pkid' INTEGER PRIMARY KEY  NOT NULL , 
	'answer' INTEGER NOT NULL, 
	'question' INTEGER NOT NULL, 
	'right' INTEGER NOT NULL,
	FOREIGN KEY(question) REFERENCES questions(pkid),
	FOREIGN KEY(answer) REFERENCES answers(pkid)
) ;

CREATE TABLE 'scoreboard' (
	'pkid' INTEGER PRIMARY KEY  NOT NULL , 
	'game_mode' VARCHAR NOT NULL, 
	'value' INTEGER NOT NULL
) ;

INSERT INTO 'scoreboard' ('game_mode', 'value') VALUES ('machina', 0);
INSERT INTO 'scoreboard' ('game_mode', 'value') VALUES ('tempus', 0);
INSERT INTO 'scoreboard' ('game_mode', 'value') VALUES ('simius', 0);