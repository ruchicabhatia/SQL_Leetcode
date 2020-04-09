/*
Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
*/

SELECT x.email as "Email"
from
(
    Select email,
    count(*) as Number_of_emails
    from 
    Person
    group by email
    having Number_of_emails > 1
)x