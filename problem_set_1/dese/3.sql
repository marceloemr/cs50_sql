SELECT CAST(AVG("per_pupil_expenditure") * 1e11 AS INTEGER) / 1e11
AS "Average District Per-Pupil Expenditure"
FROM "expenditures";
