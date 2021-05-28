select Ad,Soyad,DersSaati from Müşteriler m inner join Üyelik  ü on m.PaketId=ü.PaketId where Gün=2 order by DersSaati
--Salı günü dersi olan üyelerin isimleri ve ders saatleri

select m.Ad + '' +m.Soyad as Müşteri,e.Ad + '' + e.Soyad as [Eğitmen],DersSaati from Müşteriler m 
inner join Üyelik  ü on m.PaketId=ü.PaketId inner join Eğitmenler e on ü.EğitmenId=e.EğitmenId where gün=5
--Cuma günü dersi olan üyelerin isimleri ve o üyelere ait eğitmenlerin isimleri

select * from Müşteriler where PaketId in(select PaketId from Üyelik ü 
inner join Atlar a on ü.EğitmenId=a.AtId where a.Ad='Gece')
--Gece adlı atla ders yapan müşteri bilgileri

select e.EğitmenId,e.Ad + e.Soyad as Eğitmen,a.Ad, count(*) as [Toplam Ders Saati],Satıldı as [Satıldı mı?] from Üyelik ü inner join Eğitmenler e 
on e.EğitmenId=ü.EğitmenId inner join Atlar a on a.AtId=e.EğitmenId group by e.EğitmenId,Satıldı,e.Ad,e.Soyad,a.Ad having Satıldı is not null
--Satılan paketlere göre her eğitmenin hangi atla toplam kaç saat ders verdiği

select gün,min(DersSaati) as [en erken],e.Ad from Üyelik ü inner join Eğitmenler e on e.EğitmenId=ü.EğitmenId 
where Satıldı is null group by gün,e.Ad order by gün,e.Ad
--Paket satın almak isteyen biri eğitmenlerin programlarına göre en erken saate alabilecekleri paketleri gösteren sorgu

select AtId,Ad,count(*)*100 as [haftaiçi kazanç] from Üyelik ü inner join Atlar a on ü.EğitmenId=a.AtId 
where Satıldı is not null and gün<=5 group by AtId,Ad
--Haftaiçi verilen derslerde atların kullanımına göre kazanç


