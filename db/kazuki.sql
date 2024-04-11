-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2024 at 01:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kazuki`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Osei Owusu', 'ansah', 8989898989, 'osei-owusu@gmail.com', 'f925916e2754e5e03f75dd58a5733251', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `recipeId` int(11) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `userEmail` varchar(200) DEFAULT NULL,
  `commentMessage` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcomments`
--

INSERT INTO `tblcomments` (`id`, `recipeId`, `userName`, `userEmail`, `commentMessage`, `postingDate`, `status`, `updationDate`) VALUES
(1, 1, 'rapsoccer', 'obibarapsoccer@gmail.com', 'For testing purpose.  ', '2024-04-09 04:37:22', 0, '2024-04-10 07:45:40'),
(2, 1, 'kwaku ansah', 'kwakuansah@gmail.com', 'This is the best recipe. Thank you much.', '2024-04-09 04:39:06', 0, '2024-04-11 08:00:11'),
(3, 1, 'Nora Agyekum', 'agyekumnora1@gmail.com', 'This is the best recipe. Thank you much.', '2024-04-01 15:33:50', 1, '2024-04-11 07:49:51'),
(4, 1, 'kazuki', 'kazuki@gmail.com', 'I love your recipe.', '2024-04-01 16:50:40', 1, '2024-04-08 17:16:16'),
(5, 5, 'dusty owusu', 'dustyowusu@gmail.com', 'Nice recipe. I like it', '2024-04-10 19:43:36', 1, '2024-04-10 19:44:52'),
(6, 2, 'shahana', 'shana@gmail.com', 'The best recipe ever', '2024-04-04 16:33:56', 1, '2024-04-11 07:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblenquiry`
--

CREATE TABLE `tblenquiry` (
  `id` int(11) NOT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `userEmail` varchar(200) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `commentMessage` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `adminRemark` mediumtext DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblenquiry`
--

INSERT INTO `tblenquiry` (`id`, `userName`, `userEmail`, `subject`, `commentMessage`, `postingDate`, `adminRemark`, `updationDate`) VALUES
(3, 'hgff', 'rectifyingissues@gmail.com', 'hjkkhg fbb', 'sdfsaghh brhrfhh fhh dgdg', '2024-04-06 15:05:50', NULL, NULL),
(4, 'Osei Owusu', 'kwakuansahisaac@gmail.com', 'Nice website with nice recipes.', 'I really love your website. I would be grateful to see more recipes added everyday. Thanks.', '2024-04-10 11:21:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `ID` int(11) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` text DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `UpdationDate`) VALUES
(1, 'aboutus', 'Kazuki Recipe', '<div style=\"text-align: justify;\">We are pleased to welcome you to Kazuki Recipe, where we honour the blending of regional cooking customs with the depth of European cooking. Come along with us on a culinary journey that honours diversity, beauty and the delight of enjoying delectable meals with those you love.</div>', '2024-04-11 02:49:34'),
(2, 'contactus', 'Contact Us', '<div style=\"text-align: center;\" bis_skin_checked=\"1\"><b><u>Kazuki Recipe&nbsp;</u></b></div><div bis_skin_checked=\"1\"><b>Address:&nbsp; &nbsp; &nbsp;134, John Street, Aberdeen, United Kingdom AB25 1LE</b></div><div bis_skin_checked=\"1\"><b>Telephone: </b>07917734377</div><div bis_skin_checked=\"1\"><b>Email</b>: kazukirecipe@gmail.com<br><div bis_skin_checked=\"1\"><b>Youtube: </b>youtube.com/@KazukiRecipe</div><div bis_skin_checked=\"1\"><b>Instagram: </b>instagram.com/@KazukiRecipe</div></div>', '2024-04-11 08:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `tblrecipes`
--

CREATE TABLE `tblrecipes` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `recipeTitle` varchar(255) DEFAULT NULL,
  `recipePrepTime` int(11) DEFAULT NULL,
  `recipeCookTime` int(11) DEFAULT NULL,
  `recipeYields` int(11) DEFAULT NULL,
  `recipeIngredients` mediumtext DEFAULT NULL,
  `recipeDescription` mediumtext DEFAULT NULL,
  `recipePicture` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `category` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblrecipes`
--

INSERT INTO `tblrecipes` (`id`, `userId`, `recipeTitle`, `recipePrepTime`, `recipeCookTime`, `recipeYields`, `recipeIngredients`, `recipeDescription`, `recipePicture`, `postingDate`, `category`, `country`) VALUES
(2, 1, 'New Banana Bread', 60, 50, 4, '1⁄2 cup butter, softened,1 cup granulated sugar,2 eggs, beaten,3 bananas, finely crushed (for serious and extreme moist and delicious, try 4 bananas),1 1⁄2 cups all-purpose flour,1 teaspoon baking soda,1⁄2 teaspoon salt,1⁄2 teaspoon vanilla (optional)', 'Remove odd pots and pans from oven.\r\nPreheat oven to 350º / 180º.\r\nCream together butter and sugar.\r\nAdd eggs and crushed bananas.\r\nCombine well.\r\nSift together flour, soda and salt. Add to creamed mixture. Add vanilla.\r\nMix just until combined. Do not overmix.\r\nPour into greased and floured loaf pan.\r\nBake at 350º / 180º for 50 minutes.\r\nKeeps well, refrigerated.', 'd3874240152e0e68e44ee02005fac3f9.jpg', '2023-08-11 17:49:07', 'Lunch', 'Ghana'),
(3, 2, 'Egg Curry Indian Style Recipe', 40, 40, 6, '1 Onions Chopped,1/2 inch Ginger,5 – 6 Garlic Pods.,1 medium Fresh Green Chilli,1/4 tsp Sugar,1 tsp Coriander Powder,1 tsp Cumin Powder,1/2 tsp Red Chilli Powder,1/4 tsp Garam Masala Powder,3 -4 Fresh Tomatoes Grinded,1/4 cup Curd,4 Eggs Boiled,2 tbsp oil', 'Add the onions, ginger, garlic, and green chilies to a blender and blend until smooth.\r\nTo cook, add two tablespoons of oil to a heated kadai.\r\nAdd the bay leaf and 1/4 teaspoon of sugar.\r\n\r\nAdd the garlic-onion paste right now.\r\nContinue stirring and cooking until the paste becomes deeply browned.\r\nThe red chilli powder, garam masala powder, cumin powder, and coriander powder are now added while the flame is lowered. Cook while adding 1/2 table water until the water evaporates.\r\nInclude the tomato puree now.\r\nCook it till the oil appears.\r\nStir in the curd well.\r\nStir and simmer until all of the curd is gone and all of the oil has been liberated from the masala.\r\nAt this stage 1 cup water and let it boil.\r\nYou can add salt at this stage.\r\nMeanwhile slice the eggs into half.\r\nOnce the gravy acquires desired consistency, place the sliced eggs in the curry. You can even crush the yolk of one of the eggs and put in the curry. This gives a nice body to the egg curry.\r\nGarnish the curry with chopped green coriander.\r\nNow add one cup of water and bring to a boil.\r\nAt this point, salt can be added.\r\nIn the interim, cut the eggs in half.\r\nAdd the sliced eggs to the curry after the gravy reaches the desired consistency. One egg yolk can even be crushed and added to the curry. This gives the curry made with eggs a good body.\r\nSprinkle chopped green coriander over the curry.', 'd971e878a2b40360ea87a4caafea6463.jpg', '2023-08-13 16:35:20', 'Lunch', 'Italy'),
(5, 3, 'Rice Recipe', 30, 60, 8, '1 cup basmati rice – 190 grams,3 tablespoons Ghee (clarified butter),15 to 18 cashews,1 tablespoon raisins (without seeds),⅓ cup thinly sliced onions – 50 grams or 1 medium-sized,1.75 to 2 cups water for stove-top pan and 1.25 cups for instant pot,⅓ teaspoon rock salt (edible and food grade) or add as required,1 to 2 tablespoons chopped coriander leaves (cilantro) for garnish', 'Rice is a staple in Indian Cuisine. Obviously, apart from simple steamed rice, a variety of rice dishes are made in Indian cuisine. In this category, you will find vegetarian and vegan rice recipes. Some of the rice recipes are naturally gluten-free too.\r\nWe have steamed rice with lentils (dal) and curries. Apart from steamed rice being cooked in almost every household, there are some other standalone recipes that are exclusively made with rice.\r\nIn the Southern & Eastern India, rice is cooked everyday for lunch or dinner. While the Northern India has roti (whole wheat flat bread) as a regular staple. But in most Indian homes, you will find either roti or rice regularly in their meals.\r\nHere you will find a huge collection of 119 rice recipes. Many of them are from the Indian cuisine and some from asian and world cuisine. You will also find many varieties of biryani and pulao recipes.', '97eedccb82672ec52a5d0cecb3ad600b.jpg', '2023-08-14 19:42:43', 'Lunch', 'India'),
(10, 4, 'Egg Curry Mali Style Recipe', 70, 60, 7, 'Egg,Onion (finely chopped),Tomato (finely chopped),Ginger-garlic paste,Green chilies (slit),Curry leaves,Turmeric powder,Water', 'This is a basic recipe for curry made with eggs:\r\nFirst, bring the eggs to a boil: Put the eggs into a pot and pour water over them. Put the water on medium-high heat and bring it to a boil. After the eggs begin to boil, lower the heat and simmer them for nine to ten minutes. After that, take the eggs off of the heat source, pour the hot water out, and place them in a dish of cool water. Peel off the shells after they have cooled fully.\r\nHeat a tablespoon of oil or ghee in a pan over medium heat. This can be done in a big pan or skillet.\r\nOnions are sautéed when they are added to hot oil after being coarsely sliced and cooked till golden brown. To avoid burning, stir from time to time.\r\nSpices and ginger-garlic paste should be added after the onions are cooked. Sauté the paste for one minute to get rid of the raw scent. Next, incorporate the red chilli powder, cumin, coriander, and turmeric powders along with a small amount of salt. Toss to thoroughly blend the spices and onions.\r\nCook the tomatoes: Place the finely chopped tomatoes in the pan and cook for about 10 minutes, or until they are mushy and soft. To keep from sticking, stir from time to time.\r\nPrepare the curry base: Once the tomatoes are cooked, you can either use a blender to puree the mixture or continue cooking it as it is for a chunkier texture.\r\nAdd water and simmer: Pour water into the pan, depending on your desired consistency of the curry. Stir well and let the mixture simmer for a few minutes to allow the flavors to blend together.\r\nAdd the boiled eggs: Make sure the boiled eggs are completely covered in the curry sauce by gently adding them in. To give the eggs time to absorb the flavours, lower the heat to low and simmer the curry for a further five to seven minutes.\r\nTaste the curry and adjust the salt and spices to your preferred level. Then, add the garnish. Lastly, add some fresh coriander leaves as a garnish.\r\nServe: After taking the pan off of the hob, move the egg curry to a platter. It goes nicely with naan, roti (Indian bread), or steaming rice. Savour the delectable curry of eggs!', '59085b19223e40ec9e3f0add9ab38f72.jpg', '2024-04-06 09:57:21', 'Dinner', 'Mali'),
(13, 4, 'Fufu', 60, 30, 5, 'Cassava: 2 pounds (approximately 900 grams),Plantains: 2 ripe plantains,Water: Sufficient amount for boiling,Salt: 1 teaspoon (optional, for seasoning)', 'An easy recipe to make fufu with plantains and cassava is as follows:\r\nPlantains and cassava should be peeled and sliced. Peeling the plantains and cassava should come first. For easy cooking, cut them into small parts.\r\nBoil the plantains and cassava: Place the plantain and cassava slices in a big saucepan with enough water to cover them. Over medium-high heat, bring the water to a boil. Boil the water and add the cassava and plantains. Cook until the potatoes are mushy and tender. In most cases, this takes 20 to 30 minutes.\r\nDrain the water: Gently remove the water from the pot when the plantains and cassava have finished cooking.\r\nPulverise the plantains and cassava. Spoon the cooked plantains and cassava into a big bowl or a fufu pounding board. \r\nMash them together with a wooden pestle or a fufu masher. Mash them with pressure until a smooth, cohesive mixture forms. This can take several minutes and requires considerable effort.\r\nForm the fufu: Using your hands, gently press the mashed potato into little oblong or spherical pieces. To keep your hands from sticking, wet them with water.\r\nServe: A variety of West African soups and stews, such as egusi soup, groundnut soup, or palm nut soup, are typically served with fufu. Typically, you take off a tiny piece of fufu, roll it into a ball, and then dip it into the soup or stew that goes with it.', '6c9f847ca62b91ea6764e189fa04480c.jpg', '2024-04-08 04:53:24', 'Lunch', 'Ghana'),
(14, 4, 'googe', 30, 23, 12, 'BE,HF,OP,SD,OL,QW', 'TJTJJE DIDIINfbkb fbifigj gfggj\r\nhjgj hh', '8b241914e252c47eff75b7d9b106a30f.jpg', '2024-04-08 14:44:56', 'Lunch', 'Andorra'),
(15, 4, 'kelewele', 20, 30, 5, 'plaintain,salt,water,garlic,groundnut', 'it is very delicious and nice', '37068c3c4e9f7144264ed0a2619aded4.jpg', '2024-04-08 16:32:20', 'Lunch', 'Bahamas'),
(16, 4, 'fried rice', 76, 34, 7, 'rice,salt,water,spaghetti', 'Pour the rice into the pot. Add salt and a little water to cover the rice.\r\nPut on fire for about 20 to 30 minutes.\r\nRemove and serve with stew.', '096d37527eac9a0a507fd1202e1065e2.jpg', '2024-04-10 18:54:17', 'Dinner', 'Venezuela'),
(17, 6, 'egg salad', 70, 45, 9, 'egg,cucumber,spinach', 'Slice all the ingredients. Then add a little salt and water and boil with egg for 10 minutes.\r\nServe to about 9 people.', 'f0881d4384a1ef2a7490bc08a8492638jpeg', '2024-04-10 19:02:22', 'Dessert', 'Barbados');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `Email`, `MobileNumber`, `Password`, `RegDate`) VALUES
(6, 'Isaac Osei-Owusu', 'kwakuansahisaac@gmail.com', 7917734377, 'afe1c36ae219958f4fca20fd8dd1be66', '2024-04-10 18:58:20'),
(7, 'NORA AGYEKUM', 'noraagyekum1@gmail.com', 249746992, 'af76dfc74ae1691e6a55e4ae14197dc3', '2024-04-11 10:51:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblrecipes`
--
ALTER TABLE `tblrecipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblrecipes`
--
ALTER TABLE `tblrecipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
