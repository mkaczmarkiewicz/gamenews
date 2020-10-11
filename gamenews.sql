-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Lut 2020, 17:55
-- Wersja serwera: 10.4.8-MariaDB
-- Wersja PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `gamenews`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comment`
--

CREATE TABLE `comment` (
  `id` int(255) NOT NULL,
  `idParent` int(255) NOT NULL,
  `content` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `idUser` int(255) NOT NULL,
  `idPost` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `comment`
--

INSERT INTO `comment` (`id`, `idParent`, `content`, `idUser`, `idPost`, `date`) VALUES
(33, 0, 'Liczyłem na coś znacznie lepszego', 13, 48, '2020-02-23 15:20:54'),
(34, 33, 'Chyba wszyscy jesteśmy rozczarowani', 16, 48, '2020-02-23 15:21:24'),
(35, 0, 'Warcraft 3 to Warcraft 3, nadal bawi, ale mogło być lepiej', 18, 48, '2020-02-23 15:22:26'),
(60, 0, 'Ja właśnie przechodzę drugi raz - bawi tak samo jak za pierwszym :)', 13, 46, '2020-02-24 16:29:00'),
(62, 0, 'Czekam z niecierpliwością! ', 13, 44, '2020-02-24 16:34:15'),
(63, 0, 'Szkoda, że nie na Steam...', 13, 39, '2020-02-24 16:34:34'),
(64, 0, 'A gdzie bohaterowie Metra?', 13, 41, '2020-02-24 16:35:07'),
(65, 0, 'Nic tylko pogratulować naszym rodakom. Gra jest świetna, nic dziwnego że się sprzedaje', 12, 46, '2020-02-24 16:35:57'),
(66, 0, 'Wreszcie coś sensownego na Switcha, powoli zaczynam tracić wiarę w tą konsolę', 12, 36, '2020-02-24 16:36:22'),
(67, 0, 'Robią wszystko żeby nakłonić graczy do przejścia ze Steama, zobaczymy czy im się uda', 12, 43, '2020-02-24 16:37:15'),
(68, 67, 'Mnie przekonali. Może nie do pełnego przejścia, ale egs mam i regularnie z niego korzystam', 14, 43, '2020-02-24 16:37:59'),
(69, 65, 'Ciekawe czy Cyberpunk odniesie podobny sukces', 14, 46, '2020-02-24 16:38:53'),
(70, 0, 'Czego to ludzie nie wymyślą', 14, 42, '2020-02-24 16:39:22'),
(71, 0, 'Do kompletu brakuje tylko Skyrima', 14, 40, '2020-02-24 16:39:50'),
(72, 60, 'W którą ze zbroi warto inwestować? Nie chce mi się biegać za wszystkimi', 19, 46, '2020-02-24 16:40:33');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `id` int(255) NOT NULL,
  `type` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `intro` text COLLATE utf8_polish_ci NOT NULL,
  `content` text COLLATE utf8_polish_ci NOT NULL,
  `idUser` int(255) NOT NULL,
  `date` date NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`id`, `type`, `title`, `intro`, `content`, `idUser`, `date`, `thumbnail`) VALUES
(32, 'article', 'Marki które powinny zostać wskrzeszone na next-genach', '<p>Nadchodząca generacja konsol bez wątpienia przyniesienie wiele świetnych produkcji. Miejmy nadzieję, że znajdzie się wśr&oacute;d nich kilka takich, kt&oacute;re &quot;powr&oacute;cą do żywych&quot;.</p>\r\n', '<h4><strong>Grand Theft Auto</strong></h4>\r\n\r\n<p><strong>Wydaje mi się, że w tym akapicie nie muszę pisać absolutnie nic</strong>. Pokuszę się o stwierdzenie, że GTA 6 to jedna z najbardziej wyczekiwanych gier bez podziału na konsole i studia. Ludzie prześcigają się w przewidywaniu tego, gdzie osadzona będzie nadchodząca część i wok&oacute;ł czego kręciła się będzie kolejna przygoda.&nbsp;</p>\r\n\r\n<p>Najnowsze informacje m&oacute;wią o biznesie narkotykowym, kartelach i przeniesieniu graczy do&hellip; Vice City. Są to oczywiście zaledwie plotki, jeśli bowiem Rockstar pracuje nad swoim flagowym projektem, to&nbsp;<strong>robi to bardzo potajemnie</strong>. Kto wie, co w rzeczywistości pojawi się w grze, kt&oacute;ra bez wątpienia powalczy o tytuł najlepszej, gdy tylko zadebiutuje?</p>\r\n\r\n<h4><strong>Max Payne</strong></h4>\r\n\r\n<p>Trylogia była dobrą, zamkniętą historią, ale&hellip; Kto nie chciałby nowej odsłony z wykorzystaniem &nbsp;mocy kolejnej generacji?! Chyba wszyscy zgodnie kiwamy głową.&nbsp;<strong>Powr&oacute;t agenta z możliwością spowalniana czasu byłby wielkim wydarzeniem</strong>&nbsp;dla całej branży gier i bez wątpienia ogromną niespodzianką- nie tylko dla fan&oacute;w produkcji od Rockstar.&nbsp;</p>\r\n\r\n<p>C&oacute;ż, warto zaznaczyć, że pomiędzy drugą częścią a trzecią, minęło 9 lat- jeśli chodzi o terminy wydania ich na rynek. Max Payne 3 zadebiutował w 2012 roku, więc&nbsp;<strong>nie należy w stu procentach zakładać, że marka została pogrzebana</strong>. Może zn&oacute;w, dokładnie po takim samym czasie, doczekamy się kontynuacji? Rok 2021 brzmi bardzo pozytywnie!</p>\r\n\r\n<h4><strong>Mass Effect&nbsp;</strong></h4>\r\n\r\n<p>Wydaje mi się, że nadeszła najwyższa pora, aby zakryć rysę na diamencie.&nbsp;<strong>Trylogia Mass Effect to jedne z lepszych tytuł&oacute;w</strong>, w jakie przyszło grać wielu fanom produkcji łączących elementy science fiction oraz RPG. Niestety po genialnych produkcjach przyszła &bdquo;<em><strong>Andromeda</strong></em>&rdquo;, kt&oacute;ra niczym najgorszy meteoryt, uderzyła w słupek określający poziom serii, znacząco go obniżając.&nbsp;</p>\r\n\r\n<p>Piąta część mogłaby pom&oacute;c wr&oacute;cić na prawidłowe tory i na nowo rozkochać w sobie graczy. Co więcej, gdyby chwilę wcześniej&nbsp;<strong>ukazały się odnowione wersje poprzednich wydań</strong>, seria na pewno trafiłaby do nowych fan&oacute;w, kt&oacute;rzy mają problem, aby dziś przedzierać się przez archaiczną już rozgrywkę- szczeg&oacute;lnie zaimplementowaną w debiutanckiej odsłonie.&nbsp;</p>\r\n\r\n<h4><strong>Wiedźmin</strong></h4>\r\n\r\nWiem, że część z Was weszła i liczyła, że ten tytuł pojawi się na liście. Właśnie z tego powodu zachowałem go na sam koniec. Nie oszukujmy się, kontynuacji Wiedźmina nie mogło tu zabraknąć. Jest to gra, która wywołuje nieporównywalny szum w naszym kraju. Śmiem twierdzić, że ogłoszenie o czwartej odsłonie spotkałoby się z największym ruchem w branży gier od… Sam nie wiem kiedy.\r\n\r\nO czym mogłaby traktować kontynuacja? Może pociągnąć historię Geralta? Może tym razem Ciri albo inni Wiedźmini? Nie mam pojęcia, natomiast wiem, że CD Projekt udowodnił już, że nie ma to znaczenia, gra i tak będzie niesamowitym doświadczeniem. Osobiście wierzę, że raz jeszcze dostaniemy kandydata do tytułu najlepszego w generacji.\r\n\r\n<h4><strong>Prototype</strong></h4>\r\n\r\nZarówno pierwsza, jak i druga (choć w mniejszym stopniu) część były świetnymi grami, które, mam wrażenie, wyprzedzały nieco swoje czasy. Satysfakcję, jaka towarzyszyła rozpruwaniu przeciwników, za pomocą super mocy naszych bohaterów, porównać mogę jedynie do tej, jaka pojawia się przy strzelaniu w najnowszej odsłonie Dooma z 2016 roku. \r\n\r\nNiestety ciężko teraz wróżyć przyszłość gry. Pierwotni twórcy, Radical Entertainment, zostali zamknięci. Od ostatniej części minęło osiem lat, a po drodze dostaliśmy zaledwie składankę obu części na nowe konsole. Czy trzecia część może powstać? Wątpliwie, ale nigdy nie można mówić nigdy. Nie takie marki wskrzeszano.', 11, '2020-02-23', 'img/article1.jpg'),
(33, 'news', 'Ubisoft usuwa operatora z Rainbow Six Siege przez bugi', '<p>Ubisoft wycofał z gry Rainbow Six: Siege po raz trzeci operatorkę Clash.</p>\r\n', '<p>Ubisoft po raz kolejny ma problem z błędami, występującymi w popularnej sieciowej strzelance&nbsp;Tom Clancy&#39;s Rainbow Six: Siege. Tym razem bugi występowały podczas korzystania z operatorki Clash, kt&oacute;ra była znana ze swojej potężnej tarczy, kt&oacute;ra pozwalała jej stać się chodzącym murem.&nbsp;</p>\r\n\r\n<p>Clash została usunięta z owej produkcji na czas nieokreślony ze względu na błąd, kt&oacute;ry powstawał w wyniku używania tarczy. Mianowicie, tarcza z założenia Francuz&oacute;w odpowiedzialnych za Six Siege, miała być nieprzenikalna z obu stron - oznacza to, że pociski nie mogły przelatywać przez defensywną broń operatorki. Błąd, kt&oacute;ry udało się odkryć graczom pozwalał na wystrzeliwanie pocisk&oacute;w od strony tzw. &quot;bezpiecznej&quot; - dzięki temu, Clash była, można ją nazwać, mobilną wieżyczką, kt&oacute;ra chroniła towarzyszy mogących przez strzelać przez jej tarczę. Warto wspomnieć, że owa operatorka została ponownie usunięta z Six Siege&#39;a - w wyniku innego błędu, Clash została usunięta z gry kilka miesięcy temu i dopiero przywr&oacute;cona po usunięciu buga - możemy spodziewać się, że tak samo będzie w tym przypadku.</p>\r\n\r\n<p>Przypomnijmy, że Tom Clancy&#39;s Rainbow Six: Siege zadebiutował na rynku 1 grudnia 2015 roku na komputerach osobistych oraz konsolach Xbox One i PlayStation 4.</p>\r\n', 11, '2020-02-23', 'img/news1.jpg'),
(34, 'news', '9 na 10 osób było idealistą w trylogii Mass Effect', '<p>Projektant trylogii Mass Effect oznajmił, że 9 na 10 graczy wolało wykreować swojego Sheparda na idealistę, aniżeli na egoistę.</p>\r\n', '<p>Deweloper, kt&oacute;ry pracował nad trylogią Mass Effect oznajmił, że 92% graczy, mających za sobą kosmiczną przygodę Sheparda, byli idealistami - osobami, kt&oacute;re preferowały załatwić sprawy łagodnie, aniżeli używać pięści.&nbsp; 8% graczy kierowało&nbsp;się egoizmem&nbsp;-&nbsp;załatwiali większość&nbsp;spraw&nbsp;siłą.</p>\r\n\r\n<p>Trzeba przyznać, że podział pomiędzy idealistą, a egoistą został bardzo dobrze wdrożony do serii Mass Effect. Jeśli zachowywaliśmy się poprawnie, pasek idealisty (niebieski) się zwiększał - jeśli natomiast byliśmy agresywni, pasek egoisty&nbsp;(czerwony) wzrastał. W p&oacute;źniejszym czasie miało to znaczenie podczas podejmowania znaczących decyzji - często trzeba było zapełnić ustaloną przez tw&oacute;rc&oacute;w wartość paska, aby użyć danej opcji w dialogu. Zatem, najlepszym wyborem było całkowicie granie idealistą lub egoistą - jeśli natomiast raz byliśmy dobrzy, a innym razem źli, nasze paski wypełniały się dosyć wolno, co często przekładało się na brak możliwości podjęcia jakichkolwiek znaczących decyzji odblokowywanych dopiero po zapełnieniu się danej ilości paska.&nbsp;</p>\r\n\r\n<p>Były pracownik BioWare ujawnił, że dziewięciu na dziesięciu graczy kończyło grę jako idealista. Oznacza to, że ścieżkę egoisty mało kto poznał, o czym m&oacute;wi&nbsp;sam John Ebenger.&nbsp;</p>\r\n\r\n<p>Woleliście kierować się prawością czy egoizmem? Koniecznie dajcie znać.</p>\r\n', 11, '2020-02-23', 'img/news2.jpg'),
(35, 'news', 'Apex Legends - mapa Królewski Kanion wróciła do gry na weekend', '<p>Tw&oacute;rcy Apex Legends oznajmili, że mapa, na kt&oacute;rej wszystko się zaczęło, powraca do gry na weekend.</p>\r\n', '<p>Można rzec, że Apex Legends powraca do korzeni, bowiem od wczoraj można grać na mapie, kt&oacute;rą z pewnością zna każdy fan owego battle royale&#39;a - mowa tutaj o Kr&oacute;lewskim Kanonie, na kt&oacute;rym wychowało się większość os&oacute;b grających w produkcję od ambitnego studia Respawn Entertainment.</p>\r\n\r\n<p>Tw&oacute;rcy gry w oficjalnym wpisie na Twitterze oznajmili, że w trwającym obecnie weekendzie będziemy mogli powr&oacute;cić do miejsca, w kt&oacute;rym wszystko się zaczęło. Nie oznacza to jednak, że obecna mapa, dostępna w czwartym sezonie została odłożona na boczny tor - na niej w dalszym ciągu możemy rozgrywać sieciowe potyczki. Po Kr&oacute;lewskim Kanonie będziecie mogli biegać do 24 lutego.&nbsp;</p>\r\n\r\n<p>Apex Legends zadebiutował 4 lutego minionego roku na komputerach osobistych oraz konsolach PlayStation 4 i Xbox One. Gra zebrała bardzo wysokie oceny i jest przez wiele os&oacute;b uznawana za najlepszą grę battle royale na rynku.</p>\r\n', 11, '2020-02-23', 'img/news3.jpg'),
(36, 'review', 'Two Point Hospital – recenzja gry. Najlepsze lekarstwo na nostalgię', '<p>Two Point Hospital w końcu trafiło na konsole. Po spędzeniu z tytułem kilkunastu godzin jestem pewien jednego &ndash; nie ma lepszego lekarstwa na nostalgię po Theme Hospital, jak właśnie produkcja od tw&oacute;rc&oacute;w oryginału. To piękny powr&oacute;t do znanej i cenionej strategii.</p>\r\n', '<h4><strong>Two Point Hospital... To już było i smakuje r&oacute;wnie dobrze</strong></h4>\r\n\r\n<p>Założenia Two Point Hospital nie r&oacute;żnią się od przywołanego wcześniej Theme Hospital. Do naszej dyspozycji jest oddana plac&oacute;wka, kt&oacute;rą&nbsp;musimy zarządzać &ndash; od wybudowania recepcji, stworzenia gabinet&oacute;w, po zatrudnienie kadry. Kampania dość ślamazarnie wprowadza&nbsp;w realia zawodu, ponieważ pod nasze skrzydła zostają oddane kolejne szpitale, kt&oacute;rymi musimy się zająć dbając nie tylko o podstawowe potrzeby pacjent&oacute;w, ale także stając do walki z coraz nowszymi chorobami. Tw&oacute;rcy ponownie małymi krokami rozszerzają atrakcje oferując na początku bardzo podstawowe gabinety, by od pewnego momentu coraz śmielej zaskakiwać kolejnymi przypadkami. Gra od początku nie jest specjalnie wymagająca, gracze kt&oacute;rzy znają realia serii dość szybko odnajdą się szpitalnych korytarzach, by&nbsp;następnie bez przeszk&oacute;d zacząć&nbsp;wypełniać kolejne zadania. W każdym szpitalu musimy osiągnąć wyznaczone cele, by m&oacute;c przejść do kolejnego oddziału &ndash; studio daje nam wyb&oacute;r: zbierzesz&nbsp;jedną z trzech gwiazdek i możesz rozwijać następne miejsce lub możesz sprawdzić swoje zdolności w zarządzaniu i zdobyć kolejne dwie. Za każdym razem pierwsze zadania są ciekawe i angażujące, ale już te następne (druga i trzecia gwiazda) są od pewnego momentu niezwykle generyczne i zamiast angażować graczy interesującymi przypadkami, wymagają&nbsp;zdobycia wyznaczonej got&oacute;wki lub wyleczenia odpowiedniej liczby pacjent&oacute;w. Jest to dość nudne i w kilku przypadkach po prostu zostawiłem włączoną konsolę, a na smartfonie przeglądałem Internet. Po kilku minutach pojawił się komunikat, że&nbsp;zdobyłem&nbsp;&bdquo;maxa&rdquo;. Taki samograj jest dostępy wyłącznie na starcie, ale p&oacute;źniej poziom trudności jest zwiększany wyłącznie za sprawą coraz większych&nbsp;liczb, kt&oacute;re musimy osiągnąć. Two Point Hospital jest oczywiście strategią&nbsp;ekonomiczną, zatem&nbsp;gdzieś w okolicy piątego szpitala faktycznie trzeba umiejętnie i sprytnie&nbsp;planować swoje wydatki, bo możemy bardzo szybko popaść w długi &ndash; dobrze jest w tej sytuacji planować każdy najmniejszy ruch, bo czasami lepiej postawić na mniejszą liczbę lekarzy lub odpuścić sobie niekt&oacute;re z droższych pomieszczeń. Czasami jednak trzeba zaryzykować, bo przykładowo &bdquo;Klaunika&rdquo; lub &bdquo;Chromoterapia&rdquo; pozwoli nam szybko zarobić i stanąć na nogi &ndash; studio oczywiście nie zapomniało o rozbudowie plac&oacute;wki przez dokupywanie kolejnych szpitali.</p>\r\n\r\n<p>Nie mogę jednak powiedzieć złego słowa o samych podstawach, ponieważ Two Point Hospital to w zasadzie wsp&oacute;łczesna wersja Theme Hospital. Także w nowych realiach&nbsp;musimy musimy szybko reagować i odpowiednio dostosowywać miejsc&oacute;wkę do aktualnych wydarzeń. Tw&oacute;j szpital znajduje się w g&oacute;rach? Przygotuj większy oddział, bo na pewno będziesz musiał leczyć sporo złamań. Tw&oacute;rcy od czasu do czasu zaskakują także specjalnymi kontraktami, przez kt&oacute;re w naszym szpitalu może pojawić się nawet kilka wymagających&nbsp;przypadk&oacute;w, ale wystarczy sprawne planowanie, by poradzić sobie z każdą akcją. Podczas zabawy miałem wrażenie, że deweloperzy chcą z dużym spokojem przedstawić wsp&oacute;łczesnej społeczności szpitalne realia, dlatego też poszczeg&oacute;lne opcje docierają do nas z czasem.</p>\r\n\r\n<p>Co jednak jest warte podkreślenia &ndash; Two Point Hospital oferuje taką samą frajdę&nbsp;jak jego pierwowz&oacute;r, ponieważ gameplay jest niezwykle lekki. To jedna z tych produkcji, kt&oacute;rą włączasz po ciężkim tygodniu i&nbsp;czerpiesz radość&nbsp;stawiając kolejne pomieszczenia lub radząc sobie z następnym, trudnym przypadkiem. Magia Theme Hospital została zachowana, a deweloperzy pokusili się o bardzo podobną stylistykę i obładowali pozycje toną humoru. Pacjent z żar&oacute;wką zamiast głowy lub gość z garnkiem na głowie? To tylko dwa z wielu przypadk&oacute;w, kt&oacute;re przypominają najlepsze czasy pierwowzoru. Tytuł na każdym kroku zaskakuje zabawnymi sytuacjami, kt&oacute;re może i nie wywołają b&oacute;lu brzucha, ale będą sentymentalną przyjemnością dla graczy, kt&oacute;rzy wychowali się na oryginale. Atutem gry jest polska lokalizacja, ponieważ ekipa odpowiedzialna za napisy &bdquo;czuła klimat&rdquo; i potrafiła zadbać o drobne szczeg&oacute;ły, dzięki kt&oacute;rym nie ucieka sens przekazu.</p>\r\n\r\n<h4><strong>Two Point Hospital wywołuje uśmiech</strong></h4>\r\n\r\n<p>Najlepszym momentem w Theme Hospital był dla mnie zawsze początek zabawy&nbsp;czyli planowanie, budowanie i zatrudnianie. Nie inaczej jest w Two Point Hospital &ndash;&nbsp;ponownie układanie poszczeg&oacute;lnych pomieszczeń, stawianie kolejnych ławek, dbanie o grzejniki lub automaty z jedzeniem to po prostu czysta frajda. Autorzy nie zapomnieli o takich szczeg&oacute;łach&nbsp;jak łapanie duch&oacute;w, a od pewnego momentu możemy nawet szkolić swoich pracownik&oacute;w &ndash; pozwala to poprawić jakość usług i zwiększyć reputację&nbsp;jednostki. Lekarze oraz pielęgniarki mają swoje za uszami, więc czasami musimy ich zdyscyplinować zmniejszając przerwę, a innym razem mamy okazję nagrodzić odpowiednią podwyżką. Nawet nasza&nbsp;ekipa od czasu do czasu zaproponuje&nbsp;specjalne wyzwania, kt&oacute;re możemy, choć nie musimy przyjąć &ndash; warto jednak trochę się nagimnastykować, by zyskać kilka pozytywnych sł&oacute;w.</p>\r\n\r\n<p>W grze oczywiście kluczowa jest odpowiednia strategia związana z odpowiednim&nbsp;zarządzaniem&nbsp;zespołem i szybką reakcją na przedstawione wydarzenia &ndash; poziom trudności rośnie z czasem, a fani oryginału odnajdą tutaj tak wiele pozytywnych wspomnień, że trudno będzie Wam odłożyć konsolę lub kontroler na p&oacute;łkę. Tw&oacute;rcy zajęli się kompletnym przebudowaniem pozycji dla nowych platform, a&nbsp;ta magia udała&nbsp;się w 99,9%. Budowanie jest proste, wszystko odbywa się na planie kwadrat&oacute;w, więc łatwo można ustawić wszystkie ściany, by następnie dorzucić sprzęt lub przykładowo ławki. Świetnie poradzono&nbsp;sobie także z rozmieszczeniem przycisk&oacute;w &ndash; nigdy nie miałem wrażenia, że czegoś brakuje, a samo załapanie &bdquo;co i gdzie się klika&rdquo; trwało w moim przypadku kilka minut. Bez problemu możemy obracać kamerą (prawy analog), przybliżać lub oddalać akcję (ZL/ZR) i wszystko odbywa się niezwykle płynnie. Magicznym przyciskiem w wersji na Switcha jest &bdquo;Y&rdquo;, kt&oacute;ry&nbsp;pozwala skorzystać z trzech zakładek: pomieszczenia, obiekty i zatrudnienie &ndash; wszystko jest dosłownie podane na tacy. Autorzy też dobrze wszystko tłumaczą i pokazują &ndash; gdzie, co i jak. Jedyny zarzut? Gdy musimy chwycić biegającego lekarza... Szczerze m&oacute;wiąc nie jest to wielkim problemem, ponieważ wystarczy kliknąć pauzę, ale w sumie to jest jedyny moment, kiedy poczułem, że &bdquo;myszką byłoby łatwiej&rdquo;.</p>\r\n\r\n<h4><strong>Two Point Hospital receptą na sukces</strong></h4>\r\n\r\n<p>Two Point Hospital udowadnia, że na konsolach jest miejsce dla porządnych strategii, kt&oacute;re pozwolą budować, zarządzać, szykować i kombinować. Port wersji na konsole został przygotowany z głową &ndash; nie ma obawy o wycięte treści. Dla fan&oacute;w Theme Hopistal jest to produkcja obowiązkowa, a&nbsp;teraz macie cztery platformy&nbsp;(PS4, XOne, Switch, PC), na kt&oacute;rych bez najmniejszego problemu zbudujecie kilka plac&oacute;wek i wyleczycie wielu pacjent&oacute;w chociażby z sucharozy.</p>\r\n', 11, '2020-02-23', 'img/review1.jpg'),
(37, 'news', 'GeForce Now z pierwszym dużym sukcesem. 1500 gier nadciąga do streamingowej usługi', '<p>NVIDIA może świętować pierwszy sukces GeForce Now. Streamingowa usługa cieszy się bardzo dobrym zainteresowaniem, a dodatkowo firma zapowiada znaczącą rozbudowę biblioteki. Już wkr&oacute;tce gracze zapoznają się z kolejnymi tytułami.</p>\r\n', '<p>Google Stadia może mieć ogromny problem. GeForce Now nie patrzy na konkurencję i notuje pierwszy sukces &ndash;&nbsp;<strong>już 1 mln graczy wypr&oacute;bowało streamingową usługę firmy NVIDIA.</strong>&nbsp;Model biznesowy pozwalający cieszyć się własnymi tytułami bez konieczności płacenia abonamentu okazał się strzałem w dziesiątkę.</p>\r\n\r\n<p>Phil Eisler, dyrektor generalny NVIDIA GeForce Now, potwierdził świetny rezultat, a jednocześnie wspomniał, że cała usługa wciąż znajduje się w &bdquo;okresie przejściowym&rdquo;. NVIDIA chce, by w przyszłości<strong>&nbsp;nowe gry były dodawane co tydzień.&nbsp;</strong>Jednocześnie firma zamierza ograniczyć do minimum sytuacje, w kt&oacute;rych produkcje są wycofywane z serwer&oacute;w.</p>\r\n\r\n<p><strong>Już teraz kolejne 1500 tytuł&oacute;w czeka w kolejce, by trafić do GeForce Now&nbsp;</strong>i oczywiście w tym wypadku zainteresowani nie muszą płacić dodatkowych koszt&oacute;w, by cieszyć się wcześniej kupionymi pozycjami. Wystarczy podłączyć konto do przykładowo Steam i przenieść swoją bibliotekę.</p>\r\n\r\n<p>Jak widać korporacja ma wielkie plany na rozw&oacute;j GeForce Now, dzięki kt&oacute;rym gracze otrzymają dostęp do nowych tytuł&oacute;w, a konkurencja będzie musiała się postarać, by zapewnić lepszą propozycję od Nvidii.</p>\r\n', 11, '2020-02-23', 'img/news4.jpg'),
(38, 'news', 'Microsoft Flight Simulator ze wszystkimi lotniskami świata. Ogromny realizm wykonania obiektów na filmie', '<p>To będzie jedna z najciekawszych nadciągających premier. Marka, kt&oacute;ra klasycznie kojarzyła się wyłącznie z high-endowymi pecetami wyląduje w końcu r&oacute;wnież na konsolach. Chodzi oczywiście o Microsoft Flight Simulator.</p>\r\n', '<p>Można powiedzieć, że to przełomowe wydarzenie w dziejach konsol, bo pada ostatnio bastion pecetowego grania - niezwykle realistyczny i zaawansowany symulator lotu wskoczy r&oacute;wnież na<strong>&nbsp;Xbox One</strong>&nbsp;(prawdopodobnie otrzyma też pełne wsparcie dla<strong>&nbsp;Xbox Series X</strong>).</p>\r\n\r\n<p>Jeszcze w 2020 roku Microsoft Flight Simulator&nbsp;pojawi się na PC. Wiemy, że gra wyląduje z pewnym op&oacute;źnieniem na Xbox One - możliwe, że dopiero w 2021 roku.</p>\r\n\r\n<p>W najnowszym materiale wideo deweloperzy postanowili pochwalić się wykonaniem lotnisk w grze. Wiadomo, że w grze pojawią się wszystkie lotniska cywilne występujące na świecie - obiekty wykonano na bazie zdjęć satelitarnych i proceduralnego generowania oraz bazy danych istniejącej już w&nbsp;<strong>Microsoft Flight Simulator X</strong>.<strong>&nbsp;80 najważniejszych obiekt&oacute;w tego typu zostało jednak zrealizowanych ręcznie&nbsp;</strong>- z dbałością o najmniejsze szczeg&oacute;ły (np. lotniska w Paryżu, Londynie, Nowym Jorku, Waszyngtonie, Tokio).</p>\r\n', 11, '2020-02-23', 'img/news5.jpg'),
(39, 'news', 'Assassins Creed Syndicate za darmo! Pobierajcie grę Ubisoftu i Faeria', '<p>Assassin&#39;s Creed Syndicate jest od dzisiaj dostępny za darmo. Produkcja Ubisoftu pozwala poznać ciekawą historię umiejscowioną w Londynie, a dodatkowo zainteresowani wrzucą na listę Faeria. To wszystko w ramach promocji Epic Games Store.</p>\r\n', '<p>Nie możemy w ostatnich dniach narzekać na oferty przygotowane przez Epic Games Store. Do godziny 17:00 mogliśmy wrzucić na listę Kingdom Come Deliverance, a teraz cyfrowy sklep oferuje za darmo Assassin&#39;s Creed Syndicate. Produkcja Ubisoftu zadebiutowała w 2015 roku i zebrała oceny na poziomie 74-78%. Tw&oacute;rcy zaprosili graczy do Londynu w epoce wiktoriańskiej &ndash; gracze podczas opowieści mogli doświadczyć rewolucji przemysłowej.</p>\r\n\r\n<p>Jest to jeszcze Assassin&#39;s Creed &bdquo;starej daty&rdquo;, ponieważ dużych zmian doświadczyliśmy dopiero w następnej odsłonie &ndash; Assassin&rsquo;s Creed Origins zadebiutował w 2017 roku i deweloperzy otrzymali dodatkowy rok na rozbudowę system&oacute;w &ndash; ale mimo wszystko warto poznać tytuł, kt&oacute;ry jest od dzisiaj dostępny bez dodatkowych koszt&oacute;w.</p>\r\n\r\n<p>Drugą produkcją dostępną w ramach promocji Epic Games jest Faeria &ndash; tw&oacute;rcy z Abrakam przygotowali połączenie karcianki ze strategią. Gra zadebiutowała w 2017 roku i osiągnęła w recenzjach dobre 81%. Jest to na pewno dobra opcja dla graczy, kt&oacute;rzy liczą na coś nowego i chcą zapoznać się z wciągającą rozgrywką. Oba tytuły możecie wrzucić na listę do 27 lutego, jednak nie odkładajcie tej przyjemności na p&oacute;źniej &ndash; akurat tym razem Epic Games zaoferowało dwie interesujące produkcje, kt&oacute;rymi warto się zainteresować.</p>\r\n', 11, '2020-02-23', 'img/news6.jpg'),
(40, 'article', 'Najbardziej zbugowane gry na tej generacji', 'Zapewne niejednokrotnie doświadczyliście na swojej sk&oacute;rze bug&oacute;w, tych komicznych, jak i tych, kt&oacute;re uniemożliwiły dalszą rozgrywkę. W poniższym zestawieniu przedstawimy 10 gier, kt&oacute;re od błęd&oacute;w nie stroniły.\r\n', '<h4>PUBG</h4>\r\n\r\n<p>Zestawienie otworzymy jedną z najgłośniejszych gier 2018 roku - mowa tutaj o battle royale&#39;u, z kt&oacute;rym zapewne większość z Was miała styczność. W Playerunknown&#39;s Battlegrounds (bardziej znane jako PUBG) wcielamy się w utworzoną przez nas postać, kt&oacute;ra w każdym meczu trafia na mapę, w kt&oacute;rej musi walczyć z innymi osobami o przetrwanie. Rozgrywka byłaby przyjemna, gdyby nie znikające bronie, zapadanie się naszej postaci pod ziemię czy inne tego typu błędy. Według wielu graczy, PUBG posiadał mniej błęd&oacute;w we Wczesnym Dostępie, aniżeli w oficjalnej wersji, kiedy to dodano m.in nowiutki silnik.</p>\r\n\r\n<h4>Assassin&#39;s Creed Unity</h4>\r\n\r\n<p>Assassin&#39;s Creed Unity to piąta, a zarazem najbardziej zbugowana&nbsp;pełnoprawna odsłona kultowej serii od francuskiego zespołu Ubisoft. W grze wcieliliśmy się w zakapturzonego zab&oacute;jcę o imieniu Arno, kt&oacute;ry trafił do Paryża w celu pokrzyżowania plan&oacute;w gł&oacute;wnych antagonist&oacute;w serii, Templariuszy. Francuzi zdecydowanie skupili się na grafice oraz historii, nie patrząc przy tym na błędy, kt&oacute;re stopniowo&nbsp;powstawały podczas projektowania gry. Tym samym, gracze sterujący Arno mogli chodzić po powietrzu czy też wgniatać wrog&oacute;w pod podłogę. Warto dodać, że&nbsp;błędy pojawiły się dopiero po premierowych patchach - w pierwszych wersjach gry bug&oacute;w było dużo mniej.&nbsp;</p>\r\n\r\n<h4>WWE 2K20</h4>\r\n\r\n<p>WWE 2K20 to zdecydowanie najgorsza premiera minionego roku. Studio Visual Concepts nie przyłożyło się do swojej pracy, ale przede wszystkim dziwi decyzja wydawcy, 2K Games, kt&oacute;ry postanowił wydać tak niedopracowany produkt na rynek. Po premierze gry, z wymienionego wyżej studia zaczęli odchodzić pracownicy, a reszta deweloper&oacute;w pr&oacute;buje wyeliminować bugi - jak na razie, naprawa gry idzie jak krew z nosa. Dobitką był bug, uniemożliwiający rozgrywkę w 2020 roku - niekt&oacute;rym graczom udało się dowiedzieć, że gra nie przyjmuje do swoich obliczeń&nbsp;daty z nowym rokiem, przez co zapisy profilu zostały uszkodzone.</p>\r\n\r\n<h4>Fallout 76</h4>\r\n\r\n<p>Fallout 76 to kolejna odsłona post-apokaliptycznej serii od Bethesdy. Tym razem amerykańska ekipa skupiła się na rozgrywce sieciowej - na papierze wyglądało wszystko bardzo ciekawie - wsp&oacute;łpraca graczy, aby przeżyć w świecie, w kt&oacute;rym na każdym kroku czyhają niebezpieczeństwa. Pomysł to jedno, a wykonanie to co innego, o czym wie już na pewno Bethesda, bowiem Fallout 76 to jedna z najbardziej niedopracowanych i nudnych gier obecnej generacji.</p>\r\n\r\n<h4>No Man&#39;s Sky</h4>\r\n\r\n<p>No Man&#39;s Sky zapowiadało się wyśmienicie - od pierwszych materiał&oacute;w promocyjnych tw&oacute;rcy obiecywali masę ciekawej zawartości, więc dużo os&oacute;b uznawało ową produkcję za jedną z najciekawszych premier 2016 roku. Jednak nie wszystko poszło po myśli deweloper&oacute;w - gra dostawała bardzo niskie oceny szczeg&oacute;lnie od użytkownik&oacute;w, posiadających kopię No Man&#39;s Sky na komputerach osobistych, na kt&oacute;rych występowało najwięcej bug&oacute;w. Po pierwszym tygodniu od oficjalnej premiery, zainteresowanie grą spadło o ponad 80%, a&nbsp;negatywne opinie zdecydowanie przeważały nad pozytywnymi. Należy się jednak szacunek tw&oacute;rcom, kt&oacute;rzy od 2016 roku pr&oacute;bują uratować grę, eliminując błędy i dodając nową zawartość. Gra dostała drugą szansę w sierpniu 2017 roku, czyli rok po oficjalnej premierze.</p>\r\n', 11, '2020-02-23', 'img/article2.jpg'),
(41, 'article', 'TOP 5 gier z milczącymi głównymi bohaterami', '<p>Gł&oacute;wny bohater-niemowa to dosyć osobliwa koncepcja. Dawniej wielu tw&oacute;rc&oacute;w uważało, że produkcje, w kt&oacute;rych gł&oacute;wny bohater się w og&oacute;le nie odzywa, zapewniają większą immersję dla gracza, kt&oacute;ry może lepiej &quot;wczuć&quot; się w daną postać. Dzisiaj sytuacja się oczywiście zmieniła i branża raczej rezygnuje z niemych postaci.</p>\r\n', '<p>Deweloperzy tłumnie odeszli w ostatnich 15 latach od bohater&oacute;w-mruk&oacute;w, kt&oacute;rzy nigdy się nie odzywają. Uznano po prostu, że jest to nienaturalna koncepcja - lepiej zamiast milczącego protagonisty dać graczowi kilka wariant&oacute;w wypowiedzi do wyboru. Nawet na current-genach powstały jednak udane produkcje z niemymi bohaterami;&nbsp;dawniej powstało sporo&nbsp;prawdziwych hit&oacute;w z takim &quot;trybem&quot; narracji. Poniżej znajdziecie listę najlepszych i najbardziej wartościowych pozycji tego typu.</p>\r\n\r\n<h4>5. Portal 1/2</h4>\r\n\r\n<p>Podobnie jak w Half-Life&nbsp;Valve postanowiło w serii Portal, że gł&oacute;wna bohaterka Chell nie będzie się w og&oacute;le odzywać. W zasadzie można powiedzieć, że przebiegło to bez szkody dla całej produkcji (GLaDOS kilka razy komentuje milczenie protagonistki, o tylko podkreśla atmosferę całej produkcji).</p>\r\n\r\n<h4>4. Half-Life</h4>\r\n\r\n<p>Oto jeden z najbardziej znanych przykład&oacute;w niemego protagonisty. W pierwszym Half-Lifie takie przedstawianie gł&oacute;wnego bohatera wyszło całemu projektowi na zdrowie. W narracji tej produkcji dominuje bowiem nieprzerwana akcja, działanie. Gordon ciągle gdzieś zasuwa, kogoś podsłuchuje - w zasadzie nie ma czasu na konwersacje. Gość przez większość czasu walczy też samotnie. Wypada to w pierwszym Half-Life naturalnie i autentycznie. Znacznie&nbsp;<strong>gorzej sytuacja wygląda natomiast w Half-Life 2,&nbsp;</strong>gdzie w kilku miejscach, gdzie wchodzimy w głębsze interakcje z innymi postaciami,&nbsp;naprawdę przydałoby się, by Gordon przem&oacute;wił.</p>\r\n\r\n<h4>3. Grand Theft Auto 3</h4>\r\n\r\n<p>Gł&oacute;wny bohater z kultowego już GTA 3 jest niemy. W 2011 roku Rockstar postanowił wyjaśnić, dlaczego zdecydował się na takie posunięcie. Chodzi o to, że &quot;zesp&oacute;ł deweloperski miał&nbsp;<strong>ważniejsze rzeczy na głowie</strong>&quot;, niż udźwiękowianie Claude&#39;a. A na dokładkę autorzy chcieli, by gracz lepiej&nbsp;&quot;utożsamił się w ten spos&oacute;b z Claudem&quot;. To pokazuje jak bardzo zmieniło się podejście do game designu od 2001 roku. Dawniej takie sprawy jak dialogi czy dubbing spychane były na drugi a nawet trzeci plan.</p>\r\n\r\n<h4>2. BioShock 2</h4>\r\n\r\n<p>Pierwszy BioShock nie m&oacute;gł się znaleźć w tym ranking, bo... Jack przemawia w grze! Jest to co prawda bardzo kr&oacute;tka wypowiedź, w kt&oacute;rej bohater wspomina swoich rodzic&oacute;w (w openingu), ale trzeba ją zanotować. Natomiast protagonista BioShocka 2 nie odzywa się nigdy (przynajmniej w zrozumiały spos&oacute;b). W fabule są ku temu jednak bardzo dobre powody i tutaj koncepcja milczącego protagonisty sprawdza się doskonale.</p>\r\n\r\n<h4>1. Chrono Trigger</h4>\r\n\r\n<p>Deweloperzy tego cudownego jRPG-owego klasyka zdradzili po latach w wywiadzie, że pow&oacute;d dla kt&oacute;rego Crono nie m&oacute;wi jest taki, że było to zalecenie Yujiego Horii, ojca serii Dragon Quest. Horii postawił sprawę jasno:&nbsp;<strong>&quot;protagonista RPG nie może m&oacute;wić!&quot;</strong>. Pracownicy Square mieli na ten temat podzielone zdania, ale finalnie zaakceptowali sugestię autora niezwykle popularnych w Japonii Dragon Quest&oacute;w.</p>\r\n', 11, '2020-02-23', 'img/article3.jpg'),
(42, 'news', 'Red Dead Redemption 2 bez seksu. Rockstar chce zablokować mod Hot Coffee', '<p>Rockstar nie chce zapewnić uciech Arthurowi w Red Dead Redemption 2 -&nbsp;deweloperzy otwarcie walczą tw&oacute;rcami modyfikacji Hot Coffee. Autorzy otrzymali żądanie usunięcia swojej pracy z serwer&oacute;w i zaprzestanie rozwijania projektu.</p>\r\n', '<p>Tw&oacute;rcy z Rockstar za czas&oacute;w GTA San Andreas chcieli&nbsp;zaszaleć i zapewnić bohaterowi gry trochę więcej przyjemności. Na ostatniej prostej usunięto z produkcji&nbsp;możliwość igraszek z jego kobietą, jednak gracze potrafili odblokować scenę dzięki modyfikacji zatytułowanej &bdquo;Hot Coffee&rdquo; - nazwa została zaczerpnięta ze sceny, kiedy to&nbsp;dziewczyna zaprosiła CJ&#39;a na kawę.</p>\r\n\r\n<p>Kreatorzy&nbsp;GTA długo walczyli z autorami modyfikacji, a ich koszmar powr&oacute;cił za sprawą Red Dead Redemption 2. Tym razem deweloperzy nie zostawili w kodzie produkcji dodatkowej sceny, jednak nie był to problem dla chętnych, kt&oacute;rzy przywr&oacute;cili do życia &bdquo;Hot Coffee&rdquo;.</p>\r\n\r\n<p>Mod wprowadza możliwość korzystania z usług prostytutek w saloonach, ale nie będziemy tutaj świadkami zbyt emocjonujących scen o charakterze&nbsp;seksualnym&nbsp;&ndash; to raczej dwie osoby ocierające się o siebie na ł&oacute;żku. Mimo to Take-Two i Rockstar postanowiły zareagować. YouTuber Swegta przybliżył sytuację, według kt&oacute;rej prawnicy firm odezwali się do tw&oacute;rc&oacute;w modyfikacji &ndash;&nbsp;<strong>ich zdaniem Hot Coffee narusza licencję użytkownika wraz z &bdquo;mn&oacute;stwem&nbsp;innych reguł&rdquo;.</strong></p>\r\n\r\n<p>Tw&oacute;rca moda zaznaczył, że w informacji od prawnik&oacute;w pojawiła się wzmianka o rozgrywce online, ale jest to niemożliwe, gdyż mod działa tylko w trybie dla pojedynczego gracza. Unlosing zaznaczył r&oacute;wnież, nie zamierza usunąć moda &bdquo;w najbliższym czasie&rdquo; i podkreślił, że jego zdaniem sytuacja jest oznaką niesprawiedliwości.</p>\r\n', 11, '2020-02-23', 'img/news7.jpg'),
(43, 'news', 'Epic Games Store ujawnia kolejną darmową grę', '<p>Obecnie możemy w Epic Games Store pobierać całkowicie za darmo Assassin&#39;s Creed: Syndicate. To oczywiście nie koniec gratisowej akcji, kt&oacute;rą cały czas urządza rzeczony przybytek.</p>\r\n', '<p>Obsługa Epic Games Store zdradziła już tytuł następnej gry, kt&oacute;ra będzie udostępniana za darmo Okazuje się, że w dniach&nbsp;<strong>27 lutego - 5 marca</strong>&nbsp;pobierzemy za darmo z Epic Games Store&nbsp;<strong>InnerSpace.</strong>&nbsp;Niestety nie jest to najlepiej oceniana produkcja. Średnia ocen, jaką uzyskało InnerSpace to<strong>&nbsp;6,5/10.</strong></p>\r\n\r\n<p>InnerSpace to oryginalna gra przygodowa autorstwa niezależnego studia PolyKnight Games. Pierwotnie tytuł miał ukazać się wyłącznie na komputerach osobistych, jednak dzięki wsparciu wydawcy &ndash; firmy Aspyr Media &ndash; zdecydowano się na wydanie go także na konsolach PlayStation 4 oraz Xbox One.</p>\r\n\r\n<p>Rozgrywka w&nbsp;InnerSpace na platformę PC, Switch itd. opiera się na eksploracji świat&oacute;w otoczonych wodą, gdzie działają odwr&oacute;cone prawa fizyki, a&nbsp;mieszkańcy żyją w&nbsp;miastach powstałych na szczątkach dawnych cywilizacji. Gracze wcielą się w&nbsp;nienazwanego kartografa, kt&oacute;ry poszukuje artefakt&oacute;w i odkrywa nieznane miejsca, aby poznać historię uniwersum.</p>\r\n\r\n<p>Podstawowym założeniem tw&oacute;rc&oacute;w było ścisłe połączenie swobodnej eksploracji z&nbsp;narracją, a&nbsp;za wz&oacute;r posłużyły takie produkcje, jak Podr&oacute;ż, Minecraft i&nbsp;Proteus. Gracze mogą podr&oacute;żować w&nbsp;dowolnym kierunku na pokładzie specjalnego pojazdu, pozwalającego na przemieszczanie się tak w&nbsp;powietrzu, jak i&nbsp;w&nbsp;wodzie. Poziomy nie są wyraźnie od siebie oddzielone, lecz stanowią część większego środowiska, w&nbsp;kt&oacute;re można ingerować m.in. za pomocą specjalnej energii, pozwalającej na strzelanie lub zmianę skrzydeł sterowanej maszyny w&nbsp;ostrza, przydatne do przecinania obiekt&oacute;w (na przykład przewod&oacute;w zasilających mechanizmy bram lub bujnych wodorost&oacute;w).</p>\r\n\r\n<p>Wszystkie działania gracza są w&nbsp;jakiś spos&oacute;b powiązane z&nbsp;warstwą fabularną, odsłaniając historie poszczeg&oacute;lnych świat&oacute;w oraz zamieszkujących je b&oacute;stw. Każdy świat posiada własnego p&oacute;łboskiego opiekuna, a&nbsp;spotkania z&nbsp;nimi kojarzą się z&nbsp;potyczkami z&nbsp;kolosami w&nbsp;Shadow of the Colossus. Jednak tutejsi giganci nie są wyłącznie bossami do pokonania. Bohater InnerSpace może wchodzić z&nbsp;nimi w&nbsp;interakcję na wiele sposob&oacute;w, niekoniecznie poprzez walkę.</p>\r\n', 11, '2020-02-23', 'img/news8.jpg'),
(44, 'news', 'Microsoft zaprezentuje mnóstwo ekskluzywnych gier na E3 2020. Spencer szykuje się do premiery Xbox Series X', '<p>Podczas gdy Sony rezygnuje z kolejnych imprez i wciąż czekamy na prezentację PS5, Microsoft nie spogląda na konkurencję i planuje swoje wystąpienia na kolejnych wydarzeniach. Phil Spencer potwierdził, że już teraz trwają prace nad pokazem korporacji na E3 2020. Gracze mogą liczyć na pokaz wielu znakomitych tytuł&oacute;w.</p>\r\n', '<p>Microsoft już pod koniec ubiegłego roku pokazał graczom nową generację. Phil Spencer nie tylko przedstawił Xboksa Series X, ale w&nbsp;następnych tygodniach zapowiedział wizję przygotowaną przez jego zesp&oacute;ł &ndash; firma stawia na fan&oacute;w zamierzając zapewnić pełne wsparcie Wstecznej Kompatybilności.</p>\r\n\r\n<p>Gracze mogą mieć pewność, że&nbsp;Spencer pojawi się na targach w Los Angeles. Podczas tegorocznego E3 możemy spodziewać się prezentacji wielu gier przygotowywanych na Xboksa Series X, Xboksa One oraz komputery osobiste.</p>\r\n\r\n<p>Wewnętrzne studia Microsoftu opracowują szereg produkcji, kt&oacute;re trafią na Xboksa Series X, Xboksa One oraz komputery osobiste, a gracze mogą mieć pewność, że pod koniec roku zagramy na nowym sprzęcie amerykańskiej korporacji. To będzie dobry rok dla fan&oacute;w marki Xbox.</p>\r\n', 11, '2020-02-23', 'img/news9.jpg'),
(45, 'news', 'Dying Light do wypróbowania za darmo. Techland świętuje 5. lat od premiery i zapowiada nowości', '<p>Dying Light trafił na rynek ponad 5 lat temu, więc Techland postanowił w odpowiedni spos&oacute;b uczcić to wielkie wydarzenie. Gracze mogą liczyć na serię aktywności i jednocześnie zainteresowani sprawdzą grę za darmo.</p>\r\n', '<p>Dying Light trafił na rynek 30 stycznia 2015 roku i Techland jest gotowy do świętowania. Tw&oacute;rcy właśnie ogłosili miesiąc obchod&oacute;w 5. rocznicy, podczas kt&oacute;rych zesp&oacute;ł chce podziękować wspaniałej społeczności za wsparcie.</p>\r\n\r\n<p>Tw&oacute;rcy postanowili, że 5 lat od premiery to wyjątkowy czas, więc zamiast jednego wydarzenia, gracze otrzymają serię aktywności &ndash;&nbsp;<strong>wszystko zakończy się dopiero 19 marca.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Na dobry początek gracze mogą zająć się polowaniem na przemieńc&oacute;w (za zasługi otrzymacie całkowicie nowy plan ładunku C4 sporządzony przez nieustraszonego dow&oacute;dcę Fortu Jefferson), a także będziecie zrzucać zombie z dach&oacute;w jako superbohater Harran.</p>\r\n\r\n<p>Tw&oacute;rcy wprowadzili do gry także zupełnie nowy wariant zabawy &ndash; tryb fabularny (zwany też Easy Mode), kt&oacute;re pomoże graczom skupić się wyłącznie na fabule. Zesp&oacute;ł zajął się wprowadzeniem szeregu zmian: zainteresowany jest silniejszy, wytrzymalszy, zarażeni stanowią mniejsze zagrożenie, noce są kr&oacute;tsze.</p>\r\n', 11, '2020-02-23', 'img/news10.jpg'),
(46, 'news', 'Wiedźmin 3 zarobił majątek na Steam. CD Projekt RED szykuje się na jeszcze lepsze wyniki', '<p>CD Projekt RED potwierdził wynik osiągnięty przez serię Wiedźmin na Steam. Tw&oacute;rcy growych przyg&oacute;d Geralta mogą świętować, ponieważ teraz będą zarabiać jeszcze więcej. Firma wydała oficjalny komunikat.</p>\r\n', '<p>CD Projekt RED nie odwr&oacute;ciło się od Steam i firma wciąż chętnie sprzedaje swoje gry na platformie Valve. Nie jest to raczej przypadek, ponieważ produkcje Polak&oacute;w bardzo dobrze radzą sobie na Steam &ndash; Wiedźmin 3 wygenerował już prawdziwy majątek w tym cyfrowym sklepie.</p>\r\n\r\n<p>Tw&oacute;rcy growych przyg&oacute;d Wiedźmina właśnie potwierdzili, że&nbsp;<strong>skumulowane przychody ze sprzedaży Wiedźmina 3: Dziki Gon na Steam od 1 października 2018 roku przekroczyły już 50 mln dolar&oacute;w!</strong>&nbsp;Teraz Polacy będą otrzymywać 80% z każdej sprzedaży trzeciego Wiedźmina na tej platformie.</p>\r\n\r\n<p>Jak wiadomo wciąż nie brakuje chętnych, kt&oacute;rzy sięgają po Wiedźmina, więc CD Projekt RED może liczyć na jeszcze lepsze wyniki &ndash; w końcu świeżo po premierze pierwszego sezonu serialu od Netflix udało się osiągnąć rekordowe zainteresowanie na Steam.</p>\r\n\r\n<p>Steam to oczywiście tylko jedna z cyfrowych platform &ndash; Wiedźmin 3 jest także dostępny na PlayStation Store, Xbox Live, GOG-u czy też ostatnio nawet w eShopie... A podejrzewam, że tytuł trafił także do mniej popularnych platform. CD Projekt RED stworzył kolosa, kt&oacute;ry nawet po latach od premiery cieszy się wyjątkowymi wynikami.</p>\r\n', 11, '2020-02-23', 'img/news11.jpg'),
(47, 'review', 'Patapon 2 Remastered - recenzja gry. PON PON PATA PON', '<p>Patapon 2 Remastered pojawiło się na PlayStation 4 dość niespodziewanie, przez co w głowie od razu pojawia się pewna myśl - czy możemy obawiać się o jakość gry? Sprawdźmy!</p>\r\n', '<h4>PATA PATA PATA PON</h4>\r\n\r\n<p>Dla większości z Was może to być pierwszy kontakt z walecznymi Pataponami, dlatego warto pokr&oacute;tce przypomnieć sobie o czym tak właściwie jest ta opowieść. Tytułowe stworki są niezwykle odważną i dzielną rasą istot, jaka co rusz musi mierzyć się z nowymi trudnościami losu, zagrażającymi ich w miarę spokojnemu życiu. Jako gracze wcielamy się tu w ich Boga, albowiem określenie Kami, jakim nas nazywają, w japońskiej kulturze oznacza Boga - niekoniecznie tego chrześcijańskiego, tylko&nbsp;potężną istotę o takim statusie.</p>\r\n\r\n<p>Za pomocą magicznych bębn&oacute;w jakie oddają w nasze posiadanie Patapony, możemy wydawać im rozkazy, a tym samym niczym najlepszy w&oacute;dz poprowadzić ich do boju. Do dyspozycji mamy komendy PATA, PON, CHAKA, DON, kt&oacute;re zagrane w odpowiedniej kombinacji&nbsp;dają nam r&oacute;żne efekty - na przykład słynne już PON PON PATA PON pozwala zaatakować, zaś CHAKA CHAKA PATA PON sprawia, że nasi wojownicy zaczynają się bronić.</p>\r\n\r\n<p>Tak jak w oryginale z 2008 roku, w odświeżonej wersji drugich Patapon&oacute;w r&oacute;wnież otrzymujemy 30 misji fabularnych, serię treningowych mini-gierek, a także specjalne wyzwania, w kt&oacute;rych czterech bohater&oacute;w może pokusić się o pojedynek z wielgachnym bossem, aby otworzyć magiczne jajo ze specjalną nagrodą. Szkoda tylko, że deweloperzy odpowiedzialni za remaster nie pokusili się o dodanie jakiejś zawartości od siebie, ot chociażby trybu przetrwania, albo czegoś innego tego rodzaju.&nbsp;</p>\r\n\r\n<h4>PON PON PATA PON</h4>\r\n\r\n<p>Jeśli zaś chodzi o jakość samego odświeżenia gry i dostosowania jej do PlayStation 4 i wielkich ekran&oacute;w, tutaj raczej żadnych zarzut&oacute;w mieć nie można. Nawet w 1080p obraz jest ostry jak brzytwa, a efekty specjalne wciąż potrafią cieszyć oko dzięki nieśmiertelnemu kierunkowi artystycznemu, jaki swego czasu obrała seria. Tak jak w przypadku innych remaster&oacute;w sklejonych na szybko, nie możemy liczyć na odświeżone przerywniki filmowe, gdyż te straszą nas pikselozą znaną z ekran&oacute;w PSP - o ile tam to wyglądało ładnie, tak na 40 calach może wzbudzić niesmak.</p>\r\n\r\n<p>W poprzedniej odsłonie cyklu bardzo dużym problemem była niezgodność w synchronizacji pomiędzy tym co widzimy na ekranie, a tym kiedy klikamy odpowiednie guziki, co sprawiało niezwykłe trudności w komfortowym ogrywaniu &quot;jedynki&quot; w HD. Czy tym razem zrobiono port lepiej i input lag nie występuje?</p>\r\n\r\n<p>Po kilku godzinach jakie spędziłem z grą wydaje mi się, że problem z op&oacute;źnieniem nie występuje, ale za to kłopotliwe może okazać się to, że czasami nasze minionki za wolno reagują na zmianę komend bądź też zachowują się tak jakby nowe piosenki do nich nie docierały.&nbsp;Na przykład po długotrwałem serii obronnej pieśni CHAKA CHAKA, niekt&oacute;re jednostki mają problem z przestawieniem się na atak i zamiast uderzać, wciąż uskakują nadchodzącym ciosom - możliwe jednak że to jest spowodowane czymś innym niż problemy z kodem remastera.&nbsp;</p>\r\n\r\n<p>Czy zatem warto po latach powr&oacute;cić do drugiej przygody Patapon&oacute;w? Zdecydowanie tak! Jeśli cenicie sobie wyjątkowe produkcje jakich nie znajdziecie nigdzie indziej na rynku, śmiało możecie dać szansę dziełu stworzonemu przez&nbsp;japoński&nbsp;oddział Sony. Pamiętajcie tylko, aby nie rzucać padem w telewizor, bo mimo wszystko poziom trudności potrafi dać w kość.</p>\r\n', 11, '2020-02-23', 'img/review2.jpg');
INSERT INTO `post` (`id`, `type`, `title`, `intro`, `content`, `idUser`, `date`, `thumbnail`) VALUES
(48, 'review', 'WarCraft 3 Reforged – recenzja gry. Blizzard, proszę skończ', '<p>WarCraft odegrał szczeg&oacute;lną rolę w moim życiu. Gdyby nie WarCraft 3 The Frozen Throne&nbsp;nigdy nie moglibyście przeczytać tego tekstu. To za sprawą WC3 miałem okazję organizować og&oacute;lnopolskie turnieje, prowadziłem reprezentację Polski, poznałem najlepszych przyjaci&oacute;ł, więc gdy Blizzard zapowiedział Reforged,&nbsp;wiedziałem, że produkcja zmierzy się z moimi ogromnymi oczekiwaniami. Z perspektywy czasu wiem&nbsp;jedno &ndash; nie dało się tego bardziej zepsuć.</p>\r\n', '<h4><strong>WarCraft 3 Reforged &ndash; poradnik od A do Z&nbsp;jak zniszczyć legendę</strong></h4>\r\n\r\n<p>Nie będzie to&nbsp;typowa recenzja, bo szczerze m&oacute;wiąc, nie ma tutaj co tak naprawdę recenzować. Blizzard postanowił za sprawą WarCraft 3 Reforged odpicować dwie kampanie&nbsp;zapewniające graczom ponad 40 godzin czystej frajdy &ndash; to 62 misje rozgrywane w niemal całym świecie WarCrafta ze świetnymi bohaterami oraz wieloma ciekawymi wątkami. Poznałem te historie po pierwotnej premierze (2002-2003), a p&oacute;źniej w kolejnych latach i te opowieści nadal się bronią &ndash; tw&oacute;rcy na szczęście nie dotknęli gł&oacute;wnej mechaniki rozgrywki, więc pod względem fabularnym WarCraft 3 nadal się broni. Jeśli nigdy wcześniej nie mieliście okazji zapoznać się z tymi historiami, to będziecie zachwyceni &ndash; musicie jedynie przygotować się na bardzo klasyczne zaprezentowanie akcji.</p>\r\n\r\n<p>Co mam na myśli? W 2018 roku Blizzard zapowiadając WarCraft 3 Reforged pokazał świetnie wyglądające i w pełni odświeżone przerywniki filmowe, kt&oacute;re choć nadal działały na silniku gry, to prezentowały się znacznie lepiej od &bdquo;gadających porter&oacute;w&rdquo; z 2002 roku. Tw&oacute;rcy jednak gdzieś w połowie drogi stwierdzili najwidoczniej, że nie ma sensu się za bardzo męczyć, więc zdecydowali się zapewnić graczom zwyczajne odrestaurowane jednostek, bohater&oacute;w, budynk&oacute;w oraz lokacji. Czy produkcja wygląda lepiej? Sprawa jest niestety niezwykle dyskusyjna, ale tutaj oczywiście zawsze można stwierdzić&nbsp;&ndash; są gusta i guściki... Na szczęście przed rozpoczęciem gry, tw&oacute;rcy pozwalają&nbsp;przeskoczyć na &bdquo;klasyczną&rdquo; oprawę, więc jeśli należycie do grona graczy, kt&oacute;rzy nie mogą patrzeć na nowego Blade Mastera &ndash; możecie przełączyć opcję. Trudno w całym projekcie jednak m&oacute;wić o ogromnych&nbsp;rewolucyjnych zmianach, ponieważ deweloperzy jedynie odświeżyli modele&nbsp;&ndash;&nbsp;bez jakichkolwiek ingerencji w kod źr&oacute;dłowy. Z&nbsp;perspektywy czasu jest to w zasadzie najlepsza wiadomość... Bo przynajmniej tego nie zniszczono.</p>\r\n\r\n<h4><strong>WarCraft 3 Reforged &ndash; niszczysz? Nie zapomnij wyciąć</strong></h4>\r\n\r\n<p>Gdybym w tym miejscu m&oacute;gł zakończyć tekst, to ponarzekałbym jeszcze akapit nad brakiem oczekiwanej rewolucji, ale i tak z uśmiechem na ustach włączałbym produkcję i grał ze znajomymi w kolejne mecze. Blizzard jednak dokonał czegoś, co tak naprawdę trudno wytłumaczyć słowami &ndash; studio wycięło kilka niezwykle istotnych funkcji z samej rozgrywki.</p>\r\n\r\n<p>W WarCraft 3 Reforged nie znajdziecie ladder&oacute;w, kt&oacute;re napędzały zabawę i zachęcały fan&oacute;w serii do walki o coraz lepsze wyniki. W produkcji zabrakło nawet prostego wchodzenia w profil gracza, by sprawdzić jego osiągi. Tw&oacute;rcy wycieli opcję rozgrywania sieciowych turniej&oacute;w, ograbiając grę nawet z takich podstaw jak funkcje klanowe. To wszystko było dostępne w serii od 17 lat, ale ktoś postanowił wyciąć newralgiczne funkcje i nie zapewnił żadnej gratyfikacji. W grze nie znajdziecie nowych system&oacute;w, świeżych tryb&oacute;w kolejnych opcji rozgrywania pojedynk&oacute;w &ndash; tutaj dosłownie nie ma nic nowego. Studio broni się twierdząc, że w ostatnich miesiącach mało kto grał w turniejach (podobnie jak korzystał z balansu z Reign of Chaos) i potrafię w to uwierzyć. Nikt jednak nie wpadł na to, że duże zainteresowanie odświeżoną odsłoną skłoniłoby graczy do ponownego brania udziału w rozgrywkach? Jeśli&nbsp;odpowiedź i tak byłaby negatywna,&nbsp;to deweloperzy nie zakomunikowali tego przed premierą, więc gracze mogą czuć, że czegoś w tym tytule brakuje.</p>\r\n\r\n<p>Nie poradzono sobie&nbsp;nawet z tak prostymi zasadami jak przeniesienie rozgrywki jeden do jednego &ndash; w meczach sieciowych w przypadku dw&oacute;ch ras nie działa mgła wojny. Na szczęście nie widzimy wszystkich jednostek wroga, ale potrafimy określić, w kt&oacute;rym miejscu znajduje się baza Nocnych Elf&oacute;w oraz Nieumarłych &ndash; w tym pierwszym przypadku znika kopalnia,&nbsp;w drugim drzewa są skażone i czarne. Jak można było dopuścić do zaniedbania takich podstaw? Nie mam pojęcia, ale studio nawet nie dopilnowało czcionki, kt&oacute;ra potrafi się rozjechać i w podsumowaniu meczu liczby chociażby stworzonych jednostek nie znajdują się w tabelce.</p>\r\n\r\n<p>Problemem jest&nbsp;r&oacute;wnież fakt, że&nbsp;społeczność została zmuszona do gry w WarCraft 3 Reforged. Teraz nie możesz włączyć &bdquo;klasycznego WC3&rdquo; i cieszyć się wcześniej dostępnymi możliwościami, ponieważ ta opcja została usunięta. Każdy posiadacz WarCrafta otrzymał automatyczną aktualizację do Reforged &ndash; czy tego chciał,&nbsp;czy nie.</p>\r\n\r\n<h4><strong>WarCraft 3 Reforged &ndash; niszczysz? Zapomnij o priorytetach</strong></h4>\r\n\r\n<p>Pomimo tych wyraźnych problem&oacute;w, WarCraft 3 Reforged ma jedno &ndash; fantastyczną społeczność. Od ubiegłego tygodnia w każdej wolnej chwili wpadam na serwery, na kt&oacute;re powr&oacute;cili wszyscy znajomi. Chociaż mamy świadomość, że gramy w eksperyment student&oacute;w drugiego roku filologii klasycznej, kt&oacute;rych budżet nie przekroczył wartości&nbsp;trzech Świeżak&oacute;w, jednak tytuł nadal ma w sobie &bdquo;to coś&rdquo;. Gameplay klasycznego WC3 na szczęście się nie zmienił, więc nadal można świetnie się bawić testując stare taktyki na młodych graczach lub decydując się z trzema znajomymi pokusić się o kilka zabawnych strategii. To wciąż działa.</p>\r\n\r\n<p>Podobnie zresztą jak wszystkie UMS-y &ndash; pod tą nazwą ukrywają się wszystkie niestandardowe mapy przygotowane przez graczy. Footmen Frenzy, Green TD, a może Farmer vs Hunter? Na serwerach nie brakuje graczy, kt&oacute;rzy chętnie bawią się w tych klasycznych tytułach i tutaj nadal znajdziecie dziesiątki świetnych gier, w kt&oacute;rych nietrudno się zatracić. Blizzard jednak nie byłby Blizzardem gdybym nawet w tym miejscu nie namieszał &ndash; nowy regulamin wyraźnie podkreśla, że to deweloperzy są właścicielami wszystkich projekt&oacute;w przygotowanych przez sympatyk&oacute;w tytułu. Studio nie chce kolejnej sytuacji, gdy ambitni fani stworzą nową Dotę, a następnie ich projekt zostanie wykupiony przez zewnętrzne studio. Teraz nawet jeśli stworzycie&nbsp;nowy gatunek, kt&oacute;ry zostanie doceniony przez cały&nbsp;świat &ndash; jego własnością będzie korporacja.</p>\r\n\r\n<h4><strong>Warcraft 3 Refund &ndash; i wszystko jasne...</strong></h4>\r\n\r\n<p>Tak jak wspomniałem na początku tekstu &ndash; nie jest to typowa recenzja. Blizzard nie zapewnił bolesnego minimum, a zamiast tego zmasakrowano klasyk, kt&oacute;ry wydawał&nbsp;się niemożliwy do zepsucia. Przedstawiciele&nbsp;przepraszają, pozwalają zwracać pieniądze, ale szczerze? Takich rzeczy się nie robi.</p>\r\n', 11, '2020-02-23', 'img/review3.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tag`
--

CREATE TABLE `tag` (
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `tag`
--

INSERT INTO `tag` (`name`) VALUES
('ac'),
('apex'),
('battleroyale'),
('bioware'),
('blizzard'),
('bug'),
('bugi'),
('cdp'),
('egs'),
('epic'),
('geforce'),
('indie'),
('microsoft'),
('nextgen'),
('ns'),
('nvidia'),
('patapon'),
('pc'),
('promocja'),
('ps4'),
('ps5'),
('rdr2'),
('remaster'),
('retro'),
('rockstar'),
('siege'),
('sony'),
('stadia'),
('steam'),
('strategia'),
('switch'),
('syndicate'),
('techland'),
('ubisoft'),
('vita'),
('vr'),
('wiedźmin'),
('x1'),
('xbx');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tag_post_relation`
--

CREATE TABLE `tag_post_relation` (
  `tagName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `idPost` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `tag_post_relation`
--

INSERT INTO `tag_post_relation` (`tagName`, `idPost`) VALUES
('ps5', 32),
('xbx', 32),
('pc', 32),
('nextgen', 32),
('ps4', 33),
('pc', 33),
('x1', 33),
('siege', 33),
('ubisoft', 33),
('bioware', 34),
('pc', 34),
('ps4', 34),
('x1', 34),
('apex', 35),
('pc', 35),
('ps4', 35),
('x1', 35),
('battleroyale', 35),
('ns', 36),
('switch', 36),
('ps4', 36),
('x1', 36),
('pc', 36),
('strategia', 36),
('nvidia', 37),
('stadia', 37),
('pc', 37),
('geforce', 37),
('pc', 38),
('microsoft', 38),
('x1', 38),
('nextgen', 38),
('vr', 38),
('pc', 39),
('epic', 39),
('egs', 39),
('ac', 39),
('syndicate', 39),
('promocja', 39),
('bugi', 40),
('ps4', 40),
('pc', 40),
('x1', 40),
('retro', 41),
('pc', 41),
('steam', 41),
('rdr2', 42),
('pc', 42),
('ps4', 42),
('x1', 42),
('rockstar', 42),
('egs', 43),
('promocja', 43),
('pc', 43),
('indie', 43),
('microsoft', 44),
('x1', 44),
('xbx', 44),
('techland', 45),
('pc', 45),
('ps4', 45),
('x1', 45),
('steam', 45),
('wiedźmin', 46),
('cdp', 46),
('pc', 46),
('ps4', 46),
('x1', 46),
('ps4', 47),
('vita', 47),
('sony', 47),
('patapon', 47),
('ns', 47),
('remaster', 48),
('pc', 48),
('blizzard', 48),
('pc', 49);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `nick` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `userType` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `banned` bit(1) NOT NULL,
  `description` text COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `nick`, `password`, `email`, `avatar`, `userType`, `banned`, `description`) VALUES
(11, 'admin', '$2y$10$lBPjxq5QehE8RO7n7mDmQuaMyCnCulGbEiTzqsA4jw2/tjN9v6bW6', 'gamenews@gmail.com', 'img/default_avatar.jpg', 'admin', b'0', 'Ustaw swój opis za pomocą przycisku na górze!'),
(12, 'Wredny', '$2y$10$TgxkMyjjwq0Tr1cSEIvPp.rdYlyFsgBRqcLmZA/eJHBcVAYNFEoxS', 'wredny@gmail.com', 'img/avatar12.jpg', 'user', b'0', 'Ustaw swój opis za pomocą przycisku na górze!'),
(13, 'Coody', '$2y$10$EOLNgnsxXN7umaBLlsju6Ox2vtsHz/5KsCJl1RhXJvbkNhfSNJG86', 'coody@gmail.com', 'img/avatar13.jpg', 'mod', b'0', 'Programista, amatorski kolaż, fan gier od 5 roku życia. Interesuję się gł&oacute;wnie strzelankami i grami RPG.'),
(14, 'adamlubin', '$2y$10$1E8rHxzdlfMqrHOasErMhO5LHfEVTaCRzT8db9bIoTYCscvV9KmhK', 'adamlubin@gmail.com', 'img/avatar14.jpg', 'user', b'0', 'Ustaw swój opis za pomocą przycisku na górze!'),
(15, 'Brozyn89', '$2y$10$yF6p9PF0EFUf660KW59tbemM/R3pOBPOFSNxr0UPd89jBeH0Py.mu', 'brozyn89@gmail.com', 'img/default_avatar.jpg', 'user', b'0', 'Ustaw swój opis za pomocą przycisku na górze!'),
(16, 'not323', '$2y$10$rZsa1NXnqpNRZIZm0KgRzeemBFnyclcrByrmk3FKvczN0JSB7ctSm', 'not323@gmail.com', 'img/default_avatar.jpg', 'user', b'0', 'Ustaw swój opis za pomocą przycisku na górze!'),
(17, 'Pinkotka', '$2y$10$dRfwn8MNvIolhm7yvDHf0uGeDraKx1lizWGVaz2izCajGNa.O.er2', 'pinkotka@gmail.com', 'img/avatar17.jpg', 'user', b'0', 'Ustaw swój opis za pomocą przycisku na górze!'),
(18, 'Rekinek', '$2y$10$2lwmUzL/RlNbn99cNKdNA.sy9Nc6z23cNTk5aPZzKJe2fRVaU7i/G', 'rekinek@gmail.com', 'img/default_avatar.jpg', 'user', b'0', 'Ustaw swój opis za pomocą przycisku na górze!'),
(19, 'grim73', '$2y$10$dl4SIAqpvptvZ5zZkHfjH.usb7r7wgiVis9GzFC2wLeN541xcz73a', 'grim73@gmail.com', 'img/avatar19.jpg', 'user', b'0', 'Ustaw swój opis za pomocą przycisku na górze!'),
(289, 'KrzyKrzysiek', '$2y$10$ImXinNbz0NBKNBv0O2J1h.UrOAhpPmExZOIgWrmI2buZQEG22r9OK', 'krzykrzysiek@gmail.com', 'img/default_avatar.jpg', 'user', b'0', 'Ustaw swój opis za pomocą przycisku na górze!'),
(290, 'Janek123', '$2y$10$vsQ2aKn4ykRPZHCIfnfg2eJAvZM/U9hQ7Qk3sLiyCAbhIH9yCmWm.', 'janek123@gmail.com', 'img/avatar290.jpg', 'user', b'0', 'Zawodowo programista, amatorsko bokser, prywatnie nerd. Gram na PC i Playstation 4. Interesuję się gł&oacute;wnie strategiami, sieciowymi FPSami i grami MMO.');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`nick`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
