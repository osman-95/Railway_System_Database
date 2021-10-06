# Railway_System_Database

This project focused on designing a Database for a railway system that can provide an ease in future scalability , accessibility , parallel computing , cloud cloning as well as data protection.

The project began with designing  an entity-relationship diagram (ERD) which focuses on illustrating  on defining the entities and their respective attribute and the relationship they exhibit with each other. The ER diagram for this project is displayed below  comprising 6 main entities 
- Station
- Track
- Route
- Passenger Booking
- Passenger
- Train

![]()


The ERD once finalized, was followed up with implementation of relation model mainly focusing on expressing the relations of the entities which are nothing determining the relationships between individual tables illustrating the attributes, degree, cardinality   as well as the primary key for each table or entity.

The relational model for this project is demonstrated below.

![]()

The database was created on MySQL using SQL language and the SQL schema for the creation and updating of the database table is provided in the word format as well as in in SQL format.

To avoid redundancy in the database the relational model was restructured to design a star schema model by grouping the purely numerical facts in one table referred as fact table while the other descriptive attributes are grouped together and linked to the fact table creating a star like structure.

The Star Schema implemented in this project is displayed below

![]()

Since only one fact table was needed for the design, the star-schema or snowflake-schema could be chosen. The star-schema was chosen because the nature of our previously designed E-R diagram and relational model was such that smaller dimension tables weren’t needed. Had the Train dimension table been normalized and a Coach dimension table was used, or had the Station dimension table been normalized and a City dimension table was used, the snow-flake schema would have been more applicable. But since this was not the case for our design in Task 1, the star-schema was determined to be more appropriate.
In the diagram shown above, Sales is the fact table, while the other tables represent dimension tables in the data warehouse. The Sales fact table is connected to the set of dimension tables.
Both the measures i.e. no. of seats and sales in dollars, and the keys of the related dimension tables were included in the Sales fact table. The Sales fact table and the dimension tables each contain a surrogate key used as a primary key. The Sales fact table also contains a foreign key related to each dimension table.
To choose which columns were to be included in each of dimension tables, concept hierarchies were first formed for tables. To do so, we theorized what information the railway company executives may want to see.
In the relational model developed in Task 1, a table was not used for Time. So, in this design, the Time dimension table does not come from the operational data.

Using the star-schema developed above, two SQL script for the same were coded as shown 
below.

![]()

SQL script used for defining the fact table and the dimension tables for the model

![]()

SQL script that uses the select and insert statements (i.e. the ETL process) to populate the OLAP cube





