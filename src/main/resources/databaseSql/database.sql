-- --------------------------------------------------------
-- Host:                         apcnprgdbdv01.cc9o8mvrbwyt.ap-southeast-1.rds.amazonaws.com
-- Server version:               5.7.19-log - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for apcnprgdbdv01
/*CREATE DATABASE IF NOT EXISTS `apcnprgdbdv01` /*!40100 DEFAULT CHARACTER SET latin1 */;
/*USE `apcnprgdbdv01`;*/

-- Dumping structure for table apcnprgdbdv01.PG_ANZ_OPERTUNITY
CREATE TABLE IF NOT EXISTS `PG_ANZ_OPERTUNITY` (
  `OpertunityID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OpportunityName` varchar(350) DEFAULT NULL,
  `SupplyingQuarry` varchar(350) DEFAULT NULL,
  `Region` varchar(350) DEFAULT NULL,
  `SalesOffice` varchar(350) DEFAULT NULL,
  `MarketSegment` varchar(350) DEFAULT NULL,
  `Address` varchar(350) DEFAULT NULL,
  `City` varchar(350) DEFAULT NULL,
  `State` varchar(350) DEFAULT NULL,
  `Postcode` varchar(350) DEFAULT NULL,
  `MapRadius` varchar(350) DEFAULT NULL,
  `OpportunityVolume` int(11) DEFAULT NULL,
  `ProjectProductDriver` varchar(350) DEFAULT NULL,
  `UnitRateTonne` double DEFAULT NULL,
  `CloseDate` date DEFAULT NULL,
  `WinMonth` date DEFAULT NULL,
  `OpportunitySupplyStart` date DEFAULT NULL,
  `IncludeinForecast` varchar(350) DEFAULT NULL,
  `CreateQuoteNow` varchar(350) DEFAULT NULL,
  `CreationDate` date DEFAULT NULL,
  `CreatedBy` varchar(350) DEFAULT NULL,
  `Stage1` varchar(40) DEFAULT NULL,
  `Stage1date` date DEFAULT NULL,
  `Stage2` varchar(40) DEFAULT NULL,
  `Stage2date` date DEFAULT NULL,
  `Stage3` varchar(40) DEFAULT NULL,
  `Stage3date` date DEFAULT NULL,
  `Stage4` varchar(40) DEFAULT NULL,
  `Stage4date` date DEFAULT NULL,
  `Stage5` varchar(40) DEFAULT NULL,
  `Stage5date` date DEFAULT NULL,
  `GLatitude` varchar(200) DEFAULT NULL,
  `GLongitude` varchar(200) DEFAULT NULL,
  `SalesForceOportunityID` varchar(400) DEFAULT NULL,
  `SalesForceUserID` varchar(400) DEFAULT NULL,
  `OwnerId` varchar(250) DEFAULT NULL,
  `Street` varchar(250) DEFAULT NULL,
  `SalesGroup` varchar(250) DEFAULT NULL,
  `PlantCode` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`OpertunityID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_ANZ_PRICEMASTER
CREATE TABLE IF NOT EXISTS `PG_ANZ_PRICEMASTER` (
  `PriceMasterID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ApproverID` bigint(20) DEFAULT NULL,
  `SalesManName` varchar(350) DEFAULT NULL,
  `PriceRange` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PriceMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_ANZ_PRODUCT
CREATE TABLE IF NOT EXISTS `PG_ANZ_PRODUCT` (
  `ProductID` bigint(20) NOT NULL AUTO_INCREMENT,
  `QuotationID` bigint(20) DEFAULT NULL,
  `opertunityID` bigint(20) DEFAULT NULL,
  `ProductLookup` varchar(350) DEFAULT NULL,
  `Product` varchar(350) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `repeatProduct` varchar(350) DEFAULT NULL,
  `approverName` varchar(200) DEFAULT NULL,
  `approvalStatus` varchar(50) DEFAULT NULL,
  `approvalDate` date DEFAULT NULL,
  `OpportunityName` varchar(300) DEFAULT NULL,
  `UserName` varchar(300) DEFAULT NULL,
  `OpportunityRefID` varchar(300) DEFAULT NULL,
  `ProductCreatedDate` date DEFAULT NULL,
  `quotedprice` varchar(200) DEFAULT NULL,
  `quotedpriceDate` date DEFAULT NULL,
  `AutoApprovalStatus` varchar(200) DEFAULT NULL,
  `Actualquotedprice` varchar(200) DEFAULT NULL,
  `productExbinPrice` varchar(200) DEFAULT NULL,
  `productDiscount` varchar(200) DEFAULT NULL,
  `productFreight` varchar(200) DEFAULT NULL,
  `productFinalPrice` varchar(200) DEFAULT NULL,
  `discountMaster` bigint(20) DEFAULT NULL,
  `PlntCode` varchar(200) DEFAULT NULL,
  `userRejectComment` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_ANZ_QUOTATION
CREATE TABLE IF NOT EXISTS `PG_ANZ_QUOTATION` (
  `QuotationID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OpertunityID` varchar(250) DEFAULT NULL,
  `SalesGroup` varchar(350) DEFAULT NULL,
  `OppName` varchar(350) DEFAULT NULL,
  `Address` varchar(350) DEFAULT NULL,
  `City` varchar(350) DEFAULT NULL,
  `State` varchar(200) DEFAULT NULL,
  `Postcode` varchar(50) DEFAULT NULL,
  `QuotationSAP` varchar(50) DEFAULT NULL,
  `MarketSegment` varchar(300) DEFAULT NULL,
  `ProjectVolume` int(11) DEFAULT NULL,
  `ShowVolumesonQuote` varchar(50) DEFAULT NULL,
  `QuoteValidFrom` date DEFAULT NULL,
  `ValidforAcceptance` date DEFAULT NULL,
  `RiseandFallDate` date DEFAULT NULL,
  `SupplyStartDate` date DEFAULT NULL,
  `SupplyEndDate` date DEFAULT NULL,
  `AccountLookup` varchar(300) DEFAULT NULL,
  `Account` varchar(250) DEFAULT NULL,
  `street` varchar(350) DEFAULT NULL,
  `PONumber` varchar(340) DEFAULT NULL,
  `IncoTerms` varchar(250) DEFAULT NULL,
  `EndUse` varchar(200) DEFAULT NULL,
  `AllAreas` varchar(200) DEFAULT NULL,
  `QuotedKms` varchar(200) DEFAULT NULL,
  `TruckType` varchar(200) DEFAULT NULL,
  `AltTruckType` varchar(200) DEFAULT NULL,
  `AltTruckRate` varchar(200) DEFAULT NULL,
  `ExcludeMinCartage` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `SalesforceOpportunityID` varchar(300) DEFAULT NULL,
  `creationDate` varchar(300) DEFAULT NULL,
  `createdBy` varchar(300) DEFAULT NULL,
  `userSalesforceID` varchar(300) DEFAULT NULL,
  `SalesOrg` varchar(300) DEFAULT NULL,
  `Division` varchar(300) DEFAULT NULL,
  `SalesOffice` varchar(300) DEFAULT NULL,
  `Plant` varchar(300) DEFAULT NULL,
  `Customer` varchar(300) DEFAULT NULL,
  `Region` varchar(300) DEFAULT NULL,
  `AccountManager` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`QuotationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_APPROVAL_STATUS_MASTER
CREATE TABLE IF NOT EXISTS `PG_APPROVAL_STATUS_MASTER` (
  `APPROVALSTATUSID` bigint(20) NOT NULL AUTO_INCREMENT,
  `STATUSVALUE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`APPROVALSTATUSID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_CUSTOMER_MASTER
CREATE TABLE IF NOT EXISTS `PG_CUSTOMER_MASTER` (
  `CUSTOMER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` varchar(250) DEFAULT NULL,
  `SalesOrg` varchar(250) DEFAULT NULL,
  `Name1` varchar(250) DEFAULT NULL,
  `Name2` varchar(250) DEFAULT NULL,
  `Name3` varchar(250) DEFAULT NULL,
  `SearchTerm` varchar(250) DEFAULT NULL,
  `Country` varchar(250) DEFAULT NULL,
  `PO` varchar(250) DEFAULT NULL,
  `SalesOffice` varchar(250) DEFAULT NULL,
  `SalesGroup` varchar(250) DEFAULT NULL,
  `CreditRepGroup` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_DISCOUNT_APPROVALS
CREATE TABLE IF NOT EXISTS `PG_DISCOUNT_APPROVALS` (
  `DISCOUNTAPPROVALID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISCOUNTAPPROVALMASTERID` bigint(20) DEFAULT NULL,
  `APPROVERID` bigint(20) DEFAULT NULL,
  `APPROVERSTATUSID` bigint(20) DEFAULT NULL,
  `DISCOUNTREFVALUE` double DEFAULT NULL,
  `STATEID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DISCOUNTAPPROVALID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_DISCOUNT_APPROVAL_MASTER
CREATE TABLE IF NOT EXISTS `PG_DISCOUNT_APPROVAL_MASTER` (
  `DISCOUNTAPPROVALMASTERID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISCOUNTVALUE` double DEFAULT NULL,
  `DISCOUNTAPPROVALSTATUSID` bigint(20) DEFAULT NULL,
  `DISCOUNTAPPROVALLEVELS` bigint(20) DEFAULT NULL,
  `STATEID` bigint(20) DEFAULT NULL,
  `EMAILID` varchar(650) DEFAULT NULL,
  `QUOTATIONID` bigint(20) DEFAULT NULL,
  `OPPORTUNITYID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DISCOUNTAPPROVALMASTERID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_DISCOUNT_MASTER
CREATE TABLE IF NOT EXISTS `PG_DISCOUNT_MASTER` (
  `DISCOUNTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLEID` bigint(20) DEFAULT NULL,
  `STATEID` bigint(20) DEFAULT NULL,
  `DISCOUNTNEW` double DEFAULT NULL,
  `DISCOUNTOLD` double DEFAULT NULL,
  PRIMARY KEY (`DISCOUNTID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_DIVISIONNAME_MASTER
CREATE TABLE IF NOT EXISTS `PG_DIVISIONNAME_MASTER` (
  `DivisionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DivisionCode` varchar(350) DEFAULT NULL,
  `DivisionName` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`DivisionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_EMPLOYEE_APPROVAL
CREATE TABLE IF NOT EXISTS `PG_EMPLOYEE_APPROVAL` (
  `EmployeeApprovalID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmployeeID` bigint(20) NOT NULL,
  `EmployeeEmailID` varchar(350) DEFAULT NULL,
  `Approval1EmailID` varchar(350) DEFAULT NULL,
  `Approval2EmailID` varchar(350) DEFAULT NULL,
  `Approval3EmailID` varchar(350) DEFAULT NULL,
  `Approval4EmailID` varchar(350) DEFAULT NULL,
  `Approval5EmailID` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`EmployeeApprovalID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_EMPLOYEE_APPROVAL_MASTER
CREATE TABLE IF NOT EXISTS `PG_EMPLOYEE_APPROVAL_MASTER` (
  `EmployeeApprovalMasterID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmployeeID` bigint(20) NOT NULL,
  `EmployeeEmailID` varchar(350) DEFAULT NULL,
  `ProductID` bigint(20) NOT NULL,
  `opportunityId` bigint(20) NOT NULL,
  `quotationId` bigint(20) NOT NULL,
  `StateID` bigint(20) NOT NULL,
  `Discount` double NOT NULL,
  `FinalStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`EmployeeApprovalMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_EMPLOYEE_APPROVAL_STATUS
CREATE TABLE IF NOT EXISTS `PG_EMPLOYEE_APPROVAL_STATUS` (
  `EmployeeApprovalStatusID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmployeeApprovalMasterID` bigint(20) NOT NULL,
  `opportunityId` bigint(20) NOT NULL,
  `quotationId` bigint(20) NOT NULL,
  `ProductID` bigint(20) NOT NULL,
  `EmployeeID` varchar(250) NOT NULL,
  `ApprovalEmailID` varchar(350) DEFAULT NULL,
  `ApprovalStatus` varchar(50) DEFAULT NULL,
  `ApprovalDiscount` double DEFAULT NULL,
  `userNote` varchar(350) DEFAULT NULL,
  `takeApprovalDate` date DEFAULT NULL,
  PRIMARY KEY (`EmployeeApprovalStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_EMPLOYEE_MASTER
CREATE TABLE IF NOT EXISTS `PG_EMPLOYEE_MASTER` (
  `EmployeeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmployeeName` varchar(350) DEFAULT NULL,
  `EmployeeEmailID` varchar(350) DEFAULT NULL,
  `Sales_Office` varchar(350) DEFAULT NULL,
  `Region` varchar(350) DEFAULT NULL,
  `Country` varchar(350) DEFAULT NULL,
  `Location` varchar(350) DEFAULT NULL,
  `EmpContactNo` varchar(350) DEFAULT NULL,
  `EmpCompanyName` varchar(350) DEFAULT NULL,
  `EmpActiveStatus` varchar(350) DEFAULT NULL,
  `Division` varchar(350) DEFAULT NULL,
  `SalesForce_UserID` varchar(350) DEFAULT NULL,
  `OpcoName` varchar(300) DEFAULT NULL,
  `RoleId` bigint(20) DEFAULT NULL,
  `StateId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_MARKET_SEGMENT_MASTER
CREATE TABLE IF NOT EXISTS `PG_MARKET_SEGMENT_MASTER` (
  `Market_Segment_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MarketSegment` varchar(250) DEFAULT NULL,
  `Market_Description` varchar(250) DEFAULT NULL,
  `Humes` varchar(250) DEFAULT NULL,
  `RMX` varchar(250) DEFAULT NULL,
  `AGG` varchar(250) DEFAULT NULL,
  `CEM` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Market_Segment_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_MATERIALS_MASTER
CREATE TABLE IF NOT EXISTS `PG_MATERIALS_MASTER` (
  `MATERIALS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Material` varchar(250) DEFAULT NULL,
  `MaterialDescription` varchar(250) DEFAULT NULL,
  `Plnt` varchar(250) DEFAULT NULL,
  `SLoc` varchar(250) DEFAULT NULL,
  `BUn` varchar(250) DEFAULT NULL,
  `MaterialsGroup` varchar(250) DEFAULT NULL,
  `SOrg` varchar(250) DEFAULT NULL,
  `DelInd` varchar(250) DEFAULT NULL,
  `ExtMaterialGrp` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`MATERIALS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_OPPORTUNITY_STATUS
CREATE TABLE IF NOT EXISTS `PG_OPPORTUNITY_STATUS` (
  `OppStatusID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OpertunityID` bigint(20) NOT NULL,
  `OpportunityName` varchar(650) DEFAULT NULL,
  `SalesForceOportunityID` varchar(250) DEFAULT NULL,
  `Status` varchar(250) DEFAULT NULL,
  `StatusCreatedDate` varchar(250) DEFAULT NULL,
  `ModifiedDate` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`OppStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_PLANT_MASTER
CREATE TABLE IF NOT EXISTS `PG_PLANT_MASTER` (
  `PALNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PLANTCODE` bigint(20) NOT NULL DEFAULT '0',
  `Plant_Name` varchar(250) DEFAULT NULL,
  `CountryKey` varchar(250) DEFAULT NULL,
  `Region` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`PALNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_PriceGlider_OTP_Master
CREATE TABLE IF NOT EXISTS `PG_PriceGlider_OTP_Master` (
  `OTPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OTPEmailID` varchar(255) NOT NULL,
  `OTPNumber` varchar(255) DEFAULT NULL,
  `OTPAuthToken` varchar(255) DEFAULT NULL,
  `OTPGeneratedDate` varchar(255) DEFAULT NULL,
  `OTPFlag` varchar(255) DEFAULT NULL,
  `OTPFlagStatus` varchar(255) DEFAULT NULL,
  `OTPExpireDate` varchar(255) DEFAULT NULL,
  `OTPFlagTwo` varchar(255) DEFAULT NULL,
  `OTPFlagThree` varchar(255) DEFAULT NULL,
  `DeviceID` varchar(255) DEFAULT NULL,
  `ApplicationName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OTPID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_PRODUCT_ENDUSE_MASTER
CREATE TABLE IF NOT EXISTS `PG_PRODUCT_ENDUSE_MASTER` (
  `Product_enduse_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductEndUse` varchar(250) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Humes` varchar(250) DEFAULT NULL,
  `RMX` varchar(250) DEFAULT NULL,
  `AGG` varchar(250) DEFAULT NULL,
  `CEM` varchar(250) DEFAULT NULL,
  `MarketSegment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Product_enduse_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_PRODUCT_PRICING
CREATE TABLE IF NOT EXISTS `PG_PRODUCT_PRICING` (
  `PRODUCTPRICINGID` bigint(20) NOT NULL AUTO_INCREMENT,
  `STATEID` bigint(20) DEFAULT NULL,
  `MATERIALSID` bigint(20) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  PRIMARY KEY (`PRODUCTPRICINGID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_REGION_MASTER
CREATE TABLE IF NOT EXISTS `PG_REGION_MASTER` (
  `REGION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Region_Code` varchar(250) DEFAULT NULL,
  `Region_Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`REGION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_ROLE_MASTER
CREATE TABLE IF NOT EXISTS `PG_ROLE_MASTER` (
  `ROLEID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLENAME` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_SalesGroup
CREATE TABLE IF NOT EXISTS `PG_SalesGroup` (
  `SalesGroupID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SalesGroup` varchar(50) DEFAULT NULL,
  `SGDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SalesGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_SalesOffice
CREATE TABLE IF NOT EXISTS `PG_SalesOffice` (
  `SalesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SalesOffice` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SalesID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_SO_SG_CUSTOMER_MASTER
CREATE TABLE IF NOT EXISTS `PG_SO_SG_CUSTOMER_MASTER` (
  `SO_SG_CUSTOMER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SalesOrganization` varchar(250) DEFAULT NULL,
  `PersonnelNumber` bigint(40) DEFAULT NULL,
  `SalesOffice` varchar(250) DEFAULT NULL,
  `SalesGroup` varchar(250) DEFAULT NULL,
  `Customer` varchar(250) DEFAULT NULL,
  `ValidFrom` varchar(250) DEFAULT NULL,
  `ValidTo` varchar(250) DEFAULT NULL,
  `Pricegroup` varchar(250) DEFAULT NULL,
  `MarketSegment` varchar(250) DEFAULT NULL,
  `ProductEndUse` varchar(250) DEFAULT NULL,
  `CustomerName` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`SO_SG_CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_SO_SG_DEFAULT
CREATE TABLE IF NOT EXISTS `PG_SO_SG_DEFAULT` (
  `SO_SG_GroupID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SalesOffice` varchar(50) DEFAULT NULL,
  `SalesGroup` varchar(50) DEFAULT NULL,
  `QTCActive` varchar(50) DEFAULT NULL,
  `ViewId` varchar(50) DEFAULT NULL,
  `MapZonesActive` varchar(50) DEFAULT NULL,
  `ClosestPltActive` varchar(50) DEFAULT NULL,
  `InquiryValidToDate` bigint(20) DEFAULT NULL,
  `QuoteValidTo` bigint(20) DEFAULT NULL,
  `VehicleType` varchar(100) DEFAULT NULL,
  `AltTruckType` varchar(100) DEFAULT NULL,
  `AltTTRate` float DEFAULT NULL,
  `WetmixRate` float DEFAULT NULL,
  `StabiliserRate` float DEFAULT NULL,
  PRIMARY KEY (`SO_SG_GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_SO_SG_PLANT_MASTER
CREATE TABLE IF NOT EXISTS `PG_SO_SG_PLANT_MASTER` (
  `SO_SG_PALNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SAPPlant` varchar(250) DEFAULT NULL,
  `TollingPlant` varchar(250) DEFAULT NULL,
  `SalesOrganization` varchar(150) DEFAULT NULL,
  `ShippingPointReceiving_POINT` varchar(150) DEFAULT NULL,
  `SalesOffice` varchar(150) DEFAULT NULL,
  `SalesGroup` varchar(150) DEFAULT NULL,
  `Division` varchar(150) DEFAULT NULL,
  `LineOfBusiness` varchar(150) DEFAULT NULL,
  `PlantType` varchar(150) DEFAULT NULL,
  `plantDetails` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`SO_SG_PALNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_STATE_DISCOUNT
CREATE TABLE IF NOT EXISTS `PG_STATE_DISCOUNT` (
  `StateDiscountID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Product` varchar(350) DEFAULT NULL,
  `Material_Desc` varchar(250) DEFAULT NULL,
  `Plant_code` varchar(250) DEFAULT NULL,
  `STATE_ID` bigint(20) NOT NULL,
  `DCP_Account_MGR` double DEFAULT NULL,
  `DCP_Sales_MGR` double DEFAULT NULL,
  `DCP_Commercial_MGR` double DEFAULT NULL,
  `DCP_State_MGR` double DEFAULT NULL,
  `DCP_National_MGR` double DEFAULT NULL,
  `DCP_EGM_MGR` double DEFAULT NULL,
  PRIMARY KEY (`StateDiscountID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_STATE_MASTER
CREATE TABLE IF NOT EXISTS `PG_STATE_MASTER` (
  `STATE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Country` varchar(250) DEFAULT NULL,
  `Region` varchar(250) DEFAULT NULL,
  `Description` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.PG_TRUCKTYPE_MASTER
CREATE TABLE IF NOT EXISTS `PG_TRUCKTYPE_MASTER` (
  `TRUCK_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TruckType` varchar(250) DEFAULT NULL,
  `Truck_Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`TRUCK_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.vtx_client_data
CREATE TABLE IF NOT EXISTS `vtx_client_data` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `document_type` varchar(45) DEFAULT NULL,
  `user_profile_id` varchar(45) DEFAULT NULL,
  `corporate_name` varchar(45) DEFAULT NULL,
  `corporate_document` varchar(45) DEFAULT NULL,
  `corporate_phone` varchar(45) DEFAULT NULL,
  `is_corporate` tinyint(4) DEFAULT NULL,
  `customer_class` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `user_profile_id_UNIQUE` (`user_profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.vtx_ordered_item
CREATE TABLE IF NOT EXISTS `vtx_ordered_item` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) NOT NULL,
  `unique_id` varchar(45) DEFAULT NULL,
  `item_name` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `list_price` float DEFAULT NULL,
  `manual_price` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `image_url` text,
  `detail_url` text,
  `brand_name` varchar(45) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `cat_id` varchar(50) DEFAULT NULL,
  `product_cluster_id` varchar(45) DEFAULT NULL,
  `dimensions_hight` float DEFAULT NULL,
  `dimensions_width` float DEFAULT NULL,
  `dimensions_length` float DEFAULT NULL,
  `dimensions_weight` float DEFAULT NULL,
  `dimensions_cubic_weight` float DEFAULT NULL,
  `measurement_unit` varchar(45) DEFAULT NULL,
  `unit_multiplier` int(11) DEFAULT NULL,
  `selling_price` float DEFAULT NULL,
  `is_gift` tinyint(4) DEFAULT NULL,
  `shipping_price` float DEFAULT NULL,
  `pre_sale_date` timestamp NULL DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='		';

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.vtx_order_details
CREATE TABLE IF NOT EXISTS `vtx_order_details` (
  `order_id` varchar(50) NOT NULL,
  `items_total` float DEFAULT NULL,
  `discount_total` float DEFAULT NULL,
  `shipping_total` float DEFAULT NULL,
  `tax_total` float DEFAULT NULL,
  `final_value` float DEFAULT NULL,
  `order_time_stamp` timestamp NULL DEFAULT NULL,
  `country_code` varchar(50) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `user_profile_id` varchar(200) DEFAULT NULL,
  `delivery_address` text,
  `seller_id` float DEFAULT NULL,
  `warehouse_id` float DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `sku_id` varchar(50) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `order_id_UNIQUE` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.vtx_order_status
CREATE TABLE IF NOT EXISTS `vtx_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) NOT NULL,
  `current_status` varchar(45) DEFAULT NULL,
  `changed_status` varchar(45) DEFAULT NULL,
  `status_change_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `change_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.vtx_payment_data
CREATE TABLE IF NOT EXISTS `vtx_payment_data` (
  `transaction_id` varchar(45) DEFAULT NULL,
  `order_id` varchar(45) NOT NULL,
  `merchant_name` varchar(45) DEFAULT NULL,
  `payment_id` varchar(45) DEFAULT NULL,
  `payment_system_code` int(11) DEFAULT NULL,
  `payment_system_name` varchar(45) DEFAULT NULL,
  `payment_value` float DEFAULT NULL,
  `installments` int(11) DEFAULT NULL,
  `card_holder_name` varchar(45) DEFAULT NULL,
  `card_number` bigint(20) DEFAULT NULL,
  `cvv2` int(11) DEFAULT NULL,
  `expire_month` int(11) DEFAULT NULL,
  `expire_year` int(11) DEFAULT NULL,
  `gift_card_id` varchar(45) DEFAULT NULL,
  `gift_card_name` varchar(45) DEFAULT NULL,
  `gift_card_caption` varchar(45) DEFAULT NULL,
  `redemption_code` varchar(45) DEFAULT NULL,
  `gift_card_due_date` timestamp NULL DEFAULT NULL,
  `transaction_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table apcnprgdbdv01.vtx_shipping_data
CREATE TABLE IF NOT EXISTS `vtx_shipping_data` (
  `order_id` varchar(50) NOT NULL,
  `selected_service` varchar(45) DEFAULT NULL,
  `lock_TTL` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `list_price` float DEFAULT NULL,
  `selling_price` float DEFAULT '0',
  `delivery_company` varchar(45) DEFAULT NULL,
  `shipping_estimate` varchar(45) DEFAULT NULL,
  `shipping_estimate_date` date DEFAULT NULL,
  `courier_id` varchar(45) DEFAULT NULL,
  `courier_name` varchar(45) DEFAULT NULL,
  `warehouse_id` varchar(45) DEFAULT NULL,
  `address_type` varchar(45) DEFAULT NULL,
  `receiver_name` varchar(45) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `neighborhood` varchar(45) DEFAULT NULL,
  `complement` text,
  `reference` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
http://ap-sgs-vh159:50400/sap/xi/engine?type=entry&version=3.0&Sender.Service=PriceGlider&Interface=urn:priceglider:quprint^PriceGQuPrint_OB
http://AP-SGS-VH126.oc.holcim.net:51400/sap/xi/engine?type=entry&version=3.0&Sender.Service=PriceGlider&Interface=urn:priceglider:qulist^PriceGQuList_OB
http://ap-sgs-vh159:50400/sap/xi/engine?type=entry&version=3.0&Sender.Service=PriceGlider&Interface=urn:priceglider:qucreate^PriceGQuCreate_OB