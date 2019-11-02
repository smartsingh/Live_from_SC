view: casts {
  sql_table_name: snl_db.casts ;;

  dimension: pk {
    #hidden: yes
    type: string
    sql: CONCAT(${aid},CAST(${sid} AS STRING)) ;;
    primary_key: yes
  }

  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
  }

  dimension: featured {
    type: yesno
    sql: ${TABLE}.featured ;;
  }

#   dimension: first_epid {
#     type: date
#     sql: MIN(${episodes.aired}) ;;
#   }
#
#   dimension: last_epid {
#     type: date
#     sql: MAX(${episodes.aired}) ;;
#   }

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
