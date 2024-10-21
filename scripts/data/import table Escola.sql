SET sql_mode = "";
load data infile 'C:\\Users\\Bruno\\Desktop\\Unesp\\LabBD\\2024\\Trabalho\\selecionados\\Escolas Rio Claro 2017.csv'
into table labbd.escola
fields terminated by '|'
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
;