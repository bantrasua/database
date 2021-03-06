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

<!-- th??m d??? li???u v??o b???ng author -->

```sql
INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('1','V?? Tr???ng Ph???ng','link ???nh','V?? Tr???ng Ph???ng (1912-1939) l?? m???t nh?? v??n, nh?? b??o n???i ti???ng c???a Vi???t Nam v??o ?????u th??? k??? 20. N???i ti???ng v???i gi???ng v??n tr??o ph??ng ch??m bi???m x?? h???i c???a m??nh, m???t s??? ng?????i ???? so s??nh ??ng nh?? Balzac c???a Vi???t Nam[4]. Tuy nhi??n, c??ng v?? phong c??ch "t??? ch??n" v?? y???u t??? t??nh d???c trong t??c ph???m m?? khi sinh th???i ??ng ???? b??? ch??nh quy???n b???o h??? Ph??p t???i H?? N???i g???i ra t??a v?? "t???i t???n th????ng phong h??a" (outrage aux bonnes moeurs). V??? sau n??y, t??c ph???m c???a ??ng l???i b??? c???m xu???t b???n v?? l?? "t??c ph???m suy ?????i" t???i mi???n B???c Vi???t Nam t??? n??m 1954 v?? c??? n?????c t??? ng??y 30 th??ng 4 n??m 1975 cho ?????n t???n cu???i nh???ng n??m 1980 m???i ???????c ch??nh quy???n cho l??u h??nh.','1912-10-20','1939-10-13');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('2','T?? Ho??i','link ???nh','T?? Ho??i (t??n khai sinh: Nguy???n Sen; 27 th??ng 9 n??m 1920 ??? 6 th??ng 7 n??m 2014) l?? m???t nh?? v??n Vi???t Nam. M???t s??? t??c ph???m ????? t??i thi???u nhi c???a ??ng ???????c d???ch ra ngo???i ng???. ??ng ???????c nh?? n?????c Vi???t Nam trao t???ng Gi???i th?????ng H??? Ch?? Minh v??? V??n h???c ??? Ngh??? thu???t ?????t 1 (1996) cho c??c t??c ph???m: X??m gi???ng, Nh?? ngh??o, O chu???t, D??? m??n phi??u l??u k??, N??i C???u qu???c, Truy???n T??y B???c, M?????i n??m, Xu???ng l??ng, V??? t???nh, T??o l?????ng, H??? Gi??ng ??? Ph??n Sa, Mi???n T??y, V??? ch???ng A Ph???, Tu???i tr??? Ho??ng V??n Th???.','1920-09-27','2014-07-06');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('3','Nam Cao','link ???nh','Nam Cao (1915 ho???c 1917 ??? 28 th??ng 11 n??m 1951) l?? m???t nh?? v??n v?? c??ng l?? m???t chi???n s??, li???t s?? ng?????i Vi???t Nam. ??ng l?? nh?? v??n hi???n th???c l???n (tr?????c C??ch m???ng Th??ng T??m), m???t nh?? b??o kh??ng chi???n (sau C??ch m???ng), m???t trong nh???ng nh?? v??n ti??u bi???u nh???t th??? k??? 20. Nam Cao c?? nhi???u ????ng g??p quan tr???ng ?????i v???i vi???c ho??n thi???n phong c??ch truy???n ng???n v?? ti???u thuy???t Vi???t Nam ??? n???a ?????u th??? k??? 20.','1915-10-29','1951-11-30');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('4','Kim L??n','link ???nh','Nguy???n V??n T??i (sinh 1 th??ng 8 n??m 1920 - m???t 20 th??ng 7 n??m 2007), th?????ng ???????c bi???t ?????n v???i b??t danh Kim L??n, l?? m???t nh?? v??n Vi???t Nam. ??ng ???????c bi???t ?????n v???i c??c t??c ph???m v??n h???c nh?? V??? nh???t, L??ng. Ngo??i ra ??ng c??ng ???????c bi???t ?????n qua vai di???n L??o H???c trong phim L??ng V?? ?????i ng??y ???y.','1920-08-01','2007-07-20');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('5','Ng?? T???t T???','link ???nh','Ng?? T???t T??? (1893 ??? 20 th??ng 4 n??m 1954) l?? m???t nh?? v??n, nh?? b??o, nh?? Nho h???c, d???ch gi??? v?? nh?? nghi??n c???u c?? ???nh h?????ng l???n ??? Vi???t Nam giai ??o???n tr?????c 1954.','1894-12-20','1954-04-20');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('6','H??? V?? T??n','link ???nh','??ng n??y ch??a th???y c?? t??c ph???m n??o','1913-12-20','1966-04-20');

INSERT INTO `author`(`id`, `fullname`, `avatar`, `description`, `birthday`, `deathday`) VALUES ('7','M??y V??n T??nh','link ???nh','M???t nh?? v??n l???','1956-11-20','1970-04-10');
```

<!-- th??m d??? li???u v??o b???ng category -->

```sql
INSERT INTO `category`(`id`, `name`) VALUES ('1','Truy???n ng??? ng??n');
INSERT INTO `category`(`id`, `name`) VALUES ('2','Ti???u thuy???t');
INSERT INTO `category`(`id`, `name`) VALUES ('3','Gi??o tr??nh');
INSERT INTO `category`(`id`, `name`) VALUES ('4','Truy???n c??? t??ch');
INSERT INTO `category`(`id`, `name`) VALUES ('5','H???i k??');
INSERT INTO `category`(`id`, `name`) VALUES ('6','Truy???n ng???n');
INSERT INTO `category`(`id`, `name`) VALUES ('7','L???ch s???');
INSERT INTO `category`(`id`, `name`) VALUES ('8','Truy???n d??i');
INSERT INTO `category`(`id`, `name`) VALUES ('9','S??ch gi??o khoa');
INSERT INTO `category`(`id`, `name`) VALUES ('10','Th??');
```

<!-- publish company -->

```sql
INSERT INTO `publish_company`(`id`, `name`) VALUES ('1','NXB Kim ?????ng');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('2','NXB V??n h???c');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('3','NXB Tu???i tr???');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('4','NXB Gi??o d???c');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('5','NXB T????ng lai');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('6','NXB Qu?? kh???');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('7','NXB Hi???n t???i');
INSERT INTO `publish_company`(`id`, `name`) VALUES ('8','NXB K??? ni???m');
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
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('1','Tr???n V??n A','Nam','link ???nh','1999-11-16','0123456789','ac@gmail.com','HN');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('2','Nguy???n Minh B','Nam','link ???nh','2000-12-12','011223344','ad@gmail.com','Tp HCM');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('3','Phan Th??? C','N???','link ???nh','1998-03--2','0987654321','er@gmail.com','HN');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('4','B??i V??n D','Nam','link ???nh','1999-07-09','7357283','jj@gmail.com','HN');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('5','L?? Minh E','Nam','link ???nh','1997-12-22','5653727','bb@gmail.com','HN');
INSERT INTO `staff`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('6','V?? Th??? F','N???','link ???nh','2000-01-01','34655747','tt@gmail.com','HN');
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
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('1','Ho??ng t??? ???ch','200000','4');
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('2','H??ng x??m','150000','5');
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('3','Th???y b??i xem voi','180000','6');
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('4','T??y du k??','300000','10');
INSERT INTO `titleOfBook`(`id`, `title`, `price`, `numberOfBook`) VALUES ('5','B???p ga','135000','4');
```

<!-- book -->

```sql
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('1','1','????y l?? m???t t??c ph???m hay...','1945','1','link ???nh','c??n s??ch');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('2','2','????y l?? m???t t??c ph???m vui...','1969','3','link ???nh','c??n s??ch');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('3','2','????y l?? m???t t??c ph???m vui...','1969','3','link ???nh','c??n s??ch');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('4','3','????y l?? m???t t??c ph???m l??ng m???n...','1954','2','link ???nh','h???t s??ch');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('5','4','????y l?? m???t t??c ph???m bu???n...','1970','5','link ???nh','c??n s??ch');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('6','4','????y l?? m???t t??c ph???m bu???n...','1970','5','link ???nh','c??n s??ch');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('7','4','????y l?? m???t t??c ph???m bu???n...','1970','5','link ???nh','c??n s??ch');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('8','5','????y l?? m???t t??c ph???m hay ?????nh...','1990','7','link ???nh','h???t s??ch');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('9','5','????y l?? m???t t??c ph???m ?????nh...','1990','7','link ???nh','h???t s??ch');
INSERT INTO `book`(`id`, `id_title`, `description`, `release_year`, `id_publishCompany`, `image`, `status`) VALUES ('10','5','????y l?? m???t t??c ph???m ?????nh...','1990','7','link ???nh','h???t s??ch');
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
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('1','L?? Th??? M','N???','link ???nh','1999-12-12','135315146','aa@gmail.com','Hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('2','Tr???n V??n V','Nam','link ???nh','2000-11-11','2354642','zz@gmail.com','Hp');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('3','Nguy???n Th??? T','N???','link ???nh','2001-10-10','357527257','ss@gmail.com','Vp');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('4','V?? Th??? G','N???','link ???nh','1993-07-11','31542624','ll@gmail.com','Hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('5','??inh Trung P','Nam','link ???nh','1998-09-14','8695644','vv@gmail.com','hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('6','Tr???n M???nh Q','Nam','link ???nh','1990-01-13','2624783','pp@gmail.com','hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('7','Phan V??n C','Nam','link ???nh','2000-08-08','6933285','ii@gmail.com','hn');
INSERT INTO `reader`(`id`, `fullname`, `gender`, `avatar`, `birthday`, `mobile`, `email`, `address`) VALUES ('8','L??u Th??? D','N???','link ???nh','1996-05-16','5825825836','bb@gmail.com','hn');
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

![library](https://user-images.githubusercontent.com/95067954/155089223-9a929b23-6135-4eb2-901c-b50c2fceb181.jpg)
