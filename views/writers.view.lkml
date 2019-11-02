view: writers {
  sql_table_name: snl_db.writers ;;

  dimension: pk {
    hidden: yes
    type: string
    sql: CONCAT(CAST(${sid} AS STRING),${writers}) ;;
    primary_key: yes
  }

  dimension: head_writers {
    type: string
    sql: ${TABLE}.head_writers ;;
  }

  dimension: sid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
  }

  dimension: writers {
    type: string
    sql: ${TABLE}.writers ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
