select distinct 
c.name as [Collection Name]
,c.collectionid
,CONVERT(varchar(20),cdepend.SourceCollectionID) as 'Collection Dependency'
,cc.Name as 'Collection Dependency Name'
,Case When
cdepend.relationshiptype = 1 then 'Limited '
when cdepend.relationshiptype = 2 then 'Include '
when cdepend.relationshiptype = 3 then 'Exclude '
end as 'Type of Relationship'
,cc.name
,[v_ApplicationAssignment].[AssignmentName]
,[v_ApplicationAssignment].[SuppressReboot]
,[v_ApplicationAssignment].[NotifyUser]
,[v_ApplicationAssignment].[StartTime]
,[v_ApplicationAssignment].[LastModifiedBy]
,[v_ApplicationAssignment].[OverrideServiceWindows]
,[v_ApplicationAssignment].[RequireApproval]
,[v_ApplicationAssignment].[ApplicationName]
,CONVERT(varchar(20), col_path.ObjectPath) as 'Collection Dependency'
,Case When
[OfferTypeID] = 0 then 'Required'
when [OfferTypeID] = 2 then 'Available'
end as 'Deployment Purpose'
from v_Collection c
join vSMS_CollectionDependencies cdepend on cdepend.DependentCollectionID=c.CollectionID
join v_Collection cc on cc.CollectionID=cdepend.SourceCollectionID
join v_Collections as col_path on col_path.SiteID = c.CollectionID
left join [v_ApplicationAssignment] on [v_ApplicationAssignment].CollectionID = c.CollectionID
UNION
select distinct 
c.name as [Collection Name]
,c.collectionid
,CONVERT(varchar(20), col_q.QueryID) as 'Collection Dependency'
,col_q.RuleName as 'Collection Dependency Name'
,'Query' as 'Type of Relationship'
,col_q.QueryExpression
,[v_ApplicationAssignment].[AssignmentName]
,[v_ApplicationAssignment].[SuppressReboot]
,[v_ApplicationAssignment].[NotifyUser]
,[v_ApplicationAssignment].[StartTime]
,[v_ApplicationAssignment].[LastModifiedBy]
,[v_ApplicationAssignment].[OverrideServiceWindows]
,[v_ApplicationAssignment].[RequireApproval]
,[v_ApplicationAssignment].[ApplicationName]
,CONVERT(varchar(20), col_path.ObjectPath) as 'Collection Dependency'
,Case When
[OfferTypeID] = 0 then 'Required'
when [OfferTypeID] = 2 then 'Available'
end as 'Deployment Purpose'
from v_Collection c
join v_CollectionRuleQuery col_q on col_q.CollectionID = c.CollectionID
join v_Collections as col_path on col_path.SiteID = c.CollectionID
left join [v_ApplicationAssignment] on [v_ApplicationAssignment].CollectionID = c.CollectionID
UNION
select distinct 
c.name as [Collection Name]
,c.collectionid
,CONVERT(varchar(20), col_Dir.ResourceID) as 'Collection Dependency'
,col_Dir.RuleName as 'Collection Dependency Name'
,'Direct' as 'Type of Relationship'
,col_Dir.RuleName
,[v_ApplicationAssignment].[AssignmentName]
,[v_ApplicationAssignment].[SuppressReboot]
,[v_ApplicationAssignment].[NotifyUser]
,[v_ApplicationAssignment].[StartTime]
,[v_ApplicationAssignment].[LastModifiedBy]
,[v_ApplicationAssignment].[OverrideServiceWindows]
,[v_ApplicationAssignment].[RequireApproval]
,[v_ApplicationAssignment].[ApplicationName]
,CONVERT(varchar(20), col_path.ObjectPath) as 'Collection Dependency'
,Case When
[OfferTypeID] = 0 then 'Required'
when [OfferTypeID] = 2 then 'Available'
end as 'Deployment Purpose'
from v_Collection c
join v_CollectionRuleDirect as col_Dir on col_Dir.CollectionID = c.CollectionID
join v_Collections as col_path on col_path.SiteID = c.CollectionID
left join [v_ApplicationAssignment] on [v_ApplicationAssignment].CollectionID = c.CollectionID
--Select name0, count(*) from v_R_System group by name0 having COUNT(*) >1

--select * from v_Collections""