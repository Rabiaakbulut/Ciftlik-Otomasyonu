select Ad,Soyad,DersSaati from Müþteriler m inner join Üyelik  ü on m.PaketId=ü.PaketId where Gün=2 order by DersSaati
--Salý günü dersi olan üyelerin isimleri ve ders saatleri

select m.Ad + '' +m.Soyad as Müþteri,e.Ad + '' + e.Soyad as [Eðitmen],DersSaati from Müþteriler m 
inner join Üyelik  ü on m.PaketId=ü.PaketId inner join Eðitmenler e on ü.EðitmenId=e.EðitmenId where gün=5
--Cuma günü dersi olan üyelerin isimleri ve o üyelere ait eðitmenlerin isimleri

select * from Müþteriler where PaketId in(select PaketId from Üyelik ü 
inner join Atlar a on ü.EðitmenId=a.AtId where a.Ad='Gece')
--Gece adlý atla ders yapan müþteri bilgileri

select e.EðitmenId,e.Ad + e.Soyad as Eðitmen,a.Ad, count(*) as [Toplam Ders Saati],Satýldý as [Satýldý mý?] from Üyelik ü inner join Eðitmenler e 
on e.EðitmenId=ü.EðitmenId inner join Atlar a on a.AtId=e.EðitmenId group by e.EðitmenId,Satýldý,e.Ad,e.Soyad,a.Ad having Satýldý is not null
--Satýlan paketlere göre her eðitmenin hangi atla toplam kaç saat ders verdiði

select gün,min(DersSaati) as [en erken],e.Ad from Üyelik ü inner join Eðitmenler e on e.EðitmenId=ü.EðitmenId 
where Satýldý is null group by gün,e.Ad order by gün,e.Ad
--Paket satýn almak isteyen biri eðitmenlerin programlarýna göre en erken saate alabilecekleri paketleri gösteren sorgu

select AtId,Ad,count(*)*100 as [haftaiçi kazanç] from Üyelik ü inner join Atlar a on ü.EðitmenId=a.AtId 
where Satýldý is not null and gün<=5 group by AtId,Ad
--Haftaiçi verilen derslerde atlarýn kullanýmýna göre kazanç

