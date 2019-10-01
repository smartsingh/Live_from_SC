view: impressions {
  sql_table_name: snl_db.impressions ;;

  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
  }

  dimension: impid {
    type: number
    value_format_name: id
    sql: ${TABLE}.impid ;;
    primary_key: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
