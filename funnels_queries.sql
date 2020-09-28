
--compare conversion from quiz→home_try_on and home_try_on→purchase
WITH funnels AS(
  SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs AS 'number_of_pairs',
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
)
SELECT COUNT(user_id) AS 'all ussers', SUM(is_home_try_on) AS 'home_try', SUM(is_purchase) AS 'amount of purchaces'
FROM funnels;

--difference in purchase rates between customers who had 3 number_of_pairs with ones who had 5.
WITH funnels AS(
  SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs AS 'number_of_pairs',
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
)
SELECT number_of_pairs, SUM(is_home_try_on), SUM(is_purchase)
FROM funnels
GROUP BY 1;

--The most common results of the style quiz
SELECT style, COUNT(*)
FROM quiz
GROUP BY 1
ORDER BY 2 DESC;

--The most common types of purchase made.
SELECT product_id, COUNT(*)
FROM purchase
GROUP BY 1
ORDER BY 2 DESC;