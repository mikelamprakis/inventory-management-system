insert into SUPPLIER (ID, NAME, DETAILS, DESCRIPTION) values (SUPPLIER_SEQ.nextval, 'General Electrics', 'contactus@ge.com', 'Electric machines, Aircraft Systems, Automotive parts');
insert into SUPPLIER (ID, NAME, DETAILS, DESCRIPTION) values (SUPPLIER_SEQ.nextval, 'Apple', 'contactus@apple.com', 'Mobile phones, tablets, laptops, tech accessories');
insert into SUPPLIER (ID, NAME, DETAILS, DESCRIPTION) values (SUPPLIER_SEQ.nextval, 'Power Electronics', 'contactus@pe.com', 'Electronic machines, gadgets, other tech accessories');

insert into ADDRESS (ID, WAREHOUSE, HOUSENUMBER, STREET, CITY, POSTCODE ) values (ADDRESS_SEQ.nextval, 'LAB8' ,'5', 'St Georges', 'Leeds','GU9 7LW');
insert into ADDRESS (ID, WAREHOUSE, HOUSENUMBER, STREET, CITY, POSTCODE ) values (ADDRESS_SEQ.nextval, 'NDR1' , '45', 'Street Road', 'Norwich','NR66GJ');

insert into ITEM (ID, TITLE , PRODUCTCODE, PRICE, STOCK, DATEUPDATED ) values (ITEM_SEQ.nextval, 'MacBook Air', '12021-4548545', 350.24 , 30, TO_DATE('2010/01/01', 'yyyy/mm/dd'));
insert into ITEM (ID, TITLE , PRODUCTCODE, PRICE, STOCK, DATEUPDATED ) values (ITEM_SEQ.nextval, 'Samsung Galaxy S6', '12021-4547452', 160.99 , 50, TO_DATE('2010/01/01', 'yyyy/mm/dd'));
insert into ITEM (ID, TITLE , PRODUCTCODE, PRICE, STOCK, DATEUPDATED ) values (ITEM_SEQ.nextval, 'Broadband Starlex Pro 2', '12021-4517856', 45.23 , 25, TO_DATE('2010/01/01', 'yyyy/mm/dd'));
insert into ITEM (ID, TITLE , PRODUCTCODE, PRICE, STOCK, DATEUPDATED ) values (ITEM_SEQ.nextval, 'Coffee Machine Dolce Gusto ', '12021-4547845', 35.24 , 55, TO_DATE('2010/01/01', 'yyyy/mm/dd'));
insert into ITEM (ID, TITLE , PRODUCTCODE, PRICE, STOCK, DATEUPDATED ) values (ITEM_SEQ.nextval, 'Wireles speaker SoundHub Mini 2', '12021-4546523', 15.99 , 45, TO_DATE('2010/01/01', 'yyyy/mm/dd'));

insert into SUPPLIER_WAREHOUSES  (SUPPLIER_ID, WAREHOUSES_ID) values (1, 1);
insert into SUPPLIER_WAREHOUSES  (SUPPLIER_ID, WAREHOUSES_ID) values (1, 2);

insert into ITEM_CATEGORIES  (ITEM_ID, CATEGORIES) values (1, 1);
insert into ITEM_CATEGORIES  (ITEM_ID, CATEGORIES) values (1, 2);

insert into ITEM_SUPPLIERS (ITEM_ID, SUPPLIERS_ID) values (1, 1);
insert into ITEM_SUPPLIERS (ITEM_ID, SUPPLIERS_ID) values (1, 2);

insert into USERS (DTYPE, ID, USERNAME, PASSWORD, USERTYPE ) values ('Admin', USERS_SEQ.nextval, 'admin-user', '123', 'ADMIN'); --DTYPE 1
insert into USERS (DTYPE, ID, USERNAME, PASSWORD, USERTYPE ) values ('Client', USERS_SEQ.nextval, 'client-user', '123', 'CLIENT'); --DTYPE 1