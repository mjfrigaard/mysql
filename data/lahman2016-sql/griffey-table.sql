/*
***************************************************************************
-- This is code to create: Griffeys table
-- Authored by and feedback to mjfrigaard@gmail.com
-- MIT License
-- Version: 1.0
***************************************************************************
*/

/*
 select database
*/

USE lahman2016;

/*
 create new table
*/

CREATE TABLE Griffeys (
    playerID varchar(255) NOT NULL,
    birthYear int(11) NOT NULL,
    nameFirst VARCHAR(255) NOT NULL,
    nameLast VARCHAR(255) NOT NULL,
    weight int(11),
    height int(11),
    bats varchar(255),
    throws varchar(255),
    retroID varchar(255),
    bbrefID varchar(255),
    teamID varchar(255),   
    lgID varchar(255),
    yearID int(11),
    G int(11),
    AB int(11),
    R int(11),
    H int(11),
    HR int(11),
    RBI int(11),
    BB int(11),
    SO int(11)
);

/*
 insert the select query into the new columns
*/

INSERT INTO Griffeys (
  playerID, 
  birthYear, 
  nameFirst, 
  nameLast, 
  weight, 
  height, 
  bats, 
  throws, 
  retroID, 
  bbrefID,
  teamID,
  lgID,
  yearID,
  G,
  AB,
  R,
  H,
  HR,
  RBI,
  BB,
  SO
)
SELECT 
  -- Master columns
  mas.playerID, 
  mas.birthYear, 
  mas.nameFirst, 
  mas.nameLast, 
  mas.weight, 
  mas.height, 
  mas.bats, 
  mas.throws, 
  mas.retroID, 
  mas.bbrefID,
  -- Batting columns
  bat.teamID,
  bat.lgID,
  bat.yearID,
  bat.G,
  bat.AB,
  bat.R,
  bat.H,
  bat.HR,
  bat.RBI,
  bat.BB,
  bat.SO
  
FROM 
    Master AS mas
      INNER JOIN 
    Batting AS bat ON mas.playerID = bat.playerID
  WHERE nameLast = "Griffey";
  
-- End file