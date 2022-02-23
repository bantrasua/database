<!-- bai1 -->

```sql
-- Sách xuất trước 1900
SELECT title, year_of_publication
FROM book
WHERE year_of_publication  < 1900;

-- Sách dưới 100 trang
SELECT title, page_number
FROM book
WHERE page_number < 100;

-- id_publisher = 1 và xếp số trang tăng dần
SELECT title, id_publisher, page_number
FROM book
WHERE id_publisher = 1
ORDER BY page_number ASC;
```

<!-- bai2 -->

```sql
-- TBC rental_rate các phim có rating R
SELECT AVG(rental_rate) AS average
FROM film
WHERE rating = 'R';

-- Đếm phim
SELECT COUNT(film_id)
FROM film
WHERE special_features LIKE 'Deleted Scenes';

-- Tìm phim
SELECT title
FROM film
WHERE title LIKE '%ACADEMY%'
```
