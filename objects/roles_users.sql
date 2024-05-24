USE coderhouse_hr;

-- Creo roles

CREATE ROLE 'web_admin';
CREATE ROLE 'web_reader';
CREATE ROLE 'web_writer';

-- Asigno permisos a los roles

GRANT ALL ON coderhouse_hr.* TO 'web_admin';
GRANT SELECT ON coderhouse_hr.* TO 'web_reader';
GRANT INSERT, UPDATE, DELETE ON coderhouse_hr.* TO 'web_writer';

-- Creo usuarios y asigno roles

CREATE USER 'admin_user'@'%' IDENTIFIED BY 'admin_pass';
CREATE USER 'reader_user1'@'%' IDENTIFIED BY 'reader1_pass';
CREATE USER 'reader_user2'@'%' IDENTIFIED BY 'reader2_pass';
CREATE USER 'writer_user1'@'%' IDENTIFIED BY 'writer1_pass';

GRANT 'web_admin' TO 'admin_user'@'%';
GRANT 'web_reader' TO 'reader_user1'@'%';
GRANT 'web_reader' TO 'reader_user2'@'%';
GRANT 'web_writer' TO 'writer_user1'@'%';

GRANT ALL ON coderhouse_hr.* TO 'admin_user'@'%';
GRANT SELECT ON coderhouse_hr.* TO 'reader_user1'@'%';
GRANT SELECT ON coderhouse_hr.* TO 'reader_user2'@'%';
GRANT INSERT, UPDATE, DELETE ON coderhouse_hr.* TO 'writer_user1';
FLUSH PRIVILEGES;