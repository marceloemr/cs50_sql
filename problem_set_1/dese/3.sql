--SELECT printf("%.11f", AVG("per_pupil_expenditure"))
SELECT AVG("per_pupil_expenditure")
AS "Average District Per-Pupil Expenditure"
FROM "expenditures";
