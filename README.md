# SQL Sales Analytics Projesi

## Proje Özeti

Bu proje, SQL Server kullanılarak uçtan uca bir veri analizi sürecini göstermektedir.
Gerçek dünya benzeri bir satış veri seti üzerinde veri temizleme, dönüşüm ve analiz işlemleri gerçekleştirilmiştir.

---

## Kullanılan Teknolojiler

* SQL Server (Azure SQL)
* DBeaver
* SQL (T-SQL)
* Git ve GitHub

---

## Proje Yapısı

* `sql/01_create_database.sql` → veritabanı oluşturma
* `sql/02_create_tables.sql` → tablo yapıları
* `sql/03_constraints.sql` → foreign key ilişkileri
* `sql/04_insert_import_prep.sql` → veri temizleme ve ETL işlemleri
* `sql/05_views.sql` → analiz view’ları
* `sql/06_procedures.sql` → stored procedure’ler
* `sql/07_analysis_queries.sql` → analiz sorguları
* `sql/08_indexing.sql` → performans iyileştirme

---

## Veri Süreci

Ham veri alınarak aşağıdaki süreçten geçirilmiştir:

Raw Veri → Temizleme → Dönüşüm → Analiz

---

## Yapılan Analizler

* Toplam satış ve kâr analizi
* Kategori bazlı kârlılık analizi
* Şehir bazlı kâr analizi
* Aylık satış trendi

---

## Kazanımlar

* İlişkisel veritabanı tasarımı (normalizasyon)
* SQL ile veri temizleme ve dönüşüm
* Gerçek hayata benzer kirli verilerle çalışma
* Analitik sorgular oluşturma
* View ve stored procedure kullanımı
* Index ile performans iyileştirme

---

## Görseller

Proje çıktılarının görselleştirilmiş hali `screenshots/` klasöründe bulunmaktadır.

Bu görseller, SQL ile elde edilen analiz sonuçlarının daha anlaşılır şekilde sunulmasını amaçlamaktadır ve aşağıdaki içerikleri kapsar:

* Satış ve kâr özetleri
* Kategori bazlı analizler
* Şehir bazlı kârlılık
* Zaman bazlı satış trendleri

---

## Sonuç

Bu proje ile:

* Ham veriden anlamlı içgörüler elde edilmiştir
* Ölçeklenebilir ve düzenli bir veritabanı yapısı kurulmuştur
* SQL kullanarak veri analizi süreci uçtan uca gerçekleştirilmiştir