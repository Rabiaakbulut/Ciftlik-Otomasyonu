-----------------------------------------------------------------------------------------------
--4. Insert, update, delete deyimlerine �rnekler

insert into M��teriler values (111,'Sinem','Y�lmaz',05411123456,'1995-03-09',22132)
--M��teriler tablosuna yeni bir kay�t ekleme

insert into M��teriler values (112,'Ba�ak','Demir',05411123456,'1995-03-11',11111)
--M��teriler tablosuna yeni bir kay�t ekleme

update �yelik set Sat�ld�='evet' where PaketId=22132
--Yeni kay�t olan ki�inin paketini sat�ld� olarak belirtme

update �yelik set Sat�ld�='evet' where PaketId=11111
--Yeni kay�t olan ki�inin paketini sat�ld� olarak belirtme

delete from M��teriler where M��teriId=112
--M��teriler tablosundan kay�t silme

update �yelik set Sat�ld�=NULL where PaketId=11111
--Silinen Kay�d�n sahip oldu�u paketid'nin sat�ld� de�eri de�i�tirildi

insert into �yelik values (44151,4,4,15,2,NULL)
--�yelik tablosuna yeni paket kayd� ekleme

-----------------------------------------------------------------------------------------------
--5. Select deyimleri ve gruplama fonsksiyonlar� (min, max, avg, count gibi) ile ilgili 
--veritaban�za ait anlaml� sorusu ve cevab�n� i�eren en az 10 sorgu

select g�n from �cretlendirme where �cret between 50 and 100
--�creti 50 ile 100 lira aras�nda olan g�nler

select distinct Manej from �yelik
--ka� farkl� manej oldu�unu g�steren sorgu

select Ad,upper(Soyad),Do�umTarihi from M��teriler where year(Do�umTarihi)<1990 order by Do�umTarihi asc
--M��teriler tablosunda do�um tarihi 1990'dan k���k olan kay�tlar

select top 20 percent PaketId from �yelik where Sat�ld� is NULL
--Sat�n al�nabilecek paketlerden %20'sini g�steren sorgu

select * from �yelik where Sat�ld� is Null and PaketId like '_2___'
--Sal� g�n� i�in sat�n al�nabilecek paketler

select * from �yelik where Sat�ld� is Null and Manej=2
--2. manej i�in sat�n al�nabilecek paketler

select * from �yelik where Sat�ld� is Null and DersSaati in(13,14,15)
--Ders saati 13 14 ya da 15 olan sat�n al�nabilecek paketler

select count(*)*100 as [haftai�i kazan�] from �yelik where g�n<=5 and Sat�ld�='evet'
--Haftai�i sat�lan paketler �zerinden elde edilen kar

select (year(getdate())-min(year(Do�umTarihi))) as [En B�y�k �yenin Ya��] from M��teriler 
--En b�y�k �yenin ya��

select max(DersSaati) from �yelik 
--En ge� ders al�nabilecek saat

select avg(�cret) as [Ortalama Fiyat] from �cretlendirme
--Ortalama bir paketin fiyat�