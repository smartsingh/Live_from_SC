view: appearances {
  sql_table_name: snl_db.appearances ;;

  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
  }

  dimension: capacity {
    type: string
    sql: ${TABLE}.capacity ;;
  }

  dimension: charid {
    type: number
    value_format_name: id
    sql: ${TABLE}.charid ;;
  }

  dimension: epid {
    type: number
    value_format_name: id
    sql: ${TABLE}.epid ;;
  }

  dimension: impid {
    type: number
    value_format_name: id
    sql: ${TABLE}.impid ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: sid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
  }

  dimension: tid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tid ;;
  }

  dimension: voice {
    type: yesno
    sql: ${TABLE}.voice ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
