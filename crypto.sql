-- 1. Retrieve all records from the crypto table.
		select * from crypto;
        
-- 2. Select the name and price of all cryptocurrencies.
		select name, price from crypto;
        
-- 3. Calculate the average market cap of all cryptocurrencies.
		select avg(marketcap) as AVG_MCAP from crypto;
        
-- 4. Find the cryptocurrency with the highest volume in the last 24 hours.
		select max(volume24hrs) as volume24hrs from crypto;
        
-- 5. Calculate the total supply of all cryptocurrencies combined.
		select sum(totalsupply) as total_supply from crypto;
        
-- 6. Select all records where the price is above 1000.
		select * from crypto 
        where price > 1000;
        
-- 7. Retrieve the name and market cap for cryptocurrencies with a market cap above 1 billion.
		select name, marketcap from crypto
        where  marketcap > 1000000000;
        
-- 8. Find the cryptocurrency with the lowest circulating supply.
		select name , circulatingsupply 
        from crypto
        where circulatingsupply = (select min(circulatingsupply) from crypto);
        
-- 9. Calculate the average price of cryptocurrencies with a max supply above 100 million.
		select avg(price) as "cryptocurrencies with a max supply above 100 million" from crypto
        where maxsupply > 100000000;
        
-- 10. Select all cryptocurrencies that were taken on or after 2010-01-01.
		select * from crypto
        where date_taken >= 01-01-2010;
        
-- 11. Find the cryptocurrency with the highest max supply.
		 select * from crypto
         where maxsupply = (select max(maxsupply) from crypto);
         
-- 12. Calculate the total volume in the last 24 hours for cryptocurrencies with a price above 100.
		select sum(volume24hrs)
        from crypto
        where price > 100;
        
-- 13. Select the name and market cap for the top 5 cryptocurrencies by market cap.
		select name, marketcap 
		from crypto
        order by marketcap desc
        limit 5;
                
-- 14. Retrieve the name and total supply for cryptocurrencies with a total supply less than 1 billion.
		select name, totalsupply 
        from crypto
        where totalsupply < 100000000;
	
-- 15. Find all cryptocurrencies where the volume in the last 24 hours is between 100,000 and 1,000,000.
		select * from crypto
        where volume24hrs between 100000 and 1000000;
-- 16. Calculate the average circulating supply for cryptocurrencies in the "BTC" market category.	
		select abbr, avg(circulatingsupply)
        from crypto
        where abbr = "BTC";

-- 17. Select the name and price for cryptocurrencies with a circulating supply above 10 million.
        select name , price 
        from crypto 
        where circulatingsupply > 10000000;
        
-- 18. Find the cryptocurrency with the highest price and its corresponding market cap.
		select name, marketcap, price
        from crypto
        where price = (select max(price) from crypto);
        
        
-- 19. Calculate the percentage of total supply to max supply for each cryptocurrency.
		select name ,(totalsupply / maxsupply) * 100
        as supply_percentage
        from crypto;

		
-- 20. Retrieve all records where the market cap is missing or null.
		select * from crypto
        where marketcap  is null;
        
-- 21. Retrieve the name and date_taken for cryptocurrencies introduced after 2010.
	 select name , date_taken
     from crypto
     where date_taken > 01-01-2010;

-- 22. List the cryptocurrencies with the abbreviation "BTC", "ETH", or "USDT".
		select name,abbr
        from crypto
        where abbr in ("BTC" , "ETH", "USDT");
       

-- 23. Retrieve the name and market cap of the top 5 cryptocurrencies by market cap.
		select name, marketcap 
        from crypto
        order by marketcap desc
        limit 5;


-- 24. Find the total supply of all cryptocurrencies introduced before 2010.
	select sum(totalsupply)
    from crypto
    where date_taken < 01-01-2010;
    
-- 25. List the names of cryptocurrencies that have both a high market cap (above 1 billion) and a low price (below $10).
		select name, marketcap,price
        from crypto
        where marketcap > 1000000000 
        and price <10;
    
	
-- 26. Retrieve the name and price of the cryptocurrency with the second highest price.
	select * from crypto
    order by price desc
    limit 1 offset 1;


-- 27. Find the average market cap of cryptocurrencies grouped by the year they were taken.
		select name ,date_taken,avg(marketcap) 
        from crypto
        group by avg(marketcap);
        
-- 28. Calculate the rank of each cryptocurrency based on their market cap within each category.
		select name,marketcap,
        rank() over(order by marketcap desc) as marketcap_rank
        from crypto;
        
-- 29. Find the cumulative sum of total supply for each cryptocurrency.
		select name, totalsupply, 
		sum(totalsupply) over(order by name ) as cumulative_totalsupply
		from crypto;
        
-- 3. Determine the difference in market cap between each cryptocurrency and the one with the highest market cap.
		SELECT 
		name, 
		marketcap, 
		marketcap - FIRST_VALUE(marketcap) OVER (ORDER BY marketcap DESC) AS marketcap_difference
		FROM 
		crypto;