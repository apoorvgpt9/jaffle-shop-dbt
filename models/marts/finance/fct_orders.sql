select
    order_id as order_id,
    customer_id as customer_id,
    sum(payments.amount) as amount
from
    {{ ref('stg_jaffle_shop__orders') }} orders
    inner join {{ ref('stg_stripe__payments') }} payments using (order_id)
    where payments.payment_status = 'success'
    group by order_id, customer_id