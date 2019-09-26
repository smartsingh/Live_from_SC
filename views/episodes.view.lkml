view: episodes {
  sql_table_name: snl_db.episodes ;;

  dimension: aired {
    type: string
    sql: ${TABLE}.aired ;;
  }

  dimension: epid {
    type: number
    value_format_name: id
    sql: ${TABLE}.epid ;;
  }

  dimension: epno {
    type: number
    sql: ${TABLE}.epno ;;
  }

  dimension: sid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
