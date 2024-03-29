view: seasons {
  sql_table_name: snl_db.seasons ;;

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

  dimension: sid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
    primary_key: yes
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: actor_seasons {
    type: count_distinct
    sql: CASE WHEN {% condition appearances.actor %} ${appearances.aid} {% endcondition %} THEN ${sid} END ;;
  }

}
