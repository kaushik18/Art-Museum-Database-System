--/*
CREATE VIEW Art_Of_The_Sacred (Name,Description,Year,Acquired,Medium,Collection,Insured_Value) AS
SELECT i.name AS Name, i.description AS Description, i.created AS Year, i.acquired AS Acquired, i.medium as Medium, i.collection AS Collection, i.insured_value AS Insured_Value
FROM Item i--, Display d, Exhibit e
LEFT JOIN Display ON i.itemID = Display.itemID
LEFT JOIN Exhibit ON Display.exhibitID = Exhibit.exhibitID
WHERE title = 'Art of the Sacred'
GROUP BY name,description,created,acquired,medium,collection,insured_value

CREATE VIEW Impressionist_Pieces (Name,Year,Acquired,Medium,Collection,Insured_Value) AS
SELECT name AS Name, created AS Year, acquired AS Acquired, medium as Medium, collection AS Collection, insured_value AS Insured_Value
FROM Item
WHERE description = 'Impressionist'
GROUP BY name,created,acquired,medium,collection,insured_value
--*/
SELECT * FROM Art_Of_The_Sacred
SELECT * FROM Impressionist_Pieces