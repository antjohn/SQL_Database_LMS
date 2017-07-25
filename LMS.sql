USE [db_lms]
BEGIN

/*Make sure to create the database db_lms before executing the 
remaining procedure.*/


	/******************************************************
	 * If our tables already exist, drop and recreate them
	 ******************************************************/
	IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tbl_book)
		DROP TABLE tbl_book_authors, tbl_book_loans, tbl_book_copies, tbl_book, tbl_publisher, tbl_borrower, tbl_library_branch;
		
		
	/******************************************************
	 * Build our database tables and define their schema
	 ******************************************************/
/*tbl_publisher build*/
	CREATE TABLE tbl_publisher (
		publisher_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		publisher_name VARCHAR(50) NOT NULL,
		publisher_address VARCHAR(50) NOT NULL,
		publisher_phone VARCHAR(20) NOT NULL
	);

	INSERT INTO tbl_publisher
		(publisher_name, publisher_address, publisher_phone)
		VALUES 
		('Mad Hatter Publishing, Inc.', '123 6th St. Melbourne, FL 32904', '(203)974-5626'),
		('Low Baller Printing, LLC', '4 Goldfield Rd. Honolulu, HI 96815', '(231)596-3858'),
		('C & A Truck And Equipment', '44 Shirley Ave. West Chicago, IL 60185', '(662)277-8756'),
		('Skildipity Services', '8283 S. Forest Street Corona, NY 11368', '(669)444-1634'),
		('Maps Co', '882 Pin Oak Street Neptune, NJ 07753', '(309)402-8843'),
		('Smith Newspapers Inc', '7190 Vernon Court Chelsea, MA 02150', '(316)522-1804'),
		('Federal Book Initiators', '60 Aspen St. Summerville, SC 29483', '(540)308-8447'),
		('Faithfully Yours Embroidery', '8892 Foster Ave. Fort Walton Beach, FL 32547', '(435)363-1691')
	;
	SELECT * FROM tbl_publisher;
/*tbl_publisher built*/

/*tbl_book build*/
	CREATE TABLE tbl_book (
		book_id INT PRIMARY KEY NOT NULL IDENTITY (4000,13),
		book_title VARCHAR(50) NOT NULL,
		publisher_id INT NOT NULL CONSTRAINT fk_publisher_id FOREIGN KEY REFERENCES tbl_publisher(publisher_id) ON UPDATE CASCADE ON DELETE CASCADE,
	);

	INSERT INTO tbl_book
		(book_title, publisher_id)
		VALUES 
		('Replace the Straw: A Hay Huckin Guide', 1),
		('The Art of Business Blasphemy', 1),
		('Stolen Sliver', 2),
		('The Manual Manual: Transmissions for Men', 3),
		('The Lost Tribe', 1),
		('The Prized Rainbow', 4),
		('The Guardian''s Streams', 4),
		('Search of Servants', 4),
		('The Bridges''s Eyes', 4),
		('The Kiss of the Vision', 4),
		('The Map', 5),
		('The Daily Slurm', 6),
		('The Manhattan Project: Lessons Learned', 7),
		('Map This', 5),
		('The Forgotten Wife', 8),
		('Erect Beginning', 2),
		('Crossing Oracle: Book 1 of The Sangarica Trilogy', 4),
		('Overpass Canon: Book 2 of The Sangarica Trilogy', 4),
		('Loop Fortune: Book 3 of The Sangarica Trilogy', 4),
		('All Up In Your Map', 5),
		('All Up In Your Map 2: Are You Map, Bro?', 5),
		('The Danger''s of Magic', 4)
	;
	SELECT * FROM tbl_book;
/*tbl_book built*/

/*tbl_book_authors build*/
	CREATE TABLE tbl_book_authors (
		book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		book_authors_name VARCHAR(50) NOT NULL
	);

	INSERT INTO tbl_book_authors
		(book_id, book_authors_name)
		VALUES 
		(4000, 'Stephen King'),
		(4013, 'Intelligent Business Consultants'),
		(4026, 'Instrumentation Design Lab'),
		(4039, 'C & A Truck And Equipment'),
		(4052, 'Sandy Ishataro'),
		(4065, 'Sharita Borrego'),
		(4078, 'Adriana and Orville Fuentes'),
		(4091, 'Clinton Rasar'),
		(4104, 'Adriana and Orville Fuentes'),
		(4117, 'Sharita Borrego'),
		(4130, 'Matty Mapmaker'),
		(4143, 'Archibald Fuddlesworth'),
		(4156, 'Manhattan Group Inc'),
		(4169, 'Matty Mapmaker'),
		(4182, 'Miss Martha Ray Robinson'),
		(4195, 'Innovative Rod Products'),
		(4208, 'Dagmar Elrod'),
		(4221, 'Dagmar Elrod'),
		(4234, 'Dagmar Elrod'),
		(4247, 'Matty Mapmaker'),
		(4260, 'Matty Mapmaker'),
		(4273, 'Adriana and Orville Fuentes')
	;
	SELECT * FROM tbl_book_authors;

/*tbl_book_authors built*/

/*tbl_borrower build*/
	CREATE TABLE tbl_borrower (
		card_no INT PRIMARY KEY NOT NULL IDENTITY(112,3),
		borrower_name VARCHAR(50) NOT NULL,
		borrower_address VARCHAR(50) NOT NULL,
		borrower_phone VARCHAR(20) NOT NULL,
	);
	
	INSERT INTO tbl_borrower 
		(borrower_name, borrower_address, borrower_phone)
		VALUES 
		('Aaron N. Stark', '2308 Rodney Street Valley Park, MO 63088', '636-431-8280'),
		('Judith J. Au', '43 Summit Park Avenue Southfield, MI 48034', '248-997-1968'),
		('Darlene L. Murphy', '629 Sand Fork Road Logansport, IN 46947', '574-722-8330'),
		('Mary K. Dempsey', '2283 Earnhardt Drive Louisville, KY 40202', '502-629-4933'),
		('Ed S. McLaughlin', '1295 Twin Oaks Drive Clam River, MI 49612', '231-377-4999'),
		('Charles C. Colvin', '71 Tenmile Suffolk, VA 23434', '757-925-4881'),
		('Christopher S. Ball', '951 Traction Street Spartanburg, SC 29303', '864-544-5181'),
		('Elizabeth S. Johnson', '3728 Pickens Way Winnsboro, TX 75494', '903-342-9814'),
		('Justin J. Jefferson', '4013 Marshville Road New York, NY 10011', '845-617-8904'),
		('Kathy T. Bibby', '3200 Delaware Avenue San Rafael, CA 94909', '415-257-6261'),
		('Roy A. Bibby', '3200 Delaware Avenue San Rafael, CA 94909', '415-257-6261'),
		('Arnold T. Bibby', '3200 Delaware Avenue San Rafael, CA 94909', '415-257-6261')
	;
	SELECT * FROM tbl_borrower;
/*tbl_borrower built*/


/*tbl_library_branch build*/
	CREATE TABLE tbl_library_branch (
		branch_id INT PRIMARY KEY NOT NULL IDENTITY (7000,123),
		branch_name VARCHAR(50) NOT NULL,
		branch_address VARCHAR(50) NOT NULL,
	);
	INSERT INTO tbl_library_branch 
		(branch_name, branch_address)
		VALUES 
		('Sharpstown', '2067 Stiles Street Pittsburgh, PA 15222'),
		('Central', '1446 Brownton Road Greenville, MS 38701'),
		('South', '2708 Heavens Way Los Angeles, CA 90017'),
		('North', '2424 Pick Street Edwards, CO 81632')
	;
	SELECT * FROM tbl_library_branch;
/*tbl_library_branch built*/

/*tbl_book_copies build*/
	CREATE TABLE tbl_book_copies (
		book_id INT NOT NULL CONSTRAINT fk_book_id_2 FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		branch_id INT NOT NULL CONSTRAINT fk_branch_id_2 FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		no_of_copies INT NOT NULL
	);
	INSERT INTO tbl_book_copies 
		(book_id, branch_id, no_of_copies)
		VALUES 
		(4000, 7000, 6),
		(4000, 7123, 5),
		(4000, 7246, 7),
		(4000, 7369, 3),
		(4013, 7000, 2),
		(4013, 7123, 2),
		(4013, 7246, 2),
		(4013, 7369, 2),
		(4026, 7123, 5),
		(4026, 7246, 5),
		(4026, 7369, 3),
		(4039, 7000, 3),
		(4039, 7123, 2),
		(4039, 7369, 2),
		(4052, 7123, 4),
		(4052, 7246, 2),
		(4052, 7000, 13),
		(4052, 7369, 8),
		(4065, 7000, 13),
		(4065, 7123, 10),
		(4078, 7000, 2),
		(4078, 7123, 3),
		(4078, 7246, 7),
		(4078, 7369, 3),
		(4091, 7123, 11),
		(4104, 7000, 11),
		(4104, 7123, 6),
		(4104, 7246, 2),
		(4104, 7369, 7),
		(4117, 7123, 3),
		(4117, 7246, 5),
		(4117, 7369, 8),
		(4130, 7123, 10),
		(4130, 7246, 15),
		(4143, 7123, 19),
		(4143, 7246, 6),
		(4143, 7369, 4),
		(4156, 7123, 6),
		(4156, 7246, 3),
		(4169, 7000, 11),
		(4169, 7123, 5),
		(4169, 7246, 6),
		(4169, 7369, 4),
		(4182, 7000, 18),
		(4182, 7123, 17),
		(4195, 7123, 14),
		(4195, 7246, 3),
		(4195, 7369, 5),
		(4208, 7246, 17),
		(4208, 7369, 3),
		(4221, 7000, 12),
		(4221, 7123, 5),
		(4221, 7369, 9),
		(4234, 7000, 8),
		(4234, 7123, 5),
		(4234, 7246, 4),
		(4234, 7369, 10),
		(4247, 7000, 7),
		(4247, 7123, 4),
		(4247, 7246, 2),
		(4247, 7369, 8),
		(4260, 7000, 8),
		(4260, 7123, 8),
		(4273, 7246, 9),
		(4273, 7369, 26),
		(4273, 7123, 4)
	;
	SELECT * FROM tbl_book_copies;
/*tbl_book_copies built*/

/*tbl_book_loans build*/
	CREATE TABLE tbl_book_loans (
		book_id INT NOT NULL CONSTRAINT fk_book_id_3 FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		branch_id INT NOT NULL CONSTRAINT fk_branch_id_3 FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		card_no INT NOT NULL CONSTRAINT fk_card_no_3 FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
		date_out DATE NOT NULL,
		due_date DATE NOT NULL,
	);
	INSERT INTO tbl_book_loans
		(book_id, branch_id, card_no, date_out, due_date)
		VALUES 
		(4000, 7000, 112, '19960725', '19961025'),
		(4000, 7123, 115, '20170704', '20171004'),
		(4000, 7246, 118, '20160930', '20161230'),
		(4000, 7369, 121, '20170724', '20171004'),
		(4013, 7000, 124, '20170624', '20170924'),
		(4013, 7123, 127, '20170724', '20171004'),
		(4013, 7246, 130, '20170724', '20171004'),
		(4013, 7369, 133, '19960725', '19961025'),
		(4026, 7123, 136, '20170322', '20170322'),
		(4026, 7246, 139, '20170419', '20170719'),
		(4026, 7369, 112, '20170724', '20171004'),
		(4039, 7000, 115, '20170724', '20171024'),
		(4039, 7123, 118, '20170724', '20171024'),
		(4039, 7369, 121, '20170704', '20171004'),
		(4052, 7123, 124, '20170419', '20170719'),
		(4052, 7246, 127, '20170322', '20170622'),
		(4052, 7369, 130, '20170724', '20171024'),
		(4065, 7000, 133, '20170724', '20171024'),
		(4065, 7123, 136, '20170724', '20171024'),
		(4078, 7000, 139, '20170419', '20170719'),
		(4078, 7123, 112, '20170419', '20170719'),
		(4078, 7246, 115, '20170322', '20170622'),
		(4078, 7369, 118, '20170419', '20170719'),
		(4091, 7123, 121, '20160930', '20161230'),
		(4104, 7000, 124, '20170419', '20170719'),
		(4104, 7123, 127, '20170704', '20171004'),
		(4104, 7246, 130, '20170419', '20170719'),
		(4104, 7369, 133, '20170322', '20170622'),
		(4117, 7123, 136, '20170419', '20170719'),
		(4117, 7246, 139, '20170724', '20171024'),
		(4117, 7369, 112, '20170419', '20170719'),
		(4130, 7123, 115, '20170419', '20170719'),
		(4130, 7246, 118, '20160930', '20161230'),
		(4143, 7123, 121, '20170419', '20170719'),
		(4143, 7246, 124, '20170322', '20170622'),
		(4143, 7369, 127, '20170419', '20170719'),
		(4156, 7123, 130, '20170419', '20170719'),
		(4156, 7246, 133, '20170419', '20170719'),
		(4169, 7000, 136, '20170704', '20171004'),
		(4169, 7123, 139, '20170419', '20170719'),
		(4169, 7246, 112, '20170322', '20170622'),
		(4169, 7369, 115, '20170419', '20170719'),
		(4182, 7000, 118, '20170419', '20170719'),
		(4182, 7123, 121, '19960725', '19961025'),
		(4195, 7123, 124, '20170419', '20170719'),
		(4195, 7246, 127, '20170322', '20170622'),
		(4195, 7369, 130, '20170419', '20170719'),
		(4208, 7246, 133, '20170419', '20170719'),
		(4208, 7369, 136, '20170322', '20170622'),
		(4221, 7000, 139, '20170419', '20170719'),
		(4221, 7123, 112, '20170322', '20170622'),
		(4221, 7369, 115, '20170419', '20170719'),
		(4234, 7000, 118, '20170704', '20171004'),
		(4234, 7123, 121, '20170322', '20170622'),
		(4234, 7246, 124, '20170419', '20170719'),
		(4234, 7369, 127, '20160930', '20161230'),
		(4247, 7000, 130, '20170419', '20170719'),
		(4247, 7123, 133, '19960725', '19961025'),
		(4247, 7246, 136, '20170322', '20170622'),
		(4247, 7369, 139, '20170419', '20170719'),
		(4260, 7000, 112, '20170322', '20170622'),
		(4260, 7123, 115, '20170419', '20170719'),
		(4273, 7246, 118, '20170322', '20170622'),
		(4273, 7369, 121, '20170419', '20170719'),
		(4273, 7123, 124, '20170704', '20171004')
	;
	SELECT * FROM tbl_book_loans;
/*tbl_book_loans built*/


	/*****************************************************
	 * The following queries database using INNER JOINS.
	 ******************************************************/
/*1. Query number of copies of The Lost Tribe at Sharpstown Branch*/

	SELECT
		a1.book_title AS 'Title', a2.branch_name AS 'Branch', a3.no_of_copies AS 'Copies'
		FROM tbl_book a1
		INNER JOIN tbl_book_copies a3 ON a3.book_id = a1.book_id
		INNER JOIN tbl_library_branch a2 ON a2.branch_id = a3.branch_id
		WHERE a1.book_title = 'The Lost Tribe' AND a2.branch_name = 'Sharpstown'
	;

/*2. Query number of copies of The Lost Tribe at each branch*/

	SELECT
		a1.book_title AS 'Title', a2.branch_name AS 'Branch', a3.no_of_copies AS 'Copies'
		FROM tbl_book a1
		INNER JOIN tbl_book_copies a3 ON a3.book_id = a1.book_id
		INNER JOIN tbl_library_branch a2 ON a2.branch_id = a3.branch_id
		WHERE a1.book_title = 'The Lost Tribe'
	;

/*3. Query names of borrowers without any books checked out*/

	SELECT
		a1.borrower_name AS 'Borrower', COUNT(a2.card_no) AS 'Books Loaned Out'
		FROM tbl_borrower a1
		LEFT OUTER JOIN tbl_book_loans a2 ON a2.card_no = a1.card_no
		GROUP BY a1.borrower_name
		HAVING COUNT(a2.card_no) = 0
	;

/*4. Query for each book that is loaned out from the "Sharpstown" branch and 
whose DueDate is today, retrieve the book title, the borrower's name, and the 
borrower's address*/

	SELECT
		a1.book_title AS 'Title', a3.borrower_name AS 'Name', a3.borrower_address AS 'Address'
		FROM tbl_book a1
		INNER JOIN tbl_book_loans a2 ON a1.book_id = a2.book_id
		INNER JOIN tbl_borrower a3 ON a3.card_no = a2.card_no
		INNER JOIN tbl_library_branch a4 ON a4.branch_id = a2.branch_id
		WHERE a4.branch_name = 'Sharpstown' AND a2.due_date = '20170719' /*Had to select a date as none had a due date of TODAY()*/
	;

/*5. Query branch name and total number of books loaned out from that branch*/

	SELECT
		a1.branch_name AS 'Branch Name', COUNT(a2.book_id) AS 'Total Books Loaned Out'
		FROM tbl_library_branch a1
		INNER JOIN tbl_book_loans a2 ON a2.branch_id = a1.branch_id
		GROUP BY a1.branch_name
	;

/*6. Query the names, addresses, and number of books checked out for all borrowers 
who have more than five books checked out*/

	SELECT
		a1.borrower_name AS 'Borrower', a1.borrower_address AS 'Address', COUNT(a2.card_no) AS 'Books Loaned Out'
		FROM tbl_borrower a1
		LEFT OUTER JOIN tbl_book_loans a2 ON a2.card_no = a1.card_no
		GROUP BY a1.borrower_name, a1.borrower_address
		HAVING COUNT(a2.card_no) > 5
	;

/*7. Query For each book authored (or co-authored) by "Stephen King", retrieve the 
title and the number of copies owned by the library branch whose name is "Central".*/

	SELECT
		a1.book_title AS 'Title', a3.no_of_copies AS 'Copies'
		FROM tbl_book a1
		INNER JOIN tbl_book_copies a3 ON a3.book_id = a1.book_id
		INNER JOIN tbl_library_branch a2 ON a2.branch_id = a3.branch_id
		INNER JOIN tbl_book_authors a4 ON a4.book_id = a1.book_id
		WHERE a4.book_authors_name = 'Stephen King' AND a2.branch_name = 'Central'
	;
	
END