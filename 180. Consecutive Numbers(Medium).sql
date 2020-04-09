/*
SQL Schema
Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/


select Distinct l1.Num as ConsecutiveNums from Logs l1 join  Logs l2 join Logs l3 
on (l1.Id+1=l2.Id and  l2.Id+1=l3.Id) 
where l1.Num=l2.Num and l1.Num=l3.Num