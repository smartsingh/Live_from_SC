view: actors {
  sql_table_name: snl_db.actors ;;

  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
  }

  dimension: gender {
    type: string
    sql: CASE
    WHEN ${TABLE}.gender = "andy" THEN 'male'
    WHEN ${TABLE}.gender = "unknown" THEN 'female'
    ELSE ${TABLE}.gender
    END ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}