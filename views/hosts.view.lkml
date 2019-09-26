view: hosts {
  sql_table_name: snl_db.hosts ;;

  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
  }

  dimension: epid {
    type: number
    value_format_name: id
    sql: ${TABLE}.epid ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}.occupation ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
