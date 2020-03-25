
-- Need to add FOREIGN_KEY_CHECKS due to Cannot truncate a table referenced in a foreign key constraint
SET FOREIGN_KEY_CHECKS = 0;

-- Data for overall module items
TRUNCATE TABLE `fsxcore_moduleitems`;
INSERT INTO `fsxcore_moduleitems` (ModuleItemId, ModuleItemParentID, ModuleItemLandingID, ModuleName, Description, HasChildren, IconPath) VALUES 
(1,0,1,"Parent","",false,"")
,(2,1,0,"Dashboard","Shows graphical representation of records",false,"/Images/Icons/dashboard.png")
,(3,1,12,"CRM","Shows customer's details",true,"/Images/Icons/users.png")
,(4,1,0,"Asset","Shows asset details",false,"/Images/Icons/vehicle.png")
,(5,1,0,"Asset Hire","Loads list of existing records in the inventory",false,"/Images/Icons/assethire.png")
,(6,1,0,"Maintenance","Shows maintenance details",false,"/Images/Icons/maintenance.png")
,(7,1,0,"Stock","Shows stock details",false,"/Images/Icons/stocks.png")
,(8,1,0,"Sales","Shows sales details",false,"/Images/Icons/sales.png")
,(9,1,0,"Human Resource","Shows human resource details",false,"/Images/Icons/humanresource.png")
,(10,1,0,"Finance","Shows finance details",false,"/Images/Icons/finance.png")
,(11,1,0,"Report","Shows report details",false,"/Images/Icons/report.png")
,(12,3,0,"My Panel","Graphical representation of collected records",false,"/Images/Icons/sales.png")
,(13,3,0,"Account","Shows account  details",false,"/Images/Icons/users.png")
,(14,3,0,"Deals","Shows deals  details",false,"/Images/Icons/report.png")
,(15,3,0,"Collaboration","Shows collaboration  details",false,"/Images/Icons/report.png")
,(16,3,0,"Marketing","Shows marketing  details",false,"/Images/Icons/report.png")
,(17,3,0,"Support","Shows support  details",false,"/Images/Icons/report.png")
,(18,3,0,"Report","Shows report  details",false,"/Images/Icons/report.png");

TRUNCATE `fsxcore_lookupcategories`;
INSERT INTO `fsxcore_lookupcategories` (LookUpCatID, LookUpCategory) VALUES (1,"RADIAL_MENU_ACTIONS");

TRUNCATE `fsxcore_lookupitems`;
INSERT INTO `fsxcore_lookupitems` (LookUpCatID, LookUpItemID, LookUpItemName) VALUES 
(1,1,"ADD")
,(1,2,"EDIT")
,(1,3,"DELETE")
,(1,4,"PRINT")
,(1,5,"EXPORT")
,(1,6,"SAVE")
,(1,7,"CANCEL");

SET FOREIGN_KEY_CHECKS = 1;