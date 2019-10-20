view: appearances {
  sql_table_name: snl_db.appearances ;;

  dimension: pk {
    #hidden: yes
    type: string
    sql: CONCAT(CONCAT(CONCAT(${aid},CAST(${tid} AS STRING)), COALESCE(CAST(${role} AS STRING), '-')), COALESCE(CAST(${voice} AS STRING), '-'));;
    primary_key: yes
  }

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
    suggestable: yes
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

  filter: actor {
    suggest_dimension: aid
  }

  measure: actor_appearances {
    type: count_distinct
    sql: CASE WHEN {% condition actor %} ${aid} {% endcondition %} THEN ${pk} END ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
