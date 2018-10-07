# court
Court is an open sourced (available under GNU GPL v3) CMS made to manage issues in Hostels in institutes and elsewhere. It notifies floor incharges when a complaint is added and notifies Hostel maintenance secretary in case of a serious complaint or when the list becomes too large, so he/she can call the maintenance worker. It is also capable of automatically organising, exporting and printing list of all complaints before notifying the maintenance secretary.

# database
Relations in the database:  
1. all_complains (record of resolved complaints till date)  
* complain_id : int(11) AUTO_INCREMENT
* hostel_no : int(11)
* floor_no : varchar(11)
* room_no : varchar(11)
* issue : mediumtext
* issue_type : tinytext
* roll_no : int(9)
* phone_no : bigint(12)
* time : timestamp -default: CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

2. announcements (record of announcements sent out)  
* id : int(11) AUTO_INCREMENT
* composer_level : tinytext
* hostel : int(11)
* issues : text
* subject : tinytext
* message : text
* composer_name : tinytext

3. complains (record of unresolved complaints)  
* complain_id : int(11) AUTO_INCREMENT
* hostel_no : int(11)
* floor_no : varchar(11)
* room_no : varchar(11)
* issue : mediumtext
* issue_type : tinytext
* roll_no : int(9)
* phone_no : bigint(12)
* time : timestamp -default: CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

4. issue_type_table (contains all the possible issue types)  
* issue_type_option_no : int(11) AUTO_INCREMENT
* issue_type_option_name : tinytext

5. users (contains information about users)  
* id : bigint(11) AUTO_INCREMENT
* level : tinytext
* hostel : int(11)
* name : tinytext
* email : varchar(100)
* username : tinytext
* password : varchar(40)
* phone : tinytext
* rset_flag : varchar(50)
