# App Nation Case Study

Bu proje, Flutter kullanılarak geliştirilmiş bir uygulamadır. Dog API kullanarak köpek türlerini ve resimlerini çeken bunlar içinde search yapma imkanı sunan bir uygulamadır.

## Kullanılan Paketler

Projede aşağıdaki Flutter paketleri kullanılmıştır:

- **flutter_bloc: ^8.1.3**
  - State management için kullanılmıştır.

- **dartz: ^0.10.1**
  - Fonksiyonel programlama özellikleri sunan bir pakettir.

- **get_it: ^7.6.4**
  - Dependency injection için kullanılmıştır.

- **equatable: ^2.0.5**
  - Bloclarda kullanılan veri sınıflarının karşılaştırılmasını kolaylaştırmak için kullanılmıştır.

- **dio: ^5.3.4**
  - Network işlemleri yönetimi için kullanılmıştır.

- **flutter_svg: ^2.0.9**
  - SVG ikonlarını göstermek için kullanılmıştır.

- **draggable_menu: ^4.4.1**
  - Ana sayfadaki search inputunu genişletmek için kullanılmıştır.

- **cached_network_image: ^3.3.0**
  - Resimleri önbellekten göstermek için kullanılmıştır.

- **go_router: ^12.1.1**
  - Routing işlemleri için kullanılmıştır.

## Proje'de Kullanılan Yapılar

Projede paralel istek yapısı kurularak, resimler paralel olarak çekilmektedir.
Method channellar sayesinde Swift ve Kotlin kodlarına bağlanılarak işletim sistemi versiyonu bilgisi elde edilmektedir.

## Nasıl Çalıştırılır

1. Projeyi klonlayın.
   ```bash
   git clone https://github.com/kullanici/ad-nation-case-study.git
   
2. Bağımlılıkları yükleyin.
   ```bash
   flutter pub get
   
3. Uygulamayı çalıştırın.
   ```bash
   flutter run

## Ekran Kaydı
[](https://github.com/metehanpinarli/AppNationCaseStudy/assets/56471014/98f02eed-bc85-4004-9b81-a66627753357)



