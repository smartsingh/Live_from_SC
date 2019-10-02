view: episode_ratings {
  sql_table_name: snl_db.episode_ratings ;;

  dimension: pk {
    #hidden: yes
    type: string
    sql: CONCAT(CAST(${epno} AS STRING),CAST(${sid} AS STRING)) ;;
    primary_key: yes
  }

  dimension: score {
    type: number
    sql: ${TABLE}.Average_All ;;
  }

  dimension: female_score {
    type: number
    sql: ${TABLE}.Average_Females ;;
  }

  dimension: male_score {
    type: number
    sql: ${TABLE}.Average_Males ;;
  }

  dimension: votes {
    type: number
    sql: ${TABLE}.Counts_All ;;
  }

  dimension: female_votes {
    type: number
    sql: ${TABLE}.Counts_Females ;;
  }

  dimension: male_votes {
    type: number
    sql: ${TABLE}.Counts_Males ;;
  }

  dimension: epno {
    type: number
    #episode numbers from this view are counted from base 0 for some reason instead of base 1
    sql: ${TABLE}.epno + 1;;
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

  measure: average_score {
    type: average
    sql: ${score} ;;
  }

  measure: female_average {
    type: average
    sql: ${female_score} ;;
  }

  measure: male_average {
    type: average
    sql: ${male_score} ;;
  }
}
