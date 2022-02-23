 

-- OutPut에 초록 체크가 뜨면 성공. 리프레쉬 버튼 누르면 DB 생겨있고 디폴트 목록이 존재.

-- ex2) crtl+ENTER => 한줄 실행, DB는 한줄 씩 의미가 있음. crtl+shift_ENTER 전체 실행

-- ex1) -- : 그냥 주석 /* */ 전체 주석

 

-- ex3

Create database db01; -- DB생성, 동그라미 => 실행 가능 

-- ex4

show databases; -- DB 목록 확인

-- ex5 db 삭제

drop database db01;

-- 왼쪽 창에서 우클릭 Create로 데이터베이스, 테이블 전부 만들어서 apply 가능하며 그걸 코드로 만들어줘 실행해준다.

-- ex6 mysql만 데이터 베이스를 스키마라고 부흔다. 원래 스키마는 데이터베이스에 속성을 부여하는 것이다. ex) 4글자 밖에 들어오지 못한다, 특정인 밖에 들어오지 못한다 => 스키마를 설정

-- 왼쪽 창에 new 스키마 => 어플라이로 데이터베이스를 스키마로 바꾸고 백쿼터 처리해준다. -> 삭제도 왼쪽 스키마 목록에서 삭제 가능하다.

-- 고유 아이디(pk) 첫 컬러 네임

-- NN(Not Null 절대 Null을 넣지마라)(예시: 패스워드), 기본적으로 Null값이 있으면 불편한데 의도적으로 Null값을 넣는 경우도 비일 비재(ex: 집 전화)

-- 데이터 타입 선택 가능. INT or VarChar를 거의 사용.

-- 만들어준 것을 복사 붙여넣기 했다. 콘솔로 하려면 밑의 것을 그 밑에 버젼으로 전부 타이핑으로 만든다.

CREATE TABLE `db01`.`table01` (

  `id` INT NOT NULL,

  `name` VARCHAR(45) NULL,

  `age` INT NULL,

  `salary` INT NULL,

  PRIMARY KEY (`id`));

  -- 누구 DB에서 실행시키는 지 명시되는 것이 없어서 콘소렝서는 실행이 되지 않는다(IDE는 더블클릭으로 옆에 스키마 중 선택하면 되긴한다.). db01.table01을 하기도 하지만 매번 붙일 수 없으니 use db01을 사용한다.

  use db01;

  CREATE TABLE table01 (

  id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크

  name VARCHAR(16), -- max가 16개라고 하는 것이다. 글자 2개면 메모리는 더 적게 먹게해준다. char는 16개부터 시작. 다만 실행 속도에 차이가 있다.

  age INT,

  salary INT,

  PRIMARY KEY (id));

  

-- ex7) 테이블 보기(테이블이 존재한다는 전제)

show tables;

 

-- ex8) 컬럼 목록 보기

desc table01;

 

-- ex9) 테이블 삭제

drop table table01;

 

-- ex10) 앞으로 나올 4개의 명령어는 무조건 외운다.

-- Data에 대한 CRUD는 DB를 사용하는 근본 목적이다.

-- Create(로우 생성)

-- insert into 테이블명 values(값, );

insert into table01 values( null, '이순신', 20, 300);

insert into table01 values( null, '홍길동', 23, 300);

insert into table01 values( null, '안중근', 24, 300);

insert into table01 values( null, '호랑이', 25, 300);

insert into table01 values( null, '코끼리', null, null);

 

-- ex11) CR(ead) : 조회, 검색 UD

-- 다른 곳에서 변경되면 리프레쉬 버튼을 눌러주면 된다.

-- 왼쪽 스키마에서 셀렉트 명령어나 이모지를 눌러 가능하다. 또한 위 메뉴에 limit to 1000rows를 보기 원하는 열 개수로 바꿀 수 있다.

select * from table01;

 

-- ex12) update

-- 옵션체크 : 프리페어런스에 sql editor에 safe update 체크해제

update table01 set age = 99; -- 조건을 안걸고 이렇게 쓰지는 않는다.

update table01 set age = 99 where name = '안중근'; -- where과 if는 똑같다. =는 대입 연산자가 아니고 ==과 같은 뜻이다. 실행 순서는 where -> set

update table01 set name = '소나무' where id = 4;

update table01 set name = '대나무', age=888 where id = 4;

 

-- ex13) delete

delete from table01 where name= '홍길동';

select * from table01;

 

-- ex14) CRUD 무조건 암기

insert into table01 values( null, '이순신', 20, 300);

select * from table01;

update table01 set age = 99 where name = '안중근';

delete from table01 where name= '홍길동';

 

-- ex15)

-- 모두 채울 떼

insert into table01 values (null, '유니콘', 20, 300);

 

-- 선택적으로 채울 때( 명시적 방법 )

insert into table01(id, name, age, salary) values( null, '유니콘', 200, 300);

insert into table01(id, age) values( null, 20);

insert into table01(age, id) values( 20, null);

select *from table01;

 

-- ex16) WorkBench에서 n개의 로우를 삭제할 때

-- 밑의 창에 우클릭을 이용하여 n개 삭제 가능 (apply 버튼 누르는 것 잊지 않기)

-- 반드시 apply 적용

 

-- ex17) 로우의 개수를 출력

select count(*) from table01;

 

-- ex18) sakila db에서 검색 및 개수 출력

select * from city;

select count(*) from city;

select count(*), city from city; -- 불가능하다. row가 한줄인 count(*)와 row가 여러줄인 city_id는 같이 사용할 수 없다. 같은 row 수의 출력만 가능하다.

 

-- ex19) 출력개수 제한(오라클과 다르다)

-- 0번부터 3개

select * from city limit 0, 3;

-- 0번부터 3개

select * from city limit 3;

-- 2번부터 3개

select * from city limit 2, 3;

 

-- ex20) 선택적으로 컬럼 검색

select id from table01;

select id, name from table01;

select id, name,  name from table01;

select id, name, name, salary from table01;

 

-- ex21) 선택 컬럼에 산술식을 사용할 수 있다.

select name, salary, salary*0.1 from table01;

select

	name, salary, salary*0,1,salary+salary*0.1

table01 from table01;

 

-- ex22) 컬럼 별칭 사용 가능

select name as 이름, salary as 급여 from table01;

select

	name, salary, salary*0,1 as 보너스 ,salary+salary*0.1 as 실수령액

from table01;

 

-- as는 생략할 수 있다.

select name 이름, salary 급여 from table01;

 

-- 별칭 사이에 공백이 들어 가는 경우 빽 쿼터 이용

select name `이 름`, salary '급 여' from table01;

 

-- 단순 쿼리 정리

select name `이름`, salary*12 `연  봉` from table01;

 

-- ex23) 컬럼연결이 필요한 경우(컬럼 + 컬럼 >> 컬럼 + 컬럼)

select concat(name, salary) 이름급여 from table01;

select concat(name, '님의 급여는', salary, "만원입니다") 이름급여 from table01; -- 다른 프레임워크에서도 이것이 가능한지는 잘 모른다. 그래서 concat을 2개 쓰는 경우도 있다.

select concat('님의 급여는', concat(salary, "만원입니다")) 이름급여 from table01;

 

-- ex24) 단술 산술식이나 날짜를 얻고 싶을 때

-- select 3*5 from talbe01; 단순 3*5를 알고 싶을 때

select sysdate(), 3*7 from dual; -- 가상의 한줄 테이블을 만든다.

select 9+2, 9-2, 9*2, 9/2, 9%2 from dual; -- 몫은 소수점까지 나와서 안된다.

 

-- ex25) null 검색

select * from table01;

-- 아주 조심(= null은 안된다) 

select * from table01 where salary = null; 

select * from table01 where salary is null;

select * from table01 where salary is not null;

select name from table01 where salary is not null;

select name `급여를 받는 사람` from table01 where salary is not null;

 

-- ex26) 직원들의 연봉을 모두 검색하여 출력

  CREATE TABLE table02 (

  id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크

  name VARCHAR(16), -- max가 16개라고 하는 것이다. 글자 2개면 메모리는 더 적게 먹게해준다. char는 16개부터 시작. 다만 실행 속도에 차이가 있다.

  salary INT,

  bonus INT,

  PRIMARY KEY (id));

  

  

  insert into table02 values(null, '호랑이1', 100, 10);

  insert into table02 values(null, '호랑이2', 200, null);

  insert into table02 values(null, '호랑이3', 400, 40);

  insert into table02 values(null, '호랑이4', 400, 30);

  insert into table02 values(null, '호랑이5', 500, null);

-- 원하는 결과가 나오지 않는 쿼리(모든 데이터가 원하는 대로 들어가 있는 것이 아니다. 또한 데이터를 자체적으로 갱신해버리면 다른 몇년 간 사용해온 쿼리들이 죽어버린다.=> 사실 이런 것에서 계산해서 출력하는 부분들이 전부 원본은 건드리지 않는 식으로 되어서 있는 것이 아닐까?)

  select salary*12+bonus from table02; -- bonus에 null이 들어가 있어서 null연산으로 인해 무효화 되어버렸다.

  select salary*12+ifnull(bonus, 0) from table02;

  

  -- ex27) table02의 bonus가 null인 컬럼을 0으로 수정(갱신)하세요.

  update table02 set bonus=0 where bonus is null;

  select * from table02;

  

  -- ex28)

  CREATE TABLE table03 (

  id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크

  name VARCHAR(16), -- max가 16개라고 하는 것이다. 글자 2개면 메모리는 더 적게 먹게해준다. char는 16개부터 시작. 다만 실행 속도에 차이가 있다.

  result float,

  PRIMARY KEY (id));

  

insert into table03 values(null, '호랑이1', 4.5);

insert into table03 values(null, '호랑이2', 3.7);

insert into table03 values(null, '호랑이3', 2.7);

insert into table03 values(null, '호랑이4', 4.2);

insert into table03 values(null, '호랑이5', 2.2);

insert into table03 values(null, '호랑이5', 4.05);

insert into table03 values(null, '호랑이5', 3.07);

select *from table03;

-- 2:3 = 4:6 => 내항과 외항끼리 연산을 통해 값을 구하는 것 => 이것을 통해 100점으로 환산했을 때의 값 구하기 가능.

select result, result *100/4.5 from table03;

 

-- ex29) 어려운 쿼리의 시작, 뒤에 table 명령 대신 새로운 쿼리가 나오고 그로 인해 복잡해짐. (테이블의 관계를 끊어버리고 1개의 테이블만 사용하려고 하는 시도가 비 관계형 DB)

-- =>용량 최적화(절약)의 장점이 사라지는 대신 그냥 하드디스크 더 꼽거나 aws에 임대(사실 이쪽이 좀 더 비용이 아껴진다.)를 해버리는 식으로 => 좋은 성능 하드보다는 여러 싸구려 하드를 쓰는 것이 더 용량면에서 유리하다.=> 비관계형 DB 증가, 병렬형 처리( 병렬 적으로 데이터를 여러 DB에 마구 집어 넣으므로 )

 -- 중복제거된 결과

 -- 나라, 지역, 학과 등에 distinct

  CREATE TABLE table04 (

  id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크

  name VARCHAR(16), -- max가 16개라고 하는 것이다. 글자 2개면 메모리는 더 적게 먹게해준다. char는 16개부터 시작. 다만 실행 속도에 차이가 있다.

  country varchar(16),

  PRIMARY KEY (id));

  

insert into table04 values(null, '호랑이1','한국');

insert into table04 values(null, '호랑이2','중국');

insert into table04 values(null, '호랑이1','일본');

insert into table04 values(null, '호랑이1','한국');

insert into table04 values(null, '호랑이3','중국');

insert into table04 values(null, '호랑이4',null);

-- 값이 null인 경우는 집계(통계)에 포함되지 않는다.

select * from table04;

select distinct name from table04;

-- 중복 제거된 목록

select distinct(country ) from table04;

-- 중복 제거된 목록의 개수

select count(distinct(country )) from table04;

 

 

  CREATE TABLE table05 (

  id INT NOT NULL AUTO_INCREMENT, -- 컬럼1

  name VARCHAR(16), -- 컬럼2

gold_num int, -- 컬럼3

silver_num int, -- 컬럼4

  PRIMARY KEY (id));

  

  insert into table05 values(null, '한국',10, 10);

  insert into table05 values(null, '중국',2, 9);

  insert into table05 values(null, '일본',4, 8);

  insert into table05 values(null, '미국',7, 3);

  insert into table05 values(null, '독일',6,7);

  -- select * from table05 order by 컬럼;

  -- asc는 생략 가능 : 오름차순, 순차정렬

  -- desc는 생략 불가능 : 내림차순

  select * from table05 order by gold_num asc;

  -- 테이블이 수정되는 것은 아니다.

select * from table05 order by gold_num desc;

-- 컬럼3 을 정렬시켜주세요.

select * from table05 order by 3 desc;

-- 위까지가 1차 정렬

select * from table05 order by gold_num desc;

select * from table05 order by 3 desc;

-- 2차 정렬. 골드 순 다음 실버 순으로.

select * from table05 order by gold_num desc, silver_num desc;

 

-- ex30) 정렬

 

  CREATE TABLE table06 (

  id INT NOT NULL AUTO_INCREMENT, -- 컬럼1

  name VARCHAR(16), -- 컬럼2

dept VARCHAR(16), -- 컬럼3

salary int, -- 컬럼4

  PRIMARY KEY (id));

  insert into table06 values(null, '호랑이1',"경영",700);

    insert into table06 values(null, '호랑이1',"개발",'100');

      insert into table06 values(null, '호랑이1',"영업",'200');

  insert into table06 values(null, '호랑이1',"경영",700);

    insert into table06 values(null, '호랑이1',"개발",'100');

      insert into table06 values(null, '호랑이1',"영업",'200');

  insert into table06 values(null, '호랑이1',"경영",700);

    insert into table06 values(null, '호랑이1',"개발",'100');

      insert into table06 values(null, '호랑이1',"영업",'200');

      select*from table06;

-- 부서별로 순차 정렬을 하고 급여를 역순 정렬로 나열하시오

select *from table06 order by dept asc, salary desc;

-- ~별로( 나라별로, 부서별로, 성별로, 학과별로)

-- 1. order by(2차 검색을 이용한 단순 검색) + 2.group by(통게좌료를 뽑고 싶을 떼)

 

-- ex31) 성적 합에 대한 역순 정렬( 키포인터는 별칭 사용)

  CREATE TABLE table07 (

  id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크

  name VARCHAR(16), -- max가 16개라고 하는 것이다. 글자 2개면 메모리는 더 적게 먹게해준다. char는 16개부터 시작. 다만 실행 속도에 차이가 있다.

  kor INT,

  eng INT,

  mat int,

  PRIMARY KEY (id));

  

    insert into table07 values(null, '호랑이1',99,55,33);

    

    insert into table07 values(null, '호랑이2',66,77,44);

    

    insert into table07 values(null, '호랑이3',11,44,99);

    insert into table07 values(null, '호랑이4',77,66,66);

    

    insert into table07 values(null, '호랑이5',88,99,32);

    select * from table07;

    select name, kor+eng+mat total

    from table07 order by total desc;

    

    -- ex32) 대소 비교( = , !=, >, >=, <. <=)

    select *from table07 where kor > 80;

      select *from table07 where (kor+eng+mat)/3 > 80;

        select name, (kor+eng+mat)/3 from table07 where (kor+eng+mat)/3 > 40;

        -- 아래 쿼리는 될 것 같은데 안된다. select에서 정의된 별칭은 where에서 사용할 수 없다.

        -- 테이블 이름을 별칭으로 만들 수가 있는데, 이 때 만든 별칭은 where에서 사용할 수 있다.

    select name, (kor+eng+mat)/3 result from table07 where result > 80;

 

select name,(kor+eng+mat)/3 result 

from table07 as T

where T.result >=80;

 

show variables like 'datadir'; 

-- ex33) and, or 사용
  CREATE TABLE table08 (

  id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크

  name VARCHAR(16), -- max가 16개라고 하는 것이다. 글자 2개면 메모리는 더 적게 먹게해준다. char는 16개부터 시작. 다만 실행 속도에 차이가 있다.

	dept varchar(16),

  salary int,

  PRIMARY KEY (id));
use db01;

    insert into table08 values(null, '호랑이5',2);
        insert into table08 values(null, '호랑이5',88,99,32);
            insert into table08 values(null, '호랑이5',88,99,32);
                insert into table8 values(null, '호랑이5',88,99,32);
                    insert into table08 values(null, '호랑이5',88,99,32);
                        insert into table08 values(null, '호랑이5',88,99,32);
select id, name, dept, salary -- *(전체) 대신에 컬럼명 명시 추천.
from table08
where dept = '영업' and salary >320;





select id name, dept, salaty
from table08
where dept 140 and salary 1>60;
select id name, dept, salaty
from table08;
where dept = '영업' or salary >100;



  CREATE TABLE table010 (

  id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크

  name VARCHAR(16), -- max가 16개라고 하는 것이다. 글자 2개면 메모리는 더 적게 먹게해준다. char는 16개부터 시작. 다만 실행 속도에 차이가 있다.

dept varchar(16),

  salary int,

  PRIMARY KEY (id));



insert into table08 values(null, '스타벅스',2);
insert into table08 values(null, '올스타 노래방.1500');
insert into table08 values(null,'강남만ㅋ두', 100);
insert into table8 values(null, '호랑이5',99);
           
select id, name, dept, salary; -- " where name like"%스타"
select id, name, dept, salary; -- " where name like"%유서석"
select id, name, dept, salary; -- " where name like"%강호동" //중복 자동 제거

select * from table09
where name like'%스타';
select count(name) from table09
where name like'스타%';
select * from table09
where name like'%스타';
select * from table09
where name like '김%' and grade = 2;

-- ex37) 이름이 2글자인 사원 검색
select *
from table10
where name like '__';

-- ex38) 성과 이름이 3글자가 아닌 사람 검색
select *
from table10
where name not like '___';

-- ex39)
USE db01;

  CREATE TABLE db01.table11 (

  id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크

  name VARCHAR(16), -- max가 16개라고 하는 것이다. 글자 2개면 메모리는 더 적게 먹게해준다. char는 16개부터 시작. 다만 실행 속도에 차이가 있다.

dept varchar(16),

  salary int,

  PRIMARY KEY (id));
  
insert into table08 values(null, '호랑이5','경영',200);
insert into table08 values(null, '호랑이5','경영',200);
insert into table08 values(null, '호랑이5','경영',200);
insert into table08 values(null, '호랑이5','경영',200);
-- 가독성이 높아서 사용된다.
select *
from table11
where salary BETWEEN 200 AND 600; -- 반드시 A가 작고 B기 커야한다.

-- ex40)
select *
from table11
where dept = '개발' or dept = '경영'; -- or = '기획'

-- 좀 더 선호된다.
select *
from table11
where dept in('개발','경영'); -- . '기획'

-- ex41)
-- select  *
-- from table11
/*
where sal > ANY(300,200,250);
-- 제일 작은 놈을 찾는디.(where sal > 200) 이렇게 번역이 된다.
where salary > ALL(300,200,250);
-- where salary > 300;
where sal < ANY(300,200,250);
-- 제일 작은 놈을 찾는디.(where sal < 300) 이렇게 번역이 된다.
where salary < ALL(300,200,250);
-- where salary < 200;
*/

CREATE TABLE db01.table12 (

id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크

eno INT, -- max가 16개라고 하는 것이다. 글자 2개면 메모리는 더 적게 먹게해준다. char는 16개부터 시작. 다만 실행 속도에 차이가 있다.

NAME varchar(16),

salary INT,

PRIMARY KEY (id));

-- 문제) 20번 부서의 최고 월급보다 작은 연봉을 받는 직원을 검색하세요.
INSERT INTO table12 value (NULL,10, 'tiger',600);
INSERT INTO table12 value (NULL,10, 'tiger2',500);
INSERT INTO table12 value (NULL,10, 'tiger3',300);
INSERT INTO table12 value (NULL,10, 'tiger4',400);
INSERT INTO table12 value (NULL,10, 'tiger5',700);
INSERT INTO table12 value (NULL,20, 'tiger6',600);
INSERT INTO table12 value (NULL,20, 'tiger7',200);
INSERT INTO table12 value (NULL,20, 'tiger8',300);
INSERT INTO table12 value (NULL,20, 'tiger9',400);

select  * from table12;

-- 20번 부서의 급여를 모든 검색한다.
select salary from table12
where eno = 20;
-- 20번 부서의 최고 급여는 얼마인가?

select MAX(salary) from table12
where eno = 20;

-- 20번 부서의 최고 급여를 받는 직원의 이름은 무엇입니까 ?
-- select NAME table12
-- where salary = 600; 이런 식으로 코드를 풀면 최종적으로 밑이 된다. 서브 쿼리를 이용했다.
select NAME table12
where salary = (select MAX(salary) from table12
where eno = 20);


select eno, NAME table12
where salary < (select MAX(salary) from table12
where eno = 20); -- 밑의 코드와 같다.
select eno, NAME table12
where sal < ANY(select salary from table12
where eno = 20);
-- 위에서 20번들의 급여를 뺀다면?
select eno, NAME table12
where sal < ANY(select salary from table12
where eno = 20)and eno != 20;

-- 유사 예제
-- 문제 컴공과에서 제일 낮은 점수를 받은 학생보다 성적이 낮은 학생들은 누구인가 ?
/*
컴공 40
컴공 20 -->>>>> 컴공에서 제일 낮은 점수의 학생
컴공 50 
중국 80 
중국 70
중국 10 >> 결과
일어 40
일어 05 >> 결과
*/

-- ex42)
select min(salary) from table12;
select max(salary) from table12;
select AVG(salary) from table12;
select SUM(salary) from table12;

select name from table12
where salary = (select max(salary) from table12);

-- ex43) ??? 조인이라는 이름이 8개 정도 된다.
-- join : 오라클 join문법(비표준. 하지만 오라클 join 문법이 나오고 모든 sql다 나오고 표준 Ansi sql이 나옴), Ansi join문법(표준이라 모든 sql에서 사용 가능).
 -- 

 -- ex44) 교차 조인(cross join) : 테카르트 곱, 카테시안 곱
-- A table의 로우가 3개, B table의 로우가 4개일 때. 12개. 

drop table tableA;
CREATE TABLE db01.tableA (
id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크
NAME varchar(16),
eno INT, -- 직업 번호
salary INT,
PRIMARY KEY (id));

-- 필요에 따라 쪼개진 걸 합칠 때 중복된 것 까지 고려해서 사용될 수 있게 고려된 것이 join.
insert into tableA values(null, '홍길동', 10, 1000);
insert into tableA values(null, '이순신', 20, 4000);
insert into tableA values(null, '안중근', 30, 2000);
insert into tableA values(null, '임꺽정', 40, 3000);
select * from tableA;


drop table tableB;
CREATE TABLE db01.tableB (
id INT NOT NULL AUTO_INCREMENT, -- IDE에서는 AI 체크
eno INT, -- 직업 번호
JOB varchar(16), -- 직업

PRIMARY KEY (id));

-- 옵티마이저로 최적화를 통한 알고리즘으로 우연히 출력된다.)
insert into tableB values(null, 10, '장군');
insert into tableB values(null, 20, '의적');
insert into tableB values(null, 20, '의적');
insert into tableB values(null, 20, '의적');

-- 교차 조인(일반적인 조인 방식)
select count(*) FROM tableA, tableB;

-- 항상  join은 join 될 수 있는 지 조건을 확인하고 join한다.

-- 교차 조인 (명시적인 안시 방식) => 가독성에서 뛰어나다.
select COUNT(*) from tableA
	CROSS JOIN TABLEB;
    

-- ex45) 내부조인 ( 외부 조인이 아닌 것 전부 )
-- 안시 조인
-- 확인: 교차 초안
select * from tableA INNER JOIN TABLEB; -- 내부 조인은 사용할 때 반드시 조건과 같이 쓴다는 전제가 있다. 안해서 외부 조인과 같은 모습을 보였다.
-- 정상적인 내부 조인 문법
select * from tableA
	INNER JOIN TABLEB
	on tableA.eno = tableB.eno; -- on 조인 조건
-- 등가 조인이라고 한다.(=) 나머지는 비등가 조인  
select * from tableA
	INNER JOIN TABLEB
	on tableA.eno = tableB.eno -- 조인 조건
    where salary >=3000; -- 필터 조건, 검색 조건.


-- 교차 조인, 내부 조인, 등가 조인    (일반 조인, 안시 조인)

-- ex46) 일반 조인
select * from tableA, tableB
where tableA.eno = tableB.eno -- 조인 조건
and salary >= 3000; -- 필터 조건, 검색 조건

-- 테이블을 쪼개는 이유는 직업을 숫자로 대체 해놓고 대체한 숫자와 직업이 기록된 테이블을 따로 만들어 놓으면 메모리를 엄청나게 아낄 수 있다.
-- 그러나 요즘에는 하드가 넘처나기 때문에 메모리를 아끼기 위해 테이블을 쪼개지 말고 바로 전체 연결해서 사용함으로서 속도가 빨라진다.

-- ex 47) 테이블 이름에 별칭(별명)을 사용할 수 있다. 보통 첫자로 쓰며 첫자가 같을 경우 숫자를 이어 붙인다.
-- 정확하게는 별칭이라기보다는 리네임이다. 바꿔놓고 tableA라고 쓰면 오류가 뜬다. 
select * from tableA as t1, tableB t2 
where t1.eno = t2.eno
and salary >= 3000; 
-- and t1.salary >= 3000; 중복되는 컬럼이 아닌 순간 줄일 수 있다.

select t1.eno name, t1.id from tableA as t1, tableB t2 -- id는 컬럼명이 중복됨으로 명칭 or 별칭 명시필.
where t1.eno = t2.eno
and salary >= 3000; 

-- ex48) 사용을 잘못하고 있다.
select * from tableA
	cross join tableB
    on tableA.eno = tableb.eno;
    
-- ex49)
select * from tableA
	inner join tableB
    where tableA.eno = tableB.eno; -- 조인 조건이 없으니까, 교차 조인이 일어난다.교차 조인을 다 시키고 나서 그 결과를 필터 조인하므로 아주 잘못된 프로그램이다.
    
-- ex50) 이순신의 직업은 무엇입니까?
-- 등가 조인으로 구할 수 있다.
select name, job from tableA t1, tableB t2
where t1.eno = t2.eno
and t1.name = '이순신';

-- 서브 커리를 이용하는 방법
select job from tableB -- 로우마다 서브 커리에 넣는다.(즉 백만개의 로우면 백만번 시행한다. 그래서 위의 JOIN이 더 낫다는 것이 정론. 시행 시간을 보고 튜닝을 해야하는 데 이론을 떠나서 이 것이 빠르면 이 경우를 써야한다. 이렇게 되는 이유는 옵티마이제이션이 어떻게 최적화 시키는 지 모르기 때문이다.)
WHERE ENO = (
SELECT ENO
FROM TABLEA
WHERE NAME = '이순신');

-- ex51) 모대학에서 2학점인 과목을 검색하고, 이 과목을 강의하는 교수를 검색하세요.
CREATE TABLE db01.tableA (
id INT NOT NULL AUTO_INCREMENT,
pno int,	-- 교수 번호
name varchar(10), 	-- 교수 이름
PRIMARY KEY (id));
insert INTO tableA values (null, 100, '홍길동');
insert INTO tableA values (null, 101, '이순신');
insert INTO tableA values (null, 102, '안중근');
insert INTO tableA values (null, 103, '임꺽정');
insert INTO tableA values (null, 104, '강감찬');

CREATE TABLE db01.tableB (
id INT NOT NULL AUTO_INCREMENT,
name varchar(10), 	-- 과목명
num int,			-- 교수 이름
pno int,			-- 담당 교수 번호
PRIMARY KEY (id));
Insert into tableB values (null, '국어', 2, 103);
Insert into tableB values (null, '영어', 2, 104);
Insert into tableB values (null, '수학', 2, 105);
Insert into tableB values (null, '사회', 2, 106);
Insert into tableB values (null, '체육', 2, 107);
Insert into tableB values (null, '과학', 2, 108);

select  *from tableA t1
	inner join tableB t2
    on t1.pno = t2.pno;

select  *from tableA t1
	inner join tableB t2
    on t1.pno = t2.pno
    WHERE num = 2;
    
-- ex52) 화학과 1학년 학생들의 점수(성적)을 검색하세요.
-- 1. 최종 검색 결과는 무엇인가? 점수
-- 2. 필터링 조건은 무엇인가? 학과, 학년
-- 3. 조인될 테이블과 컬럼은 무엇인가? 학번
CREATE TABLE db01.tableA (
id INT NOT NULL AUTO_INCREMENT,
eno int, -- 학번
name varchar(10), -- 학생 이름
major varchar(10), -- 학과명
year int, -- 학년
PRIMARY KEY (id));

insert into tableA values (null, 1000, '홍길동', '화학', 1);
insert into tableA values (null, 1001, '이순신', '화학', 1);
insert into tableA values (null, 1002, '안중근', '국어', 2);
insert into tableA values (null, 1003, '임꺽정', '화학', 2);
insert into tableA values (null, 1004, '강감찬', '국어', 1);

CREATE TABLE db01.tableB (
id INT NOT NULL AUTO_INCREMENT,
eno int, -- 학번
cno int, -- 시험 과목 번호
result int, -- 점수
PRIMARY KEY (id));

insert into tableB values (null, 1000,10, 59);
insert into tableB values (null, 1000,20, 59);
insert into tableB values (null, 1001,10, 59);
insert into tableB values (null, 1001,20, 59);
insert into tableB values (null, 1001,30, 59);
insert into tableB values (null, 1002,20, 59);
insert into tableB values (null, 1003,30, 59);

select  *from tableA t1
	inner join tableB t2
    on t1.eno = t2.eno
    WHERE year = 1 and major = '화학';



drop table tableB;
-- ex53) 
select * from table01
	inner join table02
    on 조인조건;
    
    CREATE TABLE db01.tableA (
id_a INT NOT NULL AUTO_INCREMENT,
eno int, -- 학번
name varchar(10), -- 학생 이름
major varchar(10), -- 학과명
year int, -- 학년
PRIMARY KEY (id_a));


CREATE TABLE db01.tableB (
id_b INT NOT NULL AUTO_INCREMENT,
eno int, -- 학번
cno int, -- 시험 과목 번호
result int, -- 점수
PRIMARY KEY (id_b));

-- ex53)자연조인 : 양쪽 테이블에서  컬럼명이 동일한 것이 1개 이상 있다는 전제하에(그래서 id는 겹치지 않게 바꿨다.)
select * from tableA
	natural join tableB;
    
select * from tableA
	natural join tableB
where year = 1;
    
-- ex 54) Using 조인(일종의 자연 조인) : 컬럼명이 어쩔 수 없이 2개 이상 중복된 경우의 조인
-- 컬럼을 콕 찍어서 조인 시킬 수 있다.
select * from tableA
	join tableB using(eno)
where year = 1;

-- ex 54) 비등가 조인 : (=) 을 제외한 비교연산
CREATE TABLE db01.tableA (
	id_a INT NOT NULL AUTO_INCREMENT,
    name varchar(10), -- 이름
	eno int,	-- 부서번호, 직급번호
    salary int,
PRIMARY KEY (id_a));

insert into tableA values (null, '홍길동', 20, 50);
insert into tableA values (null, '이순신', 10, 150);
insert into tableA values (null, '안중근', 30, 250);
insert into tableA values (null, '임꺽정', 20, 350);
insert into tableA values (null, '김서방', 20, 170);
insert into tableA values (null, '강감찬', 20, 370);

-- 등급 테이블
CREATE TABLE db01.tableB (
	id_b INT NOT NULL AUTO_INCREMENT,
    grade varchar(10), -- 등급
	losalary int,	-- 최소값 설정
    hisalary int,	-- 최대값 설정
PRIMARY KEY (id_b));

insert into tableB value (null, 'A', 300, 9999);
insert into tableB value (null, 'B', 200, 299);
insert into tableB value (null, 'C', 100, 199);
insert into tableB value (null, 'D', 0, 99);

-- ex1)
select name, grade from tableA t1
	inner join tableB t2
    on t1.salary >= t2.losalary and t1.salary >= t2.hisalary;

-- ex2)
select name, grade from tableA t1
inner join tableB t2
on salary between t2.losalary and t2.hisalary;
-- ex3)
select name, grade from tableA t1, tableB t2
where salary between t2.losalary and t2.hisalary;

-- ex4)
select name, grade from tableA t1, tableB t2
where salary between t2.losalary and t2.hisalary
and grade='A';


    
-- ex55) 셀프 조인 : 동일 테이블끼리 조인
-- pk: 자신의 row 구별을 위한 컬럼
-- fk(외래기) : join할 때 사용 되는 컬럼.

-- 홍길동의 사원번호(1000)	사수번호(1005)
-- 이순신 사원번호(1005)
-- 이순신의 사수가 홍길동인 것처럼의 경우.


CREATE TABLE db01.table011 (
	id_a INT NOT NULL AUTO_INCREMENT,
    name varchar(10), -- 이름
	eno int,	-- 부서번호, 직급번호
    mgr int,	-- 사수번호, 멘토번호
    salary int,
PRIMARY KEY (id_a));

insert into table011 values (null, '홍길동', 1000, null, 100); -- 사수가 없다.
insert into table011 values (null, '이순신', 1001, 1000, 100);
insert into table011 values (null, '안중근', 1002, 1001, 100);
insert into table011 values (null, '임꺽정', 1003, 1002, 100);
-- 셀프 조인도 교차 조인이 되어 16개의 값이 일어난다.
-- 셀프 조인은 반드시 별칭이 있어야 한다. 하나의 테이블을 이용하는 거라 구별이 불가능하기 때문이다.
-- ex1) 셀프조인 기본.
select * from table011 as t1, table011 as t2;

-- ex2) 셀프조인
select * from table011 as t1, table011 as t2
where  t1. eno = t2.mgr ;

-- ex3) 셀프 조인. ex2와 같다.
select * from table011 as t1, table011 as t2
where t1.mgr = t2. eno;

-- ex56) 동명이인 검색
CREATE TABLE db01.table012 (
	id_a INT NOT NULL AUTO_INCREMENT,
    name varchar(10), -- 이름
PRIMARY KEY (id_a));

insert into table012 values (null, 'ㅁ');
insert into table012 values (null, 'ㅁ');
insert into table012 values (null, 'ㅋ');
insert into table012 values (null, 'ㅎ');
insert into table012 values (null, 'ㅁ');
insert into table012 values (null, 'ㅇ');
insert into table012 values (null, 'ㅋ');
insert into table012 values (null, 'ㄹ');
insert into table012 values (null, 'ㅂ');
-- 아이디가 다르면서 돔명
-- ex1)
select * from table012 as t1, table012 as t2
where t1.ia_a != t2.id_a
and t1.name = t2.name;

-- ex2) 동명이인 출력
select distinct(t1.name) from table012 as t1, table012 as t2
where t1.ia_a != t2.id_a
and t1.name = t2.name;

-- ex3) 동명이인 아이디 출력
select distinct(t1.id_a) from table012 as t1, table012 as t2
where t1.ia_a != t2.id_a
and t1.name = t2.name;

-- ex57) 세미 조인( 안티조인 ) : 메인쿼리에서 로우를 1개씩 가져와서
-- 서브쿼리에서 EXISTS로 존재 여부를 묻는 조인
/* 오늘 팔린 메뉴는?
메인쿼리		서브쿼리
메뉴 테이블	판매 테이블
짜장			짜장
짬뽕			짜장
냉면			짬뽕
			짜장
			짬뽕
*/
DROP TABLE munu;
create table menu(
	foodnum int,
    name varchar(20)
);
insert into menu values(1, '짜장');
insert into menu values(2, '우동');
insert into menu values(3, '냉면');
insert into menu values(4, '탕슉');
insert into menu values(5, '양장');


create table sell(
	no int, -- 판매번호
	count int, -- 판매수량
    foodnum int -- 판매된 음식번호
);
insert into sell values(1, 2, 1);
insert into sell values(2, 3, 2);
insert into sell values(3, 4, 2);
insert into sell values(4, 2, 2);
insert into sell values(5, 2, 1);

-- ex1)
select s.foodnum from sell s;
-- ex2)
select *
	from menu m
-- 		where m.foodnum = 1 or m.foodnum = 2;
-- 		where m.foodnum in(1,2); 위와 동일
-- 		where m.foodnum in(1,2,2,2,1) 위와 동일
where 	m.foodnum in(select s.foodnum from sell s); -- 위와 동일
-- ex3) 새미 조인
select * from menu m -- 주 커리에서 하나씩 가져와서 exits 될 때마다 가져온다?
	where exists(
		select * from sell s
		where m.foodnum = s.foodnum
    );
    
-- ex4) 안티 조인
select * from menu m
	where not exists(
		select * from sell s
		where m.foodnum = s.foodnum
    );
	-- 밑은 전부 내부 조인인가?
    -- 교차 조인, 내부 조인, 등가 조인			(일반 조인, 안시 조인)
    -- 자연 조인, Using 조인, 비등가 조인
    -- 셀프 조인, 세미 조인(안티 조인)
    


-- ex58 외부조인(outer join)
    create table tebleA(
	id int, -- 판매번호
	name varchar(20)
);

    create table tebleB(
	id int, -- 판매번호
	age int
);

insert into tebleA values(1, 'tiger01');
insert into tebleA values(2, 'tiger02');
insert into tebleA values(3, 'tiger03');
insert into tebleA values(4, 'tiger04');
insert into tebleA values(5, 'tiger05');

insert into tebleB values(3, 30);
insert into tebleB values(4, 40);
insert into tebleB values(5, 50);
insert into tebleB values(6, 60);
insert into tebleB values(7, 70);

-- 교집합 345를 구하는 것이 등가 조인.
-- ex1)
select *
from tableA t1, tableB t2
where t1.id = t2.id;
-- 교집합을 제외한 여러 경우의 수를 구할 수도 있는 부분이다.
-- ex) A 부분 B 부분, B를 제외한 A부분, A를 제외한 B 부분, 교집합을 제외한 AB 부분 등.
-- https://blogger.pe.kr/231에 그림으로 나와있다. 대표적으로 LEFT 조인과 RIGHT 조인이 있다.

-- ex2)
select *
	from tableA t1
		left join tableB t2
			on t1.id = t2.id;
            
select *
	from tableA t1
		right join tableB t2
			on t1.id = t2.id;
            
/*
-- ex3) 문제 제시 >> 전체 교수 명단과 그 교수가 담당하는 과목의 이름을 검색하세요. => 일반 조인해버리면 감강찬이 빠져버린다. 왼쪽은 전부 나와야한다 => 레프트 조인.
교수테이블				과목테이블
이름		과목번호		과목번호 교과목이름
홍길동	1			1		수학
안중근	null		2		영어
홍길동	2
이순신	2
감강찬	null

쿼리 결과는 ?
홍길동	국어
안중근	null
홍길동	영어
이순신 	영어
감강찬	null
*/
 
-- ex59) group by : ~별로( 그룹별로, 부서별로, 학과별로, 팀별로)
-- 그룹조건 : 	having
-- ex) 그룹별 평균(avg) 급여......, 그룹별 사원수(count), 그룹별 최대연봉(max)
-- 통계함수와 집계함수는 같은 말이다.

create table tableA(
	eno 	int,
    salary 	int
);

insert into tableA values(10, 800);
insert into tableA values(20, 200);
insert into tableA values(20, 400);
insert into tableA values(10, 500);
insert into tableA values(20, 800);
select * from tableA;

-- ex1)	group by를 사용해서 select 할 때는 컬럼명을 사용하는 것이 일반적이다.
select eno, sum(salary) -- *를 쓰지않고 이렇게 쓰는 데 이것이 정석코드이다.
	from tableA
    group by eno;
    
-- ex2) 급여가 300이상인 직원들을 그룹별로 검색하세요.
select eno, sum(salary)
	from tableA
    where salary > 300 -- select를 필터링한다.
    group by eno;
    
-- ex3)
select eno, sum(salary)
	from tableA
    where salary > 300
    group by eno
    having sum(salary) > 1000; -- 그룹핑된 결과를 필터링한다.
    
-- ex4)
select eno, sum(salary)
	from tableA
    where salary > 300
    group by eno	-- 3번 다시보기
    having sum(salary) > 1000; -- 그룹핑된 결과를 필터링한다.
    
-- 실행 순서를 검색해보자 https://bicloud.tistory.com/20

-- UI를 이용한 제작으로 밑의 예시들을 체크ㅎ보자.
-- 테이블 제작할 때 UQ(유니크)를 등록하면 중복 불가능. 프라이빗 키는 다음 번호는 무조건 다르게 들어온다. 기존의 키 번호가 삭제해도 그 키 번호 사용은 불가능하다.
-- 유니크 키는 주민번호에 사용되기 좋다. 키가 삭제되면 그 키를 다시 사용 가능하다. 정수 타입에서 사용이 가능하다. UN을 체크하면 음수를 사용 불가능하게 한다.(나이 등등)(양수 범위가2 배로 늘어난다.)
-- 대 소문자 구분을 시키기 위해 함수를 사용해서 제어할 수 있지만 바이너리 체크를 하면 처음부터 대 소문자 구분을 해준다.
-- ZF 옵션도 INT만 가능하다. age int(4)를 하면 4자리까지만 가능하다. 이런 거 또한 스키마이다. 여기서 내가 부족하게 수를 채우면 0을 대신 채워줄까 말까 하는 옵션이 ZF(ZERO FILL)이다.
-- 테이블 처음 만들 때 미리 계산해서 컬럼을 만들어 놓을 때 G를 사용. 옆 칸의 Default/Expression에 공식을 적는다.

-- ex60) 옵션 예 (중복 방지, Zero Fill)
CREATE TABLE `db01`.`tablea` (
  `idTableA` INT NOT NULL,
  `TableAcol` VARCHAR(45) BINARY NULL,
  PRIMARY KEY (`idTableA`));

insert into tableT values(null, 'tiger');
insert into tableT values(null, 'Tiger');
insert into tableT values(null, 'Tiger');
insert into tableT values(null, 'TigerLion');

CREATE TABLE `db01`.`new_table` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `age` INT ZEROFILL NULL,
  PRIMARY KEY (`id`));
  
insert into new_table values(null, 'tiger', 23);
-- 예시) sakila erd
-- ERD E: 엔티티 테이블. R: 관계 D: Diagram
-- 학생 테이블				기말 점수 테이블					등급 테이블
-- 이름						학번								학점(FK)
-- 성별			--->		점수(result)		--->			최소번
-- 학과			(sno)		과목	수학(033)	result(학점)		최대값
-- 학번(sno)					|
-- 							|(CNO)
-- 							|(양방향)
--                          |
-- 						과목 테이블				교수테이블
-- 						과목명		------->	교수 번호(PNO)
-- 						과목번호(CNO)				이름
-- 						학점						연도
-- 						담당교수(PNO)				급여
-- 위 하나하나를 서비스를 하는 객체이고 이를 도메인이라고 한다.(고객에게 서비스가 됐다고 표현한다.)
