```sql
    CREATE DATABASE library
```

```sql
CREATE TABLE category(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    name text
)
```

```sql
CREATE TABLE publish_company(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    name text
)
```

```sql
CREATE TABLE shift(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    time text
)
```

```sql
CREATE TABLE author(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    fullname text,
    avatar text,
    description text,
    birthday date,
    deathday date
)
```

```sql
CREATE TABLE reader(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    fullname text,
    gender text,
    avatar text,
    birthday date,
    mobile text,
    email text,
    address text
)
```

```sql
CREATE TABLE staff(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    fullname text,
    gender text,
    avatar text,
    birthday date,
    mobile text,
    email text,
    address text
)
```

```sql
CREATE TABLE staff_shift(
    id_staff int PRIMARY KEY,
    id_shift int,
    FOREIGN KEY(id_staff) REFERENCES staff(id),
    FOREIGN KEY(id_shift) REFERENCES shift(id)
)
```

```sql
CREATE TABLE titleOfBook(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    title text,
    price bigint,
    numberOfBook int
)
```

```sql
CREATE TABLE book(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    id_title int,
    description text,
    release_year year,
    id_publishCompany int,
    image text,
    status text,
    FOREIGN KEY(id_title) REFERENCES titleOfBook(id),
    FOREIGN KEY(id_publishCompany) REFERENCES publish_company(id)
)
```

```sql
CREATE TABLE book_author(
    id_book int PRIMARY KEY,
    id_author int,
    FOREIGN KEY(id_book) REFERENCES book(id),
    FOREIGN KEY(id_author)REFERENCES author(id)
)
```

```sql
CREATE TABLE book_category(
    id_book int PRIMARY KEY,
    id_category int,
    FOREIGN KEY(id_book) REFERENCES book(id),
    FOREIGN KEY(id_category)REFERENCES category(id)
)
```

```sql
CREATE TABLE author_category(
    id_author int,
    id_category int,
    FOREIGN KEY(id_author) REFERENCES author(id),
    FOREIGN KEY(id_category) REFERENCES category(id)
)
```

```sql
CREATE TABLE borrowSheet(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    id_reader int,
    id_staff int,
    borrow_date date,
    return_date date,
    FOREIGN KEY(id_reader) REFERENCES reader(id),
    FOREIGN KEY(id_staff) REFERENCES staff(id)
)
```

```sql
CREATE TABLE itemBorrow(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    id_borrow int,
    id_book int,
    FOREIGN KEY(id_borrow) REFERENCES borrowSheet(id),
    FOREIGN KEY(id_book) REFERENCES book(id)
)
```

```sql
CREATE TABLE returnSheet(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    id_borrow int,
    id_staff int,
    returning_date date,
    FOREIGN KEY(id_borrow) REFERENCES borrowSheet(id),
    FOREIGN KEY(id_staff) REFERENCES staff(id)
)
```

```sql
CREATE TABLE itemReturn(
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    id_return int,
    id_itemBorrow int,
    FOREIGN KEY(id_return) REFERENCES returnSheet(id),
    FOREIGN KEY(id_itemBorrow) REFERENCES itemBorrow(id)
)
```

<!-- thêm dữ liệu vào bảng author -->

```sql
INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('1','Vũ Trọng Phụng','link ảnh','Vũ Trọng Phụng (1912-1939) là một nhà văn, nhà báo nổi tiếng của Việt Nam vào đầu thế kỷ 20. Nổi tiếng với giọng văn trào phúng châm biếm xã hội của mình, một số người đã so sánh ông như Balzac của Việt Nam[4]. Tuy nhiên, cũng vì phong cách "tả chân" và yếu tố tình dục trong tác phẩm mà khi sinh thời ông đã bị chính quyền bảo hộ Pháp tại Hà Nội gọi ra tòa vì "tội tổn thương phong hóa" (outrage aux bonnes moeurs). Về sau này, tác phẩm của ông lại bị cấm xuất bản vì là "tác phẩm suy đồi" tại miền Bắc Việt Nam từ năm 1954 và cả nước từ ngày 30 tháng 4 năm 1975 cho đến tận cuối những năm 1980 mới được chính quyền cho lưu hành.','1912-10-20','1939-10-13');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('2','Tô Hoài','link ảnh','Tô Hoài (tên khai sinh: Nguyễn Sen; 27 tháng 9 năm 1920 – 6 tháng 7 năm 2014) là một nhà văn Việt Nam. Một số tác phẩm đề tài thiếu nhi của ông được dịch ra ngoại ngữ. Ông được nhà nước Việt Nam trao tặng Giải thưởng Hồ Chí Minh về Văn học – Nghệ thuật Đợt 1 (1996) cho các tác phẩm: Xóm giếng, Nhà nghèo, O chuột, Dế mèn phiêu lưu ký, Núi Cứu quốc, Truyện Tây Bắc, Mười năm, Xuống làng, Vỡ tỉnh, Tào lường, Họ Giàng ở Phìn Sa, Miền Tây, Vợ chồng A Phủ, Tuổi trẻ Hoàng Văn Thụ.','1920-09-27','2014-07-06');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('3','Nam Cao','link ảnh','Nam Cao (1915 hoặc 1917 – 28 tháng 11 năm 1951) là một nhà văn và cũng là một chiến sĩ, liệt sĩ người Việt Nam. Ông là nhà văn hiện thực lớn (trước Cách mạng Tháng Tám), một nhà báo kháng chiến (sau Cách mạng), một trong những nhà văn tiêu biểu nhất thế kỷ 20. Nam Cao có nhiều đóng góp quan trọng đối với việc hoàn thiện phong cách truyện ngắn và tiểu thuyết Việt Nam ở nửa đầu thế kỷ 20.','1915-10-29','1951-11-30');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('4','Kim Lân','link ảnh','Nguyễn Văn Tài (sinh 1 tháng 8 năm 1920 - mất 20 tháng 7 năm 2007), thường được biết đến với bút danh Kim Lân, là một nhà văn Việt Nam. Ông được biết đến với các tác phẩm văn học như Vợ nhặt, Làng. Ngoài ra ông cũng được biết đến qua vai diễn Lão Hạc trong phim Làng Vũ Đại ngày ấy.','1920-08-01','2007-07-20');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('5','Ngô Tất Tố','link ảnh','Ngô Tất Tố (1893 – 20 tháng 4 năm 1954) là một nhà văn, nhà báo, nhà Nho học, dịch giả và nhà nghiên cứu có ảnh hưởng lớn ở Việt Nam giai đoạn trước 1954.','1894-12-20','1954-04-20');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('6','Họ Và Tên','link ảnh','Ông này chưa thấy có tác phẩm nào','1913-12-20','1966-04-20');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('7','Máy Văn Tính','link ảnh','Một nhà văn lạ','1956-11-20','1970-04-10');
```

<!-- thêm dữ liệu vào bảng category -->

```sql
INSERT INTO `category`(`id`, `name`) VALUES ('1','Truyện ngụ ngôn');
INSERT INTO `category`(`id`, `name`) VALUES ('2','Tiểu thuyết');
INSERT INTO `category`(`id`, `name`) VALUES ('3','Giáo trình');
INSERT INTO `category`(`id`, `name`) VALUES ('4','Truyện cổ tích');
INSERT INTO `category`(`id`, `name`) VALUES ('5','Hồi kí');
INSERT INTO `category`(`id`, `name`) VALUES ('6','Truyện ngắn');
INSERT INTO `category`(`id`, `name`) VALUES ('7','Lịch sử');
INSERT INTO `category`(`id`, `name`) VALUES ('8','Truyện dài');
INSERT INTO `category`(`id`, `name`) VALUES ('9','Sách giáo khoa');
INSERT INTO `category`(`id`, `name`) VALUES ('10','Thơ');
```

<!-- publish company -->

```sql
INSERT INTO `publish_company`(`id`, `name`) VALUES ('1','NXB Kim đồng');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('2','NXB Văn học');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('3','NXB Tuổi trẻ');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('4','NXB Giáo dục');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('5','NXB Tương lai');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('6','NXB Quá khứ');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('7','NXB Hiện tại');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('8','NXB Kỉ niệm');
```

<!-- shift -->

```sql
INSERT INTO `shift`(`id`, `time`) VALUES ('1','7h-12h');
INSERT INTO `shift`(`id`, `time`) VALUES ('2','12h-16h');
INSERT INTO `shift`(`id`, `time`) VALUES ('3','16h-20h');
INSERT INTO `shift`(`id`, `time`) VALUES ('4','20h-23h');
```

<!-- author-category -->

```sql
INSERT INTO `author_category`(`id_author`, `id_category`) VALUES ('1','9');
INSERT INTO `author_category`(`id_author`, `id_category`) VALUES ('1','6');
INSERT INTO `author_category`(`id_author`, `id_category`) VALUES ('2','4');
INSERT INTO `author_category`(`id_author`, `id_category`) VALUES ('3','2');
INSERT INTO `author_category`(`id_author`, `id_category`) VALUES ('4','4');
INSERT INTO `author_category`(`id_author`, `id_category`) VALUES ('7','6');
INSERT INTO `author_category`(`id_author`, `id_category`) VALUES ('5','7');
INSERT INTO `author_category`(`id_author`, `id_category`) VALUES ('6','8');
INSERT INTO `author_category`(`id_author`, `id_category`) VALUES ('7','10');
```
<!-- ```staff -->
```sql
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('1','Trần Văn A','Nam','link ảnh','1999-11-16','0123456789','ac@gmail.com','HN');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('2','Nguyễn Minh B','Nam','link ảnh','2000-12-12','011223344','ad@gmail.com','Tp HCM');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('3','Phan Thị C','Nữ','link ảnh','1998-03--2','0987654321','er@gmail.com','HN');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('4','Bùi Văn D','Nam','link ảnh','1999-07-09','7357283','jj@gmail.com','HN');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('5','Lê Minh E','Nam','link ảnh','1997-12-22','5653727','bb@gmail.com','HN');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('6','Vũ Thị F','Nữ','link ảnh','2000-01-01','34655747','tt@gmail.com','HN');
```

<!-- staff-shift -->
```sql
INSERT INTO `staff_shift`(`id_staff`, `id_shift`) VALUES ('1','1');
INSERT INTO `staff_shift`(`id_staff`, `id_shift`) VALUES ('2','1');
INSERT INTO `staff_shift`(`id_staff`, `id_shift`) VALUES ('3','2');
INSERT INTO `staff_shift`(`id_staff`, `id_shift`) VALUES ('4','2');
INSERT INTO `staff_shift`(`id_staff`, `id_shift`) VALUES ('5','3');
INSERT INTO `staff_shift`(`id_staff`, `id_shift`) VALUES ('6','4');
```


<!-- titleOfBook -->
```sql
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('1','Hoàng tử ếch','200000','4');
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('2','Hàng xóm','150000','5');
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('3','Thầy bói xem voi','180000','6');
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('4','Tây du kí','300000','10');
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('5','Bếp ga','135000','4');
```

<!-- book -->
```sql
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('1','1','Đây là một tác phẩm hay...','1945','1','link ảnh','còn sách');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('2','2','Đây là một tác phẩm vui...','1969','3','link ảnh','còn sách');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('3','2','Đây là một tác phẩm vui...','1969','3','link ảnh','còn sách');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('4','3','Đây là một tác phẩm lãng mạn...','1954','2','link ảnh','hết sách');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('5','4','Đây là một tác phẩm buồn...','1970','5','link ảnh','còn sách');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('6','4','Đây là một tác phẩm buồn...','1970','5','link ảnh','còn sách');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('7','4','Đây là một tác phẩm buồn...','1970','5','link ảnh','còn sách');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('8','5','Đây là một tác phẩm hay đỉnh...','1990','7','link ảnh','hết sách');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('9','5','Đây là một tác phẩm đỉnh...','1990','7','link ảnh','hết sách');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('10','5','Đây là một tác phẩm đỉnh...','1990','7','link ảnh','hết sách');
```

<!-- book-author -->
```sql
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('1','2');
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('2','1');
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('3','1');
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('4','5');
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('5','3');
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('6','3');
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('7','3');
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('8','4');
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('9','4');
INSERT INTO `book_author`(`id_book`, `id_author`) VALUES ('10','4');
```

<!-- book-category -->
```sql
INSERT INTO `book_category`(`id_book`, `id_category`) VALUES ('1','2');
INSERT INTO `book_category`(`id_book`, `id_category`) VALUES ('2','5');
INSERT INTO `book_category`(`id_book`, `id_category`) VALUES ('3','5');
INSERT INTO `book_category`(`id_book`, `id_category`) VALUES ('4','1');
INSERT INTO `book_category`(`id_book`, `id_category`) VALUES ('5','4');
INSERT INTO `book_category`(`id_book`, `id_category`) VALUES ('6','4');
INSERT INTO `book_category`(`id_book`, `id_category`) VALUES ('7','4');
```

<!-- reader -->
```sql
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('1','Lê Thị M','Nữ','link ảnh','1999-12-12','135315146','aa@gmail.com','Hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('2','Trần Văn V','Nam','link ảnh','2000-11-11','2354642','zz@gmail.com','Hp');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('3','Nguyễn Thị T','Nữ','link ảnh','2001-10-10','357527257','ss@gmail.com','Vp');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('4','Võ Thị G','Nữ','link ảnh','1993-07-11','31542624','ll@gmail.com','Hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('5','Đinh Trung P','Nam','link ảnh','1998-09-14','8695644','vv@gmail.com','hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('6','Trần Mạnh Q','Nam','link ảnh','1990-01-13','2624783','pp@gmail.com','hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('7','Phan Văn C','Nam','link ảnh','2000-08-08','6933285','ii@gmail.com','hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('8','Lưu Thị D','Nữ','link ảnh','1996-05-16','5825825836','bb@gmail.com','hn');
```

<!-- borrow Sheet -->
```sql
INSERT INTO `borrowSheet`(`id`, `id_reader`, `id_staff`, `borrow_date`, `return_date`) VALUES ('1','2','3','2021-02-21','2021-03-02');
INSERT INTO `borrowSheet`(`id`, `id_reader`, `id_staff`, `borrow_date`, `return_date`) VALUES ('2','1','4','2021-02-21','2021-03-02');
INSERT INTO `borrowSheet`(`id`, `id_reader`, `id_staff`, `borrow_date`, `return_date`) VALUES ('3','5','1','2021-02-20','2021-01-02');
INSERT INTO `borrowSheet`(`id`, `id_reader`, `id_staff`, `borrow_date`, `return_date`) VALUES ('4','4','5','2021-02-22','2021-05-02');
INSERT INTO `borrowSheet`(`id`, `id_reader`, `id_staff`, `borrow_date`, `return_date`) VALUES ('5','6','6','2021-02-22','2021-07-02');
INSERT INTO `borrowSheet`(`id`, `id_reader`, `id_staff`, `borrow_date`, `return_date`) VALUES ('6','3','4','2021-02-22','2021-03-02');
INSERT INTO `borrowSheet`(`id`, `id_reader`, `id_staff`, `borrow_date`, `return_date`) VALUES ('7','3','2','2021-02-22','2021-04-02');
```


<!-- item borrow -->
```sql
INSERT INTO `itemBorrow`(`id`, `id_borrow`, `id_book`) VALUES ('1','1','4');
INSERT INTO `itemBorrow`(`id`, `id_borrow`, `id_book`) VALUES ('2','3','3');
INSERT INTO `itemBorrow`(`id`, `id_borrow`, `id_book`) VALUES ('3','2','1');
INSERT INTO `itemBorrow`(`id`, `id_borrow`, `id_book`) VALUES ('4','5','2');
INSERT INTO `itemBorrow`(`id`, `id_borrow`, `id_book`) VALUES ('5','4','6');
INSERT INTO `itemBorrow`(`id`, `id_borrow`, `id_book`) VALUES ('6','6','7');
INSERT INTO `itemBorrow`(`id`, `id_borrow`, `id_book`) VALUES ('7','7','5');
```

<!-- return sheet -->
```sql
INSERT INTO `returnSheet`(`id`, `id_borrow`, `id_staff`, `returning_date`) VALUES ('1','2','2','2022-02-20');
INSERT INTO `returnSheet`(`id`, `id_borrow`, `id_staff`, `returning_date`) VALUES ('2','3','2','2022-02-20');
INSERT INTO `returnSheet`(`id`, `id_borrow`, `id_staff`, `returning_date`) VALUES ('3','1','1','2022-02-19');
INSERT INTO `returnSheet`(`id`, `id_borrow`, `id_staff`, `returning_date`) VALUES ('4','5','4','2022-02-19');
INSERT INTO `returnSheet`(`id`, `id_borrow`, `id_staff`, `returning_date`) VALUES ('5','4','3','2022-02-18');
INSERT INTO `returnSheet`(`id`, `id_borrow`, `id_staff`, `returning_date`) VALUES ('6','7','5','2022-02-20');
INSERT INTO `returnSheet`(`id`, `id_borrow`, `id_staff`, `returning_date`) VALUES ('7','6','3','2022-02-20');
```

<!-- item return -->
```sql
INSERT INTO `itemReturn`(`id`, `id_return`, `id_itemBorrow`) VALUES ('1','1','3');
INSERT INTO `itemReturn`(`id`, `id_return`, `id_itemBorrow`) VALUES ('2','2','2');
INSERT INTO `itemReturn`(`id`, `id_return`, `id_itemBorrow`) VALUES ('3','3','1');
INSERT INTO `itemReturn`(`id`, `id_return`, `id_itemBorrow`) VALUES ('4','4','4');
```


