-- --------------------------------------------------------
-- Host:                         lease.mekashron.com
-- Server version:               5.0.67-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for mekashrontv
CREATE DATABASE IF NOT EXISTS `mekashrontv` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mekashrontv`;


-- Dumping structure for table mekashrontv.actionfire
CREATE TABLE IF NOT EXISTS `actionfire` (
  `FireID` int(20) unsigned NOT NULL auto_increment,
  `FireDate` datetime default NULL,
  `eventID` int(20) unsigned default '0',
  `fieldActionID` int(20) unsigned default '0',
  `userMessageID` int(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`FireID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.business
CREATE TABLE IF NOT EXISTS `business` (
  `BusinessID` int(10) NOT NULL auto_increment,
  `BusinessName` varbinary(255) default NULL,
  `VatPCT` decimal(10,3) unsigned default '0.000',
  `EIN` varbinary(255) default '0',
  `DocumentLanguage` varbinary(255) default 'English',
  `Address` varbinary(255) default NULL,
  `City` varbinary(255) default NULL,
  `Zip` varbinary(255) default NULL,
  `Phone` varbinary(255) default NULL,
  `Fax` varbinary(255) default NULL,
  `Country` varbinary(255) default NULL,
  `State` varbinary(255) default NULL,
  `isDeleted` int(1) unsigned default '0',
  PRIMARY KEY  (`BusinessID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.calendars
CREATE TABLE IF NOT EXISTS `calendars` (
  `calendarID` int(20) unsigned NOT NULL auto_increment,
  `usersID` text,
  `googleusername` varbinary(50) default NULL,
  `googlepsw` varbinary(50) default NULL,
  `googlecalendar` varbinary(50) default NULL,
  `calendarName` varbinary(50) default NULL,
  `GroupsID` text,
  `IsDeleted` int(1) unsigned NOT NULL default '0',
  `AccessKind` int(1) unsigned default '1',
  `LastCalendarsList` text,
  `ActiveTimeFrom` time default '08:00:00',
  `ActiveTimeTo` time default '19:00:00',
  `OnlyActiveTime` int(1) unsigned default '0',
  `DisplayUnits` int(10) unsigned default '30',
  PRIMARY KEY  (`calendarID`),
  KEY `calendarID` (`calendarID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `CategoryID` int(20) unsigned NOT NULL auto_increment,
  `ParentID` int(20) unsigned default '0',
  `Name` varbinary(255) NOT NULL,
  `CategoryType` int(2) unsigned NOT NULL default '0',
  `SharedCategory` varbinary(255) default NULL,
  `isDeleted` int(1) unsigned default '0',
  `AccessKind` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`CategoryID`),
  KEY `ParentID` (`ParentID`),
  KEY `SharedCategory` (`SharedCategory`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.cati
CREATE TABLE IF NOT EXISTS `cati` (
  `CatiID` int(20) unsigned NOT NULL auto_increment,
  `CampaignID` int(20) unsigned default '0',
  `isFirst` int(1) unsigned default '0',
  `Body` blob,
  `FormName` varbinary(255) default NULL,
  `NextCatiID` int(20) unsigned default '0',
  PRIMARY KEY  (`CatiID`),
  KEY `CampaignID` (`CampaignID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.cati_fields
CREATE TABLE IF NOT EXISTS `cati_fields` (
  `cati_fieldID` int(100) unsigned NOT NULL auto_increment,
  `cati` tinyint(3) unsigned default NULL,
  `title` varbinary(255) default NULL,
  `FieldName` varbinary(255) default NULL,
  `isRequired` int(1) unsigned default '0',
  `CustomFieldID` int(20) unsigned default '0',
  `CFieldID` int(20) unsigned default '0',
  PRIMARY KEY  (`cati_fieldID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.cati_fields_action
CREATE TABLE IF NOT EXISTS `cati_fields_action` (
  `cati_actionID` int(20) unsigned NOT NULL auto_increment,
  `cati` int(10) unsigned default NULL,
  `cati_fieldID` int(20) unsigned default NULL,
  `cati_BoxID` int(10) unsigned default '0',
  `NextFormID` int(10) unsigned default NULL,
  `StatusID` int(10) unsigned default NULL,
  PRIMARY KEY  (`cati_actionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `CountryID` int(10) NOT NULL auto_increment,
  `CountryName` varbinary(255) default NULL,
  `CallingCode` varbinary(10) default NULL,
  `ISO` varbinary(10) default NULL,
  `UTC` int(11) default NULL,
  `CurrencyID` int(11) default NULL,
  `CurrencyCode` varbinary(10) default NULL,
  `LastDateUsed` datetime default NULL,
  `Isdeleted` int(1) unsigned NOT NULL default '0',
  `Removezero` int(1) unsigned default '0',
  `ISO3166` varbinary(10) default NULL,
  `Language` varbinary(50) default 'English',
  PRIMARY KEY  (`CountryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.currency
CREATE TABLE IF NOT EXISTS `currency` (
  `CurrencyID` int(20) NOT NULL auto_increment,
  `Currency` varbinary(255) default '0',
  `Symbol` varbinary(255) default NULL,
  `ExchangeRate` decimal(10,5) NOT NULL default '1.00000',
  `CurrencyCode` varbinary(255) default NULL,
  `LocaleID` int(20) default NULL,
  `deleted` int(1) unsigned default '0',
  `isDefault` int(1) unsigned NOT NULL default '0',
  `Country` varbinary(255) default NULL,
  PRIMARY KEY  (`CurrencyID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customfields
CREATE TABLE IF NOT EXISTS `customfields` (
  `FieldID` int(20) unsigned NOT NULL auto_increment,
  `FieldName` varbinary(255) default NULL,
  `Type` int(3) unsigned default NULL,
  `Required` int(1) unsigned default '0',
  `userID` int(20) unsigned default NULL,
  `FormID` int(1) unsigned default NULL,
  `Width` int(20) unsigned default '0',
  `ALeft` int(20) default '0',
  `Height` int(20) unsigned default NULL,
  `Top` int(20) unsigned default NULL,
  `TabOrder` int(20) unsigned default NULL,
  `plateID` int(9) unsigned NOT NULL default '0',
  `NextFireDate` datetime default '0000-00-00 00:00:00',
  `LastFireDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `IntervalEvery` int(1) unsigned NOT NULL default '0',
  `FaxMessageID` int(20) unsigned default '0',
  `EmailMessageID` int(20) unsigned default '0',
  `SMSMessageID` tinyint(20) unsigned default '0',
  `TelemarketingID` int(20) unsigned default '0',
  `StationID` int(20) unsigned default '0',
  `isFocused` int(1) unsigned default '0',
  `StationTimeOut` datetime default NULL,
  `ParentFieldID` int(20) unsigned default '0',
  `Formula` varbinary(255) default NULL,
  `ShowInGrid` int(1) unsigned default '1',
  `ShowCaption` int(1) unsigned default '1',
  `DependentFieldID` int(10) unsigned default '0',
  `ContainsKeyData` int(1) unsigned default '0',
  `Max` int(11) unsigned default NULL,
  `Min` int(11) unsigned default NULL,
  `MaxDelta` int(10) unsigned default NULL,
  `ColumnWidth` int(10) unsigned default '80',
  `autoinc` int(10) unsigned default '0',
  `isphone` int(1) unsigned default '0',
  `TodayDate` int(1) unsigned default '1',
  `DefaultValue` varbinary(255) default NULL,
  `IsIndexed` int(1) unsigned default '0',
  PRIMARY KEY  (`FieldID`),
  KEY `FormID` (`FormID`),
  KEY `StationID` (`StationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customfields_action
CREATE TABLE IF NOT EXISTS `customfields_action` (
  `actionID` int(10) unsigned NOT NULL auto_increment,
  `FieldID` int(20) unsigned default NULL,
  `FieldType` int(3) unsigned default '0',
  `NextFireDate` datetime default '0000-00-00 00:00:00',
  `LastFireDate` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`actionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customfields_box
CREATE TABLE IF NOT EXISTS `customfields_box` (
  `BoxID` int(20) unsigned NOT NULL auto_increment,
  `FieldID` int(20) unsigned default NULL,
  `Value` varbinary(255) default NULL,
  `Price` decimal(20,2) default NULL,
  `ParentRecord` int(10) unsigned default '0',
  `ValueKey` varbinary(50) default NULL,
  PRIMARY KEY  (`BoxID`),
  KEY `FieldID` (`FieldID`),
  KEY `Value` (`Value`),
  KEY `ParentRecord` (`ParentRecord`),
  KEY `ValueKey` (`ValueKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customfields_plates
CREATE TABLE IF NOT EXISTS `customfields_plates` (
  `plateID` int(9) unsigned NOT NULL auto_increment,
  `FormID` int(9) unsigned default '0',
  `PlateActive` int(1) unsigned default '1',
  `plateName` varbinary(255) default '0',
  `PageIndex` int(3) unsigned default '1',
  `DisallowedCategories` varbinary(255) default NULL,
  `DisallowedUsers` varbinary(255) default NULL,
  `ParentFieldID` int(20) unsigned default '0',
  `DisallowedGroups` varbinary(255) default NULL,
  PRIMARY KEY  (`plateID`),
  KEY `FormID` (`FormID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customlistbox
CREATE TABLE IF NOT EXISTS `customlistbox` (
  `listID` int(20) NOT NULL auto_increment,
  `groupID` int(3) unsigned default '0',
  `value` varbinary(255) default NULL,
  `imageIndex` int(20) unsigned default NULL,
  `dateCreated` date default NULL,
  `userID` int(20) unsigned default NULL,
  `isDeleted` int(1) unsigned default '0',
  `color` int(20) unsigned default NULL,
  `ListPermitionGroups` varbinary(255) default NULL,
  `LastUpdateDate` datetime default NULL,
  PRIMARY KEY  (`listID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customtable11
CREATE TABLE IF NOT EXISTS `customtable11` (
  `RecordID` int(10) unsigned NOT NULL auto_increment,
  `ParentRecordID` int(10) unsigned default NULL,
  `CustomField12` varbinary(255) default '',
  `CustomField13` varbinary(255) default '',
  `CustomField22` int(20) unsigned default NULL,
  PRIMARY KEY  (`RecordID`),
  UNIQUE KEY `RecordID` (`RecordID`),
  KEY `RecordID_2` (`RecordID`,`ParentRecordID`),
  KEY `ParentRecordID` (`ParentRecordID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customtable133
CREATE TABLE IF NOT EXISTS `customtable133` (
  `RecordID` int(10) unsigned NOT NULL auto_increment,
  `ParentRecordID` int(10) unsigned default NULL,
  `CustomField134` varbinary(255) default NULL,
  `CustomField135` varbinary(255) default NULL,
  PRIMARY KEY  (`RecordID`),
  UNIQUE KEY `RecordID` (`RecordID`),
  KEY `RecordID_2` (`RecordID`),
  KEY `ParentRecordID` (`ParentRecordID`),
  KEY `ParentRecordID_2` (`ParentRecordID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customtable27
CREATE TABLE IF NOT EXISTS `customtable27` (
  `RecordID` int(10) unsigned NOT NULL auto_increment,
  `ParentRecordID` int(10) unsigned default NULL,
  `CustomField28` varchar(255) character set latin1 collate latin1_bin default NULL,
  `CustomField29` varchar(255) character set latin1 collate latin1_bin default NULL,
  `CustomField30` varchar(255) character set latin1 collate latin1_bin default NULL,
  PRIMARY KEY  (`RecordID`),
  UNIQUE KEY `RecordID` (`RecordID`),
  KEY `RecordID_2` (`RecordID`,`ParentRecordID`),
  KEY `ParentRecordID` (`ParentRecordID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customtable32
CREATE TABLE IF NOT EXISTS `customtable32` (
  `RecordID` int(10) unsigned NOT NULL auto_increment,
  `ParentRecordID` int(10) unsigned default NULL,
  `CustomField33` int(20) unsigned default NULL,
  `CustomField34` int(20) unsigned default NULL,
  `CustomField35` int(20) unsigned default '0',
  `CustomField36` int(20) unsigned default '0',
  `CustomField38` int(20) unsigned default NULL,
  PRIMARY KEY  (`RecordID`),
  UNIQUE KEY `RecordID` (`RecordID`),
  KEY `RecordID_2` (`RecordID`,`ParentRecordID`),
  KEY `ParentRecordID` (`ParentRecordID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customtable5
CREATE TABLE IF NOT EXISTS `customtable5` (
  `RecordID` int(10) unsigned NOT NULL auto_increment,
  `ParentRecordID` int(10) unsigned default NULL,
  PRIMARY KEY  (`RecordID`),
  UNIQUE KEY `RecordID` (`RecordID`),
  KEY `RecordID_2` (`RecordID`),
  KEY `ParentRecordID` (`ParentRecordID`),
  KEY `ParentRecordID_2` (`ParentRecordID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customtable608
CREATE TABLE IF NOT EXISTS `customtable608` (
  `RecordID` int(10) unsigned NOT NULL auto_increment,
  `ParentRecordID` int(10) unsigned default NULL,
  `CustomField609` varchar(255) character set latin1 collate latin1_bin default NULL,
  `CustomField610` int(20) unsigned default '0',
  `CustomField611` date default NULL,
  PRIMARY KEY  (`RecordID`),
  UNIQUE KEY `RecordID` (`RecordID`),
  KEY `RecordID_2` (`RecordID`),
  KEY `ParentRecordID` (`ParentRecordID`),
  KEY `ParentRecordID_2` (`ParentRecordID`),
  KEY `CustomField611` (`CustomField611`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.customtable68
CREATE TABLE IF NOT EXISTS `customtable68` (
  `RecordID` int(10) unsigned NOT NULL auto_increment,
  `ParentRecordID` int(10) unsigned default NULL,
  `EntityId` int(10) unsigned default NULL,
  `AddDate` datetime default NULL,
  `OrderID` int(10) unsigned default NULL,
  PRIMARY KEY  (`RecordID`),
  UNIQUE KEY `RecordID` (`RecordID`),
  KEY `ParentRecordID` (`ParentRecordID`),
  KEY `EntityId` (`EntityId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.entities
CREATE TABLE IF NOT EXISTS `entities` (
  `entityID` int(20) unsigned NOT NULL auto_increment,
  `CreatedBy` int(10) unsigned default '0',
  `CategoryID` int(20) unsigned default '0',
  `FirstName` varbinary(255) default NULL,
  `LastName` varbinary(255) default NULL,
  `Company` varbinary(255) default NULL,
  `Address` varbinary(510) default NULL,
  `City` varbinary(255) default NULL,
  `State` varbinary(255) default NULL,
  `Country` varbinary(255) default NULL,
  `Zip` varbinary(255) default NULL,
  `Phone` varbinary(255) default NULL,
  `AllowPhone` int(1) unsigned default '1',
  `Mobile` varbinary(255) default NULL,
  `AllowMobile` int(1) unsigned default '1',
  `Fax` varbinary(255) default NULL,
  `AllowFax` int(1) unsigned default '1',
  `Email` varbinary(255) default NULL,
  `AllowEmail` int(1) unsigned default '1',
  `isChecked` varbinary(255) default NULL,
  `CryptedID` int(100) unsigned default '0',
  `SharedUsers` varbinary(255) default NULL,
  `isDeleted` int(1) unsigned default '0',
  `DeletedDate` datetime default NULL,
  `DeletedBy` int(10) unsigned default '0',
  `MergedID` int(10) unsigned default NULL,
  `CustomField3` int(1) default '0',
  `CustomField9` text,
  `CustomField10` varbinary(255) default '',
  `CustomField14` varbinary(255) default '',
  `CustomField15` varbinary(255) default '',
  `CustomField16` varbinary(255) default '',
  `CustomField17` varbinary(255) default '',
  `CustomField18` int(20) unsigned default NULL,
  `CustomField19` varbinary(255) default '',
  `CustomField20` int(20) unsigned default '0',
  `CustomField21` int(20) unsigned default '0',
  `CustomAction6` datetime default NULL,
  `CustomField23` varbinary(255) default '',
  `CustomField24` varbinary(255) default '',
  `CustomField25` varbinary(255) default '',
  `CustomField39` int(20) unsigned default '0',
  `CustomField51` varbinary(255) default '',
  `CustomField52` int(1) default '0',
  `CustomField53` int(20) unsigned default '0',
  `CustomField60` varbinary(255) default '',
  `CustomField61` datetime default '2013-10-24 09:46:21',
  `CustomField62` varbinary(255) default '',
  `CustomField64` datetime default '2013-10-24 09:46:21',
  `CustomField65` int(20) unsigned default '0',
  `CustomField67` varbinary(255) default '',
  `CountryID` int(11) default '54',
  `isSupplier` int(1) unsigned default '0',
  `isUser` int(1) unsigned default '0',
  `isCustomer` int(1) unsigned default '0',
  PRIMARY KEY  (`entityID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `Fax` (`Fax`),
  KEY `Email` (`Email`),
  KEY `Phone` (`Phone`),
  KEY `Mobile` (`Mobile`),
  KEY `SharedUsers` (`SharedUsers`),
  KEY `isDeleted` (`isDeleted`),
  KEY `CustomAction6` (`CustomAction6`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.entities_events
CREATE TABLE IF NOT EXISTS `entities_events` (
  `eventID` int(10) NOT NULL auto_increment,
  `entityID` int(20) default NULL,
  `userID` int(20) unsigned default NULL,
  `EventDate` datetime default NULL,
  `ScheduledDate` datetime default NULL,
  `DurationTime` time default '00:01:00',
  `Remind` int(1) unsigned default '0',
  `LocationID` int(20) unsigned NOT NULL default '0',
  `EventType` int(1) unsigned NOT NULL default '0',
  `Remark` varbinary(255) default NULL,
  `userID2` int(20) unsigned default NULL,
  `PhoneConfirmed` int(1) unsigned default '0',
  `Success` int(1) unsigned default '0',
  `isPrivetEvent` int(1) unsigned default '0',
  `EventDateEnd` datetime default '0000-00-00 00:00:00',
  `statusID` int(20) default NULL,
  `EvenReminderDate` datetime default NULL,
  `Body` longblob,
  `ChangeDate` datetime default NULL,
  `calendarID` int(20) unsigned default '0',
  `googleeventID` text,
  `LastSyncDate` datetime default NULL,
  `CustomField51` int(20) unsigned default NULL,
  PRIMARY KEY  (`eventID`),
  KEY `entityID` (`entityID`),
  KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.entities_files
CREATE TABLE IF NOT EXISTS `entities_files` (
  `FileID` int(20) unsigned NOT NULL auto_increment,
  `entityID` int(20) unsigned NOT NULL default '0',
  `Filename` varbinary(255) default NULL,
  `Width` int(5) unsigned default '40',
  `ALeft` int(5) unsigned default '5',
  `Height` int(5) unsigned default '40',
  `Top` int(5) unsigned default '5',
  `Label` varbinary(255) default NULL,
  `date` datetime default NULL,
  `filedata` longblob,
  `DataSize` int(11) default NULL,
  `Type` varbinary(30) default NULL,
  `UserID` int(11) default NULL,
  PRIMARY KEY  (`FileID`),
  KEY `entityID` (`entityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.eventlog
CREATE TABLE IF NOT EXISTS `eventlog` (
  `LogID` int(11) unsigned NOT NULL auto_increment,
  `Type` varbinary(60) default NULL,
  `Date` datetime default NULL,
  `Source` varbinary(120) default NULL,
  `Terminal` varbinary(20) default NULL,
  `IP` varbinary(17) default NULL,
  `Description` varbinary(255) default NULL,
  UNIQUE KEY `LogID` (`LogID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.grids
CREATE TABLE IF NOT EXISTS `grids` (
  `FieldId` int(3) default '0',
  `FieldType` int(3) default '0',
  `FieldName` varbinary(20) default NULL,
  `HeaderName` varbinary(20) default NULL,
  `DisplayMode` tinyint(3) unsigned default NULL,
  `Icon` blob
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.historydata
CREATE TABLE IF NOT EXISTS `historydata` (
  `HistoryID` int(10) unsigned NOT NULL auto_increment,
  `ObjectKind` int(10) unsigned default '0',
  `ObjectID` int(10) unsigned default '0',
  `FieldName` varbinary(255) default NULL,
  `Value` varbinary(255) default NULL,
  `ChangeDate` datetime default NULL,
  `userID` int(10) unsigned default '0',
  `ChangePCT` int(3) default '0',
  `CustomFieldID` int(10) unsigned default NULL,
  `Title` varbinary(50) default NULL,
  `ValueTitle` varbinary(255) default NULL,
  `DataPath` varbinary(255) default NULL,
  `ChangeType` int(2) unsigned default NULL,
  `ChangedTo` varbinary(600) default NULL,
  `SubObjectID` int(10) unsigned default '0',
  `CFieldID` int(10) unsigned default NULL,
  PRIMARY KEY  (`HistoryID`),
  KEY `ObjectID` (`ObjectID`),
  KEY `ObjectKind` (`ObjectKind`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.inbox
CREATE TABLE IF NOT EXISTS `inbox` (
  `inboxID` int(20) unsigned NOT NULL auto_increment,
  `messageType` int(1) unsigned default '0',
  `entityID` int(20) unsigned default '0',
  `Subject` varbinary(255) default NULL,
  `Body` longblob,
  `MessageFrom` varbinary(255) default NULL,
  `MessageTo` varbinary(255) default NULL,
  `InboxDate` datetime default NULL,
  `stationID` int(20) unsigned default NULL,
  `device` varbinary(50) default NULL,
  `userID` int(20) unsigned default NULL,
  `deviceID` int(3) unsigned default '0',
  `deleted` int(1) unsigned default '0',
  `ReadDate` datetime default NULL,
  `CallId` varbinary(255) default NULL,
  `Attachments` longblob,
  `MailCC` varbinary(255) default NULL,
  `MailBCC` varbinary(255) default NULL,
  `Images` longblob,
  `User_GroupID` int(10) unsigned default '0',
  `StatusID` tinyint(3) unsigned default NULL,
  `FinishDate` datetime default NULL,
  `AnsweredDate` datetime default NULL,
  `AnsweredUserID` int(10) unsigned default '0',
  `AnsweredStatusID` int(10) unsigned default '0',
  PRIMARY KEY  (`inboxID`),
  KEY `messageType` (`messageType`),
  KEY `CallId` (`CallId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.incoming
CREATE TABLE IF NOT EXISTS `incoming` (
  `IncomingID` int(10) unsigned NOT NULL auto_increment,
  `IncomingKind` int(1) unsigned default '0',
  `IncomingState` int(2) unsigned default '0',
  `CreatedDate` datetime default NULL,
  `AcceptedDate` datetime default NULL,
  `DisconnectedDate` datetime default NULL,
  `StationID` int(10) unsigned default '0',
  `entityID` int(10) unsigned default '0',
  `userID` int(10) unsigned default '0',
  `isDeleted` int(1) unsigned default '0',
  `IncomingTo` varbinary(255) default NULL,
  `IncomingFrom` varbinary(255) default NULL,
  `IncomingFromName` varbinary(255) default NULL,
  `deviceID` int(10) unsigned default '0',
  `StatusID` int(10) unsigned default '0',
  `Remarks` varbinary(255) default NULL,
  `ReSpoolID` int(10) unsigned default '0',
  `Body` longblob,
  PRIMARY KEY  (`IncomingID`),
  KEY `IncomingState` (`IncomingState`),
  KEY `isDeleted` (`isDeleted`),
  KEY `entityID` (`entityID`),
  KEY `IncomingKind` (`IncomingKind`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.location
CREATE TABLE IF NOT EXISTS `location` (
  `LocationID` int(20) unsigned NOT NULL auto_increment,
  `Name` varbinary(255) default NULL,
  PRIMARY KEY  (`LocationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `MessageID` int(20) unsigned NOT NULL auto_increment,
  `UserID` int(20) unsigned default NULL,
  `Body` longtext,
  `Type` int(1) unsigned default '0',
  `MessageName` varbinary(255) default NULL,
  `SavedAsCampaign` int(1) unsigned NOT NULL default '1',
  `Status` int(1) unsigned default '0',
  `Title` varbinary(255) default NULL,
  `Device` int(20) unsigned default '0',
  `ContentType` int(1) unsigned default '0',
  `Subject` varbinary(255) default NULL,
  `Attachments` text,
  `Priority` int(1) unsigned default '2',
  `Images` longblob,
  `DocumentType` int(1) unsigned default '0',
  `Language` varbinary(255) default NULL,
  `Deleted` int(1) unsigned default '0',
  `CurrencyCode` varbinary(255) default NULL,
  `isEMF` int(3) unsigned default '0',
  `version` int(4) unsigned default '0',
  `LastModifyDate` datetime default '0000-00-00 00:00:00',
  `BusinessID` int(10) unsigned default '1',
  `MailCC` varbinary(255) default NULL,
  `MailBCC` varbinary(255) default NULL,
  `PermissionGroups` blob,
  `AttachmentFiles` longblob,
  `GroupsID` blob,
  `Orientation` int(1) unsigned default '0',
  PRIMARY KEY  (`MessageID`),
  KEY `Type` (`Type`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(20) unsigned NOT NULL auto_increment,
  `Status` int(1) unsigned default '0',
  `OrderDate` datetime default '0000-00-00 00:00:00',
  `LastUpdate` datetime default NULL,
  `entityID` int(20) unsigned NOT NULL default '0',
  `userID` int(20) unsigned NOT NULL default '0',
  `Total` decimal(20,2) default '0.00',
  `TotalPaid` decimal(20,2) default '0.00',
  `InvoiceID` int(20) unsigned default '0',
  `ReceiptID` int(20) unsigned default '0',
  `Deleted` int(1) unsigned default '0',
  `currencyID` int(20) unsigned default '0',
  `TotalVAT` decimal(20,2) default '0.00',
  `Merged_ordersID` varbinary(255) default NULL,
  `Tax` decimal(4,2) NOT NULL default '0.00',
  `DeliveryDate` date default NULL,
  `CreatedByUserID` int(20) unsigned default NULL,
  `Discount` decimal(20,2) default '0.00',
  `DiscountPCT` decimal(20,4) default '0.0000',
  `DiscountType` int(1) unsigned default '0',
  `OrderExchangeRate` double(20,4) default NULL,
  `Recurrence` int(1) unsigned default '0',
  `Charge_payments` int(1) unsigned default '1',
  `Generate_Invoice` int(1) unsigned default '0',
  `SendInvoiceByFax` int(1) unsigned default '0',
  `SendInvoiceByEmail` int(1) unsigned default '0',
  `PrintInvoice` int(1) unsigned default '0',
  `Bills_every` int(10) unsigned default '1',
  `Bills_every_period` int(1) unsigned default '1',
  `Billing_for` int(10) unsigned default '1',
  `Billing_for_period` int(1) unsigned default '3',
  `RecurringParentOrderID` int(20) unsigned default '0',
  `RecurringNumber` int(10) unsigned default '1',
  `Deleted_Date` datetime default NULL,
  `Deleted_ByUserID` int(10) unsigned default '0',
  `RecurringTotal` int(10) default '0',
  `Next_Bill_Date` datetime default NULL,
  `OrderPaymentDate` datetime default NULL,
  `AgentID` int(20) unsigned default NULL,
  `DueDate` datetime default '0000-00-00 00:00:00',
  `BusinessID` int(10) unsigned default '1',
  `RecurringStatus` int(10) default '1',
  `PaymentAmount` decimal(9,2) default '0.00',
  `Last_Bill_Date` datetime default NULL,
  `Closed_Date` datetime default NULL,
  `Generate_Recipt` int(1) unsigned default '0',
  `RecurringActiveDate` datetime default NULL,
  `RecurringStatusChangedDate` datetime default NULL,
  `RecurringEventID` int(10) default '0',
  `LockedBy` int(20) unsigned default '0',
  `LockedDate` datetime default NULL,
  `StopIfPaymentFailed` int(1) NOT NULL default '1',
  PRIMARY KEY  (`OrderID`),
  KEY `userID` (`userID`),
  KEY `entityID` (`entityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.orders_documents
CREATE TABLE IF NOT EXISTS `orders_documents` (
  `Order_DocumentID` int(20) NOT NULL auto_increment,
  `orderID` int(255) unsigned default NULL,
  `documentID` int(20) unsigned default NULL,
  `messageID` int(20) unsigned default NULL,
  `Number` int(30) unsigned default NULL,
  `DocumentDate` datetime default NULL,
  `copies` int(20) unsigned default '0',
  `Body` longtext,
  `CanceledInvoiceID` int(20) unsigned default NULL,
  `CanceledReceiptID` int(20) unsigned default NULL,
  `entityID` int(20) unsigned NOT NULL default '0',
  `isCanceled` int(1) unsigned default '0',
  `currencyID` int(10) unsigned default '0',
  `PrintSrouce` int(1) unsigned default '0',
  `Total` decimal(20,2) default '0.00',
  `TotalVat` decimal(20,2) default '0.00',
  `VatPCT` decimal(4,2) default '0.00',
  `Vat` decimal(20,2) default '0.00',
  `TotalPayment` decimal(20,2) default '0.00',
  `Discount` decimal(20,2) default '0.00',
  `DocumentType` int(1) unsigned default '0',
  `BusinessID` int(10) unsigned default '1',
  PRIMARY KEY  (`Order_DocumentID`),
  KEY `documentID` (`documentID`),
  KEY `messageID` (`messageID`),
  KEY `orderID` (`orderID`),
  KEY `entityID` (`entityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.orders_events
CREATE TABLE IF NOT EXISTS `orders_events` (
  `orders_eventID` int(10) NOT NULL auto_increment,
  `RecurringStatus` int(10) default NULL,
  `ServiceID` int(10) default NULL,
  `ServiceUserID` int(10) default NULL,
  `SMSMessageID` int(10) default NULL,
  `Next_eventID` int(10) default NULL,
  `StartAfterDays` int(10) default NULL,
  PRIMARY KEY  (`orders_eventID`),
  UNIQUE KEY `Next_eventID` (`Next_eventID`),
  UNIQUE KEY `RecurringStatus` (`RecurringStatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.orders_payment
CREATE TABLE IF NOT EXISTS `orders_payment` (
  `order_paymentID` int(20) unsigned NOT NULL auto_increment,
  `PaymentID` int(20) unsigned NOT NULL default '0',
  `PaymentType` int(3) unsigned NOT NULL default '0',
  `PaymentName` varbinary(255) default NULL,
  `PaymentValue` decimal(20,2) default '0.00',
  `PaymentTotal` decimal(20,2) default '0.00',
  `Identification` varbinary(255) default NULL,
  `date` datetime default NULL,
  `PaymentDate` datetime default NULL,
  `PayerName` varbinary(255) default NULL,
  `PayerNumber` varbinary(255) default NULL,
  `PayerNumber2` varbinary(255) default NULL,
  `PayerNumber3` varbinary(255) default NULL,
  `PayerNumber4` varbinary(255) default NULL,
  `PayerNumber5` varbinary(255) default NULL,
  `PayerDate` date default NULL,
  `Parm1` varbinary(255) default NULL,
  `currencyID` int(20) unsigned default NULL,
  `ExchangeRate` decimal(20,4) unsigned default NULL,
  `status` int(1) unsigned default '0',
  `PaymentGroup` int(3) unsigned NOT NULL default '0',
  `orderID` int(20) unsigned default NULL,
  `entityID` int(20) unsigned NOT NULL default '0',
  `ReciptID` int(20) unsigned default '0',
  `isDeleted` int(1) unsigned default '0',
  `CancelReciptID` int(10) unsigned default NULL,
  `BusinessID` int(10) unsigned default '1',
  `ChargedDate` datetime default NULL,
  `PaymentQty` int(3) default '1',
  `FirstPayment` decimal(20,2) unsigned default '0.00',
  `ConstPayment` decimal(20,2) unsigned default '0.00',
  `RecurringNumber` int(10) unsigned default '1',
  `RetryCharge` int(1) unsigned default '0',
  `NextChargeRetryDate` datetime default NULL,
  `RetryChargeQuantity` int(10) unsigned default '0',
  `approved` int(1) unsigned default '0',
  `DeclinedRemark` varbinary(255) default NULL,
  `ChargedRemark` varbinary(255) default NULL,
  `SendToCCDate` datetime default NULL,
  `PaymentNeto` varbinary(50) default '0',
  `isForRecurring` int(10) unsigned default '0',
  `DeclinedDate` datetime default NULL,
  PRIMARY KEY  (`order_paymentID`),
  KEY `orderID` (`orderID`),
  KEY `entityID` (`entityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.orders_products
CREATE TABLE IF NOT EXISTS `orders_products` (
  `productID` int(10) unsigned NOT NULL auto_increment,
  `ParentID` int(10) unsigned default '0',
  `StockID` int(20) unsigned default '0',
  `OrderID` int(10) unsigned default '0',
  `productName` varbinary(255) default NULL,
  `Price` decimal(20,4) default '0.0000',
  `PriceVat` decimal(20,4) default '0.0000',
  `Qty` decimal(20,0) default '0',
  `Total` decimal(20,2) default '0.00',
  `currencyID` int(20) unsigned default NULL,
  `isDeleted` int(1) unsigned default '0',
  `TotalVat` decimal(20,2) default NULL,
  `InventoryID` int(20) unsigned default '0',
  `InvoiceID` int(20) unsigned NOT NULL default '0',
  `RefundID` int(20) unsigned default '0',
  `PriceWithVAT` int(1) unsigned default '0',
  `ExchangeRate` decimal(20,4) default '1.0000',
  `ShippingLabelID` int(20) unsigned default '0',
  `ReturnLabelID` int(20) unsigned default '0',
  `entityID` int(20) unsigned default '0',
  `BusinessID` int(10) unsigned default '1',
  `RecurringNumber` int(10) unsigned default '1',
  `isRecurrence` int(10) unsigned default '0',
  `PaymentAmount` decimal(20,2) default '0.00',
  `PaymentAmountTotal` decimal(20,2) default '0.00',
  `AllowPriceChange` int(11) default '-1',
  `CustomField33` varbinary(255) default NULL,
  `CustomField40` text,
  `CustomField111` varbinary(255) default NULL,
  `CustomField112` int(20) unsigned default '0',
  `CustomField113` date default NULL,
  `CustomField114` date default NULL,
  `CustomField116` int(20) unsigned default NULL,
  `CustomField1` varbinary(255) default NULL,
  `CustomField2` date default NULL,
  `CustomField46` int(20) unsigned default NULL,
  `CustomField47` int(20) unsigned default '0',
  `CustomField63` text,
  `CustomField9` varbinary(255) default NULL,
  `CustomField66` text,
  `AffiliateKind` int(11) default '0' COMMENT '0 = PCT, 1 = FIX',
  `AffiliateValue` decimal(10,2) default '0.00',
  `isForRecurring` int(1) unsigned default '0',
  `OrderProductDate` datetime default NULL,
  PRIMARY KEY  (`productID`),
  KEY `ParentID` (`ParentID`),
  KEY `entityID` (`entityID`),
  KEY `InventoryID` (`InventoryID`),
  KEY `OrderID` (`OrderID`),
  KEY `CustomField113` (`CustomField113`),
  KEY `CustomField114` (`CustomField114`),
  KEY `CustomField2` (`CustomField2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.orders_products_purchase
CREATE TABLE IF NOT EXISTS `orders_products_purchase` (
  `order_purchase_productsID` int(10) NOT NULL auto_increment,
  `order_productID` int(10) default '0',
  `purchase_productID` int(10) default '0',
  `Quantity` int(10) default '0',
  `InventoryID` int(10) default NULL,
  `CreatedDate` datetime default NULL,
  PRIMARY KEY  (`order_purchase_productsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.outgoing
CREATE TABLE IF NOT EXISTS `outgoing` (
  `OutgoingID` int(10) NOT NULL auto_increment,
  `MessageID` int(10) default '0',
  `EntityID` int(10) default '0',
  `Destination` varbinary(255) default '0',
  `Status` int(11) default '0',
  `AttachmentFiles` blob,
  `Priority` int(11) default '0',
  `Images` blob,
  `isEMF` int(11) default '0',
  `LastModifyDate` datetime default NULL,
  `Orientation` int(11) default '0',
  `StationID` int(10) default '0',
  `StationTimeOut` datetime default NULL,
  `ScheduleTo` datetime default NULL,
  `ScheduleByUserID` int(11) default NULL,
  `Device` varbinary(50) default NULL,
  `ErrorCode` int(11) default '0',
  `ErrorMessage` varbinary(255) default NULL,
  `Copies` int(11) default '0',
  `Log` varbinary(100) default NULL,
  `Retries` int(11) default '0',
  `MessageType` int(10) default '0',
  `SentByUserID` int(10) default '0',
  `Source` varbinary(255) default '0',
  PRIMARY KEY  (`OutgoingID`),
  KEY `EntityID` (`EntityID`),
  KEY `MessageType` (`MessageType`),
  KEY `MessageID` (`MessageID`),
  KEY `StationID` (`StationID`),
  KEY `Priority` (`Priority`),
  KEY `ScheduleTo` (`ScheduleTo`),
  KEY `Status` (`Status`),
  KEY `Device` (`Device`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.outgoing_statistics
CREATE TABLE IF NOT EXISTS `outgoing_statistics` (
  `MessageID` int(10) default NULL,
  `MessageType` int(10) default NULL,
  `StatusCode` int(10) default NULL,
  `ErrorCode` int(10) default '0',
  `StatusCaption` varchar(50) default NULL,
  `Count` int(10) default '0',
  `LastUpdate` datetime default NULL,
  KEY `MessageID` (`MessageID`),
  KEY `MessageType` (`MessageType`),
  KEY `StatusCode` (`StatusCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `paymentID` int(20) unsigned NOT NULL auto_increment,
  `PaymentName` varbinary(255) NOT NULL,
  `PaymentType` int(3) unsigned NOT NULL default '0',
  `Icon` blob,
  `Postion` int(9) unsigned NOT NULL default '0',
  `userID` int(20) unsigned NOT NULL default '0',
  `deleted` int(1) unsigned NOT NULL default '0',
  `Component` varbinary(255) default NULL,
  `currencyID` int(20) default '0',
  `LastDateUsed` datetime default NULL,
  PRIMARY KEY  (`paymentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.permissionsgroup
CREATE TABLE IF NOT EXISTS `permissionsgroup` (
  `PermissionGroupID` int(20) unsigned NOT NULL auto_increment,
  `GroupName` varbinary(255) default NULL,
  `permissions` blob,
  `ReadOnlyFields` text,
  `HiddenFields` text,
  `CannotAddRowFields` text,
  `CannotRemoveRowFields` text,
  `AllowPlugins` blob,
  `CustomFieldPlates` blob,
  PRIMARY KEY  (`PermissionGroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.printersset
CREATE TABLE IF NOT EXISTS `printersset` (
  `PrinterSetID` int(10) unsigned NOT NULL auto_increment,
  `Settings` blob,
  PRIMARY KEY  (`PrinterSetID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.products
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int(20) unsigned NOT NULL auto_increment,
  `CategoryID` int(20) unsigned NOT NULL default '0',
  `stockID` int(20) unsigned NOT NULL default '0',
  `OwnerProductID` int(20) unsigned NOT NULL default '0',
  `ProductName` varbinary(255) default NULL,
  `Date` datetime default NULL,
  `ModifiedDate` datetime default NULL,
  `Price` decimal(9,2) default '0.00',
  `Cost` decimal(9,2) default NULL,
  `Quantity` int(20) default '0',
  `Recurring` int(1) unsigned default '0',
  `ParentProductID` int(20) unsigned default NULL,
  `PriceVAT` decimal(9,2) default NULL,
  `IncludesVAT` int(1) default '0',
  `currencyID` int(20) unsigned default '1',
  `isDeleted` int(1) unsigned default '0',
  `SerialNumber` varbinary(255) default NULL,
  `ParentID` int(20) unsigned default '0',
  `Barcode` varbinary(255) default NULL,
  `userID` int(20) unsigned NOT NULL default '0',
  `isRecurrence` int(10) unsigned default '0',
  `Bills_every` int(10) unsigned default '1',
  `Bills_every_period` int(1) unsigned default '1',
  `Billing_for` int(10) unsigned default '1',
  `Billing_for_period` int(1) unsigned default '3',
  `Charge_payments` int(1) unsigned default '1',
  `Generate_Invoice` int(1) unsigned default '0',
  `PaymentAmount` decimal(9,2) default '0.00',
  `AllowPriceChange` int(11) default '-1',
  `Generate_Recipt` int(1) unsigned default '0',
  `CustomField66` text,
  `AffiliateKind` int(11) default '0' COMMENT '0 = PCT, 1 = FIX',
  `AffiliateValue` decimal(10,2) default '0.00',
  `smallimage` longblob,
  `largeimage` longblob,
  `Weight` decimal(10,3) default '0.000',
  `Height` decimal(10,3) default '0.000',
  `Width` decimal(10,3) default '0.000',
  `Depth` decimal(10,3) default '0.000',
  `AgentBonus` decimal(10,2) default '0.00',
  `BonusType` int(1) default '0',
  `BonusRecurring` int(1) default '0',
  `MinAlertLevel` int(10) default '0',
  `AssignServiceTo` int(20) default '0',
  `Description` text,
  PRIMARY KEY  (`ProductID`),
  KEY `SerialNumber` (`SerialNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.products_rent
CREATE TABLE IF NOT EXISTS `products_rent` (
  `rentID` int(9) unsigned NOT NULL auto_increment,
  `entityID` int(10) unsigned default '0',
  `RentedByUserID` int(9) unsigned default '0',
  `AcceptedByUserID` int(9) unsigned default '0',
  `RentedDate` datetime default NULL,
  `RentedUntil` datetime default NULL,
  `ReturnedDate` datetime default NULL,
  `isDeleted` int(1) unsigned default '0',
  `RentRemarks` text,
  `ReturnRemarks` text,
  `ReturnStatusID` int(20) unsigned default NULL,
  `productID` int(10) unsigned default '0',
  PRIMARY KEY  (`rentID`),
  KEY `entityID` (`entityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.products_stock
CREATE TABLE IF NOT EXISTS `products_stock` (
  `stockID` int(9) NOT NULL auto_increment,
  `ProductID` int(9) unsigned default NULL,
  `userID` int(9) unsigned default NULL,
  `Serial` varbinary(255) default NULL,
  `Quantity` decimal(9,2) default NULL,
  `Cost` decimal(9,2) default '0.00',
  `inDate` datetime default NULL,
  `outDate` datetime default NULL,
  `status` int(1) unsigned default '0',
  PRIMARY KEY  (`stockID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.purchase
CREATE TABLE IF NOT EXISTS `purchase` (
  `purchaseID` int(20) unsigned NOT NULL auto_increment,
  `businessID` int(10) unsigned default '1',
  `status` int(1) unsigned default '0',
  `purchaseDate` datetime default '0000-00-00 00:00:00',
  `deliveryDate` datetime default '0000-00-00 00:00:00',
  `arrivedDate` datetime default NULL,
  `lastUpdate` datetime default NULL,
  `entityID` int(20) unsigned NOT NULL default '0',
  `userID` int(20) unsigned NOT NULL default '0',
  `total` decimal(20,2) default '0.00',
  `totalPaid` decimal(20,2) default '0.00',
  `PaymentAmount` decimal(20,2) default '0.00',
  `deleted` int(1) unsigned default '0',
  `deleted_Date` datetime default NULL,
  `deleted_ByUserID` int(10) unsigned default '0',
  `currencyID` int(20) unsigned default '0',
  `totalVAT` decimal(20,2) default '0.00',
  `tax` decimal(4,2) NOT NULL default '0.00',
  `createdByUserID` int(20) unsigned default NULL,
  `orderExchangeRate` double(20,4) default NULL,
  PRIMARY KEY  (`purchaseID`),
  KEY `entityID` (`entityID`),
  KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.purchase_payment
CREATE TABLE IF NOT EXISTS `purchase_payment` (
  `purchase_paymentID` int(20) unsigned NOT NULL auto_increment,
  `BusinessID` int(10) unsigned default '1',
  `PaymentID` int(20) unsigned NOT NULL default '0',
  `PaymentType` int(3) unsigned NOT NULL default '0',
  `PaymentName` varbinary(255) default NULL,
  `PaymentValue` decimal(20,2) default '0.00',
  `Identification` varbinary(255) default NULL,
  `date` datetime default NULL,
  `PaymentDate` datetime default NULL,
  `ChargedDate` datetime default NULL,
  `currencyID` int(20) unsigned default NULL,
  `status` int(1) unsigned default '0',
  `purchaseID` int(20) unsigned default NULL,
  `entityID` int(20) unsigned NOT NULL default '0',
  `PaymentTotal` decimal(20,2) default '0.00',
  `ExchangeRate` decimal(20,4) unsigned default NULL,
  `isDeleted` int(1) unsigned default '0',
  `approved` int(1) unsigned default '0',
  `ChargedRemark` varbinary(255) default NULL,
  `PayerName` varbinary(255) default NULL,
  `PayerNumber` varbinary(255) default NULL,
  `PayerNumber2` varbinary(255) default NULL,
  `PayerNumber3` varbinary(255) default NULL,
  `PayerNumber4` varbinary(255) default NULL,
  `PayerNumber5` varbinary(255) default NULL,
  `PayerDate` date default NULL,
  `Parm1` varbinary(255) default NULL,
  `ReciptID` int(20) default '0',
  `CancelReciptID` int(20) default '0',
  `RetryCharge` int(1) default '0',
  `RetryChargeQuantity` int(10) default '0',
  PRIMARY KEY  (`purchase_paymentID`),
  KEY `purchaseID` (`purchaseID`),
  KEY `entityID` (`entityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.purchase_products
CREATE TABLE IF NOT EXISTS `purchase_products` (
  `productID` int(10) unsigned NOT NULL auto_increment,
  `InventoryID` int(20) unsigned default '0',
  `BusinessID` int(10) unsigned default '1',
  `entityID` int(20) unsigned default '0',
  `ParentID` int(20) unsigned default '0',
  `InvoiceID` int(20) unsigned default '0',
  `RefundID` int(20) unsigned default '0',
  `ShippingLabelID` int(20) unsigned default '0',
  `ReturnLabelID` int(20) unsigned default '0',
  `purchaseID` int(10) unsigned default '0',
  `userID` int(10) unsigned default '0',
  `productName` varbinary(255) default NULL,
  `Cost` decimal(20,4) default '0.0000',
  `CostVat` decimal(20,4) default '0.0000',
  `QtyOrdered` decimal(20,0) default '0',
  `QtyArrived` decimal(20,0) default '0',
  `QtyInStock` decimal(20,0) default '0',
  `Total` decimal(20,2) default '0.00',
  `TotalVat` decimal(20,2) default '0.00',
  `CostIncVAT` int(1) unsigned default '0',
  `currencyID` int(20) unsigned default NULL,
  `ExchangeRate` decimal(20,4) default '1.0000',
  `isDeleted` int(1) unsigned default '0',
  `isRecurrence` int(1) unsigned default '0',
  `AllowPriceChange` int(11) default '-1',
  `productdate` datetime default NULL,
  PRIMARY KEY  (`productID`),
  KEY `entityID` (`entityID`),
  KEY `InventoryID` (`InventoryID`),
  KEY `purchaseID` (`purchaseID`),
  KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.reports_set
CREATE TABLE IF NOT EXISTS `reports_set` (
  `ReportSetID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(20) unsigned default '0',
  `FieldName` varbinary(255) default NULL,
  `Width` int(20) unsigned default '0',
  `Checked` int(1) unsigned default '0',
  PRIMARY KEY  (`ReportSetID`),
  KEY `UserID` (`UserID`),
  KEY `FieldName` (`FieldName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.service
CREATE TABLE IF NOT EXISTS `service` (
  `ServiceID` int(100) NOT NULL auto_increment,
  `ServiceGroupID` int(10) unsigned default '0',
  `CreatedDate` datetime default NULL,
  `Issue` varbinary(255) default NULL,
  `CreatedByUserID` int(10) unsigned default '0',
  `StatusID` int(10) unsigned default '1',
  `Subject` varbinary(255) default NULL,
  `IsDeleted` int(1) unsigned default '0',
  `LastCreateDate` datetime default NULL,
  PRIMARY KEY  (`ServiceID`),
  KEY `StatusID` (`StatusID`),
  KEY `IsDeleted` (`IsDeleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.service_task
CREATE TABLE IF NOT EXISTS `service_task` (
  `taskID` int(10) unsigned NOT NULL auto_increment,
  `TaskGroupID` int(20) unsigned default '0',
  `serviceID` int(10) unsigned default '0',
  `EntityID` int(10) unsigned default '0',
  `task` varbinary(255) default NULL,
  `solution` varbinary(255) default NULL,
  `CreatedDate` datetime default NULL,
  `StartDate` datetime default NULL,
  `CreatedByUserID` int(10) unsigned default '0',
  `AssignedTo` int(10) unsigned default '0',
  `AssignedBy` int(10) unsigned default '0',
  `PriorityID` int(20) unsigned default '2',
  `StatusID` int(10) unsigned default '1',
  `AllowCloseFlags` int(8) default NULL,
  `AllowCloseID` int(8) default NULL,
  `reason` varbinary(255) default NULL,
  `DeadLine` datetime default NULL,
  `Reassigned` int(1) unsigned default '0',
  `ReassignedId` int(10) unsigned default NULL,
  `Reminder` datetime default NULL,
  `ReminderON` int(1) unsigned default '0',
  `Parent` int(10) unsigned default NULL,
  `Reassignments` varbinary(255) default NULL,
  `Addtextflag` int(1) unsigned default '0',
  `AccessKind` int(1) unsigned default '0',
  `UsedByUserID` int(10) default '0',
  `Timeout` datetime default NULL,
  PRIMARY KEY  (`taskID`),
  KEY `serviceID` (`serviceID`),
  KEY `CreatedDate` (`CreatedDate`),
  KEY `StartDate` (`StartDate`),
  KEY `StatusID` (`StatusID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.service_task_history
CREATE TABLE IF NOT EXISTS `service_task_history` (
  `TaskLogID` int(8) NOT NULL auto_increment,
  `UserID` int(8) NOT NULL default '0',
  `TaskID` int(8) NOT NULL default '0',
  `ChangeTime` datetime default NULL,
  `StatusID` int(1) default NULL,
  `AssignedTo` int(8) default NULL,
  `Deleted` int(1) default NULL,
  `Solution` varbinary(255) default NULL,
  `Reason` varbinary(255) default NULL,
  `Reassigned` int(1) unsigned default '0',
  `Child` int(10) unsigned default NULL,
  `AccessKind` int(1) unsigned default '0',
  PRIMARY KEY  (`TaskLogID`),
  KEY `UserID` (`UserID`),
  KEY `TaskID` (`TaskID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.sipextensions
CREATE TABLE IF NOT EXISTS `sipextensions` (
  `ExtID` int(20) unsigned NOT NULL auto_increment,
  `Username` varbinary(255) default NULL,
  `Password` varbinary(255) default NULL,
  `Domain` varbinary(255) default NULL,
  `BindtoListenIP` int(1) unsigned default '1',
  `ListenIP` varbinary(255) default NULL,
  `NumberOfLines` int(10) unsigned default '5',
  `Prefix` varbinary(50) default NULL,
  `Areacode` varbinary(50) default NULL,
  `GSM610` int(1) unsigned default '1',
  `iLBC` int(1) unsigned default '1',
  `GSM711ALaw` int(1) unsigned default '1',
  `GSM711ULaw` int(1) unsigned default '1',
  `AuthorizationUsername` varbinary(255) default NULL,
  `LoggedUserID` int(1) unsigned default '0',
  `Removeleadingzero` int(1) unsigned default '0',
  `UseFixedPrefix` int(1) unsigned default '1',
  `UsedCodec` varbinary(255) default 'G729,AMR0,G7221,G7220,SPEEX0,SPEEXWB,AMRWB',
  PRIMARY KEY  (`ExtID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.sip_realtimecalls
CREATE TABLE IF NOT EXISTS `sip_realtimecalls` (
  `CallId` varbinary(255) default NULL,
  `CallStatus` int(1) unsigned default '0',
  `DisplayName` varbinary(255) default NULL,
  `UserName` varbinary(255) default NULL,
  `FromURI` varbinary(255) default NULL,
  `ToURI` varbinary(255) default NULL,
  `entityID` int(10) unsigned default '0',
  `CallDate` datetime default NULL,
  `Incoming` int(1) unsigned default '1',
  `lineID` int(10) unsigned default '0',
  `extID` int(10) unsigned default '0',
  `userID` int(10) unsigned default '0',
  `CampaignID` int(10) default '0',
  KEY `CallId` (`CallId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.sip_taprequest
CREATE TABLE IF NOT EXISTS `sip_taprequest` (
  `From_Ext` int(10) unsigned default '0',
  `From_UserID` int(10) unsigned default '0',
  `To_Ext` int(10) unsigned default '0',
  `To_UserID` int(10) unsigned default '0',
  KEY `From_Ext` (`From_Ext`),
  KEY `To_Ext` (`To_Ext`),
  KEY `To_UserID` (`To_UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.spooler
CREATE TABLE IF NOT EXISTS `spooler` (
  `spoolID` int(200) unsigned NOT NULL auto_increment,
  `messageID` int(20) unsigned default NULL,
  `messageType` int(1) unsigned NOT NULL default '0',
  `EntityID` int(20) unsigned default NULL,
  `status` int(10) default '0',
  `StationID` int(20) default '0',
  `StationTimeOut` datetime default NULL,
  `spoolDate` datetime default NULL,
  `changedDate` datetime default NULL,
  `ScheduleTo` datetime NOT NULL default '0000-00-00 00:00:00',
  `ScheduleByUserID` int(20) unsigned NOT NULL default '0',
  `Priority` int(1) NOT NULL default '0',
  `Device` int(20) default NULL,
  `ErrorCode` int(10) unsigned default '0',
  `ErrorMessage` varbinary(255) default NULL,
  `Copies` int(20) unsigned default '1',
  `Log` text,
  `Visible` int(1) unsigned default '1',
  `Orientation` int(1) default '0',
  `userID` int(20) unsigned default NULL,
  `Order_DocumentID` int(20) NOT NULL default '-1',
  `Retries` int(10) unsigned default '0',
  `color` varbinary(50) default NULL,
  `AutoDialHangUp` int(2) unsigned default '0',
  `TotalTalkTime` int(20) unsigned default '0',
  PRIMARY KEY  (`spoolID`),
  KEY `EntityID` (`EntityID`),
  KEY `messageID` (`messageID`),
  KEY `messageType` (`messageType`),
  KEY `status` (`status`),
  KEY `Priority` (`Priority`),
  KEY `ScheduleTo` (`ScheduleTo`),
  KEY `StationID` (`StationID`),
  KEY `StationTimeOut` (`StationTimeOut`),
  KEY `ErrorCode` (`ErrorCode`),
  KEY `ScheduleByUserID` (`ScheduleByUserID`),
  KEY `AutoDialHangUp` (`AutoDialHangUp`),
  KEY `messageID_2` (`messageID`),
  KEY `messageType_2` (`messageType`),
  KEY `status_2` (`status`),
  KEY `ErrorCode_2` (`ErrorCode`),
  KEY `StationID_2` (`StationID`),
  KEY `EntityID_2` (`EntityID`),
  KEY `ScheduleByUserID_2` (`ScheduleByUserID`),
  KEY `ScheduleTo_2` (`ScheduleTo`),
  KEY `Priority_2` (`Priority`),
  KEY `TotalTalkTime` (`TotalTalkTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.stations
CREATE TABLE IF NOT EXISTS `stations` (
  `StationID` int(20) unsigned NOT NULL auto_increment,
  `Serial` varbinary(255) default NULL,
  `StationTimeOut` datetime default NULL,
  `ModemNumbers` varbinary(255) default NULL,
  `Synchronization` varbinary(255) default NULL,
  `Registration` varbinary(255) default NULL,
  `Version` varbinary(10) default NULL,
  PRIMARY KEY  (`StationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.systemlog
CREATE TABLE IF NOT EXISTS `systemlog` (
  `LogID` int(20) unsigned NOT NULL auto_increment,
  `LogAction` varbinary(255) default NULL,
  `userID` int(20) unsigned default NULL,
  `userName` varbinary(255) default '0',
  `LogDate` datetime default NULL,
  PRIMARY KEY  (`LogID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.system_parameters
CREATE TABLE IF NOT EXISTS `system_parameters` (
  `ParmID` int(20) unsigned NOT NULL auto_increment,
  `ParmName` varbinary(255) default NULL,
  `ParmValue` varbinary(255) default NULL,
  `ParmValue2` varbinary(255) default NULL,
  `ParmValue3` varbinary(255) default NULL,
  `ParmValue4` varbinary(255) default NULL,
  `ParmValue5` varbinary(255) default NULL,
  `ParmValue6` varbinary(255) default NULL,
  `ParmValue7` varbinary(255) default NULL,
  `ParmValue8` varbinary(255) default NULL,
  `ParmValue9` varbinary(255) default NULL,
  `ParmValue10` varbinary(255) default NULL,
  `ParmValue11` varbinary(255) default NULL,
  `ParmValue12` varbinary(255) default NULL,
  `ParmValue13` varbinary(255) default NULL,
  `ParmValue14` varbinary(255) default NULL,
  `ParmValue15` varbinary(255) default NULL,
  `ParmValue16` varbinary(255) default NULL,
  `ParmValue17` varbinary(255) default NULL,
  `ParmValue18` varbinary(255) default NULL,
  `ParmValue19` varbinary(255) default NULL,
  `ParmValue20` varbinary(255) default NULL,
  PRIMARY KEY  (`ParmID`),
  KEY `ParmName` (`ParmName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.telemarketing
CREATE TABLE IF NOT EXISTS `telemarketing` (
  `CampaignID` int(20) unsigned NOT NULL auto_increment,
  `CampaignName` varbinary(255) default NULL,
  `FaxMessageID` int(20) unsigned default '0',
  `EmailMessageID` int(20) unsigned default '0',
  `SMSMessageID` int(20) unsigned default '0',
  `UsersID` text,
  `CampaignType` int(1) unsigned default '0',
  `deleted` int(1) unsigned NOT NULL default '0',
  `HideCampaignHistory` int(1) unsigned default '0',
  `AutoDialNextCampaign` int(1) unsigned NOT NULL default '0',
  `RescheduledCallByOperator` int(1) unsigned NOT NULL default '1',
  `AutoOpenEntity` int(1) unsigned default '0',
  `BusinessID` int(10) unsigned default '1',
  `ActiveSpooler` int(10) NOT NULL default '0',
  `FinishedSpooler` int(10) NOT NULL default '0',
  `DisabledStatuss` varbinary(255) default NULL,
  `isCustomPhone` int(1) unsigned default '0',
  `isCustomPhoneCategoryID` int(10) unsigned default '0',
  `ScheduledSpooler` int(10) NOT NULL default '0',
  `ScheduledCallOwnFor` int(1) unsigned NOT NULL default '7',
  `LastUpdate` datetime default NULL,
  `AccessKind` int(1) default '1',
  `GroupsID` blob,
  `RequestStatusAfterEachCall` int(1) NOT NULL default '1',
  `StatusIDAfterEachCall` int(1) NOT NULL default '0',
  `IsMaxRescheduledDays` int(1) unsigned NOT NULL default '0',
  `MaxRescheduledDays` int(1) unsigned NOT NULL default '7',
  `StatusIDMaxRescheduled` int(1) unsigned NOT NULL default '0',
  `SysStatusIDMaxRescheduled` int(1) unsigned NOT NULL default '0',
  `ScriptFileName` varbinary(255) default NULL,
  `AutoDialerLineQty` int(2) default '2',
  `AutoDialerNoAnswerAfter` int(4) unsigned default '18',
  PRIMARY KEY  (`CampaignID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.telemarketing_history
CREATE TABLE IF NOT EXISTS `telemarketing_history` (
  `HistoryID` int(20) unsigned NOT NULL auto_increment,
  `spoolID` int(20) unsigned default NULL,
  `CampaignID` int(20) unsigned NOT NULL default '0',
  `entityID` int(20) unsigned NOT NULL default '0',
  `userID` int(20) unsigned NOT NULL default '0',
  `StatusID` int(3) unsigned default NULL,
  `StatusCaption` varbinary(255) default NULL,
  `Remark` varbinary(2000) default NULL,
  `CallStarted` datetime NOT NULL default '0000-00-00 00:00:00',
  `CallAnswered` datetime default '0000-00-00 00:00:00',
  `CallEnded` datetime NOT NULL default '0000-00-00 00:00:00',
  `ScheduleTo` datetime NOT NULL default '0000-00-00 00:00:00',
  `CampaignType` int(1) unsigned default '0',
  `PhoneNumber` varbinary(255) default NULL,
  `CampaignName` varbinary(255) NOT NULL,
  `username` varbinary(255) default NULL,
  `StationID` int(10) unsigned default '0',
  `DialCount` int(10) unsigned default '0',
  PRIMARY KEY  (`HistoryID`),
  KEY `entityID` (`entityID`),
  KEY `StatusID` (`StatusID`),
  KEY `CampaignType` (`CampaignType`),
  KEY `spoolID` (`spoolID`),
  KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.telemarketing_phone_script
CREATE TABLE IF NOT EXISTS `telemarketing_phone_script` (
  `scriptID` int(20) unsigned NOT NULL auto_increment,
  `CampaignID` int(10) unsigned NOT NULL default '0',
  `Title` varbinary(255) default NULL,
  `Body` text,
  `stationID` int(20) unsigned default NULL,
  `Postion` int(9) unsigned default '0',
  `WaveFile` varbinary(255) default NULL,
  PRIMARY KEY  (`scriptID`),
  KEY `CampaignID` (`CampaignID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.telemarketing_script
CREATE TABLE IF NOT EXISTS `telemarketing_script` (
  `CampaignID` int(20) unsigned default NULL,
  `ScriptID` int(20) unsigned default '0',
  `ParentID` int(20) unsigned default NULL,
  `Title` varbinary(255) default NULL,
  `StatusID` int(20) unsigned default '0',
  `FaxMessageID` int(20) unsigned default '0',
  `EmailMessageID` int(20) unsigned default '0',
  `SMSMessageID` int(20) unsigned default '0',
  `TelemarketingID` int(20) unsigned default '0',
  `CategoryID` int(20) unsigned default '0',
  `isDTMFset` int(1) unsigned default '0',
  `DTMFField` varbinary(255) default NULL,
  `DTMFEnd` char(1) default NULL,
  `isCancelCall` int(1) unsigned default '0',
  `body` text,
  `isTransferCall` int(1) unsigned default '0',
  `TransferPhoneNumber` varbinary(255) default NULL,
  UNIQUE KEY `ScriptID` (`ScriptID`),
  KEY `ParentID` (`ParentID`),
  KEY `CampaignID` (`CampaignID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.telemarketing_shift
CREATE TABLE IF NOT EXISTS `telemarketing_shift` (
  `ShiftID` int(10) NOT NULL auto_increment,
  `UserID` int(10) default NULL,
  `FirstCallDate` datetime default NULL,
  `LastCallDate` datetime default NULL,
  PRIMARY KEY  (`ShiftID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.telemarketing_status
CREATE TABLE IF NOT EXISTS `telemarketing_status` (
  `statusID` int(20) unsigned NOT NULL auto_increment,
  `caption` varbinary(255) default NULL,
  `isRemarkRequired` int(1) unsigned default '0',
  `isSendFax` int(1) unsigned default '0',
  `isSendEmail` int(1) unsigned default '0',
  `isSendSMS` int(1) unsigned default '0',
  `RedialType` int(1) unsigned default '0',
  `RedialDailyTime` time default NULL,
  `isRestoreCallToGlobal` int(1) default '0',
  `FaxMessageID` int(20) unsigned default '0',
  `EmailMessageID` int(20) unsigned default '0',
  `SMSMessageID` int(20) unsigned default '0',
  `TelemarketingID` int(20) unsigned default '0',
  `CategoryID` int(20) unsigned default '0',
  `color` varbinary(50) default 'clWindow',
  `isDialNextEntity` int(1) unsigned default '0',
  `SystemStatusID` int(2) unsigned default '0',
  `ChangeStatusRetries` int(10) unsigned default '0',
  `ChangeStatusID` int(10) unsigned default '0',
  `CampaignType` int(1) unsigned default '0',
  `LastUsed` datetime default '0000-00-00 00:00:00',
  `Priority` int(1) unsigned default '0',
  `TelemarketingDeleteFromCurrent` int(1) unsigned default '0',
  `CaptionID` int(10) default NULL,
  PRIMARY KEY  (`statusID`),
  KEY `SystemStatusID` (`SystemStatusID`),
  KEY `CaptionID` (`CaptionID`),
  KEY `CampaignType` (`CampaignType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.telemarketing_tracking
CREATE TABLE IF NOT EXISTS `telemarketing_tracking` (
  `trackID` int(10) NOT NULL auto_increment,
  `spoolID` int(10) NOT NULL default '0',
  `UserID` int(10) default '0',
  `EntityID` int(10) default '0',
  `CreatedDate` datetime default NULL,
  `UpdateDate` datetime default NULL,
  PRIMARY KEY  (`trackID`),
  KEY `spoolID` (`spoolID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.textdata
CREATE TABLE IF NOT EXISTS `textdata` (
  `tdID` int(10) NOT NULL auto_increment,
  `Enu` varbinary(255) default NULL,
  `Rus` varbinary(255) default NULL,
  `Ukr` varbinary(255) default NULL,
  `Heb` varbinary(255) default NULL,
  PRIMARY KEY  (`tdID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `TicketID` int(20) unsigned NOT NULL auto_increment,
  `EntityID` int(20) unsigned default '0',
  `TicketStatus` int(2) unsigned default '0',
  `CreatedByUserID` int(20) unsigned default '0',
  `AssignedToUserID` int(20) unsigned default '0',
  `ModifiedByUserID` int(20) unsigned default '0',
  `TicketDate` datetime default NULL,
  `DueDate` datetime default NULL,
  `ModifiedDate` datetime default NULL,
  `StatusID` int(20) unsigned default '0',
  `Priority` int(20) unsigned default '2',
  `Subject` varbinary(255) default NULL,
  `Description` blob,
  `Resolution` blob,
  PRIMARY KEY  (`TicketID`),
  KEY `EntityID` (`EntityID`),
  KEY `TicketStatus` (`TicketStatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.users
CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(20) unsigned NOT NULL auto_increment,
  `username` varbinary(255) default NULL,
  `password` varbinary(255) default NULL,
  `FirstName` varbinary(255) default NULL,
  `LastName` varbinary(255) default NULL,
  `Phone` varbinary(255) default NULL,
  `Email` varbinary(255) default NULL,
  `FaxNumber` varbinary(255) default NULL,
  `Position` varbinary(255) default NULL,
  `permissions` text,
  `linenumbers` text,
  `emailaccounts` text,
  `CryptedID` int(10) unsigned default '0',
  `PermissionGroupID` int(100) unsigned default '0',
  `ExtID` int(20) default '0',
  `RegisterSIP` int(1) unsigned default '1',
  `UserGroups` varbinary(200) default NULL,
  `isLogged` int(1) unsigned default '0',
  `LoginDate` datetime default NULL,
  `isDeleted` int(1) default '0',
  `EntityID` int(20) unsigned NOT NULL default '0',
  `PerHour` decimal(10,4) default '0.0000',
  `Fixedsalary` int(1) unsigned default '0',
  `travel` decimal(10,4) unsigned default '0.0000',
  `Fixedtravel` int(1) unsigned default '0',
  `CreatedByUserID` int(20) unsigned default NULL,
  PRIMARY KEY  (`userID`),
  KEY `username` (`username`),
  KEY `isLogged` (`isLogged`),
  KEY `EntityID` (`EntityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.users_group
CREATE TABLE IF NOT EXISTS `users_group` (
  `User_GroupID` int(10) unsigned NOT NULL auto_increment,
  `GroupName` varbinary(50) default NULL,
  `ViewAllInbox` int(1) unsigned default '0',
  `isDeleted` int(10) unsigned default '0',
  `DisallowUsersTap` blob,
  PRIMARY KEY  (`User_GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.users_messager
CREATE TABLE IF NOT EXISTS `users_messager` (
  `messageID` int(9) NOT NULL auto_increment,
  `to_userID` int(9) unsigned default '0',
  `from_userID` int(9) unsigned default '0',
  `send_on_date` datetime default NULL,
  `sent_date` datetime default NULL,
  `received_date` datetime default NULL,
  `body` text,
  `isread` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`messageID`),
  KEY `to_userID` (`to_userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.users_payroll
CREATE TABLE IF NOT EXISTS `users_payroll` (
  `payrollID` int(10) NOT NULL auto_increment,
  `payrollDate` datetime default NULL,
  `userID` int(10) NOT NULL default '0',
  `WorkingDays` int(10) NOT NULL default '0',
  `WorkingTime` int(10) default '0',
  `Vacation` decimal(10,2) default '0.00',
  `Sick` decimal(10,2) default '0.00',
  `TravelPay` decimal(10,2) default '0.00',
  `PerHour` decimal(10,2) default '0.00',
  `Bonuses` decimal(10,2) default '0.00',
  `TotalForHours` decimal(10,2) default '0.00',
  `TotalPay` decimal(10,2) default '0.00',
  PRIMARY KEY  (`payrollID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.users_permissions
CREATE TABLE IF NOT EXISTS `users_permissions` (
  `PermissionID` int(20) unsigned NOT NULL auto_increment,
  `UserID` int(20) unsigned default NULL,
  `type` int(20) unsigned default NULL,
  PRIMARY KEY  (`PermissionID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.users_shift
CREATE TABLE IF NOT EXISTS `users_shift` (
  `ShiftID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned default NULL,
  `StartDate` datetime default NULL,
  `EndDate` datetime default NULL,
  PRIMARY KEY  (`ShiftID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mekashrontv.users_visible_fields
CREATE TABLE IF NOT EXISTS `users_visible_fields` (
  `visible_fieldsID` int(20) unsigned NOT NULL auto_increment,
  `UserID` int(20) unsigned default NULL,
  `title` varbinary(255) default NULL,
  `name` varbinary(255) default NULL,
  `width` int(20) unsigned default '100',
  `ColumnIndex` int(20) unsigned default '0',
  `OrderBy` varbinary(255) default NULL,
  `bgColor` varbinary(255) default NULL,
  PRIMARY KEY  (`visible_fieldsID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
