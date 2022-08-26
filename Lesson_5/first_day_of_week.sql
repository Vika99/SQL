create function dbo.GetFirstWorkdayOfMonth(@Year INT, @Month INT)
returns DATETIME
as begin
    declare @firstOfMonth VARCHAR(20)
    SET @firstOfMonth = CAST(@Year AS VARCHAR(4)) + '-' + CAST(@Month AS VARCHAR) + '-01'

    declare @currDate DATETIME 
    set @currDate = CAST(@firstOfMonth as DATETIME)

    declare @weekday INT
    set @weekday = DATEPART(weekday, @currdate)

    -- 7 = saturday, 1 = sunday
    while @weekday = 1 OR @weekday = 7
    begin
        set @currDate = DATEADD(DAY, 1, @currDate)
        set @weekday = DATEPART(weekday, @currdate)
    end

    return @currdate
end