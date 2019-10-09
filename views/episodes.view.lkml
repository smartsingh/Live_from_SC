view: episodes {
  sql_table_name: snl_db.episodes ;;

  dimension_group: aired {
    type: time
    datatype: date
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    sql: PARSE_DATE('%Y%m%d', CAST(${epid} AS STRING)) ;;
  }

  dimension: epid {
    type: number
    sql: ${TABLE}.epid ;;
    primary_key: yes
  }


  dimension: epno {
    type: number
    sql: ${TABLE}.epno ;;
  }

  dimension: sid {
    type: number
    sql: ${TABLE}.sid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: First_Episode{
    type: min
    sql: ${aired_date} ;;
  }

  measure: Last_Episode {
    type: max
    sql: ${aired_date} ;;
  }

  measure: actor_episodes {
    type: count_distinct
    sql: CASE WHEN {% condition appearances.actor %} ${appearances.aid} {% endcondition %} THEN ${epid} END ;;
  }

}
