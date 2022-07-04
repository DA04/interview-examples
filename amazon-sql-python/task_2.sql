with sample as (select customer_id, start_date as change_date from subs
union
select customer_id, end_date as change_date from subs)
select sample.customer_id, sample.change_date, prev.status as prev_status, subs.status as cur_status,
case when (prev.status is null or prev.status = ' Non-member') and subs.status = ' Free' then 'WarmStart' 
when prev.status = ' Paid' and (subs.status is null or subs.status = ' Non-member') then 'Cancel'
when prev.status = ' Free' and subs.status = ' Paid' then 'Convert'
when prev.status = ' Paid' and subs.status = ' Free' then 'ReverseConvert'
when prev.status = ' Paid' and subs.status = ' Paid' then 'Renewal'
end as event
from sample left join subs on sample.customer_id = subs.customer_id and sample.change_date = subs.start_date
left join subs prev on sample.customer_id = prev.customer_id and sample.change_date = prev.end_date 