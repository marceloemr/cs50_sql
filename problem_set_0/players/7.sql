SELECT COUNT(*)
FROM "players"
WHERE
    ("bats" != "throws") AND
    ("bats" != 'B');
