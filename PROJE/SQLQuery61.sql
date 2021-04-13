select Ad,Soyad,DersSaati from M��teriler m inner join �yelik  � on m.PaketId=�.PaketId where G�n=2 order by DersSaati
--Sal� g�n� dersi olan �yelerin isimleri ve ders saatleri

select m.Ad + '' +m.Soyad as M��teri,e.Ad + '' + e.Soyad as [E�itmen],DersSaati from M��teriler m 
inner join �yelik  � on m.PaketId=�.PaketId inner join E�itmenler e on �.E�itmenId=e.E�itmenId where g�n=5
--Cuma g�n� dersi olan �yelerin isimleri ve o �yelere ait e�itmenlerin isimleri

select * from M��teriler where PaketId in(select PaketId from �yelik � 
inner join Atlar a on �.E�itmenId=a.AtId where a.Ad='Gece')
--Gece adl� atla ders yapan m��teri bilgileri

select e.E�itmenId,e.Ad + e.Soyad as E�itmen,a.Ad, count(*) as [Toplam Ders Saati],Sat�ld� as [Sat�ld� m�?] from �yelik � inner join E�itmenler e 
on e.E�itmenId=�.E�itmenId inner join Atlar a on a.AtId=e.E�itmenId group by e.E�itmenId,Sat�ld�,e.Ad,e.Soyad,a.Ad having Sat�ld� is not null
--Sat�lan paketlere g�re her e�itmenin hangi atla toplam ka� saat ders verdi�i

select g�n,min(DersSaati) as [en erken],e.Ad from �yelik � inner join E�itmenler e on e.E�itmenId=�.E�itmenId 
where Sat�ld� is null group by g�n,e.Ad order by g�n,e.Ad
--Paket sat�n almak isteyen biri e�itmenlerin programlar�na g�re en erken saate alabilecekleri paketleri g�steren sorgu

select AtId,Ad,count(*)*100 as [haftai�i kazan�] from �yelik � inner join Atlar a on �.E�itmenId=a.AtId 
where Sat�ld� is not null and g�n<=5 group by AtId,Ad
--Haftai�i verilen derslerde atlar�n kullan�m�na g�re kazan�

