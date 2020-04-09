/*

Mary is a teacher in a middle school and she has a table seat storing students' names and their corresponding seat ids.

The column id is continuous increment.
 

Mary wants to change seats for the adjacent students.
 

Can you write a SQL query to output the result for Mary?
 

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+
For the sample input, the output is:
 

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Doris   |
|    2    | Abbot   |
|    3    | Green   |
|    4    | Emerson |
|    5    | Jeames  |
+---------+---------+
Note:
If the number of students is odd, there is no need to change the last one's seat.

*/

/* Solution*/


select S.ID AS ID,
CASE
WHEN (S.ID %2 = 0) 
    THEN (SELECT STUDENT FROM SEAT S1 WHERE S1.ID = (S.ID-1))
WHEN S.ID %2 != 0 
    THEN 
    (SELECT STUDENT 
     FROM SEAT S1 
     WHERE S1.ID = (S.ID+1) 
        OR S1.ID = S.ID 
     ORDER BY ID DESC LIMIT 1)
END AS STUDENT
FROM SEAT S



SELECT
S.ID AS ID,
CASE
WHEN (S.ID %2 = 0) 
    THEN LAG(S.STUDENT) OVER (order by S.ID) 
WHEN S.ID %2 != 0 
    THEN LEAD(S.STUDENT,1,s.student) over (order by s.id)
END AS STUDENT
FROM SEAT S