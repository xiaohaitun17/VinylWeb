-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost:8889
-- 生成日期： 2023-05-03 02:33:38
-- 服务器版本： 5.7.34
-- PHP 版本： 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `newww`
--

-- --------------------------------------------------------

--
-- 表的结构 `album`
--

CREATE TABLE `album` (
  `album_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `artist` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `recordCompany` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `album`
--

INSERT INTO `album` (`album_id`, `image`, `name`, `year`, `rating`, `artist`, `genre`, `recordCompany`) VALUES
(1, 'https://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png', 'Dark Side of the Moon', 1973, '4.5', 'Pink Floyd', 'Progressive Rock', ' Harvest  Capitol'),
(2, 'https://upload.wikimedia.org/wikipedia/en/f/fb/FMacRumours.PNG', 'Rumours', 1977, '4.4', ' Fleetwood Mac', 'Pop Rock', 'Warner Bros'),
(3, 'https://upload.wikimedia.org/wikipedia/en/7/7a/Born_to_Run_%28Front_Cover%29.jpg', 'Born to Run', 1975, '4.4', 'Bruce Springsteen', 'Rock', ' Columbia'),
(4, 'https://upload.wikimedia.org/wikipedia/en/2/20/Hotel_California_by_the_Eagles_US_vinyl_single.png', 'Hotel California', 1976, '4.3', 'The Eagles', 'Rock', 'Asylum'),
(5, 'https://upload.wikimedia.org/wikipedia/en/2/26/Led_Zeppelin_-_Led_Zeppelin_IV.jpg', 'Led Zeppelin IV', 1971, '4.3', ' Led Zeppelin', 'Hard Rock', 'Atlantic'),
(9, 'https://upload.wikimedia.org/wikipedia/en/e/e2/Songs_in_the_key_of_life.jpg', 'Songs in the Key of Life', 1976, '4.2', ' Stevie Wonder', 'Pop', ' Tamla'),
(10, 'https://upload.wikimedia.org/wikipedia/en/5/55/Michael_Jackson_-_Thriller.png', 'Thriller', 1982, '4.4', ' Michael Jackson', 'Pop', ' Epic'),
(11, 'https://upload.wikimedia.org/wikipedia/en/2/28/Channel_ORANGE.jpg', 'Channel Orange', 2012, '4.1', ' Frank Ocean', 'R&B', 'Def Jam'),
(12, 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg', 'Blonde', 2016, '4.0', ' Frank Ocean', 'R&B', ' Boys Don\'t Cry'),
(13, 'https://upload.wikimedia.org/wikipedia/en/5/51/Best_of_Muddy_Waters_1958_Chess_Records.jpg', 'The Best of Muddy Waters', 1958, '3.8', ' Muddy Waters', 'Blues', 'I Just Want To Make Love To You'),
(14, '', 'The Miseducation of Lauryn Hill', 1998, NULL, ' Lauryn Hill', 'R&B', ' Ruffhouse'),
(15, '', 'Blonde', 2016, NULL, ' Frank Ocean', 'R&B', ' Boys Don\'t Cry'),
(16, '', 'The Joshua Tree', 1987, '4.2', 'U2', 'Pop Rock', 'Island'),
(17, '', 'The Beatles (The White Album)', 1968, '4.0', 'The Beatles', 'Pop Rock', 'Apple'),
(18, '', 'Sgt. Pepper\'s Lonely Hearts Club Band', 1967, '4.1', ' The Beatles', 'Pop Rock', 'Parlophone');

-- --------------------------------------------------------

--
-- 表的结构 `collection`
--

CREATE TABLE `collection` (
  `collection_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `collection`
--

INSERT INTO `collection` (`collection_id`, `user_id`, `album_id`) VALUES
(1, 1, 1),
(4, 1, 2),
(5, 1, 5),
(6, 2, 1),
(7, 2, 9),
(8, 2, 5),
(9, 2, 6),
(10, 2, 7),
(11, 1, 11),
(12, 5, 1),
(15, 7, 1),
(17, 7, 4),
(18, 8, 2),
(19, 8, 1),
(20, 8, 4);

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`comment_id`, `content`, `time`, `user_name`, `album_id`) VALUES
(1, 'it is very good', '2023-04-22 00:00:00', 'jack', 2),
(2, 'it is so cool', '2023-4-25 15:14:59', 'jack', 1),
(3, 'I like it', '2023-4-25 15:19:17', 'marry', 1),
(4, 'kkkk', '2023-4-25 19:42:44', 'jack', 3),
(5, 'kkkkkkk', '2023-4-25 19:43:42', 'jack', 2),
(6, 'kkkk', '2023-4-25 19:45:05', 'jack', 1),
(7, 'mmm', '2023-4-25 20:55:03', 'jack', 1),
(8, 'I feel like you were made for this genre! Great song choice!', '2023-4-27 15:59:58', 'xiaohaitun17', 1),
(9, 'Looking forward to listening to your next song ', '2023-4-27 16:54:44', 'xiaohaitun', 2),
(10, 'hello hello', '2023-5-3 02:06:09', 'zoel', 3);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `password`, `email`, `birthday`, `gender`, `name`) VALUES
(1, '123', '', NULL, NULL, 'jack'),
(2, '111', '', NULL, NULL, 'marry'),
(3, '666', '', NULL, NULL, 'mark'),
(4, 'password10', 'user10user10@gmail.com', NULL, NULL, 'user10'),
(5, 'xiaohaitun17', 'xiaohaitun17@gmail.com', NULL, NULL, 'xiaohaitun17'),
(6, 'xiaohaitun', 'xiaohaitun@gmail.com', '1999-03-31T23:00:00.000Z', NULL, 'xiaohaitun'),
(7, 'xiaohai', 'xiaohai@gmail.com', '1999-04-18T23:00:00.000Z', NULL, 'xiaohai'),
(8, 'byea3d', 'zoel@gmail.com', '2023-05-02T23:00:00.000Z', NULL, 'zoel');

-- --------------------------------------------------------

--
-- 表的结构 `vinly`
--

CREATE TABLE `vinly` (
  `vinly_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vinly`
--

INSERT INTO `vinly` (`vinly_id`, `name`, `album_id`) VALUES
(1, ' Speak to Me', 1),
(2, ' Breathe', 1),
(3, ' On the Run', 1),
(4, ' Time', 1),
(5, ' The Great Gig in the Sky', 1),
(6, ' Money', 1),
(7, ' Us and Them', 1),
(8, ' Any Colour You Like', 1),
(9, ' Brain Damage', 1),
(10, ' Eclipse', 1),
(11, ' Second Hand News', 2),
(12, ' Dreams', 2),
(13, ' Never Going Back Again', 2),
(14, ' Don\'t Stop', 2),
(15, ' Go Your Own Way', 2),
(16, ' Songbird', 2),
(17, ' The Chain', 2),
(18, ' You Make Loving Fun', 2),
(19, ' I Don\'t Want to Know', 2),
(20, ' Oh Daddy', 2),
(21, ' Gold Dust Woman', 2),
(22, ' Thunder Road', 3),
(23, ' Tenth Avenue Freeze-Out', 3),
(24, ' Night', 3),
(25, ' Backstreets', 3),
(26, ' Born to Run', 3),
(27, ' She\'s the One', 3),
(28, ' Meeting Across the River', 3),
(29, ' Jungleland', 3),
(30, ' Hotel California', 4),
(31, ' New Kid in Town', 4),
(32, ' Life in the Fast Lane', 4),
(33, ' Wasted Time', 4),
(34, ' Wasted Time (Reprise)', 4),
(35, ' Victim of Love', 4),
(36, ' Pretty Maids All in a Row', 4),
(37, ' Try and Love Again', 4),
(38, ' The Last Resort', 4),
(39, ' Black Dog', 5),
(40, ' Rock and Roll', 5),
(41, ' The Battle of Evermore', 5),
(42, ' Stairway to Heaven', 5),
(43, ' Misty Mountain Hop', 5),
(44, ' Four Sticks', 5),
(45, ' Going to California', 5),
(46, ' When the Levee Breaks', 5),
(47, ' Start', 11),
(48, ' Thinkin Bout You', 11),
(49, ' Fertilizer', 11),
(50, ' Sierra Leone', 11),
(51, ' Sweet Life', 11),
(52, ' Not Just Money', 11),
(53, ' Super Rich Kids', 11),
(54, ' Pilot Jones', 11),
(55, ' Crack Rock', 11),
(56, ' Pyramids', 11),
(58, ' White', 11),
(59, 'Long Distance Call', 13),
(60, 'Louisiana Blues', 13),
(61, 'Honey Bee', 13),
(62, 'Rollin\' Stone', 13),
(63, 'I\'m Ready', 13),
(64, 'Hoochie Coochie Man', 13),
(65, 'She Moves Me', 13),
(66, 'I Want You To Love Me', 13),
(67, 'Standing Around Crying', 13),
(68, 'Still A Fool', 13),
(69, 'I Can\'t Be Satisfied\"', 13);

--
-- 转储表的索引
--

--
-- 表的索引 `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`);

--
-- 表的索引 `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`collection_id`);

--
-- 表的索引 `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- 表的索引 `vinly`
--
ALTER TABLE `vinly`
  ADD PRIMARY KEY (`vinly_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `collection`
--
ALTER TABLE `collection`
  MODIFY `collection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `vinly`
--
ALTER TABLE `vinly`
  MODIFY `vinly_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
