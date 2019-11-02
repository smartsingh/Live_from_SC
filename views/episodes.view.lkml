view: episodes {
  sql_table_name: snl_db.episodes ;;

  dimension_group: aired {
    type: time
    datatype: date
    timeframes: [
      date,
      month,
      quarter,
      month_num,
      year
    ]
    sql: PARSE_DATE('%Y%m%d', CAST(${epid} AS STRING)) ;;
  }

  dimension: airdate {
    type: string
    label: "Air Date (String)"
    sql: ${TABLE}.aired ;;
  }

  dimension: epid {
    type: number
    sql: ${TABLE}.epid ;;
    primary_key: yes
    drill_fields: [seasons.sid]
  }


  dimension: epno {
    type: number
    value_format: "00"
    sql: ${TABLE}.epno ;;
  }

  dimension: sid {
    type: number
    value_format: "00"
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
    drill_fields: [aired_date, epid, hosts.aid, episode_ratings.score, episode_ratings.female_score, episode_ratings.male_score]
    }

  measure: cast_episodes {
    type: count_distinct
    sql: ${epid} ;;
    }

  set: ALL_FIELDS {
    fields: [ALL_FIELDS*]
  }
}
