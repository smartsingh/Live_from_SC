view: episode_ratings {
  sql_table_name: snl_db.episode_ratings ;;

  dimension: pk {
    #hidden: yes
    type: string
    sql: CONCAT(CAST(${epno} AS STRING),"-",CAST(${sid} AS STRING)) ;;
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
    value_format: "00"
    sql: ${TABLE}.epno + 1;;
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

  measure: average_score {
    type: average
    sql: ${score} ;;
    value_format: "0.00"
    drill_fields: [episodes.airdate, hosts.aid, episode_ratings.score, episode_ratings.female_score, episode_ratings.male_score]
  }

  measure: average_season {
    label: "Average with Season Drills"
    type: average
    sql: ${score} ;;
    value_format: "0.00"
    drill_fields: [episodes.airdate, hosts.aid, episode_ratings.score, episode_ratings.female_score, episode_ratings.male_score]
    link: {
      label: "Season Dashboard"
      url: "/dashboards/454?Season={{ episode_ratings.sid._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  measure: average_linked {
    type: average
    sql: ${score} ;;
    value_format: "0.00"
    drill_fields: [episodes.epid]
    link: {
      label: "Episode Dashboard"
      url: "/dashboards-next/457?Episode%20ID={{ appearances.epid._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
    link: {
      label: "Host Dashboard"
      url: "/dashboards/437?Actor%20Name={{ hosts.aid._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  measure: median_score {
    type: median
    sql: ${score} ;;
    value_format: "0.00"
    drill_fields: [episodes.epid]
  }

  measure: female_average {
    type: average
    sql: ${female_score} ;;
    value_format: "0.00"
    drill_fields: [episodes.airdate, hosts.aid, episode_ratings.score, episode_ratings.female_score, episode_ratings.male_score]

  }

  measure: female_season {
    label: "Female Average with Season Drills"
    type: average
    sql: ${female_score} ;;
    value_format: "0.00"
    drill_fields: [episodes.airdate, hosts.aid, episode_ratings.score, episode_ratings.female_score, episode_ratings.male_score]
    link: {
      label: "Season Dashboard"
      url: "/dashboards/454?Season={{ episode_ratings.sid._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  measure: male_average {
    type: average
    sql: ${male_score} ;;
    value_format: "0.00"
    drill_fields: [episodes.airdate, hosts.aid, episode_ratings.score, episode_ratings.female_score, episode_ratings.male_score]

  }

  measure: male_season {
    label: "Male Average with Season Drills"
    type: average
    sql: ${male_score} ;;
    value_format: "0.00"
    drill_fields: [episodes.airdate, hosts.aid, episode_ratings.score, episode_ratings.female_score, episode_ratings.male_score]
    link: {
      label: "Season Dashboard"
      url: "/dashboards/454?Season={{ episode_ratings.sid._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }
}
