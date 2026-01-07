with cte as (
SELECT * FROM bike_share_yr_0
UNION all
SELECT * FROM bike_share_yr_1)


SELECT 
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
cast(riders as int) riders,
cast(price as decimal(10,2)) price,
cast(COGS as decimal(10,2)) COGS,
cast(riders as int)*cast(price as decimal(10,2)) as revenue,
cast(riders as int)*cast(price as decimal(10,2)) -COGS as profit
FROM cte a
left join cost_table b
on a.yr=b.yr
