view: episode_ratings {
  sql_table_name: snl_db.episode_ratings ;;

  dimension: average_all {
    type: number
    sql: ${TABLE}.Average_All ;;
  }

  dimension: average_females {
    type: number
    sql: ${TABLE}.Average_Females ;;
  }

  dimension: average_males {
    type: number
    sql: ${TABLE}.Average_Males ;;
  }

  dimension: counts_all {
    type: number
    sql: ${TABLE}.Counts_All ;;
  }

  dimension: counts_females {
    type: number
    sql: ${TABLE}.Counts_Females ;;
  }

  dimension: counts_males {
    type: number
    sql: ${TABLE}.Counts_Males ;;
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
