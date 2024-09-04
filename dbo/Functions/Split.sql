
CREATE FUNCTION [dbo].[Split](@String nvarchar(max), @Delimiter char(1))
returns @Results TABLE (Items nvarchar(max))  
as
begin
declare @index int
declare @slice nvarchar(max)
select @index = 1
if @String is null return
while @index != 0
begin
select @index = charindex(@Delimiter,@String)
if @index !=0
select @slice = left(@String,@index - 1)
else
select @slice = @String
insert into @Results(Items) values(@slice)
select @String = right(@String,len(@String) - @index)
if len(@String) = 0 break
end return
end

GO

