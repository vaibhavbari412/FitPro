--1.Retrieve the top 3 members who have made the most visits, only showing name and total_visits, and order by total_visits in descending order.
SELECT
	m."name",
	COUNT(v.visit_id) AS total_visits
FROM members as m
INNER JOIN visits as v
ON v.member_id = m.member_id
GROUP BY m."name"
ORDER BY total_visits DESC
LIMIT 3;
--2.Find the number of members with a Monthly membership who are Active, grouped by membership_type, and limit the result to the top 2 most recent join dates.
SELECT
	COUNT(member_id),
	membership_type
FROM memberships
where status ='Active' and membership_type='Monthly'
GROUP BY membership_type,join_date
ORDER by join_date DESC
LIMIT 2;

--3.Get the total number of visits for each member who has more than 2 visits, ordered by total_visits, and display only the first 5 members.
SELECT
	COUNT(visit_id) as total_visits,
	member_id
FROM visits
GROUP BY member_id
HAVING COUNT(visit_id) > 2
ORDER BY total_visits DESC
LIMIT 5;

--4.Retrieve the number of members who have joined in 2023, grouped by membership_type, where the total number of members in each group is more than 100.
SELECT
	COUNT(member_id) as total_member,
	membership_type
FROM memberships
WHERE join_date between '2023-01-01' and '2023-12-31'
GROUP BY membership_type
HAVING COUNT(member_id)>100

--5.Find the average age of members who have Active membership status, grouped by membership_type, ordered by membership_type alphabetically, and limit the result to 3.
SELECT
	Round(AVG(member_id),2) as AVG_member,
	membership_type
FROM memberships
WHERE status='Active'
GROUP BY membership_type
ORDER BY membership_type 
LIMIT 3;