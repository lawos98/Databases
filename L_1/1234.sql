Select min(datename(weekday,OrderDate)),count(*)
from Orders group by datename(weekday,OrderDate) order by 2

Select * from Orders 
