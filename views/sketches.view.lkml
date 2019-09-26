view: sketches {
  sql_table_name: snl_db.sketches ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.skid ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
