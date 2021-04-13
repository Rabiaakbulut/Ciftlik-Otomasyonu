-----------------------------------------------------------------------------------------------
--4. Insert, update, delete deyimlerine örnekler

insert into Müþteriler values (111,'Sinem','Yýlmaz',05411123456,'1995-03-09',22132)
--Müþteriler tablosuna yeni bir kayýt ekleme

insert into Müþteriler values (112,'Baþak','Demir',05411123456,'1995-03-11',11111)
--Müþteriler tablosuna yeni bir kayýt ekleme

update Üyelik set Satýldý='evet' where PaketId=22132
--Yeni kayýt olan kiþinin paketini satýldý olarak belirtme

update Üyelik set Satýldý='evet' where PaketId=11111
--Yeni kayýt olan kiþinin paketini satýldý olarak belirtme

delete from Müþteriler where MüþteriId=112
--Müþteriler tablosundan kayýt silme

update Üyelik set Satýldý=NULL where PaketId=11111
--Silinen Kayýdýn sahip olduðu paketid'nin satýldý deðeri deðiþtirildi

insert into Üyelik values (44151,4,4,15,2,NULL)
--Üyelik tablosuna yeni paket kaydý ekleme

-----------------------------------------------------------------------------------------------
--5. Select deyimleri ve gruplama fonsksiyonlarý (min, max, avg, count gibi) ile ilgili 
--veritabanýza ait anlamlý sorusu ve cevabýný içeren en az 10 sorgu

select gün from Ücretlendirme where Ücret between 50 and 100
--ücreti 50 ile 100 lira arasýnda olan günler

select distinct Manej from Üyelik
--kaç farklý manej olduðunu gösteren sorgu

select Ad,upper(Soyad),DoðumTarihi from Müþteriler where year(DoðumTarihi)<1990 order by DoðumTarihi asc
--Müþteriler tablosunda doðum tarihi 1990'dan küçük olan kayýtlar

select top 20 percent PaketId from Üyelik where Satýldý is NULL
--Satýn alýnabilecek paketlerden %20'sini gösteren sorgu

select * from Üyelik where Satýldý is Null and PaketId like '_2___'
--Salý günü için satýn alýnabilecek paketler

select * from Üyelik where Satýldý is Null and Manej=2
--2. manej için satýn alýnabilecek paketler

select * from Üyelik where Satýldý is Null and DersSaati in(13,14,15)
--Ders saati 13 14 ya da 15 olan satýn alýnabilecek paketler

select count(*)*100 as [haftaiçi kazanç] from Üyelik where gün<=5 and Satýldý='evet'
--Haftaiçi satýlan paketler üzerinden elde edilen kar

select (year(getdate())-min(year(DoðumTarihi))) as [En Büyük Üyenin Yaþý] from Müþteriler 
--En büyük üyenin yaþý

select max(DersSaati) from Üyelik 
--En geç ders alýnabilecek saat

select avg(Ücret) as [Ortalama Fiyat] from Ücretlendirme
--Ortalama bir paketin fiyatý