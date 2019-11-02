view: impressions {
  sql_table_name: snl_db.impressions ;;

  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
  }

  dimension: impid {
    type: number
    value_format_name: id
    sql: ${TABLE}.impid ;;
    primary_key: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Youtube"
      url: "https://www.youtube.com/results?search_query=snl+{{ value }}+{{ aid._value }}"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/YouTube_social_white_square_%282017%29.svg/240px-YouTube_social_white_square_%282017%29.svg.png"
    }
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
