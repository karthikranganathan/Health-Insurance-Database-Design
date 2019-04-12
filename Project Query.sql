--1. List the dependents for a member 
--for member ID=128804-00

select *,'Relationship' = case 
when substring ([Mem.ID], len([Mem.ID]), 2) = 00
then 'Primary'
else 'Dependent'
end
from [Member.Information]
where [Mem.ID] like '128804-%'

--2. Show the members of a group
Select MI.Fname,MI.Lname,MG.Gname from [Member.Information] as MI
 
Join [Member.Policy] as MP
on MP.[Mem.ID] = MI.[Mem.ID]
Join [Member.MemberGroup] as MG 
on MP.[Group.ID]= MG.[Group.ID]

--3. Show all the claims for a member
Select MI.Fname,MI.Lname,EC.[Event.ID],EC.Amount, EC.[Claim.Status] 
  from [Member.Information] as MI
         join [Event.Claim] as EC on
               EC.[Mem.ID]=MI.[Mem.ID]
                                where Fname='Elijah'

--4 Show all the claims for a members dependents
Select MI.Fname,MI.[Mem.ID], EC.Amount, EC.[Claim.Status], EC.[Claim.Date] 
    from [Member.Information] as MI
Join [Event.Claim] as EC on
EC.[Mem.ID]=MI.[Mem.ID]
 

where 
MI.[Main.Mem.ID] = '128804-00'
 



--5. Show all the people with a particular insurance plan
select MI.Fname, MI.Lname, P.[Plan.Name]
from [Member.Information] as MI

Join [Member.Policy] as MP on
MP.[Mem.ID] = MI.[Mem.ID]
join Plans as P on 
P.[Plan.ID] = MP.[Plan.ID]
where P.[Plan.Name] = 'Gold'

--6. List a provider and the members that have them as a pcp (include dependents)
select MI.Fname as 'Member First Name', MI.Lname as 'Member Last Name', PI.Fname as 'PCP Name'
from [Member.Information] as MI
join [Provider.Person.Info] as PI
on PI.[NP.ID] = MI.[NP.ID]
where PI.Fname = 'Adit'

--7. Show the cronic conditions for a dependent
select MI.Fname as 'Dependent.Name', CD.[Chronic.Disease] as 'Chronic.Condition' ,
MI.[Main.Mem.ID] as 'Subscriber ID' from [dbo].[Member.Information] as MI
Join [Member.Chronic.Disease] as CD on
CD.[Mem.ID]=MI.[Mem.ID]
Where MI.[Main.Mem.ID] <> 'Null'



 