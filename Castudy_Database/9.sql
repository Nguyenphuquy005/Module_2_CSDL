-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select query_3.month, query_3.so_khach_hang_dang_ky, query_3.tong_tien
from (
	select query_1.month, query_1.so_khach_hang_dang_ky, query_1.tong_tien
	from (
		select m.month, count(contract.id_contract) as so_khach_hang_dang_ky, coalesce(sum(contract.total_money),0) as tong_tien
		from
			(
				select 1 as month union select 2 as month union select 3 as month union 
                select 4 as month union select 5 as month union select 6 as month
				union select 7 as month union select 8 as month union select
                9 as month union select 10 as month union select 11 
                as month union select 12 as month
			) m
		left join contract on month(contract.daystart_contract) = m.month
		left join custommer on custommer.id_custommer =contract.id_custommer
		where year(contract.daystart_contract) = '2019' or contract.daystart_contract is null
		group by m.month
		order by m.month
	) as query_1
	union
	select query_2.month , 0 as so_khach_hang_dang_ky, 0 as tong_tien
	FROM (
						 SELECT 1 AS MONTH
						  UNION SELECT 2 AS MONTH
						  UNION SELECT 3 AS MONTH
						  UNION SELECT 4 AS MONTH
						  UNION SELECT 5 AS MONTH
						  UNION SELECT 6 AS MONTH
						  UNION SELECT 7 AS MONTH
						  UNION SELECT 8 AS MONTH
						  UNION SELECT 9 AS MONTH
						  UNION SELECT 10 AS MONTH
						  UNION SELECT 11 AS MONTH
						  UNION SELECT 12 AS MONTH
						  UNION SELECT 12 AS MONTH
	) as query_2
) as query_3
group by query_3.month
order by query_3.month;