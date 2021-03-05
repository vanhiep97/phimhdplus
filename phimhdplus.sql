-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 16, 2018 lúc 06:35 PM
-- Phiên bản máy phục vụ: 10.1.31-MariaDB
-- Phiên bản PHP: 7.1.15

SET
SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET
AUTOCOMMIT = 0;
START TRANSACTION;
SET
time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phimhdplus`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories`
(
    `id`         int(10) UNSIGNED NOT NULL,
    `name`       varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `type`       int(11) NOT NULL,
    `parent_id`  int(11) NOT NULL DEFAULT '0',
    `disable`    int(11) NOT NULL DEFAULT '0',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `parent_id`, `disable`, `created_at`, `updated_at`)
VALUES (1, 'Phim Bộ', 2, 0, 0, NULL, NULL),
       (2, 'Phim Lẻ', 1, 0, 0, NULL, NULL),
       (3, 'Phim Chiếu Rạp', 1, 0, 0, NULL, NULL),
       (4, 'Phim Truyền Hình', 2, 0, 0, NULL, NULL),
       (5, 'Hài Hước', 2, 1, 0, NULL, NULL),
       (9, 'Tình Cảm - Lãng Mạn', 2, 1, 0, '2018-04-13 09:42:38', '2018-04-13 09:42:38'),
       (10, 'Hành Động', 2, 1, 0, '2018-04-13 09:42:54', '2018-04-13 09:42:54'),
       (11, 'Hành Động', 1, 2, 0, '2018-04-17 11:23:50', '2018-04-17 11:23:50'),
       (12, 'Tình Cảm - Lãng Mạn', 1, 2, 0, '2018-04-17 11:24:04', '2018-04-17 11:24:04'),
       (13, 'Hài Hước', 1, 2, 0, '2018-04-17 11:24:17', '2018-04-17 11:24:17'),
       (14, 'Kinh Dị', 2, 1, 0, '2018-04-17 11:24:49', '2018-04-17 11:24:49'),
       (15, 'Thần Thoại', 2, 1, 0, '2018-04-17 11:24:56', '2018-04-17 11:24:56'),
       (16, 'Viễn Tưởng', 2, 1, 0, '2018-04-17 11:25:22', '2018-04-17 11:25:22'),
       (17, 'Cổ Trang', 2, 1, 0, '2018-04-17 11:25:33', '2018-04-17 11:25:33'),
       (18, 'Chiến Tranh', 2, 1, 0, '2018-04-17 11:25:58', '2018-04-17 11:25:58'),
       (19, 'Âm Nhạc', 2, 1, 0, '2018-04-17 11:26:25', '2018-04-17 11:26:25'),
       (20, 'Võ Thuật', 2, 1, 0, '2018-04-17 11:26:40', '2018-04-17 11:26:40'),
       (21, 'Cổ Trang', 1, 2, 0, '2018-04-17 11:26:50', '2018-04-17 11:26:50'),
       (22, 'Võ Thuật', 1, 2, 0, '2018-04-17 11:26:55', '2018-04-17 11:26:55'),
       (23, 'Kinh Dị', 1, 2, 0, '2018-04-17 11:27:01', '2018-04-17 11:27:01'),
       (24, 'Hoạt Hình', 2, 1, 0, '2018-04-17 11:27:13', '2018-04-17 11:27:13'),
       (25, 'Hoạt Hình', 1, 2, 0, '2018-04-17 11:27:21', '2018-04-17 11:27:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `films`
--

CREATE TABLE `films`
(
    `id`         int(10) UNSIGNED NOT NULL,
    `name`       varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `poster`     varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `about`      text COLLATE utf8mb4_unicode_ci         NOT NULL,
    `actor`      text COLLATE utf8mb4_unicode_ci         NOT NULL,
    `director`   text COLLATE utf8mb4_unicode_ci         NOT NULL,
    `category`   text COLLATE utf8mb4_unicode_ci         NOT NULL,
    `tags`       text COLLATE utf8mb4_unicode_ci,
    `is_slide`   int(11) NOT NULL DEFAULT '0',
    `disable`    int(11) NOT NULL DEFAULT '0',
    `type`       int(11) NOT NULL,
    `view`       int(11) NOT NULL DEFAULT '0',
    `total_vote` int(11) NOT NULL DEFAULT '5',
    `episode`    int(11) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `films`
--

INSERT INTO `films` (`id`, `name`, `poster`, `about`, `actor`, `director`, `category`, `tags`, `is_slide`, `disable`,
                     `type`, `view`, `total_vote`, `episode`, `created_at`, `updated_at`)
VALUES (5, 'Lời Nguyền Bí Ẩn',
        'https://2.bp.blogspot.com/-MvlNVEnbfLE/WtXpLiePDFI/AAAAAAAAtHo/ql9H2teC6ckJ5eKb5sPO-pHD8ACM_pOuACHMYCw/s0/poster.medium.jpg',
        'Năm 1953, giữa lúc Chiến tranh Đại Tây Dương ở châu Á xảy ra thì tại Bangkok, Thái Lan, xuất hiện những trường hợp giết người kinh hoàng. Trên các xác chết luôn có những hình xăm bí ẩn ở cổ tay, trán và mắt cá chân. Đây chính là sự mở đầu cho vụ thảm sát hàng loạt kỳ lạ ở Bangkok.Một ngày nọ, thanh tra Pol.lt Col Waytag Phiromruj (Pong Nawat) báo cáo tìm thấy một cô gái chết tại ngôi đền Rakung Dusitraram. Cơ thể cô giống như bị đầu độc còn đầu thì bị bắn từ đằng sau cho tới khi bị vỡ.\r\n\r\nHọ nhìn thấy 5 từ xăm lần lượt là Yao, Jao, Pae, Ting, Pong. Chưa dừng lại ở đó, những cái chết vẫn tiếp tục diễn ra trong thời gian ngắn. Mỗi sự kiện đều có những móc nối kì lạ với những hình xăm khác nhau. Khi cảnh sát cố gắng kết nối các bằng chứng có được lại với nhau, cuộc điều tra lại bị cản trở bởi những tình huống bí ẩn. Vậy kẻ sát nhân là ai? Mục đích và ý nghĩa các hình xăm là gì?',
        'N/A', 'Anuchit, Thongwattana Dilok', '[2,\"23\"]', NULL, 1, 0, 1, 1, 5, 1, '2018-04-17 10:07:21',
        '2018-04-17 11:31:17'),
       (8, 'Phượng Tu Hoàng',
        'https://2.bp.blogspot.com/-Yn5VpTqI_uo/WlzLqhkC26I/AAAAAAAAri0/tolDRGNGlCQVeo8gYKvCw3-QXA52kO4CQCHMYCw/s0/poster.medium.jpg',
        'Trong phim Phượng Tù Hoàng, Sơn Âm công chúa là một nàng công chúa nổi tiếng hoang dâm, ham mê nam sắc, nuôi dưỡng vô số sủng nam trong phủ. Sở Ngọc một mặt giả vờ dâm loạn, một mặt tính kế để bồi dưỡng tâm phúc. Thế nhưng, lại có một Dung Chỉ xuất chúng hơn người, luôn luôn lạnh lùng âm hiểm và đầy mưu mô mà Sở Ngọc thì lại dần dần lại nảy sinh tình cảm với chàng trai ấy.',
        'Trương Hinh Dư, Quan Hiểu Đồng, Tống Uy Long, Trương', 'Vu Chính', '[1,\"9\",\"17\",\"20\"]', NULL, 1, 0, 2,
        15, 4, 53, '2018-04-17 10:43:17', '2018-04-18 19:42:27'),
       (12, 'Thiên Tài Lừa Đảo',
        'https://2.bp.blogspot.com/-h6BUNLCyZ10/WrxOukUXJFI/AAAAAAAAsxk/ulU1lxVoUQITToskM_UG8VU2gnBT0RjrQCHMYCw/s0/1-201803846.jpg',
        'Phim Switch: Change the World Một người đàn ông là một kẻ lừa đảo. Anh ta đủ thông minh để tham dự kỳ thi thanh tra, nhưng anh ta không thể trở thành công tố viên. Không tính đến sự thiên vị và thiên vị của các công tố viên, người đàn ông làm cho bọn tội phạm trả tiền cho những tội ác mà các công tố viên đã không làm.',
        'Jung Woong In, Jang Keun Suk, Shin Do-Hyun, Jang Keun-Suk', 'Baek Woon-Chul', '[1,\"5\",\"9\"]', NULL, 1, 0, 2,
        0, 5, 12, '2018-04-17 11:17:59', '2018-04-17 11:23:17'),
       (13, 'Phong Vân Thượng Hải',
        'https://2.bp.blogspot.com/-rhKBX0Hc4F0/WtIvVidRP4I/AAAAAAAAtC8/Q3NY5phvMUMZ3bUiH2eAfLIlA4luhupQgCHMYCw/s0/magic-city-2017-201804268.jpg',
        'Trong những năm 1930, cha của Diệp Phi sau khi chiến thắng thử thách với nhà ảo thuật người Đức đã bị hãm hại, khủng bố, tra tấn và cuối cùng đã qua đời. Diệp Phi (Kinh Siêu) đã quay trở lại Thượng Hải để tìm cách trả thù cho cha mình. Anh được Tiêu Dao (Châu Đông Vũ), con gái của ông chủ băng đảng Thượng Hải ngưỡng mộ. Chiến tranh với quân Nhật Bản xảy ra, cả hai cùng bước đi chung trên con đường kháng Nhật đầy nguy hiểm sinh tử.',
        'Nhậm Đạt Hoa, Châu Đông Vũ, Kinh Siêu', 'N/A', '[1,\"10\",\"20\"]', NULL, 1, 0, 2, 0, 5, 10,
        '2018-04-17 11:21:44', '2018-04-17 11:30:58'),
       (14, 'Quý Ông Của Tôi',
        'https://2.bp.blogspot.com/-_PLQzmLul84/WrMdTSDevwI/AAAAAAAAsp0/I-BIdQTDj94KLREkJecsRgoj7qJe4ftKQCHMYCw/s0/2-201803613.jpg',
        'Phim Quý Ông Của Tôi xoay quanh ba anh em ruột với những cách sống khác nhau và một người phụ nữ lạnh nhạt, xa cách phải chịu nhiều đau khổ trong cuộc đời. Cả 4 người đang học cách tận hưởng cuộc sống và hàn gắn vết thương trong quá khứ.',
        'n/a', 'n/a', '[1,\"5\",\"9\"]', NULL, 1, 0, 2, 0, 5, 10, '2018-04-17 11:35:08', '2018-04-17 11:35:08'),
       (15, 'Nghịch Duyên',
        'https://2.bp.blogspot.com/-7-yqAmAkwYE/WsRSJ9jMJsI/AAAAAAAAs30/Jd1Cs1EywuMiL4oGkBVXmy4QGuBJ8N3qQCHMYCw/s0/daddy-cool-2018-201804513.jpg',
        'Sau trận chiến tranh khốc liệt, Chung Định Quốc (do Trần Gia Lạc đóng) vô tình bị đông lạnh trong phòng thí nghiệm bỏ hoang hơn 70 năm. Nhờ cơn mưa giông lớn, Quốc mới được thoát ra ngoài mà vẫn mang hình hài của thời trai trẻ. Quốc tìm lại người con thất lạc – Hạ Hòa Bình (do Khương Đại Vệ đóng). Bình nay vào tuổi trung niên, có một đứa con trai đã lập gia đình, tên là Hạ Vĩnh Niên (do Lê Diệu Tường đóng). Tiếc thay, cả Bình và Niên đều cực kỳ tham lam và ích kỷ. Bình thường xuyên kiếm chuyện để lấy hết tiền của Niên, khiến Niên luôn rơi vào cảnh túng quẫn. Còn Niên hành nghề bói toán, lợi dụng sự cả tin của người khác để trục lợi, trong đó có nữ đại gia Ông Chỉ Kiều (do Hạ Văn Tịch đóng). Nhìn thấy con và cháu trai của mình bị xã hội tha hóa, Quốc rất đau lòng, quyết tâm dạy dỗ lại Bình và Niên. Chính phủ muốn che giấu lai lịch của Quốc nên cho Quốc làm nhân viên văn phòng tại sở phúc lợi. Nhờ đó, Quốc làm quen với Trang Tư Thần (do Lâm Hạ Vy đóng) – cô cảnh sát nhiệt thành, coi trọng gia đình. Sự can trường, tài trí của Quốc trong các phi vụ điều tra làm cho Thần ngày một ngưỡng mộ và đem lòng yêu Quốc. Nhưng Quốc không thể tiến tới vì mặc cảm tuổi tác. Trong khi đó, cảnh sát điều tra Giả Trác Bân (do Trần Sơn Thông đóng) cũng có ý với Thần. Bân có vẻ ngoài liêm chính, đàng hoàng, nhưng thực tế lại rất gian manh, không từ mọi thủ đoạn. Bân nắm giữ tất cả bí mật của Quốc, Bình, Niên, Kiều và Thần. Nhưng, khi bí mật sắp được hé lộ, Bân đột nhiên bị sát hại một cách kỳ lạ..',
        'Khương Đại Vệ, Lê Diệu Tường, Trần Gia Lạc, Hạ Văn Tịch, Hàn Mã Lợi', 'n/a', '[1,\"5\",\"9\"]', NULL, 0, 0, 2,
        0, 5, 10, '2018-04-17 11:37:05', '2018-04-17 11:37:05'),
       (16, '30 Vẫn Còn Xuân',
        'https://2.bp.blogspot.com/-3h9tGlFSD7U/WkItq69wVeI/AAAAAAAArZ0/Gih06D1zcxw4-il_vIs6idS2lTT8fFtYwCHMYCw/s0/fabulous-30.png',
        'Phim được chuyển thể từ movie nổi tiếng ăn khách cùng tên \"Fabulous 30\" do Aum P và Ken P đóng chính hứa hẹn sẽ là một series vui nhộn hài hước không kém gì bản gốc',
        'Aum Patcharapa Chaichue, Ken Phupoom Phongpanu, Ice Preechaya Pongthananikorn', 'n/a', '[1,\"5\",\"9\"]', NULL,
        1, 0, 2, 1, 5, 8, '2018-04-17 11:39:49', '2018-04-17 11:41:18'),
       (17, 'Công Chúa Tóc Dài',
        'https://2.bp.blogspot.com/-ueH4uyghy6k/VjMhE-0K28I/AAAAAAAAJMg/dFbXtca3lA4/s0/PhimHP.com-Poster-phim-Cong-chua-toc-may-2010.jpg',
        '(Công chúa tóc mây) là câu chuyện về Rapunzel - nàng công chúa có mái tóc dài thần kì bị nhốt suốt 18 năm trời trên ngọn tháp cao chót vót bởi một mụ phù thủy. Mọi chuyện trở nên kịch tính khi tên trộm tinh quái và quyến rũ nhất vương quốc - Flynn Rider - trong cuộc chạy trốn khỏi binh lính triều đình, tình cờ rơi vào ngọn tháp của Rapunzel. Từ đây cô công chúa thơ dại đã bắt đầu chuyến phiêu lưu trốn chạy khỏi ngọn tháp u tối để tìm lại cuộc sống đích thực của chính mình. Dựa trên một câu chuyện cổ tích của anh em nhà Grimm có tiêu đề Rapunzel, bộ phim Tangled được thực hiện dưới dạng 3-D và do diễn viên kiêm ca sỹ Mandy Moore lồng tiếng vai Rapunzel, cùng với sự tham gia của các diễn viên lồng tiếng nổi tiếng khác như Zachary Levi, Donna Murphy, Ewan McGregor và Steve Martin.',
        'Zachary Levi, Donna Murphy, Ron Perlman, Jeffrey Tambor, Brad Garrett, Bob Bergen, Mandy Moore, M.c. Gainey, Paul F. Tompkins, Richard Kiel, Delaney Rose Stein, Nathan Greno, Byron Howard, Tim Mertens, Michael Bell',
        'Nathan Greno Byron Howard 1', '[2,\"12\",\"13\",\"25\"]', NULL, 0, 0, 1, 0, 5, 1, '2018-04-17 11:41:06',
        '2018-04-17 11:41:06'),
       (18, 'Thiên Tài Bất Hảo',
        'https://2.bp.blogspot.com/-GON6sn64U-k/WhYhPTTwwkI/AAAAAAAAq_M/v9G9Gmqaie8_bKBSyjMTwiJLshJBgtyagCHMYCw/s0/preview.medium.jpg',
        'Bad Genius không chỉ là gian lận thi cử mà là cả một “phi vụ” kiếm tiền của một nhóm học sinh cấp 3. Kẻ cầm đầu là thiên tài toán học Lynn (Chutimon Chuengcharoensukying) bắt đầu “hành nghề” chỉ bài cho bạn cùng trường gian lận để kiếm tiền. Câu chuyện bắt đầu khi Lynn “giúp đỡ” cho 5 cô cậu con nhà giàu trong trường với mức giá 3000 baht một môn. Nhưng thật không may, phi vụ thất bại, thiên tài quay cóp bị tố và bị bắt tại trận.\r\n\r\nChuyện gì sẽ xảy ra với thiên tài một khi kế hoạch bị lật tẩy, đồng bọn của cô sẽ xử trí thế nào để cứu cô? Và những mánh khoé gian lận phòng thi sẽ được bóc trần, chưa bao giờ chuyện thi cử lại trở lên ly kỳ và hồi hộp đến như vậy\".',
        'Thaneth Warakulnukroh, Ego Mikitas, Sahajak Boonthanakit, Chutimon Chuengcharoensukying, Eisaya Hosuwan, Teeradon Supapunpinyo, Chanon Santinatornkul, Sarinrat Thomas, Pasin Kuansataporn, Kanjana Vinaipanid, Yuthapong Varanukrohchoke, Nopawat Likitwong, Vittawin',
        'N/A', '[2,\"11\",\"12\",\"13\"]', NULL, 1, 0, 1, 0, 5, 1, '2018-04-17 11:43:08', '2018-04-17 11:43:08'),
       (19, 'Em Là Thanh Xuân Của Anh',
        'https://2.bp.blogspot.com/-PirLVQdArsI/WrbU-k-K4kI/AAAAAAAAssc/v0A8V2I9edo0v3n8JoypHwn5zO9FXVKIgCHMYCw/s0/09-39-47-30-10-201803495.jpg',
        'Phim Em Là Thanh Xuân Của Anh: bắt đầu khi Từ Vĩnh Tâm gặp lại bạn học cấp ba Trịnh Đại Uy, gợi lên những kỷ niệm ngọt bùi đắng cay thời học sinh. Mười mấy năm trước, Vĩnh Tâm là một học sinh giỏi, vô cùng nghiêm túc, một sự cố về máy tính xách tay bất ngờ làm cuộc sống của cô va chạm với người bạn cùng lớp Đỗ Á Tu. Càng hiểu về Á Tu, cô càng phát hiện ra trái ngược với vẻ ngoài của một học sinh cá biệt, Á Tu là một chàng trai lương thiện và nhiệt tình. Nhờ có Á Tu, cô nàng một sách Vĩnh Tâm cũng dần mở lòng và kết giao với nhiều bạn bè mới: Anh chàng thể thao Trịnh Đại Uy, người đẹp băng giá Cao Vũ Tuyên và chàng trai ấm áp nho nhã Trịnh Đại Văn. Cùng nhau họ đối mặt với sự bất an và hoài nghi của tuổi mới lớn, cùng chia sẻ những ước mơ và cảm xúc trong trẻo, cùng cười cùng khóc, cùng nhau vấp ngã, nhưng không hề sợ hãi, bởi vì họ biết, luôn có ai đó bên cạnh ủng hộ động viên mình đứng dậy và hướng tới tương lai.',
        'n/a', 'n/a', '[1,\"9\"]', NULL, 0, 0, 2, 0, 5, 24, '2018-04-18 08:21:19', '2018-04-18 08:21:19'),
       (20, 'Tân Tiếu Ngạo Giang Hồ',
        'https://2.bp.blogspot.com/-K8diNEE6-rA/WpRBe8jKMpI/AAAAAAAAsSQ/dbwy5jGFmFIJjOj0wHecj0YrrRUZyJOiQCHMYCw/s0/1.jpg',
        'Tân Tiếu Ngạo Giang Hồ 2018 có độ dài 30 tập và sẽ phát sóng vào 26/2. Danh sách diễn viên tham gia trong phim. Một số nhân vật chú ý trong phim bao gồm: Đinh Quán Sâm vào vai Lệnh Hồ Xung, Trần Tấn vai Lâm Bình Chi, Tiết Hạo Tịnh vai Nhậm Doanh Doanh, Lý Hạo Hàn (Nhạc Bất Quần), Vương Giai Trữ (Nhậm Ngã Hành), Kim Giai Kiệt (Hướng Vấn Thiên), Lưu Gia Đồng (Lam Phượng Hoàng), Quý Đông Nhiên (Điền Bá Quang), Khương Trác Quân (Nghi Lâm)',
        'n/a', 'n/a', '[1,\"9\",\"10\",\"17\",\"20\"]', NULL, 0, 0, 2, 1, 5, 37, '2018-04-18 08:26:53',
        '2018-05-16 03:18:43'),
       (21, 'Khu Phố Giang Hồ',
        'https://2.bp.blogspot.com/-spQrScv2HC4/WtS7tM8CSrI/AAAAAAAAtGM/aYjjQNCPFds-tY42DpcDGEwjFC17TkXSwCHMYCw/s0/2-201804630.jpg',
        'Phim Khu Phố Giang Hồ Trước việc phải giải tán băng nhóm của mình, Cương Chính- một đại ca hết thời- luôn tìm cách kết liễu theo nghi thức Samurai. Thế nhưng, nhiều lần đều thất bại vì vô tính vướng vào một cuộc giao dịch ma túy kỳ quặc của kẻ khác, để rồi trời xui đất xụi góp phần làm sụp đổ băng nhóm khét tiếng của Nhật Bản.',
        'Lưu Dương, Hoàng Khải Tường, Trương Bổn Dục', 'n/a', '[2,\"11\",\"12\",\"22\"]', NULL, 0, 0, 1, 0, 5, 1,
        '2018-04-18 08:37:52', '2018-04-18 08:37:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `film_details`
--

CREATE TABLE `film_details`
(
    `id`          int(10) UNSIGNED NOT NULL,
    `film_id`     int(11) NOT NULL,
    `name`        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `source1`     text COLLATE utf8mb4_unicode_ci,
    `source2`     text COLLATE utf8mb4_unicode_ci,
    `source3`     text COLLATE utf8mb4_unicode_ci,
    `source_vip1` text COLLATE utf8mb4_unicode_ci,
    `source_vip2` text COLLATE utf8mb4_unicode_ci,
    `source_vip3` text COLLATE utf8mb4_unicode_ci,
    `created_at`  timestamp NULL DEFAULT NULL,
    `updated_at`  timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `film_details`
--

INSERT INTO `film_details` (`id`, `film_id`, `name`, `source1`, `source2`, `source3`, `source_vip1`, `source_vip2`,
                            `source_vip3`, `created_at`, `updated_at`)
VALUES (12, 5, 'Lời Nguyền Bí Ẩn',
        'https://lh3.googleusercontent.com/d9O1dugSQl8Ic7qG24diVpSZYSNbEmjcOujsjRHy307QhY-vvyYToX7tSJxmBmos2yHJ8g8oKp83gCYJWQvHXsacb4isLDC1LjMKlHP2Ms1mTJ1mjrnsy6ikSucrzKAetdAVESCY=m22',
        'https://lh3.googleusercontent.com/d9O1dugSQl8Ic7qG24diVpSZYSNbEmjcOujsjRHy307QhY-vvyYToX7tSJxmBmos2yHJ8g8oKp83gCYJWQvHXsacb4isLDC1LjMKlHP2Ms1mTJ1mjrnsy6ikSucrzKAetdAVESCY=m22',
        'https://lh3.googleusercontent.com/d9O1dugSQl8Ic7qG24diVpSZYSNbEmjcOujsjRHy307QhY-vvyYToX7tSJxmBmos2yHJ8g8oKp83gCYJWQvHXsacb4isLDC1LjMKlHP2Ms1mTJ1mjrnsy6ikSucrzKAetdAVESCY=m22',
        'https://lh3.googleusercontent.com/d9O1dugSQl8Ic7qG24diVpSZYSNbEmjcOujsjRHy307QhY-vvyYToX7tSJxmBmos2yHJ8g8oKp83gCYJWQvHXsacb4isLDC1LjMKlHP2Ms1mTJ1mjrnsy6ikSucrzKAetdAVESCY=m22',
        'https://lh3.googleusercontent.com/d9O1dugSQl8Ic7qG24diVpSZYSNbEmjcOujsjRHy307QhY-vvyYToX7tSJxmBmos2yHJ8g8oKp83gCYJWQvHXsacb4isLDC1LjMKlHP2Ms1mTJ1mjrnsy6ikSucrzKAetdAVESCY=m22',
        'https://lh3.googleusercontent.com/d9O1dugSQl8Ic7qG24diVpSZYSNbEmjcOujsjRHy307QhY-vvyYToX7tSJxmBmos2yHJ8g8oKp83gCYJWQvHXsacb4isLDC1LjMKlHP2Ms1mTJ1mjrnsy6ikSucrzKAetdAVESCY=m22',
        '2018-04-17 10:07:41', '2018-04-17 10:07:41'),
       (14, 8, 'Phượng Tu Hoàng - Tập 1',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BeKmI8bYw4MXLRrQ3Y4TsgHu3NJ8zXLrfjBLiy7A2%2F72fPisHR5%2FzHf5NT%2B1OJupM46S0T1V6SCrNdYkLUW8j3t9gL8wj6YNV1RdmV%2BZ4zsM0GzNCvhD67RLOmR%2FyWPO1pSRVtCLftbQ%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BeKmI8bYw4MXLRrQ3Y4TsgHu3NJ8zXLrfjBLiy7A2%2F72fPisHR5%2FzHf5NT%2B1OJupM46S0T1V6SCrNdYkLUW8j3t9gL8wj6YNV1RdmV%2BZ4zsM0GzNCvhD67RLOmR%2FyWPO1pSRVtCLftbQ%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BeKmI8bYw4MXLRrQ3Y4TsgHu3NJ8zXLrfjBLiy7A2%2F72fPisHR5%2FzHf5NT%2B1OJupM46S0T1V6SCrNdYkLUW8j3t9gL8wj6YNV1RdmV%2BZ4zsM0GzNCvhD67RLOmR%2FyWPO1pSRVtCLftbQ%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BeKmI8bYw4MXLRrQ3Y4TsgHu3NJ8zXLrfjBLiy7A2%2F72fPisHR5%2FzHf5NT%2B1OJupM46S0T1V6SCrNdYkLUW8j3t9gL8wj6YNV1RdmV%2BZ4zsM0GzNCvhD67RLOmR%2FyWPO1pSRVtCLftbQ%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BeKmI8bYw4MXLRrQ3Y4TsgHu3NJ8zXLrfjBLiy7A2%2F72fPisHR5%2FzHf5NT%2B1OJupM46S0T1V6SCrNdYkLUW8j3t9gL8wj6YNV1RdmV%2BZ4zsM0GzNCvhD67RLOmR%2FyWPO1pSRVtCLftbQ%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BeKmI8bYw4MXLRrQ3Y4TsgHu3NJ8zXLrfjBLiy7A2%2F72fPisHR5%2FzHf5NT%2B1OJupM46S0T1V6SCrNdYkLUW8j3t9gL8wj6YNV1RdmV%2BZ4zsM0GzNCvhD67RLOmR%2FyWPO1pSRVtCLftbQ%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        '2018-04-17 10:43:44', '2018-04-17 10:43:44'),
       (15, 8, 'Phượng Tu Hoàng - Tập 2',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BXPZ9OOsWRSDppIQEb6O4FyyGNko6VGYNvMDOcmRmNVMMEsCEW%2Ff9waZSnkifQAfIRxj9%2Fm5H4vJknMC6whRN9K%2FYfd4nSrROmoHdgPCoSOrSawv%2FE7eWDr7dAYJ2qjSH4UasMt9krnA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BXPZ9OOsWRSDppIQEb6O4FyyGNko6VGYNvMDOcmRmNVMMEsCEW%2Ff9waZSnkifQAfIRxj9%2Fm5H4vJknMC6whRN9K%2FYfd4nSrROmoHdgPCoSOrSawv%2FE7eWDr7dAYJ2qjSH4UasMt9krnA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BXPZ9OOsWRSDppIQEb6O4FyyGNko6VGYNvMDOcmRmNVMMEsCEW%2Ff9waZSnkifQAfIRxj9%2Fm5H4vJknMC6whRN9K%2FYfd4nSrROmoHdgPCoSOrSawv%2FE7eWDr7dAYJ2qjSH4UasMt9krnA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BXPZ9OOsWRSDppIQEb6O4FyyGNko6VGYNvMDOcmRmNVMMEsCEW%2Ff9waZSnkifQAfIRxj9%2Fm5H4vJknMC6whRN9K%2FYfd4nSrROmoHdgPCoSOrSawv%2FE7eWDr7dAYJ2qjSH4UasMt9krnA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BXPZ9OOsWRSDppIQEb6O4FyyGNko6VGYNvMDOcmRmNVMMEsCEW%2Ff9waZSnkifQAfIRxj9%2Fm5H4vJknMC6whRN9K%2FYfd4nSrROmoHdgPCoSOrSawv%2FE7eWDr7dAYJ2qjSH4UasMt9krnA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BXPZ9OOsWRSDppIQEb6O4FyyGNko6VGYNvMDOcmRmNVMMEsCEW%2Ff9waZSnkifQAfIRxj9%2Fm5H4vJknMC6whRN9K%2FYfd4nSrROmoHdgPCoSOrSawv%2FE7eWDr7dAYJ2qjSH4UasMt9krnA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        '2018-04-17 10:44:27', '2018-04-17 10:44:27'),
       (16, 8, 'Phượng Tu Hoàng - Tập 3',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FOw6XRSvOK%2B1m6THSbMcUOeb51G708LEh7KX%2FEvqoaZ6okVXik8EKL2Ca%2Bj4Aii3ByMDbhiNh9nFWUHS4I%2B%2B%2FWspWqtxxnbYDWd54dfQbGshjNQp%2BjM92RXQHHmw6h32gObWXYyWFUvg%3D%3D&type=video/mp4&title=T%E1%BA%ADp%203%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FOw6XRSvOK%2B1m6THSbMcUOeb51G708LEh7KX%2FEvqoaZ6okVXik8EKL2Ca%2Bj4Aii3ByMDbhiNh9nFWUHS4I%2B%2B%2FWspWqtxxnbYDWd54dfQbGshjNQp%2BjM92RXQHHmw6h32gObWXYyWFUvg%3D%3D&type=video/mp4&title=T%E1%BA%ADp%203%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FOw6XRSvOK%2B1m6THSbMcUOeb51G708LEh7KX%2FEvqoaZ6okVXik8EKL2Ca%2Bj4Aii3ByMDbhiNh9nFWUHS4I%2B%2B%2FWspWqtxxnbYDWd54dfQbGshjNQp%2BjM92RXQHHmw6h32gObWXYyWFUvg%3D%3D&type=video/mp4&title=T%E1%BA%ADp%203%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FOw6XRSvOK%2B1m6THSbMcUOeb51G708LEh7KX%2FEvqoaZ6okVXik8EKL2Ca%2Bj4Aii3ByMDbhiNh9nFWUHS4I%2B%2B%2FWspWqtxxnbYDWd54dfQbGshjNQp%2BjM92RXQHHmw6h32gObWXYyWFUvg%3D%3D&type=video/mp4&title=T%E1%BA%ADp%203%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FOw6XRSvOK%2B1m6THSbMcUOeb51G708LEh7KX%2FEvqoaZ6okVXik8EKL2Ca%2Bj4Aii3ByMDbhiNh9nFWUHS4I%2B%2B%2FWspWqtxxnbYDWd54dfQbGshjNQp%2BjM92RXQHHmw6h32gObWXYyWFUvg%3D%3D&type=video/mp4&title=T%E1%BA%ADp%203%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FOw6XRSvOK%2B1m6THSbMcUOeb51G708LEh7KX%2FEvqoaZ6okVXik8EKL2Ca%2Bj4Aii3ByMDbhiNh9nFWUHS4I%2B%2B%2FWspWqtxxnbYDWd54dfQbGshjNQp%2BjM92RXQHHmw6h32gObWXYyWFUvg%3D%3D&type=video/mp4&title=T%E1%BA%ADp%203%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        '2018-04-17 10:44:55', '2018-04-17 10:44:55'),
       (17, 8, 'Phượng Tu Hoàng - Tập 4',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19Qqx84PLW5lkscQmHUtRa3vE8hp6btOKUNdAi4bYcNNnXblfuA3i8FsklKQmEpaxtx22ySdOPi8czCMXITsLbvTeVhm27ig6x5XniHVoLKMPStUATpYYvwsrg7yk2s1u6vaNUwm14HIA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%204%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19Qqx84PLW5lkscQmHUtRa3vE8hp6btOKUNdAi4bYcNNnXblfuA3i8FsklKQmEpaxtx22ySdOPi8czCMXITsLbvTeVhm27ig6x5XniHVoLKMPStUATpYYvwsrg7yk2s1u6vaNUwm14HIA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%204%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19Qqx84PLW5lkscQmHUtRa3vE8hp6btOKUNdAi4bYcNNnXblfuA3i8FsklKQmEpaxtx22ySdOPi8czCMXITsLbvTeVhm27ig6x5XniHVoLKMPStUATpYYvwsrg7yk2s1u6vaNUwm14HIA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%204%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19Qqx84PLW5lkscQmHUtRa3vE8hp6btOKUNdAi4bYcNNnXblfuA3i8FsklKQmEpaxtx22ySdOPi8czCMXITsLbvTeVhm27ig6x5XniHVoLKMPStUATpYYvwsrg7yk2s1u6vaNUwm14HIA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%204%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19Qqx84PLW5lkscQmHUtRa3vE8hp6btOKUNdAi4bYcNNnXblfuA3i8FsklKQmEpaxtx22ySdOPi8czCMXITsLbvTeVhm27ig6x5XniHVoLKMPStUATpYYvwsrg7yk2s1u6vaNUwm14HIA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%204%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19Qqx84PLW5lkscQmHUtRa3vE8hp6btOKUNdAi4bYcNNnXblfuA3i8FsklKQmEpaxtx22ySdOPi8czCMXITsLbvTeVhm27ig6x5XniHVoLKMPStUATpYYvwsrg7yk2s1u6vaNUwm14HIA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%204%20Ph%C6%B0%E1%BB%A3ng%20T%C3%B9%20Ho%C3%A0ng%20%28Huang%20Feng%20Prison%29%202018%20VietSub%20HD',
        '2018-04-17 10:45:27', '2018-04-17 10:45:27'),
       (19, 12, 'Thiên Tài Lừa Đảo - Tập 1',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19FEjeAs%2Bbk1Brjx%2FCcr5Lfa5wuHWR9GFGUsagW%2Be0xm%2Fu8NpoWE6iMOsG4v2N7DLLm7QdMaHCoXk%2BIKOQ6hf02VgErEy7nsrnLlPOnqLfvL0%2BJ6Ohh7m9S&type=video/mp4&title=T%E1%BA%ADp%201%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19FEjeAs%2Bbk1Brjx%2FCcr5Lfa5wuHWR9GFGUsagW%2Be0xm%2Fu8NpoWE6iMOsG4v2N7DLLm7QdMaHCoXk%2BIKOQ6hf02VgErEy7nsrnLlPOnqLfvL0%2BJ6Ohh7m9S&type=video/mp4&title=T%E1%BA%ADp%201%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19FEjeAs%2Bbk1Brjx%2FCcr5Lfa5wuHWR9GFGUsagW%2Be0xm%2Fu8NpoWE6iMOsG4v2N7DLLm7QdMaHCoXk%2BIKOQ6hf02VgErEy7nsrnLlPOnqLfvL0%2BJ6Ohh7m9S&type=video/mp4&title=T%E1%BA%ADp%201%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19FEjeAs%2Bbk1Brjx%2FCcr5Lfa5wuHWR9GFGUsagW%2Be0xm%2Fu8NpoWE6iMOsG4v2N7DLLm7QdMaHCoXk%2BIKOQ6hf02VgErEy7nsrnLlPOnqLfvL0%2BJ6Ohh7m9S&type=video/mp4&title=T%E1%BA%ADp%201%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19FEjeAs%2Bbk1Brjx%2FCcr5Lfa5wuHWR9GFGUsagW%2Be0xm%2Fu8NpoWE6iMOsG4v2N7DLLm7QdMaHCoXk%2BIKOQ6hf02VgErEy7nsrnLlPOnqLfvL0%2BJ6Ohh7m9S&type=video/mp4&title=T%E1%BA%ADp%201%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19FEjeAs%2Bbk1Brjx%2FCcr5Lfa5wuHWR9GFGUsagW%2Be0xm%2Fu8NpoWE6iMOsG4v2N7DLLm7QdMaHCoXk%2BIKOQ6hf02VgErEy7nsrnLlPOnqLfvL0%2BJ6Ohh7m9S&type=video/mp4&title=T%E1%BA%ADp%201%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        '2018-04-17 11:18:28', '2018-04-17 11:18:28'),
       (20, 12, 'Thiên Tài Lừa Đảo - Tập 2',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        '2018-04-17 11:18:51', '2018-04-17 11:18:51'),
       (21, 12, 'Thiên Tài Lừa Đảo - Tập 3',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19t3a%2B4wPECGWTY30ulSaeBWoCoZ7e%2Bu0Cdr3z0dviNFncPEHdXqMHhYyz1LqHPJOSdRgpoLGeSLXTUGP2i45yzsWkv0I4A0zkriQUBc1zeSPlCizSqJdcy&type=video/mp4&title=T%E1%BA%ADp%202%20Thi%C3%AAn%20T%C3%A0i%20L%E1%BB%ABa%20%C4%90%E1%BA%A3o%20%28Switch%3A%20Change%20the%20World%29%202018%20VietSub%20HD',
        '2018-04-17 11:19:26', '2018-04-17 11:19:26'),
       (22, 13, 'Phong Vân Thượng Hải - Tập 1',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2Fxs%2FdVymhclkqmLtwkLopJJmJXcKp1NUzC5dRhgT8vl8mWhFF4NJkfX24grv0cTQE5GwbggjWcNTt%2FrWNcBKkJ2G0IwuRbUxJ%2FY%2BdfmCFBU27DKwij%2FPof&type=video/mp4&title=T%E1%BA%ADp%201%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2Fxs%2FdVymhclkqmLtwkLopJJmJXcKp1NUzC5dRhgT8vl8mWhFF4NJkfX24grv0cTQE5GwbggjWcNTt%2FrWNcBKkJ2G0IwuRbUxJ%2FY%2BdfmCFBU27DKwij%2FPof&type=video/mp4&title=T%E1%BA%ADp%201%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2Fxs%2FdVymhclkqmLtwkLopJJmJXcKp1NUzC5dRhgT8vl8mWhFF4NJkfX24grv0cTQE5GwbggjWcNTt%2FrWNcBKkJ2G0IwuRbUxJ%2FY%2BdfmCFBU27DKwij%2FPof&type=video/mp4&title=T%E1%BA%ADp%201%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2Fxs%2FdVymhclkqmLtwkLopJJmJXcKp1NUzC5dRhgT8vl8mWhFF4NJkfX24grv0cTQE5GwbggjWcNTt%2FrWNcBKkJ2G0IwuRbUxJ%2FY%2BdfmCFBU27DKwij%2FPof&type=video/mp4&title=T%E1%BA%ADp%201%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2Fxs%2FdVymhclkqmLtwkLopJJmJXcKp1NUzC5dRhgT8vl8mWhFF4NJkfX24grv0cTQE5GwbggjWcNTt%2FrWNcBKkJ2G0IwuRbUxJ%2FY%2BdfmCFBU27DKwij%2FPof&type=video/mp4&title=T%E1%BA%ADp%201%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2Fxs%2FdVymhclkqmLtwkLopJJmJXcKp1NUzC5dRhgT8vl8mWhFF4NJkfX24grv0cTQE5GwbggjWcNTt%2FrWNcBKkJ2G0IwuRbUxJ%2FY%2BdfmCFBU27DKwij%2FPof&type=video/mp4&title=T%E1%BA%ADp%201%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        '2018-04-17 11:22:21', '2018-04-17 11:22:21'),
       (23, 13, 'Phong Vân Thượng Hải - Tập 2',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FYV4ZjBtEAc%2BxrfL70THXP7usd7qXLSinNZBLq5z6tohlCGdlZqxABYaUyoWzeIqFxvCYJ%2B%2BeEGxMl%2BxCwMdITuRFXv1yWkA%2FjmjR%2B8oq6ic8CKaA6wKv8&type=video/mp4&title=T%E1%BA%ADp%202%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FYV4ZjBtEAc%2BxrfL70THXP7usd7qXLSinNZBLq5z6tohlCGdlZqxABYaUyoWzeIqFxvCYJ%2B%2BeEGxMl%2BxCwMdITuRFXv1yWkA%2FjmjR%2B8oq6ic8CKaA6wKv8&type=video/mp4&title=T%E1%BA%ADp%202%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FYV4ZjBtEAc%2BxrfL70THXP7usd7qXLSinNZBLq5z6tohlCGdlZqxABYaUyoWzeIqFxvCYJ%2B%2BeEGxMl%2BxCwMdITuRFXv1yWkA%2FjmjR%2B8oq6ic8CKaA6wKv8&type=video/mp4&title=T%E1%BA%ADp%202%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FYV4ZjBtEAc%2BxrfL70THXP7usd7qXLSinNZBLq5z6tohlCGdlZqxABYaUyoWzeIqFxvCYJ%2B%2BeEGxMl%2BxCwMdITuRFXv1yWkA%2FjmjR%2B8oq6ic8CKaA6wKv8&type=video/mp4&title=T%E1%BA%ADp%202%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FYV4ZjBtEAc%2BxrfL70THXP7usd7qXLSinNZBLq5z6tohlCGdlZqxABYaUyoWzeIqFxvCYJ%2B%2BeEGxMl%2BxCwMdITuRFXv1yWkA%2FjmjR%2B8oq6ic8CKaA6wKv8&type=video/mp4&title=T%E1%BA%ADp%202%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FYV4ZjBtEAc%2BxrfL70THXP7usd7qXLSinNZBLq5z6tohlCGdlZqxABYaUyoWzeIqFxvCYJ%2B%2BeEGxMl%2BxCwMdITuRFXv1yWkA%2FjmjR%2B8oq6ic8CKaA6wKv8&type=video/mp4&title=T%E1%BA%ADp%202%20Phong%20V%C3%A2n%20Th%C6%B0%E1%BB%A3ng%20H%E1%BA%A3i%20%28Magic%20City%29%202017%20VietSub%20HD',
        '2018-04-17 11:22:56', '2018-04-17 11:22:56'),
       (24, 14, 'Quý Ông Của Tôi - Tập 1',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18PzyxjNhW24HyKwyLRlDAjd68%2FEzBjicUZLx93eDAR8Z5FfhO5MHrL8h1bSkKRs%2FiBTSPdILLNUBM%2FNdMgf9CCkd74Fs%2BaA8K0aMD2eQ97uuINGBK3IyfH&type=video/mp4&title=T%E1%BA%ADp%201%20Quy%CC%81%20%C3%94ng%20Cu%CC%89a%20T%C3%B4i%20%28My%20Mister%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18PzyxjNhW24HyKwyLRlDAjd68%2FEzBjicUZLx93eDAR8Z5FfhO5MHrL8h1bSkKRs%2FiBTSPdILLNUBM%2FNdMgf9CCkd74Fs%2BaA8K0aMD2eQ97uuINGBK3IyfH&type=video/mp4&title=T%E1%BA%ADp%201%20Quy%CC%81%20%C3%94ng%20Cu%CC%89a%20T%C3%B4i%20%28My%20Mister%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18PzyxjNhW24HyKwyLRlDAjd68%2FEzBjicUZLx93eDAR8Z5FfhO5MHrL8h1bSkKRs%2FiBTSPdILLNUBM%2FNdMgf9CCkd74Fs%2BaA8K0aMD2eQ97uuINGBK3IyfH&type=video/mp4&title=T%E1%BA%ADp%201%20Quy%CC%81%20%C3%94ng%20Cu%CC%89a%20T%C3%B4i%20%28My%20Mister%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18PzyxjNhW24HyKwyLRlDAjd68%2FEzBjicUZLx93eDAR8Z5FfhO5MHrL8h1bSkKRs%2FiBTSPdILLNUBM%2FNdMgf9CCkd74Fs%2BaA8K0aMD2eQ97uuINGBK3IyfH&type=video/mp4&title=T%E1%BA%ADp%201%20Quy%CC%81%20%C3%94ng%20Cu%CC%89a%20T%C3%B4i%20%28My%20Mister%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18PzyxjNhW24HyKwyLRlDAjd68%2FEzBjicUZLx93eDAR8Z5FfhO5MHrL8h1bSkKRs%2FiBTSPdILLNUBM%2FNdMgf9CCkd74Fs%2BaA8K0aMD2eQ97uuINGBK3IyfH&type=video/mp4&title=T%E1%BA%ADp%201%20Quy%CC%81%20%C3%94ng%20Cu%CC%89a%20T%C3%B4i%20%28My%20Mister%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18PzyxjNhW24HyKwyLRlDAjd68%2FEzBjicUZLx93eDAR8Z5FfhO5MHrL8h1bSkKRs%2FiBTSPdILLNUBM%2FNdMgf9CCkd74Fs%2BaA8K0aMD2eQ97uuINGBK3IyfH&type=video/mp4&title=T%E1%BA%ADp%201%20Quy%CC%81%20%C3%94ng%20Cu%CC%89a%20T%C3%B4i%20%28My%20Mister%29%202018%20VietSub%20HD',
        '2018-04-17 11:35:36', '2018-04-17 11:35:36'),
       (25, 15, 'Nghịch Duyên - Tập 1',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        '2018-04-17 11:37:39', '2018-04-17 11:37:39'),
       (26, 15, 'Nghịch Duyên - Tập 2',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JAL0w0lt8RGqdnfPY88kCG%2BZ48%2FEXIm2XFtenaun614HcL6vFmalf%2FhFmY5JHGDDBX5XflmrRKjuoXzcGzxf25VOxnumfWUEk636Me3JOkAQ10OC%2BTxud&type=video/mp4&title=T%E1%BA%ADp%201%20Ngh%E1%BB%8Bch%20Duy%C3%AAn%20%28Daddy%20Cool%29%202018%20L%E1%BB%93ng%20ti%E1%BA%BFng%20HD',
        '2018-04-17 11:38:00', '2018-04-17 11:38:00'),
       (27, 19, 'Em Là Thanh Xuân Của Anh - Tập 1',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX197mqzc4UpiF47xmsdY7KNpS0aNB60oADJ9nUt6kOc9s%2BeZmDoVNV2zJqnaBrVYCy1DLwWZbZ44E7%2Fx%2FXGmD9Lwn9qhwTLoQellgJjCsJMmOW0pwX3gmLwm&type=video/mp4&title=T%E1%BA%ADp%201%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX197mqzc4UpiF47xmsdY7KNpS0aNB60oADJ9nUt6kOc9s%2BeZmDoVNV2zJqnaBrVYCy1DLwWZbZ44E7%2Fx%2FXGmD9Lwn9qhwTLoQellgJjCsJMmOW0pwX3gmLwm&type=video/mp4&title=T%E1%BA%ADp%201%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX197mqzc4UpiF47xmsdY7KNpS0aNB60oADJ9nUt6kOc9s%2BeZmDoVNV2zJqnaBrVYCy1DLwWZbZ44E7%2Fx%2FXGmD9Lwn9qhwTLoQellgJjCsJMmOW0pwX3gmLwm&type=video/mp4&title=T%E1%BA%ADp%201%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX197mqzc4UpiF47xmsdY7KNpS0aNB60oADJ9nUt6kOc9s%2BeZmDoVNV2zJqnaBrVYCy1DLwWZbZ44E7%2Fx%2FXGmD9Lwn9qhwTLoQellgJjCsJMmOW0pwX3gmLwm&type=video/mp4&title=T%E1%BA%ADp%201%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX197mqzc4UpiF47xmsdY7KNpS0aNB60oADJ9nUt6kOc9s%2BeZmDoVNV2zJqnaBrVYCy1DLwWZbZ44E7%2Fx%2FXGmD9Lwn9qhwTLoQellgJjCsJMmOW0pwX3gmLwm&type=video/mp4&title=T%E1%BA%ADp%201%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX197mqzc4UpiF47xmsdY7KNpS0aNB60oADJ9nUt6kOc9s%2BeZmDoVNV2zJqnaBrVYCy1DLwWZbZ44E7%2Fx%2FXGmD9Lwn9qhwTLoQellgJjCsJMmOW0pwX3gmLwm&type=video/mp4&title=T%E1%BA%ADp%201%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        '2018-04-18 08:21:40', '2018-04-18 08:21:40'),
       (28, 19, 'Em Là Thanh Xuân Của Anh - Tập 2',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BvdPnZ2PdcOw8swCmKecq8OUM3F%2BbpE5OeEuhUpqPK5EVtUuNoAQkEjGVj9UGJ7az0krFTsFSKPp7oAg%2B7w14j25XEgnd98nyEU0gfD2IggAYDxTQ9Ngzk&type=video/mp4&title=T%E1%BA%ADp%202%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BvdPnZ2PdcOw8swCmKecq8OUM3F%2BbpE5OeEuhUpqPK5EVtUuNoAQkEjGVj9UGJ7az0krFTsFSKPp7oAg%2B7w14j25XEgnd98nyEU0gfD2IggAYDxTQ9Ngzk&type=video/mp4&title=T%E1%BA%ADp%202%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BvdPnZ2PdcOw8swCmKecq8OUM3F%2BbpE5OeEuhUpqPK5EVtUuNoAQkEjGVj9UGJ7az0krFTsFSKPp7oAg%2B7w14j25XEgnd98nyEU0gfD2IggAYDxTQ9Ngzk&type=video/mp4&title=T%E1%BA%ADp%202%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BvdPnZ2PdcOw8swCmKecq8OUM3F%2BbpE5OeEuhUpqPK5EVtUuNoAQkEjGVj9UGJ7az0krFTsFSKPp7oAg%2B7w14j25XEgnd98nyEU0gfD2IggAYDxTQ9Ngzk&type=video/mp4&title=T%E1%BA%ADp%202%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BvdPnZ2PdcOw8swCmKecq8OUM3F%2BbpE5OeEuhUpqPK5EVtUuNoAQkEjGVj9UGJ7az0krFTsFSKPp7oAg%2B7w14j25XEgnd98nyEU0gfD2IggAYDxTQ9Ngzk&type=video/mp4&title=T%E1%BA%ADp%202%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2BvdPnZ2PdcOw8swCmKecq8OUM3F%2BbpE5OeEuhUpqPK5EVtUuNoAQkEjGVj9UGJ7az0krFTsFSKPp7oAg%2B7w14j25XEgnd98nyEU0gfD2IggAYDxTQ9Ngzk&type=video/mp4&title=T%E1%BA%ADp%202%20Em%20L%C3%A0%20Thanh%20Xu%C3%A2n%20C%E1%BB%A7a%20Anh%20%28Youth%29%202018%20VietSub%20HD',
        '2018-04-18 08:23:01', '2018-04-18 08:23:01'),
       (29, 20, 'Tân Tiếu Ngạo Giang Hồ - Tập 1',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FSjym3qYwsaTiqMFX8D54W9aBHJoPFQ7WyAXRPY7yKX4t4tUzHX5ipE1wXWQISBnStCXQNEWMs5pOWuCDsf%2BfEwDszBSXrwwhlA2836TT6ulgxISjcZQcj3CZTPzxTKuICitj4b2nkVA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FSjym3qYwsaTiqMFX8D54W9aBHJoPFQ7WyAXRPY7yKX4t4tUzHX5ipE1wXWQISBnStCXQNEWMs5pOWuCDsf%2BfEwDszBSXrwwhlA2836TT6ulgxISjcZQcj3CZTPzxTKuICitj4b2nkVA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FSjym3qYwsaTiqMFX8D54W9aBHJoPFQ7WyAXRPY7yKX4t4tUzHX5ipE1wXWQISBnStCXQNEWMs5pOWuCDsf%2BfEwDszBSXrwwhlA2836TT6ulgxISjcZQcj3CZTPzxTKuICitj4b2nkVA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FSjym3qYwsaTiqMFX8D54W9aBHJoPFQ7WyAXRPY7yKX4t4tUzHX5ipE1wXWQISBnStCXQNEWMs5pOWuCDsf%2BfEwDszBSXrwwhlA2836TT6ulgxISjcZQcj3CZTPzxTKuICitj4b2nkVA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FSjym3qYwsaTiqMFX8D54W9aBHJoPFQ7WyAXRPY7yKX4t4tUzHX5ipE1wXWQISBnStCXQNEWMs5pOWuCDsf%2BfEwDszBSXrwwhlA2836TT6ulgxISjcZQcj3CZTPzxTKuICitj4b2nkVA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX1%2FSjym3qYwsaTiqMFX8D54W9aBHJoPFQ7WyAXRPY7yKX4t4tUzHX5ipE1wXWQISBnStCXQNEWMs5pOWuCDsf%2BfEwDszBSXrwwhlA2836TT6ulgxISjcZQcj3CZTPzxTKuICitj4b2nkVA%3D%3D&type=video/mp4&title=T%E1%BA%ADp%201%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        '2018-04-18 08:27:09', '2018-04-18 08:27:09'),
       (30, 20, 'Tân Tiếu Ngạo Giang Hồ - Tập 2',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JiMmR%2BW2DzcS6KOVlrrVDtG1YZtw5Af%2F%2BSL31lflgWkutrJ%2BKzRV6mcTiUhkLyYr%2FsgeA%2B6yMG1JY3qfcer1Ie90THP0Pg0U1eE4IJ0yGOSRicZTjrv5BnnoDzCbvNnHoidD1H06fxw%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JiMmR%2BW2DzcS6KOVlrrVDtG1YZtw5Af%2F%2BSL31lflgWkutrJ%2BKzRV6mcTiUhkLyYr%2FsgeA%2B6yMG1JY3qfcer1Ie90THP0Pg0U1eE4IJ0yGOSRicZTjrv5BnnoDzCbvNnHoidD1H06fxw%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JiMmR%2BW2DzcS6KOVlrrVDtG1YZtw5Af%2F%2BSL31lflgWkutrJ%2BKzRV6mcTiUhkLyYr%2FsgeA%2B6yMG1JY3qfcer1Ie90THP0Pg0U1eE4IJ0yGOSRicZTjrv5BnnoDzCbvNnHoidD1H06fxw%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JiMmR%2BW2DzcS6KOVlrrVDtG1YZtw5Af%2F%2BSL31lflgWkutrJ%2BKzRV6mcTiUhkLyYr%2FsgeA%2B6yMG1JY3qfcer1Ie90THP0Pg0U1eE4IJ0yGOSRicZTjrv5BnnoDzCbvNnHoidD1H06fxw%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JiMmR%2BW2DzcS6KOVlrrVDtG1YZtw5Af%2F%2BSL31lflgWkutrJ%2BKzRV6mcTiUhkLyYr%2FsgeA%2B6yMG1JY3qfcer1Ie90THP0Pg0U1eE4IJ0yGOSRicZTjrv5BnnoDzCbvNnHoidD1H06fxw%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX19JiMmR%2BW2DzcS6KOVlrrVDtG1YZtw5Af%2F%2BSL31lflgWkutrJ%2BKzRV6mcTiUhkLyYr%2FsgeA%2B6yMG1JY3qfcer1Ie90THP0Pg0U1eE4IJ0yGOSRicZTjrv5BnnoDzCbvNnHoidD1H06fxw%3D%3D&type=video/mp4&title=T%E1%BA%ADp%202%20T%C3%A2n%20Ti%E1%BA%BFu%20Ng%E1%BA%A1o%20Giang%20H%E1%BB%93%202018%20%28New%20Smiling%20Proud%20Wanderer%29%202018%20VietSub%20HD',
        '2018-04-18 08:28:26', '2018-04-18 08:28:26'),
       (31, 21, 'Khu Phố Giang Hồ',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18S0IBqmwEQwlimHT9j0ijVe1veAZs%2BC2U7Yhv%2Bmc9pe2qfX467At%2FGFGUGcv9qKNd7UqakbzbCzq920XWZAvB98%2B3LILg3b%2BFLZLZacQPb5zRMXPJ%2FcQHP&type=video/mp4&title=T%E1%BA%ADp%20Full%20Khu%20Ph%C3%B4%CC%81%20Giang%20H%C3%B4%CC%80%20%28Bu%20Liang%20Jie%20Qu%202018%29%202018%20Thuy%E1%BA%BFt%20minh%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18S0IBqmwEQwlimHT9j0ijVe1veAZs%2BC2U7Yhv%2Bmc9pe2qfX467At%2FGFGUGcv9qKNd7UqakbzbCzq920XWZAvB98%2B3LILg3b%2BFLZLZacQPb5zRMXPJ%2FcQHP&type=video/mp4&title=T%E1%BA%ADp%20Full%20Khu%20Ph%C3%B4%CC%81%20Giang%20H%C3%B4%CC%80%20%28Bu%20Liang%20Jie%20Qu%202018%29%202018%20Thuy%E1%BA%BFt%20minh%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18S0IBqmwEQwlimHT9j0ijVe1veAZs%2BC2U7Yhv%2Bmc9pe2qfX467At%2FGFGUGcv9qKNd7UqakbzbCzq920XWZAvB98%2B3LILg3b%2BFLZLZacQPb5zRMXPJ%2FcQHP&type=video/mp4&title=T%E1%BA%ADp%20Full%20Khu%20Ph%C3%B4%CC%81%20Giang%20H%C3%B4%CC%80%20%28Bu%20Liang%20Jie%20Qu%202018%29%202018%20Thuy%E1%BA%BFt%20minh%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18S0IBqmwEQwlimHT9j0ijVe1veAZs%2BC2U7Yhv%2Bmc9pe2qfX467At%2FGFGUGcv9qKNd7UqakbzbCzq920XWZAvB98%2B3LILg3b%2BFLZLZacQPb5zRMXPJ%2FcQHP&type=video/mp4&title=T%E1%BA%ADp%20Full%20Khu%20Ph%C3%B4%CC%81%20Giang%20H%C3%B4%CC%80%20%28Bu%20Liang%20Jie%20Qu%202018%29%202018%20Thuy%E1%BA%BFt%20minh%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18S0IBqmwEQwlimHT9j0ijVe1veAZs%2BC2U7Yhv%2Bmc9pe2qfX467At%2FGFGUGcv9qKNd7UqakbzbCzq920XWZAvB98%2B3LILg3b%2BFLZLZacQPb5zRMXPJ%2FcQHP&type=video/mp4&title=T%E1%BA%ADp%20Full%20Khu%20Ph%C3%B4%CC%81%20Giang%20H%C3%B4%CC%80%20%28Bu%20Liang%20Jie%20Qu%202018%29%202018%20Thuy%E1%BA%BFt%20minh%20HD',
        'https://api.bilutv.com/getfb/play.php?q=U2FsdGVkX18S0IBqmwEQwlimHT9j0ijVe1veAZs%2BC2U7Yhv%2Bmc9pe2qfX467At%2FGFGUGcv9qKNd7UqakbzbCzq920XWZAvB98%2B3LILg3b%2BFLZLZacQPb5zRMXPJ%2FcQHP&type=video/mp4&title=T%E1%BA%ADp%20Full%20Khu%20Ph%C3%B4%CC%81%20Giang%20H%C3%B4%CC%80%20%28Bu%20Liang%20Jie%20Qu%202018%29%202018%20Thuy%E1%BA%BFt%20minh%20HD',
        '2018-04-18 08:38:19', '2018-04-18 08:38:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `likes`
--

CREATE TABLE `likes`
(
    `id`         int(10) UNSIGNED NOT NULL,
    `film_id`    int(11) NOT NULL,
    `user_id`    int(11) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations`
(
    `id`        int(10) UNSIGNED NOT NULL,
    `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `batch`     int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES (1, '2014_10_12_000000_create_users_table', 1),
       (2, '2014_10_12_100000_create_password_resets_table', 1),
       (3, '2018_03_15_072357_create_film_table', 1),
       (4, '2018_03_15_074516_create_film_detail_table', 1),
       (5, '2018_03_15_075627_create_category_table', 1),
       (6, '2018_03_15_080226_create_like_table', 1),
       (7, '2018_03_15_080302_create_vote_table', 1),
       (8, '2018_03_15_081002_create_report_table', 1),
       (9, '2018_03_31_050820_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets`
(
    `email`      varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `token`      varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reports`
--

CREATE TABLE `reports`
(
    `id`         int(10) UNSIGNED NOT NULL,
    `film_id`    int(11) NOT NULL,
    `email`      varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `messages`   text COLLATE utf8mb4_unicode_ci         NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reports`
--

INSERT INTO `reports` (`id`, `film_id`, `email`, `messages`, `created_at`, `updated_at`)
VALUES (1, 1, 'huyletien@outlook.com', 'Lỗi to, fix đi admin', '2018-04-12 10:33:38', '2018-04-12 10:33:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings`
(
    `id`           int(10) UNSIGNED NOT NULL,
    `title`        text COLLATE utf8mb4_unicode_ci,
    `keywords`     text COLLATE utf8mb4_unicode_ci,
    `descriptions` text COLLATE utf8mb4_unicode_ci,
    `maintenance`  int(11) NOT NULL DEFAULT '0',
    `vip`          int(11) NOT NULL DEFAULT '0',
    `created_at`   timestamp NULL DEFAULT NULL,
    `updated_at`   timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `title`, `keywords`, `descriptions`, `maintenance`, `vip`, `created_at`, `updated_at`)
VALUES (1, 'PhimHD+ - PhimHD Online', 'phimhd online, phimhd moi nhat, phimhd+, phimhd mien phi',
        'PhimHD online cập nhật mới nhất', 0, 99, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users`
(
    `id`             int(10) UNSIGNED NOT NULL,
    `email`          varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password`       varchar(255) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `avatar`         varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'uploads/images/user_default.png',
    `api_token`      varchar(255) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `right`          int(11) NOT NULL DEFAULT '0',
    `credit`         int(11) NOT NULL DEFAULT '0',
    `vip`            int(11) NOT NULL DEFAULT '0',
    `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `created_at`     timestamp NULL DEFAULT NULL,
    `updated_at`     timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `avatar`, `api_token`, `right`, `credit`, `vip`, `remember_token`,
                     `created_at`, `updated_at`)
VALUES (1, 'huyletien@outlook.com', '$2y$10$eC.hE6fPrn7RzzpNKm6ene8c5nbNn.WAitUoSvHD470H2CY01fw7W',
        'http://localhost/phimhdplus/public/upload/users/avatar/f7715074d110fe1129914270c1cbd1f1jpg', NULL, 1,
        999999802, 1, '6ADuudFhYPL0owa1fwQGaYeAh6jknXoc33FIX0fHGnfFt4x17Q8ijb3VVFqF', '2018-04-09 12:36:15',
        '2018-04-18 19:54:33'),
       (2, 'letienhuy.dev@gmail.com', '$2y$10$XYPBNipXXTySJRwvgX7AJOTkZm9sOt2h8PBvDdQ5mXwEYaskBkJrS',
        'http://localhost/phimhdplus/public/upload/users/avatar/f123729e3383186631e194299e8d9e20jpg', NULL, -1,
        100000000, 0, 'CF7LG2Y4sX6mm79MkutXcRFZ1K5ypx22qsyYgeWatMWnwcVQJorJUZu7MwRm', '2018-04-10 02:19:52',
        '2018-04-14 23:32:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `votes`
--

CREATE TABLE `votes`
(
    `id`         int(10) UNSIGNED NOT NULL,
    `film_id`    int(11) NOT NULL,
    `user_id`    int(11) NOT NULL,
    `point`      int(11) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `votes`
--

INSERT INTO `votes` (`id`, `film_id`, `user_id`, `point`, `created_at`, `updated_at`)
VALUES (1, 8, 1, 4, '2018-04-17 11:03:53', '2018-04-17 11:03:53');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `films`
--
ALTER TABLE `films`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `film_details`
--
ALTER TABLE `film_details`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `likes`
--
ALTER TABLE `likes`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reports`
--
ALTER TABLE `reports`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `votes`
--
ALTER TABLE `votes`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `films`
--
ALTER TABLE `films`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `film_details`
--
ALTER TABLE `film_details`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `likes`
--
ALTER TABLE `likes`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `reports`
--
ALTER TABLE `reports`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `votes`
--
ALTER TABLE `votes`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
