![image](https://user-images.githubusercontent.com/10184695/183286836-062dcd8a-999e-49ed-ae78-25dfe5c3fdc8.png)



# Nedir?

Bu Batch Script, Windows aktivasyonunun kod ile kolayca yapılmasını sağlar.

Windows 7, 8, 8.1, 10, 11 tüm sürümlerini (Home, Pro vb. farketmeksizin) destekler.

# ÖZELLİKLER

*Mevcut lisans anahtarını silme

*Lisans anahtarı ekleme

*Çevrimiçi aktivasyon

*Çevrimdışı aktivasyon

*Installation ID (IID) - Yükleme Kimliği alır.

*Confirmation ID (CID) - Onay Kimliği alır.

# Detaylar
Bizim burada kullanacağımız etkinleştirme yöntemi çevrimiçi ve çevrimdışı aktivasyon yönteminin ikisinin de kod ile yapılabilmesi üzerine olacaktır.  
Bununla ilgili Microsoft Windows aktivasyon dökümanı şuradan detaylı bilgi edinilebilir ve kullanılabilir. Link: https://docs.microsoft.com/tr-tr/windows-server/get-started/activation-slmgr-vbs-options


# Temel Kodlar

Script üzerinde kullanılan 5 temel kod var.
Bunlar hakkında bilgiye üstteki linkten ulaşabilirsiniz. Kodlar şunlar;

`cscript //nologo %SystemRoot%\system32\slmgr.vbs -upk`

`cscript //nologo %SystemRoot%\system32\slmgr.vbs -ipk (ABCDE-ABCDE-ABCDE-ABCDE-ABCDE şeklinde lisans anahtarı)`

`cscript //nologo %SystemRoot%\system32\slmgr.vbs /dti`

`cscript //nologo %SystemRoot%\system32\slmgr.vbs /atp (000000000000000000000000000000000000000000000000 şekline Onay Kimliği kodu)`

`cscript //nologo %SystemRoot%\system32\slmgr.vbs /ato`


# KULLANIM
Bat komut dosyasını çalıştırın ve yönergeleri takip edin.

Kullanım Videosu: (Önce çevrimiçi aktivasyonu deneyebilirsiniz ki çevrimiçi aktivasyonda CID istemez. Olmazsa çevrimdışı aktivasyonu deneyiniz.)

[![Legal Windows Telefon Aktivasyonu](https://user-images.githubusercontent.com/10184695/184220489-a50352a7-e81a-4806-9560-99788a1204d3.png)](https://www.youtube.com/watch?v=m05XuXU58yw "Legal Windows Telefon Aktivasyonu")


# Genel Bilgilendirme
Altta arayüz üzerinden nasıl aktivasyon yapılabileceği ile ilgili video mevcuttur.  
MAK gibi çevrimiçi etkinleştirmeye müsait olan lisans anahtarları ile aktivasyon kolayca yapılabilir.

[![Legal Windows Arayüz Aktivasyonu](https://yt-embed.herokuapp.com/embed?v=dGIKV-9ESfw)](https://www.youtube.com/watch?v=dGIKV-9ESfw "Legal Windows Arayüz Aktivasyonu")

Diğer bir aktivasyon yöntemi ise çevrimdışı (internet bağlantısı olmama durumunda vb. kullanılabilen bir aktivasyon yöntemi) aktivasyon yöntemidir.
RETAIL, OEM anahtarlar bu şekilde kolayca aktif edilebilir.

[![Legal Windows Telefon Aktivasyonu](https://yt-embed.herokuapp.com/embed?v=xMUULva-X_o)](https://www.youtube.com/watch?v=xMUULva-X_o "Legal Windows Telefon Aktivasyonu")


# ÖNEMLİ NOTLAR

Lisans anahtarı arayüz üzerinden Etkinleştirme ekranından `Ürün Anahtarını Değiştir` butonundan yapılmakta.

![image](https://user-images.githubusercontent.com/10184695/183283843-3790535d-7ab2-400e-bec8-ff965b2e187f.png)

Ürün anahtarını değiştir ekranının hızlıca gelmesini istiyorsanız veya sistemsel bir hata durumunda `Çalıştır`'a `SLUI.EXE` komutunu girebilirsiniz.
Telefon etkinleştirmesi çıkmadığında `Çalıştır`'a `SLUI.EXE 4` komutunu girebilirsiniz.

RETAIL anahtarlar resimdeki gibi hata verecektir.

![image](https://user-images.githubusercontent.com/10184695/183283929-a09df84d-193a-498b-b0ba-da49376726ff.png)

Bu hata anormal değildir. RETAIL anahtarlar tek kullanımlıktır ve telefon etkinleştirmesiyle aktif edilir. OEM anahtarlar da RETAIL gibi aktif edilir. Dizüstü bilgisayarların altında yer alan lisans anahtarlarını denediğinizde aktif etmediğini ve hata aldığınızı göreceksiniz. Bunu da telefon etkinleştirmesi ile çözebilirsiniz.

![image](https://user-images.githubusercontent.com/10184695/183284063-a28b5ed9-948e-4ad4-b8d4-2bf0df75475d.png)

Telefon etkinleştirmesi ile Microsoft aranır ve ekranda görülen Yükleme Kimliği (IID) kodu telefondan girilir ve Onay Kimliği (CID) kodu alınır ve ekrana girildiğinde aktivasyon gerçekleşir.

Arayüz üzerinden telefon etkinleştirmesine ulaşım ve kullanımı; https://support.microsoft.com/tr-tr/windows/windows-i%C3%A7in-%C3%BCr%C3%BCn-etkinle%C5%9Ftirme-%C3%A7evrimi%C3%A7i-ve-destek-telefon-numaralar%C4%B1-35f6a805-1259-88b4-f5e9-b52cccef91a0


Aşağıda bir satıcının bu yöntem ile aktivasyonun nasıl yapıldığını anlattığı videosunu görüyorsunuz.

[![Legal Windows Arayüz Aktivasyonu](https://user-images.githubusercontent.com/10184695/183283638-c441f5bb-2ab1-4005-9857-ea4c5d7e541f.png)](https://www.youtube.com/watch?v=K8tNvmlfoeI "Legal Windows Arayüz Aktivasyonu")

Bu da başka bir satıcının Telefon etkinleştirmesi yönlendirmesi.

![image](https://user-images.githubusercontent.com/10184695/183286722-e91b0147-424c-4bec-877e-01580a7a3999.png)

Bu da başkası.

![image](https://user-images.githubusercontent.com/10184695/183286880-f4c3578c-4d88-48f1-9c2a-f2888c9617f6.png)


# Lisans anahtarı bulmak
Lisans anahtarınız yoksa bir tane edinmeniz gerekiyor. İnternet siteleri ucuza satıyorlar ve bence buna gerek de yok.
Telegram grupları (https://t.me/windows_office_etkinlestir), bazı internet siteleri üzerinden paylaşılan anahtarlar her gün yayılıyor ve emin olun Microsoft'un çok pahalı sattığı anahtarları satan bu satıcılardan aldıktan sonra Google üzerinde arama yaparsanız nette olduğunu göreceksiniz. Düşmediyse bile 1-2 güne düşer. Neyse satın aldınız veya belirttiğim şekilde buldunuz ki bu kodların çalışıp çalışmadığını öğrenmeniz gerekiyor. Bunu kontrol etmek için ise aşağıdaki siteleri ve programları kullanabilirsiniz.

# 🔥Lisans Durumunu Nasıl Öğrenirim?🔥

Lisans kodunu kullanmadan önce durumunu kendiniz kontrol edebilirsiniz. Sorgulamadaki hata kodları lisans anahtarı durumunu gösterir. 

🚩PID (Product ID) Anahtarı Durumu Sorgulama Siteleri

🔗https://khoatoantin.com/pidms ( Username: trogiup24h Password: PHO veya Username: HQCNTH - Password: MIGOI )

🔗https://khoatoantin.com/office365 (Office365 Hesap durumu sorgulamak için) ( Username: trogiup24h Password: PHO veya Username: HQCNTH - Password: MIGOI )

🔗https://pidkey.top

🔗https://doonoi.top

🔗https://webact.185.hk/mskey.php (WeChat isteyebilir)

🔗https://dbmer.com/checkkey


🚩PID Sorgulama Programları

🔗http://khoatoantin.com/products/cidms.zip ( Username: trogiup24h Password: PHO veya Username: HQCNTH - Password: MIGOI )

🔗https://github.com/laomms/PidKeyTool

🔗https://github.com/Ja7ad/PIDChecker

Elinizdeki lisans anahtarının durumunu program veya siteye girip sorgulatınız. Size şu gibi bir çıktı verecek ve burada önemli olan ErrorCode:0xC004C008 ve MAK anahtarlarda Remaining kısmı.

MAK keyleriyle üstte belirttiğim gibi arayüz üzerinden kolayca etkinleştirebilirsiniz ancak diğer lisans anahtarları arayüzde hata verecektir. Bu sebeple telefon ile aktivasyon gerçekleştirilir.

`ProductKey:V87KN-K29H6-J2439-9DQD4-FC3KF`

`Description:Win 10 RTM Professional Retail`

`ErrorCode:0xC004C008`

`CheckedTime:2022-08-07 10:10:04 AM(UTC+03:00)`

-----------------------------------------------------
-----------------------------------------------------


`Key: DFDEN-WNR3R-MJC87-R7T9K-JXYKY`

`Description: Win 10 RTM Professional Volume:MAK`

`Remaining: 7302`

`Time: 8/7/2022 2:13:06 PM (GMT+7)`

-----------------------------------------------------
-----------------------------------------------------


# 🔥BİLİNMESİ GEREKEN HATA KODLARI🔥

`0xC004C008` ve `0xC004C020`
CID kodu alınarak telefon etkinleştirmesi ile aktivasyon yapmak mümkündür.

`0xC004C004`
Sahte ürün anahtarıdır ve kullanılamaz.

`0xC004C060` ve `0xC004C003`
Geçerli ürün anahtarı değildir ve kullanılamaz.



# 🔥CID kodunu nasıl alabilirim?🔥

Microsoft'u ücretsiz arayarak alabilirsiniz. Ücretsiz Microsoft hattı: 0(800) 211 3939

![image](https://user-images.githubusercontent.com/10184695/183290938-b417c79d-cfae-4b4f-9d2a-6186f0ca3745.png)

CID kodunu siteler aracılığıyla da almak mümkün. Aşağıda belirtilen siteler IID kodunu giriğinizde size CID kodunu verecektir.

🚩CID alma siteleri

🔗https://0xc004c008.com ( Username: trogiup24h Password: PHO )

🔗https://khoatoantin.com/cidms ( Username: trogiup24h Password: PHO )

🔗https://doonoi.top/GenCID.aspx

🔗https://pidkey.top/GenCID.aspx

🔗https://pintipin.com/aktivasyon

🔗https://pintiaktivasyon.com

🔗https://microsoft.gointeract.io/interact/index?interaction=1461173234028-3884f8602eccbe259104553afa8415434b4581-05d1&accountId=microsoft&loadFrom=CDN&appkey=196de13c-e946-4531-98f6-2719ec8405ce&Language=English&name=pana&CountryCode=en-US&Click%20To%20Call%20Caller%20Id=+16265860337&startedFromSmsToken=e9dmQhQ&dnis=1&token=UEuUbt

🔗https://getcid.info

🔗https://webact.185.hk
