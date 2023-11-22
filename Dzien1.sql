

create table Osoby 
(
  Imie varchar(255),
  Nazwisko varchar(255), -- napis max długości 255 znakków
  Wiek int, -- liczba całkowita 
  Wzrost decimal(5,2), -- np: 125.34
  DataUr datetime2 -- data z czasem 
)
---

select * from Osoby

insert into osoby values ('Jan', 'Kowalski', 35, 186.23,'20231122 15:22:43')


 use A_Zawodnicy -- zmiana kontekstu bazy 


 select * from zawodnicy

 select * from trenerzy 

 -- po przecinku wymieniam kolumny
 select imie, nazwisko, kraj from zawodnicy

 select imie, wzrost + 5 from zawodnicy

 select imie, wzrost + 5 as nowyWzrost from zawodnicy

 select imie as nazwa, wzrost + 5 as nowyWzrost from zawodnicy

 select imie as nazwa, wzrost + 5 as [nowy Wzrost] from zawodnicy

 -- slowo 'as' jest opcjonalne 
  select imie as nazwa, wzrost + 5 [nowy Wzrost] from zawodnicy


  select imie , nazwisko, (wzrost*2)/3 from zawodnicy 

  --  Wypisz imię i nazwisko skoczków oraz maksymalną dopuszczalną długość nart (maks. 146% wzrostu).

  select imie, nazwisko, wzrost*1.46 [max długość nart]
  from zawodnicy

  -- Wskaźnik BMI (Body Mass Index) to iloraz masy człowieka i kwadratu jego wzrostu wyrażonego w metrach.
  -- Wypisz listę skoczków wraz z ich wskaźnikiem BMI w kolumnie nazwanej bmi.

  select imie, nazwisko, waga/ ((wzrost/100.0)*(wzrost/100.0)) as bmi
  from zawodnicy

  select 5+2, 10/3, 10.0/3
  select wzrost/100, wzrost/100.0 from zawodnicy

  -- liczba calkowita podzielona przez inna liczbe calkowita daje wynik całkowity 

  select 2^3 -- to nie potęgowanie ! 

  -- to operacja bitowa XOR 
  select 0^0 , 0^1,1^0, 1^1 

  -- funkcje matematyczne 

  -- potęgowanie
  select POWER(2,3), power(2,3)

  select imie, nazwisko , waga/(power(wzrost/100.0,2)) bmi
  from zawodnicy

  -- zaokrąglanie
  select round(24.153,2)

   select imie, nazwisko , round(waga/(power(wzrost/100.0,2)),2) bmi
  from zawodnicy

  -- funkcja format 
  -- formaotwanie wyswietlanego wyniku tak jak chcemy 

  select format(123.456,'0000.00000')
  -- co najmniej x*0 cyfr przed przecinkiem i dokłądnie y*0 cyfr po przecinku 

  select imie, nazwisko , format(round(waga/(power(wzrost/100.0,2)),2),'0.00') bmi
  from zawodnicy

  -- funkcja formatu od razu zaokrągla wynik (nie muszę używać round)

  select imie, nazwisko , format(waga/(power(wzrost/100.0,2)),'0.00') bmi
  from zawodnicy

  -- wracamy do funkcji matematycznych 

  select abs(-5), ceiling(2.3), floor(2.7), power(2,3), sqrt(9), sign(-4),sign(0), sign(-5)



 -- Zadanie: Znajdź różnicę między wagą w kilogramach a wzrostem w metrach dla każdego
-- zawodnika i zwróć jej wartość bezwzględną.

select imie , nazwisko, abs(waga-wzrost/100.0) 
from zawodnicy

-- Zadanie:  Znajdź pierwiastek kwadratowy z wagi każdego zawodnika i zaokrąglij do 2 miejsc po przecinku.

select imie , nazwisko , round(SQRT(waga),2) 
from zawodnicy

select imie , nazwisko , format(SQRT(waga),'0.00') 
from zawodnicy


-- Zadanie: Sprawdź, czy różnica między 3 krotnością wagi a wzrostem jest dodatnia, ujemna,
--czy zerowa dla każdego zawodnika.

select imie, nazwisko , sign(waga*3-wzrost)  
from zawodnicy





