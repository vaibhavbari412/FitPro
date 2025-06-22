/*
1.	Find the total number of visits made by each member, grouping by member_id.
2.	Retrieve the count of members by membership_type (e.g., how many Monthly, Weekly, and Quarterly members there are).
3.	Get the average age of members, grouped by their membership_type.
4.	Find the total number of visits for each visit_date (group by the visit date).
5.	Retrieve the number of members with each status (Active or Cancelled), grouped by status.
*/
--1.Find the total number of visits made by each member, grouping by member_id.
SELECT 
	COUNT(visit_id) as visits_made,
	member_id
FROM visits
group by member_id;

--2.Retrieve the count of members by membership_type (e.g., how many Monthly, Weekly, and Quarterly members there are).
SELECT
	COUNT(member_id),
	membership_type
FROM memberships
GROUP by membership_type;

--3.Get the average age of members, grouped by their membership_type.
SELECT
	ROUND(AVG(age),2),
	membership_type
FROM memberships
GROUP BY membership_type

--4.Find the total number of visits for each visit_date (group by the visit date).
SELECT
	COUNT(visit_id) as visits,
	visit_date
FROM visits
GROUP BY visit_date

--5.Retrieve the number of members with each status (Active or Cancelled), grouped by status.
SELECT
	COUNT(member_id) as members,
	status
FROM memberships
GROUP BY status;