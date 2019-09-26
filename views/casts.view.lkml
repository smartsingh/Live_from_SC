view: casts {
  sql_table_name: snl_db.casts ;;

  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
  }

  dimension: featured {
    type: yesno
    sql: ${TABLE}.featured ;;
  }

  dimension: first_epid {
    type: number
    value_format_name: id
    sql: ${TABLE}.first_epid ;;
  }

  dimension: last_epid {
    type: number
    value_format_name: id
    sql: ${TABLE}.last_epid ;;
  }

  dimension: n_episodes {
    type: number
    sql: ${TABLE}.n_episodes ;;
  }

  dimension: season_fraction {
    type: number
    sql: ${TABLE}.season_fraction ;;
  }

  dimension: sid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
  }

  dimension: update_anchor {
    type: yesno
    sql: ${TABLE}.update_anchor ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
