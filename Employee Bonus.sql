select 
    name, 
    bonus 
from Employee E
left join Bonus B on E.empId = B.empid
where B.bonus < 1000 or B.bonus is null;