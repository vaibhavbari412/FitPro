/*1.Retrieve the name and membership_type of members who are female (gender = 'F').
2.	Find all members who have a Monthly membership type and have joined after 2023-11-01.
3.	Retrieve the name and status of members who have an Active status and are aged above 25.
4.	Retrieve the details of visits made by members with visit_date = '2024-01-01'.
5.	Get the list of members who have a Quarterly membership type and are aged between 20 and 30.
*/

--1.Retrieve the name and membership_type of members who are female (gender = 'F')
SELECT 
	m."name",
	mb.membership_type,
--	mb.gender
FROM members m 
INNER JOIN memberships mb
ON mb.member_id = m.member_id
WHERE mb.gender = 'F'

--2.Find all members who have a Monthly membership type and have joined after 2023-11-01
SELECT
	m."name",
	mb.membership_type,
	mb.join_date
FROM members m 
INNER JOIN memberships mb
on m.member_id=mb.member_id
where mb.join_date >='2023-11-01'

--3.Retrieve the name and status of members who have an Active status and are aged above 25.
SELECT
	m."name",
	mb.status
FROM members m 
INNER JOIN memberships mb
on m.member_id=mb.member_id
WHERE mb.status='Active'
AND mb.age>25;

--4.Retrieve the details of visits made by members with visit_date = '2024-01-01'.
SELECT
	m."name",
	v.visit_id,
	v.check_in_time,
	v.check_out_time
FROM members m 
INNER JOIN visits v
on m.member_id=v.member_id
WHERE v.visit_date= '2024-01-01'

--5.Get the list of members who have a Quarterly membership type and are aged between 20 and 30
SELECT
	m."name",
	mb.membership_type,
	mb.age
FROM members m 
INNER JOIN memberships mb
on m.member_id=mb.member_id
WHERE mb.membership_type='Quaterly'
and mb.age between 20 and 30;


