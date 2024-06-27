
-- *** The Lost Letter ***

-- Display packages collected at 900 Sommerville Avenue and their destination addresses

SELECT "packages"."id" as "package_id", "contents", "to_address_id", "address" AS "to_address", "type"
FROM "packages"
LEFT JOIN "addresses"
    ON "addresses"."id" = "packages"."to_address_id"
WHERE "packages"."id" IN (
    SELECT "package_id"
    FROM "scans"
    WHERE
        ("address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )) AND
        ("action" = 'Pick')
);

-- From the previous query we know that package 384 is the one we want
-- This next query shows details about all the scans done with the package we are monitoring,
-- allowing us to see where the scan was taken and thus find out where the package was dropped

SELECT "scans"."id" as "scan_id", "address_id", "action", "timestamp", "address", "type", "contents"
FROM "scans"
LEFT JOIN "addresses"
    ON "addresses"."id" = "scans"."address_id"
LEFT JOIN "packages"
    ON "packages"."id" = "scans"."package_id"
WHERE "package_id" = 384;

-- *** The Devious Delivery ***

-- Display the packages that dont have a source address

SELECT *
FROM "packages"
WHERE "from_address_id" IS NULL;

-- From the query above we see that there is only one package that matches the description:
-- package 5098 containing a Duck debugger
-- The next query allows us to find the addresses at which the package 5098 was scanned and
-- where it was picked up and dropped

SELECT "address_id", "action", "timestamp", "address", "type"
FROM "scans"
LEFT JOIN "addresses"
    ON "scans"."address_id" = "addresses"."id"
WHERE "package_id" = 5098;

-- So we find out that it was picked up at the postal center and dropped at the address 348

-- *** The Forgotten Gift ***

-- Display the contents of packages collected or dropped at '109 Tileston Street'
SELECT "package_id", "contents", "from_address_id", "to_address_id", "action", "timestamp"
FROM "scans"
LEFT JOIN "packages"
    ON "packages"."id" = "scans"."package_id"
WHERE "address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '109 Tileston Street'
);

-- From that we learn that package 9523 was the only one picked up and it was 
-- destined to address 4983 with Flowers
-- The next query shows all the scans related to package 9523 and the name of the driver
-- responsible from the scan

SELECT "drivers"."name" as "driver_name", "action", "address_id", "address", "type", "timestamp"
FROM "scans"
LEFT JOIN "addresses"
    ON "addresses"."id" = "scans"."address_id"
LEFT JOIN "drivers"
    ON "drivers"."id" = "scans"."driver_id"
WHERE "package_id" = 9523;
