USE coderhouse_hr;

-- Creo roles

CREATE ROLE 'web_admin';
CREATE ROLE 'web_reader';
CREATE ROLE 'web_writer';

-- Asigno permisos a los roles

GRANT ALL ON web_db.* TO 'web_admin';
GRANT SELECT ON web_db.* TO 'web_reader';
GRANT INSERT, UPDATE, DELETE ON web_db.* TO 'web_writer';

-- Creo usuarios y asigno roles

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_pass';
CREATE USER 'reader_user1'@'localhost' IDENTIFIED BY 'reader1_pass';
CREATE USER 'reader_user2'@'localhost' IDENTIFIED BY 'reader2_pass';
CREATE USER 'writer_user1'@'localhost' IDENTIFIED BY 'writer1_pass';

GRANT 'app_developer' TO 'dev1'@'localhost';
GRANT 'app_read' TO 'read_user1'@'localhost';
GRANT 'app_read' TO 'read_user2'@'localhost';
GRANT 'app_write' TO 'rw_user1'@'localhost';