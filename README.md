Kütüphane Uygulaması

Bu projede Asp.net MVC ve MSSQL kullanılarak kütüphane uygulaması geliştirilmiştir. Uygulamada kütüphanede bulununan kitaplar listelenmiş olup kitabın anlık olarak kütüphanede mi yoksa dışarıya ödünç mü verildi bilgisini gösterir. Eğer kütüphanedeyse ve dışarıya ödünç
verilmek isteniyorsa ödünç ver butonuna tıklayarak ödünç verilecek kişinin adı, soyadı, ödünç veriliş tarihi ve geri getireceği tarih bilgileri girilip veritabanına kaydedilir ve veri tabanından kitap pasif edilir. Ödünç verilmiş bir kitabın durumu detay butonuna basılarak 
incelenebilir. Eğer ödünç verilen kitap geri getirilmişse bu detay sayfasından geri getirdi butonuna basarak tekrar veri tabanından kitab aktif edilir. Ayrıca kitaplar üzerinde güncelleme ve silme işlemleri yapılabilir.

Veri tabanında books ve lend adında iki tablo bulunur. Books tablosu kitapları, lend tablosu ise hangi kitabın kime ödünç verildiği bilgilerini tutar. Lend tablosundaki book_id kolonu books tablosundaki Id kolonu ile foreign key ile bağlanmıştır.

MVC projesinde DBFirst kullanıldığı için veri tabanı model olarak ADO.NET kullanılmıştır. Bu sayede veri tabanındaki modeller projeye aktarılmıştır.

MVC projesinde 2 adet Controller yer almaktadır. HomeController kitaplar üzerindeki işlemleri yapmak için vardır. LendController ise kitaplar üzerindeki ödünç verme işlemlerini yönetmek için vardır.
