-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: myblog_db
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_category`
--
use `heroku_8dfe9584dd92401`;

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_category_blog_id_foreign` (`blog_id`),
  KEY `blog_category_category_id_foreign` (`category_id`),
  CONSTRAINT `blog_category_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  CONSTRAINT `blog_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (16,9,3,NULL,NULL),(17,10,6,NULL,NULL),(18,11,7,NULL,NULL),(19,12,5,NULL,NULL),(20,12,8,NULL,NULL),(21,13,6,NULL,NULL);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_user_id_foreign` (`user_id`),
  CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (9,'13 Rukun Salat yang Wajib Dipenuhi saat Salat','13-rukun-salat-yang-wajib-dipenuhi-saat-salat','images/blogs/B3p7w6Ay7qiFK78vrqeK8W3pBbBTfQEOqNMkGJbf.jpg',2,'ACCEPTED','2021-01-08 00:53:40','2021-01-08 01:04:33','<p>Rukun&nbsp;shalat adalah bacaan dan gerakan yang wajib dilakukan saat menjalankan salat. Terdapat 13 rukun salat yang harus dipenuhi agar ibadah salat diterima diterima di sisi Allah SWT.</p>\r\n\r\n<p>Rukun dapat diartikan sebagai pilar. Sehingga rukun salat adalah pilar-pilar yang membentuk salat secara keseluruhan.</p>\r\n\r\n<p>Jika salah satu rukun salat tidak dipenuhi secara sengaja maka salat dianggap batal dan tidak sah. Jika rukun salat tidak dipenuhi karena lupa atau tidak tahu, maka wajib melakukan rukun yang tertinggal, sujud sahwi&nbsp;atau, mengulang salat kembali.</p>\r\n\r\n<p>Sujud sahwi merupakan sujud pada akhir salat yang dilakukan saat meninggalkan&nbsp;salah satu rukun salat karena lupa.</p>\r\n\r\n<h2><strong>Berikut 13 rukun salat yang wajib dipenuhi saat salat</strong>.</h2>\r\n\r\n<p><strong>1. Berdiri bagi yang mampu</strong></p>\r\n\r\n<p>Rukun pertama adalah salat dengan berdiri bagi yang mampu. Islam memberikan keringanan untuk salat dengan duduk atau tidur jika tidak mampu berdiri.</p>\r\n\r\n<p><strong>2. Niat</strong></p>\r\n\r\n<p>Niatkan melakukan salat hanya karena Allah SWT. Niat juga bisa dibaca secara lisan berdasarkan bacaan niat yang ada. Bacaan niat umumnya mencakup nama salat yang dikerjakan, jumlah rakaat, dan melakukannya karena Allah SWT.</p>\r\n\r\n<p><strong>3.Takbiratul ihram</strong></p>\r\n\r\n<p>Takbiratul ihram adalah bacaan takbir Allahu Akbar saat salat.</p>\r\n\r\n<p><strong>4. Membaca surat Al-Fatihah pada setiap rakaat</strong></p>\r\n\r\n<p>Pada setiap rakaat salat, surat Al-Fatihah wajib dibaca pada setiap rakaatnya. Surat atau ayat pendek sunah dibaca setelah membaca Al-Fatihah.</p>\r\n\r\n<p><strong>5. Rukuk dan tuma&#39;ninah</strong></p>\r\n\r\n<p>Setelah itu, rukuk wajib dilakukan dengan tuma&#39;ninah atau tidak tergesa-gesa. Rukuk adalah gerakan membungkukkan badan dengan kedua tangan berada di lutut.</p>\r\n\r\n<p><strong>6. Iktidal dan tuma&#39;ninah</strong></p>\r\n\r\n<p>Setelah rukuk, tegakkan badan untuk beriktidal dengan tuma&#39;ninah, sebelum melakukan sujud.</p>\r\n\r\n<p><strong>7. Sujud dengan tuma&#39;ninah</strong></p>\r\n\r\n<p>Setelah iktidal, lakukan sujud dengan tuma&#39;ninah. Terdapat dua kali sujud yang dihubungkan dengan duduk di antara dua sujud.</p>\r\n\r\n<p><strong>8. Duduk di antara dua sujud</strong></p>\r\n\r\n<p>Pada setiap rakaat setelah sujud pertama, harus melakukan duduk di antara dua sujud sebelum sujud yang kedua. Duduk di antara dua sujud juga dilakukan dengan tuma&#39;ninah.</p>\r\n\r\n<p><strong>9. Duduk tasyahud akhir</strong></p>\r\n\r\n<p>Di rakaat terakhir salat, setiap orang harus melakukan duduk tasyahud akhir sebelum salam.</p>\r\n\r\n<p><strong>10. Membaca tasyahud akhir</strong></p>\r\n\r\n<p>Saat gerakan duduk tasyahud akhir, maka wajib membaca bacaan tasyahud akhir.</p>\r\n\r\n<p><strong>11. Membaca salawat nabi</strong></p>\r\n\r\n<p>Saat tasyahud akhir wajib membaca salawat yang dikirimkan kepada Nabi Muhammad dan Nabi Ibrahim serta keluarganya.</p>\r\n\r\n<p><strong>12. Salam</strong></p>\r\n\r\n<p>Setelah itu, baca salam dengan menggerakkan kepala ke kanan dan ke kiri.</p>\r\n\r\n<p><strong>13. Tertib</strong></p>\r\n\r\n<p>Tertib adalah rukun ke-13 atau yang terakhir. Tertib berarti berarti melakukan salat atau semua rukun salat dengan beraturan.</p>\r\n\r\n<p>Penuhi 13 rukun salat ini agar salat bernilai ibadah di sisi Allah SWT.</p>',NULL),(10,'Syarat Wajib dan Rukun Puasa Ramadhan Serta Bacaan Niat Berpuasa','syarat-wajib-dan-rukun-puasa-ramadhan-serta-bacaan-niat-berpuasa','images/blogs/6R9nvAgG4AC9EVYt7p06F9DLJqn9l9gTdmG9GzfL.jpg',2,'ACCEPTED','2021-01-08 01:18:54','2021-01-08 01:26:31','<p>Setiap ibadah dalam agama Islam, termasuk puasa Ramadhan, dianggap sah jika sudah terpenuhi syarat dan rukunnya. Puasa Ramadan memiliki lima syarat wajib dan dua rukun yang harus tuntas dipenuhi untuk dapat dianggap sah.<br />\r\nKewajiban puasa merupakan salah satu dari rukun Islam yang wajib ditunaikan setiap muslim dan muslimah yang telah memenuhi syarat.<br />\r\nPerintah puasa termaktub dalam surat Al-Baqarah ayat 183 yang artinya: &quot;Hai orang-orang yang beriman, diwajibkan atas kamu berpuasa sebagaimana diwajibkan atas orang-orang sebelum kamu agar kamu bertakwa.&quot;<br />\r\nSelain itu, puasa juga termasuk ibadah dengan keutamaan yang istimewa. Dalam salah satu hadis qudsi diterangkan, bahwa setiap amal kebaikan manusia akan dilipatgandakan dengan 10 kebaikan yang semisal hingga 700 kali lipat, kecuali amal puasa. Allah berfirman, &quot;Puasa tersebut untuk-Ku dan Aku sendiri yang akan membalasnya karena ia telah meninggalkan syahwat dan makanannya demi Aku,&quot; (HR. Muslim).</p>\r\n\r\n<p><strong>Syarat Wajib Puasa Ramadhan</strong></p>\r\n\r\n<p>Syarat wajib adalah ketentuan yang mesti dipenuhi seorang muslim sebelum melaksanakan suatu ibadah. Orang yang belum memenuhi syarat wajib puasa, maka kewajiban puasanya gugur dan ia tidak diharuskan menjalankan puasa.<br />\r\nAgus Arifin dalam buku&nbsp;<em>Step By Step Fiqih Puasa</em>&nbsp;(2013: 87-88) menuliskan beberapa syarat wajib puasa sebagai berikut:<br />\r\n1. Bertatus muslim<br />\r\nKarena puasa termasuk rukun Islam, hanya orang muslim dan muslimah yang wajib menunaikan ibadah puasa. Jika seseorang murtad, keluar dari Islam, kewajiban puasa baginya gugur dan ia tidak memenuhi syarat wajib puasa.<br />\r\nSyarat keislaman ini dijelaskan dalam hadis yang diriwayatkan dari Abdullah bin &#39;Umar bin Khattab Ra yang berkata: saya mendengar Rasulullah Saw. bersabda: &quot;Islam didirikan dengan 5 hal, yaitu persaksian tiada Tuhan selain Allah SWT dan Muhammad adalah utusan-Nya, didirikannya sholat, dikeluarkannya zakat, dikerjakannya haji di Baitullah [Ka&rsquo;bah], dan dikerjakannya puasa di bulan Ramadan,&rdquo; (HR. Bukhari dan Muslim).<br />\r\n2. Balig atau mencapai masa pubertas<br />\r\nSyarat wajib puasa yang kedua ialah telah mencapai status balig atau pubertas. Bagi laki-laki, ia ditandai dengan keluarnya sperma dari kemaluannya, baik dalam keadaan tidur ataupun terjaga. Sementara itu, bagi perempuan, status balig ditandai dengan menstruasi.<br />\r\nDalam uraian &quot;<a href=\"https://islam.nu.or.id/post/read/45696/syarat-wajib-dan-rukun-puasa-ramadhan\" rel=\"noopener\" target=\"_blank\">Syarat Wajib dan Rukun Puasa Ramadhan</a>&quot; yang ditulis Ustaz Syaifullah Amin di NU Online, syarat keluar mani pada laki-laki dan haid pada perempuan ada di batas usia minimal 9 tahun. Di sisi lain, bagi laki-laki dan perempuan yang belum keluar sperma dan belum menstruasi, batas minimal dikatakan balig jatuh pada usia 15 tahun dari usia kelahiran.<br />\r\n3. Berakal sehat<br />\r\nSyarat wajib puasa yang ketiga bagi seorang muslim dan balig, adalah ia harus memiliki akal yang sehat, sempurna, dan tidak gila. Selain itu, ia juga tidak mengalami gangguan mental dan tidak hilang kesadarannya karena mabuk.<br />\r\nSeorang muslim yang mabuk tidak terkena hukum kewajiban menjalankan ibadah puasa. Namun, terdapat pengecualian pada orang mabuk dengan sengaja, misalnya karena konsumsi minuman keras. Jika sengaja mabuk, ia wajib mengganti (qadha) puasanya di hari selain bulan Ramadan.<br />\r\nSyarat kebalig-an dan akal sehat ini bersandar pada sabda Nabi Muhammad SAW: &quot;Tiga golongan yang tidak terkena hukum syar&rsquo;i: orang yang tidur sapai ia terbangun, orang yang gila sampai ia sembuh, dan anak-anak sampai ia baligh,&rdquo; (HR. Abu Dawud dan Ahmad).<br />\r\n4. Kemampuan menunaikan puasa<br />\r\nSetelah terpenuhi tiga syarat wajib di atas, yang keempat ialah kemampuan menjalankan ibadah puasa. Jika seorang muslim tidak mampu menjalankan puasa karena sebab tertentu, ia diwajibkan mengganti di bulan berikutnya atau membayar fidyah.<br />\r\nKetidakmampuan berpuasa ini bisa terjadi karena perjalanan yang memberatkan (musafir), sakit, hamil dan menyusui, dan berusia sangat tua atau sudah renta.<br />\r\n5. Mengetahui awal Ramadan<br />\r\nSyarat wajib yang terakhir adalah mengetahui awal Ramadan dan hari pertama puasa hingga sebulan penuh. Untuk menetapkan pengetahuan mengenai awal Ramadan, dapat bersumber pada salah seorang terpercaya atau adil yang mengetahui awal bulan Ramadan dengan melihat hilal.<br />\r\nOrang tersebut dipercaya karena melihat hilal secara langsung dengan mata biasa tanpa peralatan bantu. Kemudian, kesaksian orang itu dapat dipercaya, dengan terlebih dulu diambil sumpahnya. Setelah mengetahui kesaksian itu, umat Islam di satu wilayah wajib menunaikan puasa Ramadan.<br />\r\nDi Indonesia, ketetapan awal Ramadan dapat bersandar kepada sidang isbat atau penentuan awal puasa yang digelar Kementerian Agama (Kemenag). Sidang isbat biasanya menentukan posisi hilal dari Tim Falakiyah oleh Kementerian Agama.<br />\r\nJikalau hilal tidak dapat dilihat karena tebalnya awan, untuk menentukan awal bulan Ramadan bisa dengan menyempurnakan hitungan tanggal bulan Sya&rsquo;ban menjadi 30 hari.<br />\r\nRujukannya adalah hadis Nabi Muhammad SAW: &ldquo;Berpuasa dan berbukalah karena melihat hilal, dan apabila hilal tertutup awan maka sempurnakanlah hitungannya bulan menjadi 30 hari.&rdquo; (HR. Bukhari).<br />\r\nMeskipun demikian, sebagian ulama berpendapat penentuan awal Ramadhan bisa dilakukan tanpa metode rukyatul hilal (melihat bulan), yang dengan cara hisab. Hisab adalah metode perhitungan secara matematis dan astronomis untuk menentukan posisi bulan pada awal kalender hijriyah, termasuk bulan Ramadhan.</p>\r\n\r\n<p><strong>Rukun Puasa Ramadhan</strong></p>\r\n\r\n<p>Setelah terpenuhinya syarat wajib, orang yang menjalankan ibadah puasa harus memenuhi rukun puasa agar ibadahnya sah dan diterima Allah SWT. Dilansir dari&nbsp;<a href=\"http://islam.nu.or.id/post/read/45696/syarat-wajib-dan-rukun-puasa-ramadhan\" rel=\"noopener\" target=\"_blank\"><em>NU Online</em></a>, rukun puasa hanya ada dua.<br />\r\n1. Niat puasa<br />\r\nNiat adalah penegasan status fardu dari ibadah puasa Ramadhan. Hal ini menunjukkan kejelasan adanya ibadah, bukan hanya sekadar kehendak menunaikannya. Menurut ulama Mazhab Syafi&#39;i, setiap orang yang hendak berpuasa disunahkan untuk melafalkan bacaan niatnya.<br />\r\nBacaan niat puasa Ramadan adalah sebagai berikut:</p>\r\n\r\n<p><br />\r\nنَوَيْتُ صَوْمَ غَدٍ عَنْ أَدَاءِ فَرْضِ شَهْرِ رَمَضَانِ هذِهِ السَّنَةِ لِلهِ تَعَالَى</p>\r\n\r\n<p>Bacaan latinnya:&nbsp;<em>&quot;Nawaitu sauma ghadin an&#39;adai fardi syahri ramadhani hadzihisanati lillahita&#39;ala&quot;</em><br />\r\n<br />\r\nArtinya: &quot;Saya niat berpuasa esok hari untuk menunaikan fardhu di bulan Ramadan tahun ini, karena Allah Ta&#39;ala.&quot;<br />\r\n<br />\r\n2. Menahan diri dari pembatal-pembatal puasa<br />\r\nRukun kedua dalam ibadah puasa sebagaimana definisinya, yakni menahan diri dari segala&nbsp;<a href=\"https://tirto.id/hal-hal-yang-membatalkan-puasa-ramadhan-dan-dalilnya-e57W\" rel=\"noopener\" target=\"_blank\">hal yang dapat membatalkan</a>&nbsp;sejak terbit fajar (waktu subuh) hingga terbenamnya matahari (waktu magrib) dengan niat karena Allah SWT.<br />\r\nTerdapat beberapa hal yang membatalkan puasa, seperti makan-minum, hubungan suami-istri di siang hari, muntah disengaja, keluar mani disengaja, haid, nifas, serta murtad keluar dari Islam.</p>',NULL),(11,'5 Rukun Islam dan Penjelasannya yang Wajib Diketahui Umat Muslim','5-rukun-islam-dan-penjelasannya-yang-wajib-diketahui-umat-muslim','images/blogs/NgoSqYqH08QClaynxraD6M5b5LiRQVHRGCEae24V.jpg',2,'ACCEPTED','2021-01-08 01:35:20','2021-01-08 01:38:58','<p>Sebagai umat muslim, kita harus tahu apa saja rukun Islam. Ada 5 amalan, berikut penjelasannya!<br />\r\nRukun Islam adalah lima tindakan dasar dalam Islam yang dianggap sebagai pondasi wajib bagi orang-orang beriman.<br />\r\nAda satu hadist yang secara khusus menerangkan tentang 5 rukun Islam yaitu sabda Rasulullah Shallahu&#39;alaihimwasallam.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>بُنِيَ الْإِسْلَامُ عَلَى خَمْسٍ : شَهَادَةِ أَنْ لَا إِلهَ إِلَّا اللهُ وَ أَنَّ مُحَمَّدًا رَسُوْلُ اللهِ ، وَ إِقَامِ الصَّلَاةِ ، وَ إِيْتَاءِ الزَّكَاةِ ، وَ حَجِّ الْبَيْتِ ، وَ صَوْمِ رَمَضَانَ . رواه البخاري و مسلم .<br />\r\n<br />\r\n&quot;Islam dibangun di atas lima perkara: persaksian bahwa tiada tuhan yang berhak disembah kecuali Allah dan Muhammad adalah utusan Allah, mendirikan shalat, menunaikan zakat, pergi haji, dan puasa di bulan Ramadhan&#39;&quot;. (HR. Al-Bukhari dan Muslim)<br />\r\n<br />\r\nBerikut 5 urutan rukun Islam dan penjelasannya:<br />\r\n<br />\r\n1. Mengucapkan Dua Kalimat Syahadat<br />\r\nRukun Islam yang pertama adalah mengucapkan dua kalimat syahadat wajib hukumnya bagi seseorang yang ingin menjadi muslim.<br />\r\nKalimat syahadat dalam bahasa Arab:<br />\r\n<br />\r\nأَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُوْلُ اللهِ<br />\r\n<br />\r\nKalimat syahadat dalam bahsa latin:<br />\r\n<br />\r\n&quot;Asy-hadu allaa ilaaha illallaahu wa asy-hadu anna muhammadarrasuulullahi&quot;.<br />\r\n<br />\r\nArti kalimat syahadat:<br />\r\n<br />\r\n&quot;Aku bersaksi tidak ada sesembahan yang berhak disembah kecuali Allah dan aku bersaksi bahwa Nabi Muhammad adalah utusan Allah&quot;.<br />\r\n<br />\r\nDi dalam dua kalimat syahadat tersebut yang patut disembah hanyalah Allah, tidak ada yang lain. Dan tidak ada Tuhan selain Allah dan Allah yang menguasai seluruh isi alam semesta.<br />\r\n<br />\r\n2. Mendirikan Salat<br />\r\nSetelah menjadi seorang muslim tentu harus mengejarkan rukun Islam yang kedua. Salat wajib disebut juga sebagai salat 5 waktu.<br />\r\nSalat 5 waktu terdiri dari:<br />\r\n- Salat Subuh<br />\r\nSalat yang dikerjakan sebelum terbitnya fajar (antara jam 04.00). Salat ini berjumlah 2 raka&#39;at.<br />\r\n<br />\r\n- Salat Dzuhur<br />\r\nSalat yang dikerjakan siang hari (sekitar pukul 12.00) dan berjumlah 4 raka&#39;at.<br />\r\n<br />\r\n- Salat Ashar<br />\r\nSalat yang dikerjakan sore hari (sekitar jam 15.30) dengan jumlah 4 raka&#39;at.<br />\r\n<br />\r\n- Salat Maghrib<br />\r\nSalat yang dikerjakan saat matahari terbenam sampai masuk waktu Isya. Raka&#39;atnya ada 3.<br />\r\n<br />\r\n- Salat Isya<br />\r\nSalat yang dikerjakan sekitar pukul 19.00 dengan jumlah 4 raka&#39;at.</p>\r\n\r\n<p>3. Berpuasa di Bulan Ramadhan<br />\r\nSetiap muslim diwajibkan berpuasa selama satu bulan penuh di bulan Ramadhan. Tujuannya untuk mencapai ketakwaan kepada Allah SWT.<br />\r\nDi antara hikmah berpuasa adalah melatih kesabaran, menumbuhkan rasa empati terhadap orang yang kelaparan sehingga terdorong hati kita untuk membantu orang yang kurang mampu.<br />\r\n<br />\r\n4. Menunaikan Zakat<br />\r\nZakat merupakan kewajiban yang dikeluarkan pada harta orang yang memiliki kelebihan. Ada beberapa jenis zakat yaitu zakat fitrah yang dikeluarkan pada bulan Ramadan, ada juga zakat mal yaitu zakat yang dikeluarkan berdasarkan hasil niaga atau penghasilan.</p>\r\n\r\n<p>Jumlah zakat fitrah yang wajib diserahkan 2,5 kg atau bisa diganti dengan uang yang setara dengan 2,5 kg beras.<br />\r\nDan untuk zakat Mal bisa memperkirakannya dengan menyerahkan 2,5 persen dari harta yang diperolah dari penghasilan kita.<br />\r\nAllah berfirman dalam surat Al Baqarah ayat 43:<br />\r\n<br />\r\nوَ اَقِیۡمُوا الصَّلٰوۃَ وَ اٰتُوا الزَّکٰوۃَ وَ ارۡکَعُوۡا مَعَ الرّٰکِعِیۡنَ<br />\r\n<br />\r\nArtinya:<br />\r\n&quot;Dan dirikanlah shalat, serta tunaikkan zakat, dan ruku&#39;lah bersama dengan orang-orang yang ruku&quot;.<br />\r\n<br />\r\n5. Pergi Haji (Bagi yang Mampu)<br />\r\nPergi Haji ke Mekkah adalah kewajiban umat muslim yang mampu secara fisik dan finansial. Pergi haji wajibnya dilakukan satu kali seumur hidup.<br />\r\nAllah berfirman dalam surat Ali-Imran: 97:<br />\r\n<br />\r\nوَلِلَّهِ عَلَى النَّاسِ حِجُّ الْبَيْتِ مَنِ اسْتَطَاعَ إِلَيْهِ سَبِيلًا ۚ وَمَن كَفَرَ فَإِنَّ اللَّهَ غَنِيٌّ عَنِ الْعَالَمِينَ<br />\r\n<br />\r\n&quot;...mengerjakan haji adalah kewajiban manusia terhadap Allah, yaitu (bagi) orang yang sanggup mengadakan perjalanan ke Baitullah. Barangsiapa mengingkari (kewajiban haji), maka sesungguhnya Allah Maha Kaya (tidak memerlukan sesuatu) dari semesta alam.&quot; (QS. Ali-Imran: 97)</p>',NULL),(12,'10 Manfaat Wudhu Bagi Kesehatan, Baik untuk Jantung dan Cegah Kanker','10-manfaat-wudhu-bagi-kesehatan-baik-untuk-jantung-dan-cegah-kanker','images/blogs/bFnkwK9wn4tflnmDHccMn44ScDIPScCl4iY5ZcQq.jpg',2,'ACCEPTED','2021-01-08 01:48:17','2021-01-08 01:50:11','<p>Sebelum mengerjakan salat, umat Islam harus&nbsp;<a href=\"https://www.merdeka.com/trending/tata-cara-wudhu-yang-benar-sesuai-syariat-islam-kln.html\">wudhu</a>&nbsp;terlebih dahulu.&nbsp;<a href=\"https://www.merdeka.com/trending/tata-cara-wudhu-yang-benar-sesuai-syariat-islam-kln.html\">Wudhu&nbsp;</a>sebagai bentuk mensucikan diri sebelum berhadapan dengan Allah SWT.</p>\r\n\r\n<p>Sebagian tubuh dibersihkan dengan tata cara khusus. Di sisi lain, wudhu memiliki manfaat bagi kesehatan tubuh. Berikut&nbsp;<a href=\"https://www.liputan6.com/citizen6/read/2256346/5-manfaat-wudhu-yang-perlu-kita-ketahui\">manfaat wudhu bagi kesehatan</a>dikutip dari berbagai sumber:</p>\r\n\r\n<p><strong>Baik untuk Sistem Pencernaan</strong></p>\r\n\r\n<p>Manfaat wudhu bagi kesehatan yang pertama ialah baik untuk sistem pencernaan. Berdasarkan salah seorang ahli kesehatan Jerman, Prof. Dr. Jamieson mengungkapkan bahwa, mencuci badan dan mandi sangat menguntungkan, bukan hanya membersihkan tetapi juga menguatkan kulit dan menyegarkan badan serta merangsang alat-alat pencernaan dalam pertukaran-pertukaran zat.</p>\r\n\r\n<p>Wudhu sebagai bentuk mencuci badan dengan air, terutama bila mampu menjaganya dengan baik.</p>\r\n\r\n<p><strong>Baik untuk Jantung</strong></p>\r\n\r\n<p>Tidak disangka, air wudhu dengan kadar yang tidak banyak untuk membersihkan area-area tubuh tertentu, ternyata bermanfaat juga untuk tubuh bagian dalam.</p>\r\n\r\n<p>Berdasarkan penelitiandokter spesialis penyakit dalam dan penyakit jantung, Dr. Ahmad Syauqy Ibrahim di London menjelaskandengan mencelupkan anggota tubuh ke dalam air akan mengembalikan tubuh yang lemah menjadi kuat. Selain itu mengurangi kekejangan pada saraf dan otot, menormalkan detak jantung, mengatasi kecemasan dan insomnia atau susah tidur.</p>\r\n\r\n<p><strong>Meningkatkan Konsentrasi</strong></p>\r\n\r\n<p>Manfaat wudhu bagi kesehatan selanjutnya sudah pasti mudah ditebak dan dirasakan secara langsung.Para pakar saraf (neurologis) telah membuktikan, air wudhu yang dapat mendinginkan ujung ujung saraf jari-jari tangan dan jari-jari kaki.</p>\r\n\r\n<p>Berguna untuk meningkatkan konsentrasi pikiran dan menjadikan rileks.</p>\r\n\r\n<p><strong>Bantu Perkuat Otot Wajah dan Mencegah Penyakit</strong></p>\r\n\r\n<p>Manfaat wudhu bagi kesehatan berikutnya yakni membantu menguatkan otot wajah. Seperti ketika Anda melakukan gerakan berkumur, pasti membersihkan sela-sela gigi dari sisa makanan dan selaput lendir di mulur. Hal ini baik untuk mencegah berbagai penyakit yang timbul di daerah rongga mulut.<br />\r\n<br />\r\nGerakan berkumur akan menguatkan otot wajah dan menjaga bibir tetap terhidrasi dengan baik, bisa mencegah bibir Anda pecah-pecah. Dari hasil sejumlah riset, wudhu bisa mencegah risiko sejumlah penyakit, seperti kanker, sakit gigi, sakit kepala, rematik, flu, pilek, pegal, dan sebagainya.</p>\r\n\r\n<p><strong>Mencegah Kuman</strong></p>\r\n\r\n<p>Gerakan berkumur dan membersihkan lubang hidung tentunya memberi manfaat wudhu yang berarti. Keduanya akan membantu membersihkan lendir dan mencegah kumat penyebab penyakit. Membersihkan lubang hidung akan mengurangi kotoran pencemaran udara yang terhidup masuk.<br />\r\n<br />\r\nGerakan wudhu membasuh muka dan telapak tangan, baik untuk menghilangkan debu dan mikroba tak terlihat.</p>\r\n\r\n<p><strong>Menjaga Kesehatan Pusat Syarat Tubuh</strong></p>\r\n\r\n<p>Manfaat wudhu bagi kesehatan begitu menakjubkan, seperti mampu menjaga kesehatan pada pusat saraf manusia. Hal ini diperkuat dari berbagai penelitian oleh para pakar ahli.</p>\r\n\r\n<p>Pusat-pusat saraf yang paling peka dari tubuh manusia berada di dahi, tangan, dan kaki. Pusat-pusat saraf tersebut sangat sensitif terhadap air segar.<br />\r\n<br />\r\nSehingga dengan senantiasa membasuh air segar (wudhu) ke pusat saraf tersebut, berarti senantiasa menjaga dan memelihara kesehatan, serta keselarasan pusat saraf. Hasil riset tentang wudhu yang dilakukan oleh Leopold Wemer Von Enrenfels, seorang psikiater dan neurology dari Austria.</p>\r\n\r\n<p><strong>Mencegah Kanker Kulit</strong></p>\r\n\r\n<p>Manfaat wudhu bagi kesehatan selanjutnya ialah mencegah kanker kulit. Penelitian mengenai wudhu yang dilakukan oleh Mokhtar Salem, menemukan bahwa wudhu bisa mencegah kanker kulit.<br />\r\n<br />\r\nKanker kulit lebih disebabkan karena bahan-bahan kimia yang setiap hari menempel dan meresap ke pori-pori. Sehingga dengan Anda berwudhu, pasti akan membersihkan bahan kimia yang dilarutkan terbuang bersama air.</p>\r\n\r\n<p><strong>Meremajakan Kulit</strong></p>\r\n\r\n<p>Masih berasal dari penelitian yang sama, Anda bisa mendapatkan manfaat wudhu bagi kesehatan yang luar biasa. Wudhu juga membuat seseorang jadi awet muda, karena air yang membasuh wajah ketika berwudhu dapat meremajakan sel-sel kulit wajah, serta membantu mencegah penuaan dini.<br />\r\n<br />\r\n<strong>Menjaga Tekanan Darah</strong><br />\r\n<br />\r\nSeperti yang telah disebutkan sebelumnya, bahwa gerakan wudhu baik untuk meredakan sakit kepala. Berwudhu dengan mengusap sebagian rambut dan kepala, juga sangat baik dalam menjaga tekanan darah, karena membantu melancarkan aliran darah yang memberi kesegaran.</p>\r\n\r\n<p><strong>Mencegah Jamur Kulit di Kaki</strong></p>\r\n\r\n<p>Biasanya sakit jamur timbul di bagian kulit kaki yang terinfeksi oleh jamur tertentu. Berwudhu dengan membasuh kedua kaki sangat baik untuk menyehatkan saraf dan otot kaki yang tegang untuk kembali rileks. Serta sangat penting untuk menyingkirkan kotoran, bau kaki, mencegah jamur, dan kotoran di area kuku.</p>\r\n\r\n<p>Layaknya semboyan dalam Islam,&nbsp;<em>kebersihan sebagian dari iman</em>. Allah SWT sangat mencintai kebersihan. Nikmat akan kita dapatkan di dunia dan di akhirat. Rasulullah SAW akan mengenali umatnya pada hari kiamat. Beliau mengatakan,<br />\r\n<br />\r\n&quot;<em>Umatku nanti kelak pada hari kiamat bercahaya muka dan kakinya karena bekas wudhu</em>&quot;.</p>',NULL),(13,'9 Hal Utama yang Membatalkan Puasa','9-hal-utama-yang-membatalkan-puasa','images/blogs/AFKf1QUEdazkmv5GgKz4ntgd5vdUUXby6IKocqxw.jpg',2,'ACCEPTED','2021-01-08 02:00:03','2021-01-08 02:00:14','<p>Bulan Ramadhan merupakan bulan yang suci bagi umat Muslim yang mampu. Pada bulan ini, setiap kegiatan ibadah manusia akan dilipatgandakan. Ketika menjalani puasa, umat Islam diwajibkan untuk menahan lapar, haus, dan hawa nafsu dari terbitnya fajar subuh hingga terbenamnya matahari atau waktu maghrib. Agar puasa dapat berjalan dengan lancar, penting mengetahui beberapa hal utama yang membatalkan puasa adalah sebuah keharusan.</p>\r\n\r\n<p>Berikut 9 hal yang dapat membatalkan puasa, dikutip dari at-Tadzhib fi Adillati Matan al-Ghayati wa at-Taqrib karya Dr Mushatafa Dib al-Baga:</p>\r\n\r\n<p><strong>1. Masuknya sesuatu ke dalam lubang tubuh secara sengaja </strong></p>\r\n\r\n<p>Tak hanya mulut, memasukkan benda-benda tertentu ke dalam lubang tubuh yang berpangkal pada organ bagian dalam (jauf) secara sengaja juga dapat membatalkan puasa. Yang dimaksud lubang yang berpangkal pada organ dalam adalah mulut, telinga, dan hidung dengan batas awal masing-masing. Dalam mulut batas awalnya adalah tenggorokan, hidung batas awalnya adalah pangkal insang, dan telinga batasannya adalah bagian yang terlihat oleh mata. Artinya, jika benda yang masuk ke dalam lubang tersebut belum melewati batas awalnya, maka puasa masih tetap sah.</p>\r\n\r\n<p><strong>2. Memasukkan benda ke dalam salah satu jalan </strong></p>\r\n\r\n<p>Yang dimaksud &quot;jalan&quot; pada konteks ini adalah kemaluan dan dubur. Jika benda yang masuk ke dalam salah satu lubang itu maka akan membatalkan puasa, seperti memasukkan obat ambeien ke dalam dubur. Oleh karena itu, sebaiknya melakukan hal itu setelah berbuka puasa atau saat sahur.</p>\r\n\r\n<p><strong>3. Muntah secara disengaja </strong></p>\r\n\r\n<p>Dalam hal ini, muntah secara disengaja bisa dimaknai seperti memasukkan sesuatu ke dalam tenggorokan hingga muntah. Jika tidak disengaja, maka puasa tetap sah, seperti dalam hadis berikut: Rasulullah bersabda: &quot;Barangsiapa dikalahkan oleh muntah maka tidak ada qadha&#39; baginya. Barangsiapa muntah dengan sengaja, maka hendaknya ia meng-qadha&#39;nya,&quot; (HR Abu Dawud, Turmudzi, Ibnu Majah, Baihaqi dan al-Hakim dari Abu Hurairah).</p>\r\n\r\n<p><strong>4. Berhubungan seks secara sengaja </strong></p>\r\n\r\n<p>Berhubungan badan pada siang hari bulan Ramadhan akan membatalkan puasa. Selain berkewajiban mengganti puasa, ada juga denda atau kafarat yang harus dibayarkarkan. Denda tersebut berupa memerdekakan hamba sahaya perempuan yang beriman. Jika tak mampu, maka diperbolehkan mengganti dengan puasa selama dua bulan secara berturut-turut. Jika masih tak mampu, maka harus memberi makan kepada 60 orang miskin, masing-masing sebanyak satu mud atau sekitar sepertiga liter.</p>\r\n\r\n<p><strong>5. Keluar mani </strong></p>\r\n\r\n<p>Dalam konteks ini, keluar mani yang dimaksud adalah akibat dari persentuhan kulit, misal bersentuhan dengan lawan jenis dan onani. Namun, apabila keluar mani karena ihtilam atau mimpi basah, maka status puasanya tetap sah.</p>\r\n\r\n<p><strong>6. Haid atau menstruasi</strong></p>\r\n\r\n<p>Haid atau menstruasi merupakan darah yang keluar akibat kerja hormonal dalam tubuh wanita. Jika seorang telah menjalani puasa selama dan keluar darah haid, maka puasanya tidak sah.</p>\r\n\r\n<p><strong>7. Nifas </strong></p>\r\n\r\n<p>Nifas adalah darah yang keluar setelah proses melahirkan. Umumnya, darah nifas keluar selama 40 hari setelah melahirkan.</p>\r\n\r\n<p><strong>8. Gila (junun) </strong></p>\r\n\r\n<p>Jika kondisi itu terjadi ketika sedang menjalani puasa, maka puasa dinyatakan tidak sah atau batal.</p>\r\n\r\n<p><strong>9. Murtad </strong></p>\r\n\r\n<p>Murtad adalah keluar dari Islam. Apabila seseorang murtad ketika menjalani puasa, maka puasanya secara otomatis batal.<br />\r\n<br />\r\n&nbsp;</p>',NULL);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'Sholat','2021-01-07 07:04:16','2021-01-08 00:41:26',NULL),(5,'Kesehatan','2021-01-07 07:05:25','2021-01-07 07:05:25',NULL),(6,'Puasa','2021-01-08 01:15:02','2021-01-08 01:15:02',NULL),(7,'Aqidah','2021-01-08 01:29:54','2021-01-08 01:29:54',NULL),(8,'Bersuci','2021-01-08 01:40:17','2021-01-08 01:40:17',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_12_23_022708_create_blogs_table',1),(5,'2020_12_23_023450_create_transactions_table',1),(6,'2020_12_23_071707_edit_users_table',1),(7,'2021_01_05_035916_create_categories_table',1),(8,'2021_01_05_040001_create_blog_category_table',1),(9,'2021_01_05_115220_update_blogs_table',2),(10,'2021_01_06_104838_softdelete_users',3),(11,'2021_01_06_132332_softdelete_blogs_table',4),(12,'2021_01_06_132633_softdelete_categories_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('sun_three_nakal@yahoo.com','$2y$10$12OGEWiHwTSeZxWF7.mZKO6wrhsi.H53vvROXcIN9wx2EhlnZi.fC','2021-01-07 20:18:55');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `blog_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_transactions_user_id_foreign` (`user_id`),
  KEY `blog_transactions_blog_id_foreign` (`blog_id`),
  CONSTRAINT `blog_transactions_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  CONSTRAINT `blog_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (22,2,9,'2021-01-08 01:01:03','2021-01-08 01:01:03'),(23,2,9,'2021-01-08 01:02:30','2021-01-08 01:02:30'),(24,2,9,'2021-01-08 01:04:38','2021-01-08 01:04:38'),(25,2,10,'2021-01-08 01:20:27','2021-01-08 01:20:27'),(26,2,10,'2021-01-08 01:26:44','2021-01-08 01:26:44'),(27,2,10,'2021-01-08 01:28:29','2021-01-08 01:28:29'),(28,2,11,'2021-01-08 01:38:09','2021-01-08 01:38:09'),(29,2,13,'2021-01-08 02:00:22','2021-01-08 02:00:22'),(30,4,13,'2021-01-08 02:00:54','2021-01-08 02:00:54'),(31,2,13,'2021-01-08 02:06:19','2021-01-08 02:06:19'),(32,2,12,'2021-01-08 02:06:48','2021-01-08 02:06:48'),(34,2,13,'2021-02-03 19:14:40','2021-02-03 19:14:40'),(35,2,13,'2021-02-03 19:15:51','2021-02-03 19:15:51');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENULIS',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mabrur','mabrur@gmail.com',NULL,'12345678','mabrur','mabru.jpg','mabrur',NULL,NULL,'2021-01-06 04:09:57','ADMIN','2021-01-06 04:09:57'),(2,'Mabrur','admin@gmail.com',NULL,'$2y$10$5aPwUTi86BFWhTHURf7/fuiTvQ7pHwzyPgE8hbu0zzJvtoUEOKv/m','mabrur','images/users/NVBtAjd95xRBH8kTlGFuBxP9H04D5g3wNgylsu54.jpg','<p>ksjdfkdsf</p>',NULL,'2021-01-05 06:39:52','2021-02-03 19:16:51','ADMIN',NULL),(3,'Mabrur Cirebon','sun_three_nakal@yahoo.com',NULL,'$2y$10$cDDrIH5PpDIkCX438NxHMuhXlEzfG7PYBekDStPBrMETCtbelbzdC','mabrurcirebon','images/users/5RWdNWOwqAYvhgRQ4S1jh0NrfVag7D9gzlQwSo1p.jpg','<p>saya adalah mabrur dari cirebon</p>',NULL,'2021-01-06 09:09:53','2021-01-06 09:09:53','PENULIS',NULL),(4,'Unknown','unknown@gmail.com',NULL,'$2y$10$S8YstHlhF1buReVR9qjfyuqQOA.jPgmVU4BxQioVD3.2nYOsbP9q6','unknwon','images/users/default-user.png','<p>unknown</p>',NULL,'2021-01-06 20:51:17','2021-01-06 20:51:17','PENULIS',NULL),(5,'adminn','adminn@gmail.com',NULL,'$2y$10$xXPjTbyzNzcuX3XLqXuvSeajf/GPC5jO5whBC8WAmqR5rK3.7CB4W','adminn',NULL,NULL,NULL,'2021-01-20 23:43:36','2021-01-20 23:43:36','PENULIS',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-01 11:41:32
