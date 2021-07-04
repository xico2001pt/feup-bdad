-- SELECT nome, anoCurricular FROM Estudante WHERE anoCurricular = 3;

-----------------------------

-- DROP VIEW IF EXISTS num_friends;

-- CREATE VIEW num_friends AS
-- SELECT ID1, COUNT(*) AS count
-- FROM Amizade
-- GROUP BY ID1;

-- SELECT nome, anoCurricular
-- FROM Estudante JOIN num_friends ON Estudante.ID = num_friends.ID1
-- WHERE count = (SELECT MAX(count) FROM num_friends);

-----------------------------

-- DROP TRIGGER IF EXISTS friends;

-- CREATE TRIGGER friends
-- AFTER INSERT ON Estudante
-- FOR EACH ROW
-- BEGIN
    -- INSERT INTO Amizade
    -- SELECT NEW.ID, ID2
    -- FROM Estudante JOIN Amizade ON ID = ID2
    -- WHERE Estudante.ID <> NEW.ID;

    -- INSERT INTO Amizade
    -- SELECT ID2, NEW.ID
    -- FROM Estudante JOIN Amizade ON ID = ID2
    -- WHERE Estudante.ID <> NEW.ID;
-- END;

-----------------------------

-- DROP VIEW IF EXISTS amizades_with_anos;

-- CREATE VIEW amizades_with_anos AS
-- SELECT ID1, anoCurricular1, ID2, anoCurricular AS anoCurricular2
-- FROM (
    -- SELECT ID1, anoCurricular AS anoCurricular1, ID2
    -- FROM Estudante JOIN Amizade ON ID = ID1
    -- )
-- JOIN Estudante ON Estudante.ID = ID2;

-- SELECT nome, anoCurricular
-- FROM (
    -- SELECT DISTINCT amizades_with_anos.ID1 FROM amizades_with_anos
    -- EXCEPT
    -- SELECT DISTINCT amizades_with_anos.ID1
    -- FROM amizades_with_anos
    -- WHERE anoCurricular1 != anoCurricular2
-- ) JOIN Estudante ON (ID1 = ID)
-- ORDER BY anoCurricular, nome;

-----------------------------

-- DROP VIEW IF EXISTS num_friends;

-- CREATE VIEW num_friends AS
-- SELECT ID1, COUNT(*) AS count
-- FROM Amizade
-- GROUP BY ID1;

-- SELECT nome
-- FROM num_friends JOIN Estudante ON ID = ID1
-- WHERE count > 3;

-----------------------------

-- SELECT DISTINCT A3.ID2
-- FROM Amizade AS A1, Amizade AS A2, Amizade AS A3
-- WHERE A1.ID1 = 201101025 AND A1.ID2 = A2.ID1 AND A2.ID2 = A3.ID1;
