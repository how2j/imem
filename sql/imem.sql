use imem;

CREATE TABLE task_ (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(30) ,
  desc_ varchar(255) ,
  index_ int(11) ,
  status_ varchar(30) ,
  imem varchar(30) ,
  PRIMARY KEY (id)
) DEFAULT CHARSET=UTF8;