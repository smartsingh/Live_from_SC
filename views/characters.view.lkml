view: characters {
  sql_table_name: snl_db.characters ;;

  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
  }

  dimension: charid {
    type: number
    value_format_name: id
    sql: ${TABLE}.charid ;;
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
