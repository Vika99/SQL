-- ¹2 What other aggregate functions are there in T-SQL? Give some examples.
--my example next:I decided to choose table transaction history and made 3 functions:

SELECT AVG(pt.ActualCost) as average_cost, VAR(pt.ActualCost) AS statistical_variance, STDEV(pt.ActualCost) AS statistical_standard_deviation
FROM Production.TransactionHistory AS pt

/*
APPROX_COUNT_DISTINCT
AVG
CHECKSUM_AGG
COUNT
COUNT_BIG
GROUPING
GROUPING_ID
MAX
MIN
STDEV
STDEVP
STRING_AGG
SUM
VAR
VARP
*/