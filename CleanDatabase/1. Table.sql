
-- START - DROP TABLES ------------------------------------------------------------------------------------
/* 
	Tables with foreign key need to drop the child tables first before the parent table 
	e.g.
		Child Table: 	fsxcore_modulesubitem
		Parent Table: 	fsxcore_moduleitems
*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `fsxcore_actions`;
DROP TABLE IF EXISTS `fsxcore_lookupcategories`;
DROP TABLE IF EXISTS `fsxcore_lookupitems`;
DROP TABLE IF EXISTS `fsxcore_moduleitems`;
/* DROP TABLE IF EXISTS `fsxcore_modulesubitem`; */
DROP TABLE IF EXISTS `fsxcore_roles`;
DROP TABLE IF EXISTS `fsxcore_users`;
-- END ----------------------------------------------------------------------------------------------------


-- START - CREATE TABLES ----------------------------------------------------------------------------------
CREATE TABLE `fsxcore_actions` (
	`ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`ActionID` INT(11) NOT NULL,
	`ActionName` VARCHAR(250) DEFAULT '',
	PRIMARY KEY (`ActionID`),
	KEY `ID` USING BTREE (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Table for look up categories
CREATE TABLE `fsxcore_lookupcategories` (
	`ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`LookUpCategoryID` INT(11) NOT NULL,
	`LookUpCategory` VARCHAR(250) DEFAULT '',
	PRIMARY KEY (`LookUpCategoryID`),
	KEY `ID` USING BTREE (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Table for look up items
CREATE TABLE `fsxcore_lookupitems` (
	`ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`LookUpCategoryID` INT(11) NOT NULL,
	`LookUpItemID` INT(11) NOT NULL,
	`LookUpItemName` VARCHAR(250) DEFAULT '',
	PRIMARY KEY (`ID`),
	KEY `LookUpItemID` USING BTREE (`LookUpItemID`),
	FOREIGN KEY (`LookUpCategoryID`) REFERENCES `fsxcore_lookupcategories` (`LookUpCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Table for top level module items
CREATE TABLE `fsxcore_moduleitems` (
	`ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`ModuleItemID` INT(11) NOT NULL,
	`ModuleItemParentID` INT(11) DEFAULT 0,
	`ModuleItemLandingID` INT(11) DEFAULT 0,
	`ModuleName` VARCHAR(250) DEFAULT '',
	`Description` VARCHAR(250) DEFAULT '',
	`HasChildren` BIT(1) DEFAULT 0,
	`IconPath` VARCHAR(250) DEFAULT '',
	PRIMARY KEY (`ModuleItemID`),
	KEY `ID` USING BTREE (`ID`),
	KEY `ModuleItemParentID` USING BTREE (`ModuleItemParentID`),
	KEY `ModuleItemLandingID` USING BTREE (`ModuleItemLandingID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Table for sub level module items
/* 
CREATE TABLE `fsxcore_modulesubitem` (
	`ID` INT(11) NOT NULL AUTO_INCREMENT,
	`ModuleSubItemID` INT(11) NOT NULL,
	`ModuleItemParentID` INT(11) DEFAULT NULL,
	`ModuleName` VARCHAR(250) DEFAULT NULL,
	`Description` VARCHAR(250) DEFAULT NULL,
	`HasChildren` BIT(1) DEFAULT NULL,
	PRIMARY KEY (`ModuleSubItemID`),
	KEY `ID` USING BTREE (`ID`),
	KEY `ModuleItemParentID` USING BTREE (`ModuleItemParentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8; 
*/

-- Table for roles
CREATE TABLE `fsxcore_roles` (
	`RoleID` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`RoleName` VARCHAR(250) DEFAULT '',
	`CreatedUserID` BIGINT(20) NOT NULL,
	`CreatedDate` DATETIME NOT NULL,
	`LastModifiedUserID` BIGINT(20) NOT NULL,
	`LastUpdate` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`RoleID`),
	KEY `CreatedUserID` USING BTREE (`CreatedUserID`),
	KEY `LastModifiedUserID` USING BTREE (`LastModifiedUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Table for roles privileges
CREATE TABLE `fsxcore_roles_privileges` (
	`ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`RoleID` BIGINT(20) NOT NULL,
	`ModuleItemID` INT(11) NOT NULL,
	`ActionID` INT(11) NOT NULL,
	`IsEnabled` BIT(1) DEFAULT 0,
	`CreatedUserID` BIGINT(20) NOT NULL,
	`CreatedDate` DATETIME NOT NULL,
	`LastModifiedUserID` BIGINT(20) NOT NULL,
	`LastUpdate` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`ID`),
	KEY `RoleID` USING BTREE (`RoleID`),
	KEY `ModuleItemID` USING BTREE (`ModuleItemID`),
	KEY `CreatedUserID` USING BTREE (`CreatedUserID`),
	KEY `LastModifiedUserID` USING BTREE (`LastModifiedUserID`),
	CONSTRAINT `fsxcore_actions_actionid_fk` FOREIGN KEY (`ActionID`) REFERENCES `fsxcore_actions` (`ActionID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Table for users
CREATE TABLE `fsxcore_users` (
	`ID` INT(11) NOT NULL AUTO_INCREMENT,
	`UserID` BIGINT(20) NOT NULL,
	`FirstName` VARCHAR(250) DEFAULT '',
	`MiddleName` VARCHAR(250) DEFAULT '',
	`LastName` VARCHAR(250) DEFAULT '',
	`Username` VARCHAR(250) NOT NULL,
	`Password` VARCHAR(250) NOT NULL,
	`RoleID` BIGINT(20) NOT NULL,
	`Position` VARCHAR(150) NOT NULL,
	`EmailAddress` VARCHAR(150) NOT NULL,
	PRIMARY KEY (`UserID`),
	KEY `ID` USING BTREE (`ID`),
	KEY `RoleID` USING BTREE (`RoleID`),
	CONSTRAINT `fsxcore_users_roleid_fk` FOREIGN KEY (`RoleID`) REFERENCES `fsxcore_roles` (`RoleID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



SET FOREIGN_KEY_CHECKS = 1;
-- END ----------------------------------------------------------------------------------------------------