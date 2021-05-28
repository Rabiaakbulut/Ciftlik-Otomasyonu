-----------------------------------------------------------------------------------------------
--Insert, update, delete deyimlerine örnekler

insert into Müşteriler values (111,'Sinem','Yılmaz',05411123456,'1995-03-09',22132)
--Müşteriler tablosuna yeni bir kayıt ekleme

insert into Müşteriler values (112,'Başak','Demir',05411123456,'1995-03-11',11111)
--Müşteriler tablosuna yeni bir kayıt ekleme

update Üyelik set Satıldı='evet' where PaketId=22132
--Yeni kayıt olan kişinin paketini satıldı olarak belirtme

update Üyelik set Satıldı='evet' where PaketId=11111
--Yeni kayıt olan kişinin paketini satıldı olarak belirtme

delete from Müşteriler where MüşteriId=112
--Müşteriler tablosundan kayıt silme

update Üyelik set Satıldı=NULL where PaketId=11111
--Silinen Kayıdın sahip olduğu paketid'nin satıldı değeri değiştirildi

insert into Üyelik values (44151,4,4,15,2,NULL)
--Üyelik tablosuna yeni paket kaydı ekleme

----------------------------------------------------------------------------------------------
-- Select deyimleri ve gruplama fonsksiyonları (min, max, avg, count gibi) ile ilgili 
--veritabanıza ait anlamlı sorusu ve cevabını içeren en az 10 sorgu

select gün from Ücretlendirme where Ücret between 50 and 100
--ücreti 50 ile 100 lira arasında olan günler

select distinct Manej from Üyelik
--kaç farklı manej olduğunu gösteren sorgu

select Ad,upper(Soyad),DoğumTarihi from Müşteriler where year(DoğumTarihi)<1990 order by DoğumTarihi asc
--Müşteriler tablosunda doğum tarihi 1990'dan küçük olan kayıtlar

select top 20 percent PaketId from Üyelik where Satıldı is NULL
--Satın alınabilecek paketlerden %20'sini gösteren sorgu

select * from Üyelik where Satıldı is Null and PaketId like '_2___'
--Salı günü için satın alınabilecek paketler

select * from Üyelik where Satıldı is Null and Manej=2
--2. manej için satın alınabilecek paketler

select * from Üyelik where Satıldı is Null and DersSaati in(13,14,15)
--Ders saati 13 14 ya da 15 olan satın alınabilecek paketler

select count(*)*100 as [haftaiçi kazanç] from Üyelik where gün<=5 and Satıldı='evet'
--Haftaiçi satılan paketler üzerinden elde edilen kar

select (year(getdate())-min(year(DoğumTarihi))) as [En Büyük Üyenin Yaşı] from Müşteriler 
--En büyük üyenin yaşı

select max(DersSaati) from Üyelik 
--En geç ders alınabilecek saat

select avg(Ücret) as [Ortalama Fiyat] from Ücretlendirme
--Ortalama bir paketin fiyatı
