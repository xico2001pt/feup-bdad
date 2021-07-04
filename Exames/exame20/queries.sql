-- SELECT Name
-- FROM (
    -- SELECT speaker, count(speaker) AS count
    -- FROM Talk
    -- GROUP BY speaker
-- ) JOIN Speaker ON (speaker = Id)
-- WHERE count > 1;

--------------------------------------

-- SELECT Name
-- FROM (
    -- SELECT Id FROM Topic
    -- EXCEPT
    -- SELECT DISTINCT topic FROM Talk
-- ) JOIN Topic USING (Id);

--------------------------------------

-- SELECT Name, Title, Country
-- FROM Talk JOIN Speaker ON speaker = Id
-- ORDER BY Country;

--------------------------------------

-- SELECT Name, count(DISTINCT Day) AS nrDays
-- FROM Topic LEFT JOIN Talk ON topic = Id
-- GROUP BY Id
-- ORDER BY Name;
