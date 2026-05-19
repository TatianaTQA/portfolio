Создала две таблицы level и user. 

CREATE TABLE level (
  id serial not null,
  level_name varchar(40) not null,
  PRIMARY KEY (id)
  );
CREATE TABLE user (
  id serial not null,
  user_name varchar(30) not null,
  level_id int not null,
  skill int not null,
  PRIMARY KEY (id),
  FOREIGN KEY (level_id) REFERENCES level(id)
  );

Внесла данные в таблицу level

INSERT INTO level (id, level_name) 
VALUES (1, 'admin'), (2, 'power_user'), (3, 'user'), (4, 'guest')

Внесла данные в таблицу user

INSERT INTO user (id, user_name, level_id, skill) 
VALUES (1, 'Anton', 1, 900000), (2, 'Denis', 3, 4000), (3, 'Petr', 2, 50000),
(4, 'Andrey', 4, 20), (5, 'Olga', 1, 600000), (6, 'Anna', 1, 1600000)

             Задания на написание запросов к БД:


1. Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а

SELECT * FROM user WHERE level_id = 1 AND skill > 799000 AND user_name LIKE '%a%'


2. Удалить всех пользователей, у которых skill меньше 100000

DELETE FROM user WHERE skill < 100000

3. Вывести все данные из таблицы user в порядке убывания по полю skill 
	
SELECT * FROM user ORDER BY skill DESC

4. Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10

INSERT INTO user (id, user_name, level_id, skill)
VALUES (7, 'Oleg', 4, 10)

5. Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000

UPDATE user SET skill = 2000000 WHERE level_id < 2

6. Выбрать user_name всех пользователей уровня admin используя подзапрос

SELECT user_name FROM user WHERE level_id IN (SELECT id FROM level WHERE level_name = 'admin')

7. Выбрать user_name всех пользователей уровня admin используя join

SELECT user_name FROM user u INNER JOIN level l
ON u.level_id = l.id WHERE l.level_name = 'admin'





