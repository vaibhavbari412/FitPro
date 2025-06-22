--1.	Retrieve all details of members who have a Cancelled membership.
SELECT 
	*
FROM memberships
WHERE status='Cancelled'
--2.	Find all members who are Male and have a Weekly membership type, and order the result by join_date.
SELECT
	*
FROM memberships
WHERE gender='M'
AND membership_type='Weekly'
order by join_date;
--3.	Get a list of distinct member ages.
SELECT
	DISTINCT(age)
FROM memberships
--4.	Retrieve the name, membership_type, and join_date of all members who joined after 2023-10-01, ordered by join_date in ascending order.
SELECT 
	m."name",
	mb.membership_type,
	mb.join_date
FROM members m
INNER JOIN memberships mb
ON mb.member_id = m.member_id
WHERE mb.join_date>'2023-10-01'
ORDER BY join_date asc;

--5.	Count the total number of visits made by each member, grouping by member_id.
SELECT
	COUNT(visit_id) as total_visits,
	member_id
FROM visits
GROUP BY member_id;
	
--6.	Retrieve the membership_type and the count of members for each membership type.
SELECT
	COUNT(member_id) as total_member,
	membership_type
FROM memberships
GROUP BY membership_type;
--7.	Get the names and ages of members who have a Monthly membership and are younger than 25, using WHERE.
SELECT
	m."name",
	mb.age
FROM members m
INNER JOIN memberships mb
ON mb.member_id = m.member_id
WHERE mb.membership_type='Monthly'
AND mb.age<25;
--8.	Retrieve the number of visits for each visit_date, ordered by visit_date.
SELECT
	COUNT(visit_id) as total_visits,
	visit_date
FROM visits
GROUP BY visit_date
ORDER BY visit_date;
--9.	Find the average age of members who have a Quarterly membership type.
SELECT 
	AVG(age) as avg_age
FROM memberships
WHERE membership_type='Quaterly'
--10.	Retrieve the name, membership_type, and status of members who are Active and Monthly, ordered by status.
SELECT 
	m."name",
	mb.membership_type,
	mb.status
FROM members m
INNER JOIN memberships mb
ON m.member_id=mb.member_id
WHERE status ='Active' 
AND membership_type='Monthly'
ORDER BY status;
--11.	Count the number of members with each membership_type, using GROUP BY and HAVING to show only those with more than 1 member.
SELECT
	COUNT(member_id) as total_member,
	membership_type
FROM memberships
GROUP BY membership_type
HAVING COUNT(member_id)>1;
--12.	Find the name of the member who has made the most visits, ordered by total_visits.
SELECT
	COUNT(visit_id),
	member_id
FROM visits
GROUP BY member_id
ORDER BY COUNT(visit_id) DESC
LIMIT 1;
--13.	Retrieve the list of name and status of members who have Cancelled status and joined before 2023-11-01, and limit the result to 3 rows.
SELECT
	m."name",
	mb.status
FROM members m
INNER JOIN memberships mb
ON m.member_id=mb.member_id
WHERE status='Cancelled'
AND join_date<'2023-11-01'
LIMIT 3;
--14.	Find the average age of members with Active status, grouped by membership_type.
SELECT
	AVG(age),
	membership_type
FROM memberships 
WHERE status='Active'
GROUP BY membership_type;
--15.	Retrieve all visit details (date, check-in, check-out) for the first 5 visits, ordered by visit_date in descending order.
SELECT
	visit_date,
	check_in_time,
	check_out_time
FROM visits
ORDER BY visit_date DESC
LIMIT 5;
