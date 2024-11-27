select E1.name
from Employee E1
join Employee E2 on E1.id = E2.managerId 
group by E2.managerId 
having count(E2.managerId) >= 5