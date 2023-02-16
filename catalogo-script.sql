CREATE DATABASE IF NOT EXISTS `catalog-library`;

USE `catalog-library`;
CREATE TABLE IF NOT EXISTS Book (
	titulo VARCHAR(50), 
	ISBN VARCHAR(50) PRIMARY KEY, 
	autor VARCHAR(50), 
	descripcion VARCHAR(200),
	valor VARCHAR(50),
 	unidades INT
);

DELIMITER //

CREATE PROCEDURE GetAllBooks()
BEGIN
	SELECT * FROM Book;
END //


CREATE PROCEDURE AddOrUpdateBook(titulo VARCHAR(50), 
	isbn VARCHAR(50), 
	autor VARCHAR(50),
	descripcion VARCHAR(200),
	valor VARCHAR(50),
 	unidades INT)
BEGIN
	if(ISNULL((SELECT b.ISBN FROM Book b WHERE b.ISBN = isbn))) then 
		INSERT INTO Book VALUES (titulo, isbn, autor, descripcion, valor, unidades);
	ELSE
		UPDATE Book b SET titulo=titulo, autor=autor, descripcion=descripcion, 
		valor=valor, unidades=unidades WHERE b.ISBN = isbn;
	END if;
END //

CREATE PROCEDURE DeleteBook(isbn VARCHAR(50))
BEGIN
	DELETE FROM Book b WHERE b.ISBN = isbn;
END //

DELIMITER ;

INSERT INTO Book VALUES ('el aro', '1', 'andres mendoza', 'descripcion', '20', 1);



