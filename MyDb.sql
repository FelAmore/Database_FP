-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 14, 2024 at 08:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MyDb`
--

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `GenreID` int(15) NOT NULL,
  `Genre_Name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`GenreID`, `Genre_Name`) VALUES
(1, 'Comedy'),
(2, 'Adventure'),
(3, 'Animation'),
(4, 'Drama'),
(5, 'Fantasy'),
(6, 'Romance'),
(7, 'Crime'),
(8, 'Adventure'),
(9, 'Action'),
(10, 'Sci-fi'),
(11, 'Horror');

-- --------------------------------------------------------

--
-- Table structure for table `moviegenres`
--

CREATE TABLE `moviegenres` (
  `MovieGenreID` int(11) NOT NULL,
  `MovieID` int(11) DEFAULT NULL,
  `GenreID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moviegenres`
--

INSERT INTO `moviegenres` (`MovieGenreID`, `MovieID`, `GenreID`) VALUES
(2, 1, 9),
(3, 1, 8),
(4, 1, 4),
(5, 2, 8),
(6, 2, 1),
(7, 2, 5),
(8, 3, 7),
(9, 3, 4),
(10, 4, 4),
(11, 4, 5),
(12, 4, 6),
(13, 5, 3),
(14, 5, 2),
(15, 5, 1),
(16, 6, 9),
(17, 6, 7),
(18, 6, 4),
(34, 26, 2),
(35, 26, 5),
(36, 26, 9),
(39, 28, 1),
(40, 28, 2),
(41, 28, 9);

-- --------------------------------------------------------

--
-- Table structure for table `movienetwork`
--

CREATE TABLE `movienetwork` (
  `MovieNetworkID` int(11) NOT NULL,
  `MovieID` int(11) DEFAULT NULL,
  `OGNetworkID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movienetwork`
--

INSERT INTO `movienetwork` (`MovieNetworkID`, `MovieID`, `OGNetworkID`) VALUES
(2, 1, 1),
(3, 1, 2),
(4, 2, 3),
(5, 2, 2),
(6, 2, 5),
(7, 3, 1),
(8, 4, 3),
(9, 4, 2),
(10, 5, 4),
(11, 6, 1),
(12, 6, 3),
(24, 26, 1),
(25, 26, 1),
(32, 28, 3),
(33, 28, 3),
(34, 28, 3);

-- --------------------------------------------------------

--
-- Table structure for table `moviepeople`
--

CREATE TABLE `moviepeople` (
  `MoviePeopleID` int(15) NOT NULL,
  `MovieID` int(15) NOT NULL,
  `PeopleID` int(15) NOT NULL,
  `RoleID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moviepeople`
--

INSERT INTO `moviepeople` (`MoviePeopleID`, `MovieID`, `PeopleID`, `RoleID`) VALUES
(1, 1, 30, 3),
(2, 1, 29, 3),
(3, 1, 28, 3),
(4, 1, 27, 2),
(5, 1, 26, 2),
(6, 1, 25, 2),
(7, 1, 24, 1),
(8, 2, 23, 3),
(9, 2, 22, 3),
(10, 2, 21, 3),
(11, 2, 20, 2),
(12, 2, 19, 2),
(13, 2, 19, 1),
(14, 3, 18, 3),
(15, 3, 17, 3),
(16, 3, 16, 3),
(17, 3, 15, 2),
(18, 3, 14, 2),
(19, 3, 13, 2),
(20, 3, 13, 1),
(21, 4, 12, 3),
(22, 4, 11, 3),
(23, 4, 10, 3),
(24, 4, 9, 2),
(25, 4, 8, 2),
(26, 4, 7, 1),
(27, 5, 6, 3),
(28, 5, 5, 3),
(29, 5, 4, 3),
(30, 5, 3, 2),
(31, 5, 2, 2),
(32, 5, 1, 2),
(33, 5, 1, 1),
(34, 5, 2, 1),
(35, 6, 31, 1),
(36, 6, 31, 2),
(37, 6, 32, 2),
(38, 6, 33, 2),
(39, 6, 11, 3),
(40, 6, 34, 3),
(41, 6, 35, 3);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `MovieID` int(50) NOT NULL,
  `Movie_Title` varchar(50) NOT NULL,
  `Synopsis` text NOT NULL,
  `Release_Year` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`MovieID`, `Movie_Title`, `Synopsis`, `Release_Year`) VALUES
(1, 'The Hunger Games: The Ballad of Songbirds & Snakes', 'Coriolanus Snow mentors and develops feelings for the female District 12 tribute during the 10th Hunger Games.', 2023),
(2, 'Barbie', 'Barbie suffers a crisis that leads her to question her world and her existence.', 2023),
(3, 'No More Bets', 'A Chinese programmer and a model who, enticed by the promise of high-paying jobs, find themselves trapped in a foreign country as prisoners of a scam mill and were forced to be part of their online fraud scheme.', 2023),
(4, 'Twilight', 'When Bella Swan moves to a small town in the Pacific Northwest, she falls in love with Edward Cullen, a mysterious classmate who reveals himself to be a 108-year-old vampire.', 2008),
(5, 'Inside Out', 'After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.', 2015),
(6, 'The Batman', 'When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city\'s hidden corruption and question his family\'s involvement.', 2022),
(26, 'Aquaman and The Lost Kingdom', 'Black Manta seeks revenge on Aquaman for his father\'s death. Wielding the Black Trident\'s power, he becomes a formidable foe. To defend Atlantis, Aquaman forges an alliance with his imprisoned brother. They must protect the kingdom.', 2023),
(28, 'Thor: Ragnarok', 'Imprisoned on the planet Sakaar, Thor must race against time to return to Asgard and stop Ragnarök, the destruction of his world, at the hands of the powerful and ruthless villain Hela.', 2017);

-- --------------------------------------------------------

--
-- Table structure for table `og_network`
--

CREATE TABLE `og_network` (
  `OGNetworkID` int(15) NOT NULL,
  `OGNetwork_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `og_network`
--

INSERT INTO `og_network` (`OGNetworkID`, `OGNetwork_Name`) VALUES
(1, 'Netflix'),
(2, 'HBO'),
(3, 'Amazon Prime Video'),
(4, 'Disney++'),
(5, 'Hulu');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `PeopleID` int(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Biography` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`PeopleID`, `Name`, `Biography`) VALUES
(1, 'Pete Docter', 'Pete Docter is the Oscar®-winning director of \"Monsters, Inc.,\" \"Up,\" and \"Inside Out,\" and Chief Creative Officer at Pixar Animation Studios. He is currently directing Pixar\'s feature film \"Soul\" with producer Dana Murray, which is set to release June 19, 2020.'),
(2, 'Ronnie Del Carmen', 'Ronnie del Carmen joined Pixar Animation Studios in the summer of 2000 during the production of \"Finding Nemo\" and became a story supervisor on the film. He did production design on the Academy Award®-nominated short film, \"One Man Band\" and story work on Oscar®-winning, \"Ratatouille.\" Del Carmen was Head of Story on Disney/Pixar\'s Academy Award winning feature, \"Up\" and is the co-director of Disney/Pixar\'s \"Inside Out.\"'),
(3, 'Meg LeFauve', 'Nominated for a Best Screenplay Oscar for the Pixar blockbuster \"Inside Out\", LeFauve won an Annie Award for that screenplay. LeFauve began her film career as a producer and President of Egg Pictures, Jodie Foster\'s film company. During that time, LeFauve produced films which were nominated for an Emmy, a Golden Globe, and she was awarded a Peabody for the Showtime film, \"The Baby Dance.\" LeFauve also produced \"The Dangerous Lives of Altar Boys\" which won the 2003 IFP Spirit Award for Best First Feature. LeFauve has been a consultant to Screen New South Wales and Screen Australia and has been a mentor at many writing labs, including The Sundance Labs, Cinestory Script Sessions, and the Meryl Streep Lab. LeFauve taught at AFI and served as co-chair of the Graduate Producers Program at UCLA\'s School of Film and Television, where she taught master level story and development classes for over seven years. Raised in Warren, Ohio, LeFauve graduated from the Syracuse University Newhouse School.'),
(4, 'Amy Poehler', 'Amy Meredith Poehler was born in Newton, Massachusetts, to high school teachers Eileen Frances (Milmore) and William Grinstead Poehler. Her brother is comedian Greg Poehler. She is of Irish (from her mother) and English, Irish, German, and Portuguese (from her father) descent. Amy was first involved with sketch comedy when she joined the group My Mother\'s Flea Bag when she was attending Boston College. In 1993, she went to Chicago where she studied at Second City and Improv Olympics. There, she met Del Close, who later became the voice of the UCB opening scene. In 1996, she joined the Upright Citizen\'s Brigade with Matt Besser, Ian Roberts, and Matt Walsh. Later on, the group moved to New York and became a Comedy Central show. The show went on only for three seasons. However, the group stayed together at the Upright Citizen\'s Brigade Theater. Today, the theater is one of the leading centers for improv and sketch shows.'),
(5, 'Bill Hader', 'Bill Hader is an American comedian and actor who is known for playing in Saturday Night Live from 2005 to 2013. He created and starred in the HBO show Barry. He also played Flint Lockwood from Cloudy with a Chance of Meatballs, Colonel Custer from Night at the Museum 2, Fear from Inside Out and Richie Tozier from It Chapter Two. He was married to Maggie Carey and has three children.'),
(6, 'Lewis Black', 'Lewis Black was born on August 30, 1948 in Silver Spring, Maryland, USA. He is an actor and producer, known for Inside Out (2015), Accepted (2006) and Man of the Year (2006).'),
(7, 'Catherine Hardwicke', 'Hardwicke\'s first film as a director was the Sundance winner THIRTEEN which explored the transition into teenage years with an authenticity that still captures young audiences (1.3 billion Tik Tok engagements.) Hardwicke directed LORDS OF DOGTOWN before she became best known as the director of TWILIGHT, which launched the blockbuster franchise and has since earned over three billion dollars. Recently her indie film PRISONER\'S DAUGHTER premiered at TIFF 2022 and DREAMS IN THE WITCHHOUSE dropped on Netflix October 2022 as part of Guillermo del Toro\'s Cabinet of Curiosities. MAFIA MAMMA premieres in theaters on April 14 2023.'),
(8, 'Melissa Rosenberg', 'Melissa Rosenberg was born on 28 August 1962 in Marin County, California, USA. She is a producer and writer, known for Jessica Jones (2015), Dexter (2006) and The Twilight Saga: Eclipse (2010). She has been married to Lev L. Spiro since 1995.'),
(9, 'Stephenie Meyer', 'Stephenie born in Connecticut in 1973. Her family was settled in Phoenix by the time she was four. The unusual spelling of her name came from her father, Stephen ( + ie). Stephenie went to high school in Scottsdale, Arizona. She was awarded a National Merit Scholarship, and she used it to pay her way to Brigham Young University, in Provo, Utah. She majored in English. Stephenie met her husband, Pancho, when she was four, but they only saw each other weekly through church activities. When they finally got around to exchanging words, sixteen years after their first meeting, it only took nine months from the first \"hello\" to the wedding. They have been married for ten and a half years now, and have three boys. Gabe is eight, Seth is five, and Eli is three. Twilight is her very first novel. New Moon is the second book in the series, Eclipse the third. The fourth book Breaking Dawn was released in August 2008.'),
(10, 'Kristen Stewart', 'Though most famous for her role as Isabella \"Bella\" Swan in The Twilight (2008) Saga, Kristen Stewart has been a working actor since her early years in Los Angeles, California. Her parents, John Stewart and Jules Stewart, both work in film and television. The family includes three boys, Kristen\'s older brother Cameron Stewart and two adopted brothers Dana and Taylor. Kristen is of English, Scottish, and Ashkenazi Jewish descent.'),
(11, 'Robert Pattinson', 'Robert Douglas Thomas Pattinson was born May 13, 1986 in London, England, to Richard Pattinson, a car dealer importing vintage cars, and Clare Pattinson (née Charlton), who worked as a booker at a model agency. He grew up in Barnes, southwest London with two older sisters. Robert discovered his love for music long before acting and started learning the guitar and piano at the age of four. He became a big cinephile for love of auteur cinema in his early teens and preferred to watch films rather than doing his homework. In his late teens and early twenties, he used to perform solo acoustic guitar gigs at open mic nights in bars and pubs around London where he sung his own written songs. Thinking about becoming a musician or going to university to study speech-writing, he never thought about pursuing an acting career and his drama teacher in school even advised him not to join the drama club because she thought he wasn\'t made for the creative subjects. But as a teenager, he joined the local amateur theatre club after his father convinced him to attend because he was quite shy. At age 15 and after two years of working backstage, he auditioned for the play \'Guys and Dolls\' and he got his first role as a Cuban dancer with no lines. He got the lead part in the next play \'Our Town\', was spotted by a talent agent who was sitting in the audience and he began looking for professional roles.'),
(12, 'Billy Burke', 'Billy Burke was born and raised in Bellingham, Washington, USA. He began singing at age nine, and joined a band at age fifteen. He continued to work with bands and study/performing drama at Western Washington University. He performed in Seattle at the Annex Theater, New City Festival, and the A.H.A. Theater, though it was as a musician, not an actor, that Burke first moved to Los Angeles. A demo deal with a major record label that \"didn\'t quite pan out\", left him to explore the only other thing he \"knew he was good at\". With two independent films shot in his native Seattle under his belt, he began auditioning and very soon working as an actor.'),
(13, 'Ao Shen', 'Ao Shen is known for My Dear Liar (2019), No More Bets (2023) and Wo men de xin sheng huo (2021).'),
(14, 'Luyang Xu', 'Luyang Xu is known for My People, My Country (2019), Revival (2023) and No More Bets (2023).'),
(15, 'Yifan Zhang', 'Yifan Zhang is known for No More Bets (2023), Cities in Love (2015) and Breakup Buddies (2014).'),
(16, 'Yixing Zhang', 'Yixing Zhang (also known as Lay) was born on October 7th, 1991. He is most famous for being one of the Main Dancers in the popular South Korean-Chinese band, EXO, and the Main Dancer in their sub-unit, EXO-M. Aside from singing and acting, he has further extended his activities to acting in few Chinese series, & now even playing a role in an English film with Jackie Chan, Kung Fu Yoga.'),
(17, 'Gina Chen Jin', 'Gina Chen Jin was born on 5 September 1990 in Jinan, Shandong, China. She is an actress, known for Fearless Whispers (2020), No More Bets (2023) and Falling Into You (2022).'),
(18, 'Mei Yong', 'Mei Yong was born on 14 February 1970 in Hohhot, Inner Mongolia, China. She is an actress, known for So Long, My Son (2019), The Assassin (2015) and Schemes in Antiques (2021).'),
(19, 'Gerta Gerwig', 'Greta Gerwig is an American actress, playwright, screenwriter, and director. She has collaborated with Noah Baumbach on several films, including Greenberg (2010), Frances Ha (2012), for which she earned a Golden Globe nomination, and Mistress America (2015). Gerwig made her solo directorial debut with the critically acclaimed comedy-drama film Lady Bird (2017), which she also wrote, and has also had starring roles in the films Damsels in Distress (2011), Jackie (2016), and 20th Century Women (2016).'),
(20, 'Noah Baumbach', 'Born in Brooklyn in 1969 Noah Baumbach is the son of two film critics, Georgia Brown and Jonathan Baumbach (also a writer). His studies at Vassar College were the subject of his first film (made as he was 26 years old), Kicking and Screaming (1995). His second major picture, made ten years later, The Squid and the Whale (2005) was no less autobiographical but went back further in his personal history, back to the time when his parents separated. Recounting this past trauma and its aftermath earned Noah a selection at the Sundance Film Festival, three Golden Globe nominations and a best screenplay Oscar nomination. From then on his career was launched and his output became more regular with Margot at the Wedding (2007) starring Nicole Kidman and his wife Jennifer Jason Leigh, Greenberg (2010), filmed in Los Angeles, with Ben Stiller and Greta Gerwig. Back in New york, where he lives, he was the director (and co-author with his main actress, Greta Gerwig) of the bittersweet art house success Frances Ha (2012). Besides directing films, he also co-writes some with Wes Anderson, a good friend of his, and is the author of humor columns in the New Yorker.'),
(21, 'Margot Robbie', 'Margot Elise Robbie was born on July 2, 1990 in Dalby, Queensland, Australia to Scottish parents. Her mother, Sarie Kessler, is a physiotherapist, and her father, is Doug Robbie. She comes from a family of four children, having two brothers and one sister. She graduated from Somerset College in Mudgeeraba, Queensland, Australia, a suburb in the Gold Coast hinterland of South East Queensland, where she and her siblings were raised by their mother and spent much of her time at the farm belonging to her grandparents. In her late teens, she moved to Melbourne, Victoria, Australia to pursue an acting career.'),
(22, 'Ryan Gosling', 'Born Ryan Thomas Gosling on November 12, 1980, in London, Ontario, Canada, he is the son of Donna (Wilson), a secretary, and Thomas Ray Gosling, a traveling salesman. Ryan was the second of their two children, with an older sister, Mandi. His ancestry is French-Canadian, as well as English, Scottish, and Irish. The Gosling family moved to Cornwall, Ontario, where Ryan grew up and was home-schooled by his mother. He also attended Gladstone Public School and Cornwall Collegiate & Vocational School, where he excelled in Drama and Fine Arts. The family then relocated to Burlington, Ontario, where Ryan attended Lester B. Pearson High School.'),
(23, 'Issa Rae', 'Jo-Issa Rae Diop credited professionally as Issa Rae, is an American actress, writer, producer, and comedian. Rae first garnered attention for her work on the YouTube web series Awkward Black Girl. Since 2011, Rae has continued to develop her YouTube channel, which features various short films, web series, and other content created by black people.'),
(24, 'Francis Lawrence', 'Francis Lawrence is an American filmmaker. He started directing over sixty music videos before he directed the cult classic Keanu Reeves film Constantine, I Am Legend and Water for Elephants. He also directed The Hunger Games: Catching Fire, The Hunger Games: Mockingjay Parts 1 and 2, and Red Sparrow, which all starred Jennifer Lawrence.'),
(25, 'Michael Lesslie', 'Michael Lesslie was born in 1984 in England, UK. Michael is a producer and writer, known for The Hunger Games: The Ballad of Songbirds & Snakes (2023), Macbeth (2015) and Assassin\'s Creed (2016).'),
(26, 'Michael Arndt', 'Michael Arndt was born on 11 November 1965 in Harris County, Texas, USA. He is a writer and producer, known for Star Wars: Episode VII - The Force Awakens (2015), Little Miss Sunshine (2006) and The Hunger Games: Catching Fire (2013).'),
(27, 'Suzanne Collins', 'Suzanne Collins is an American television writer and novelist, author of the bestselling series The Underland Chronicles and the wildly successful Hunger Games trilogy that spawned the Lionsgate film The Hunger Games (2012) and the three subsequently announced sequels, The Hunger Games: Catching Fire (2013), The Hunger Games: Mockingjay - Part 1 (2014) and The Hunger Games: Mockingjay - Part 2 (2015). Born in Hartford, Connecticut on August 10, 1962, Collins is the daughter of a U.S. Air Force officer and was a successful television writer before turning her talents to writing novels. Currently residing in Sandy Hook, Connecticut with her husband and their two children, Suzanne Collins is Amazon.com\'s best-selling author of all time.'),
(28, 'Rachel Zegler', 'Rachel Zegler is a singer and songwriter, raised in New Jersey by her American father and Colombian mother. Having been one of 30,000 people to audition, she was selected to play the role of Maria in Steven Spielberg\'s remake of the classic West Side Story (2021), opposite Ansel Elgort as Tony. She first played the role in a Performing Arts School presentation at Bergen Performing Arts Center. She reached a large audience with her cover of Lady Gaga\'s song \"Shallow\", known from the movie A Star Is Born (2018).'),
(29, 'Tom Blyth', 'Tom Keir Blyth is an English actor. His films include Scott and Sid (2018), Benediction (2021), The Hunger Games, Ballad of Songbirds and Snakes (2023). He stars as the titular character of the MGM+ series Billy the Kid (2022) and a supporting role in the HBO series The Gilded Age (2022). Blyth was born in Birmingham and grew up in Woodthorpe, a suburb of Nottingham. He is the son of soap opera producer Gavin Blyth, who passed away when he was 14. Blyth attended Arnold Hill Academy and Bilborough College. His mother Charlotte, a careers counselor, signed him up for drama classes at the Television Workshop. He also joined the National Youth Theatre. He went on to train at the Juilliard School in New York City, as had been his dream, graduating in 2020.'),
(30, 'Viola Davis', 'Viola Davis is a critically revered actress of film, television, and theater and has won rave reviews for her multitude of substantial and intriguingly diverse roles. Audiences across the United States and internationally have admired her for her work- including her celebrated, Oscar-nominated performances in The Help (2011), Doubt (2008), and her Oscar winning performance in Fences (2016). In 2015, Davis won the Emmy Award for Outstanding Performance by a Female Actor in a Drama Series for her work in ABC\'s How To Get Away With Murder, making her the first black woman in history to take home the award. In addition to acting, Viola currently produces alongside her husband and producing partner, Julius Tennon, through their JuVee Productions banner. Together they have produced award-garnering productions across theater, television, and film.'),
(31, 'Matt Reeves', 'Matthew George \"Matt\" Reeves was born April 27, 1966 in Rockville Center, New York, USA and is a writer, director and producer. Reeves began making movies at age eight, directing friends and using a wind-up camera. He befriended filmmaker J.J. Abrams when both were 13 years old and a public-access television cable channel, Z Channel, aired their short films. When Reeves and Abrams were 15 or 16 years old, Steven Spielberg hired them to transfer some of his own Super 8 films to videotape. Reeves attended the University of Southern California and there, between 1991 and 1992, he produced an award-winning student film, Mr. Petrified Forest, which helped him acquire an agent. He also co-wrote a script that eventually became Under Siege 2: Dark Territory (1995). After graduating, he co-wrote The Pallbearer (1996), which became his directorial debut.'),
(32, 'Peter Craig', 'Peter Craig is an American screenwriter, producer and novelist from Los Angeles, California who is known for writing The Hunger Games: Mockingjay, Bad Boys for Life, Blood Father, 12 Strong, The Batman, Top Gun: Maverick and The Town. He is a son of Sally Field and Steve Craig. He has had three children.'),
(33, 'Bob Kane', 'Bob Kane was an American comic book writer and artist of Jewish descent, most famous for co-creating Batman and several members of Batman\'s supporting cast. Kane was inducted into the comic book industry\'s Jack Kirby Hall of Fame in 1994 and into the Will Eisner Comic Book Hall of Fame in 1996.'),
(34, 'Zoe Kravitz', 'Zoë Kravitz has stood out in blockbuster big screen franchises such as The Batman, Mad Max and Fantastic Beasts and the celebrated EMMY Award-winning series Big Little Lies. She has captivated audiences in diverse group of acclaimed major motion picture films and notable independent releases.'),
(35, 'Jeffrey Wright', 'Born and raised in Washington DC, Jeffrey Wright graduated from Amherst College in 1987. Although he studied Political Science while at Amherst, Wright left the school with a love for acting. Shortly after graduating he won an acting scholarship to NYU, but dropped out after only two months to pursue acting full-time. With roles in Presumed Innocent (1990), and the Broadway production of Angels in America, (in which he won a Tony award), within a relatively short time Wright was able to show off his exceptional talent and ability on both stage and screen alike. His first major on-screen performance came in 1996 in the Julian Schnabel directed film Basquiat (1996). Wright\'s harrowing performance as the late painter Jean Michele Basquiat was critically acclaimed. Wright later had a continuing role in the HBO dramatic series Boardwalk Empire (2010).');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int(15) NOT NULL,
  `Role_Name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `Role_Name`) VALUES
(1, 'Director'),
(2, 'Screenwriter'),
(3, 'Cast');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`GenreID`);

--
-- Indexes for table `moviegenres`
--
ALTER TABLE `moviegenres`
  ADD PRIMARY KEY (`MovieGenreID`),
  ADD KEY `MovieID` (`MovieID`),
  ADD KEY `GenreID` (`GenreID`);

--
-- Indexes for table `movienetwork`
--
ALTER TABLE `movienetwork`
  ADD PRIMARY KEY (`MovieNetworkID`),
  ADD KEY `OGNetworkID` (`OGNetworkID`),
  ADD KEY `fk_movienetwork_movie` (`MovieID`);

--
-- Indexes for table `moviepeople`
--
ALTER TABLE `moviepeople`
  ADD PRIMARY KEY (`MoviePeopleID`),
  ADD KEY `MovieID-MoviePeople` (`MovieID`),
  ADD KEY `PeopleID-MoviePeople` (`PeopleID`),
  ADD KEY `RoleID-PeopleRole` (`RoleID`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`MovieID`);

--
-- Indexes for table `og_network`
--
ALTER TABLE `og_network`
  ADD PRIMARY KEY (`OGNetworkID`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`PeopleID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moviegenres`
--
ALTER TABLE `moviegenres`
  MODIFY `MovieGenreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `movienetwork`
--
ALTER TABLE `movienetwork`
  MODIFY `MovieNetworkID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `MovieID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `moviegenres`
--
ALTER TABLE `moviegenres`
  ADD CONSTRAINT `moviegenres_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `moviegenres_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genres` (`GenreID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movienetwork`
--
ALTER TABLE `movienetwork`
  ADD CONSTRAINT `movienetwork_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movienetwork_ibfk_2` FOREIGN KEY (`OGNetworkID`) REFERENCES `og_network` (`OGNetworkID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `moviepeople`
--
ALTER TABLE `moviepeople`
  ADD CONSTRAINT `MovieID-MoviePeople` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PeopleID-MoviePeople` FOREIGN KEY (`PeopleID`) REFERENCES `people` (`PeopleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RoleID-PeopleRole` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
