
view: test_derived_table {
  derived_table: {
    sql: SELECT
        status,
        AVG(sale_price) AS avg_sale_price,
        COUNT(DISTINCT order_id) AS count_of_orders,
        sum(sale_price) AS total_sale_price
      FROM ${order_items.SQL_TABLE_NAME}
      GROUP BY 1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: status {
    type: string
    primary_key: yes
    sql: ${TABLE}.status ;;
  }

  dimension: avg_sale_price {
    type: number
    sql: ${TABLE}.avg_sale_price ;;
  }

  dimension: count_of_orders {
    type: number
    sql: ${TABLE}.count_of_orders ;;
  }

  dimension: total_sale_price {
    type: number
    sql: ${TABLE}.total_sale_price ;;
  }

  measure: avg_avg_sale_price {
    type: average
    sql: ${avg_sale_price} ;;
  }

  set: detail {
    fields: [
      status,
      avg_sale_price,
      count_of_orders,
      total_sale_price
    ]
  }
}
