select b.[Mem.ID] as 'Dependent.Name', b.Fname as ' Dependent.Name',
	(select  a.Fname
	from [Member.Information] a
	Group by a.Fname, a.[Mem.ID]
	Having a.[Mem.ID] = '128804-00' )
 from [dbo].[Member.Information] b
where b.[Mem.ID] != '128804-00' and
b.[Mem.ID] like '128804-%'

select b.[Mem.ID] as 'Dependent.Name', b.Fname as ' Dependent.Name'
 from [dbo].[Member.Information] b
where b.[Mem.ID] != (select  a.[Mem.ID]
	from [Member.Information] a
	Group by a.[Mem.ID]
	Having a.[Mem.ID] = '128804-00' ) and
    b.[Mem.ID] like '128804-%'

select a.[Mem.ID] as 'Primary', b.[Mem.ID] as 'Dependent'
from [Member.Information] a
cross join [Member.Information] b
Group By a.[Mem.ID], b.[Mem.ID]
Having a.[Mem.ID] ='128804-00' and
b.[Mem.ID] like '128804-%' and 
a.[Mem.ID] != b.[Mem.ID]

select b.[Mem.ID] as 'Dependent.Member.ID', b.Fname as ' Dependent.Name',
	(select a.Fname as 'Primary'
	from [Member.Information] a
	where a.[Mem.ID] = '128804-00' ), (select a.[Mem.ID] 'Primary'
	from [Member.Information] a
	where a.[Mem.ID] = '128804-00' )
 from [dbo].[Member.Information] b
where b.[Mem.ID] != '128804-00' and
b.[Mem.ID] like '128804-%'

--substring ([Mem.ID], len([Mem.ID]), 2)
SELECT * FROM [Member.Information]

select *,'Relationship' = case 
when substring ([Mem.ID], len([Mem.ID]), 2) = 00
then 'Primary'
else 'Dependent'
end
from [Member.Information]
where [Mem.ID] like '128804-%'


select *,'Relationship' = case 
when substring ([Mem.ID], len([Mem.ID]), 2) = 00
then 'Primary'
else 'Dependent'
end
from [Member.Information]
Where [Main.Mem.ID] is not null




