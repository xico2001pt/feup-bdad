-- SELECT caption
-- FROM Photo JOIN User ON user = User.id
-- WHERE name LIKE 'Daniel Ramos' AND julianday(uploadDate) - julianday(creationDate) = 2;

--------------------------------

-- SELECT name
-- FROM User
-- WHERE id NOT IN (
    -- SELECT DISTINCT user
    -- FROM Photo
-- );

--------------------------------

-- SELECT AVG(count)
-- FROM (
    -- SELECT photo, COUNT(*) AS count
    -- FROM (
        -- SELECT photo
        -- FROM Likes
        -- GROUP BY photo
        -- HAVING COUNT(*) > 3
    -- ) JOIN AppearsIn USING(photo)
    -- GROUP BY photo
-- );

--------------------------------

-- DROP VIEW IF EXISTS daniel;
-- CREATE VIEW daniel AS
-- SELECT id AS danielId
-- FROM User
-- WHERE name LIKE 'Daniel Ramos';

-- DROP VIEW IF EXISTS friends;
-- CREATE VIEW friends AS
-- SELECT user2 AS friend1
-- FROM Friend
-- WHERE user1 IN daniel;

-- DROP VIEW IF EXISTS friendsOfFriends;
-- CREATE VIEW friendsOfFriends AS
-- SELECT user2 AS friend2
-- FROM friends JOIN Friend ON friend1 = user1;

-- SELECT DISTINCT caption
-- FROM AppearsIn JOIN Photo ON AppearsIn.photo = id
-- WHERE AppearsIn.user IN daniel OR AppearsIn.user IN friends OR AppearsIn.user IN friendsOfFriends;

--------------------------------

-- DELETE FROM Photo WHERE uploadDate < '2010-01-01' AND (SELECT COUNT(*) FROM AppearsIn WHERE photo = id) < 2;

--------------------------------

DROP TRIGGER IF EXISTS AutoLike;
CREATE TRIGGER AutoLike
AFTER INSERT ON AppearsIn
FOR EACH ROW
WHEN NEW.user NOT IN (SELECT user FROM Likes WHERE NEW.photo = Likes.photo)
BEGIN
    INSERT INTO Likes VALUES (NEW.user, NEW.photo);
END;
