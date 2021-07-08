view: titles {
  sql_table_name: snl_db.titles ;;

  dimension: pk {
    hidden: yes
    type: string
    sql: CONCAT(CAST(${epid} AS STRING),CAST(${tid} AS STRING)) ;;
    primary_key: yes
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: epid {
    type: number
    value_format_name: id
    sql: ${TABLE}.epid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Youtube"
      url: "https://www.youtube.com/results?search_query=snl+{{ value }}"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/YouTube_social_white_square_%282017%29.svg/240px-YouTube_social_white_square_%282017%29.svg.png"
    }
  }

  dimension: order {
    type: number
    sql: ${TABLE}.``order`` ;;
  }

  dimension: sid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
  }

  dimension: later_season {
    type: yesno
    sql: ${sid} > 40 ;;
  }

  measure: count_later {
    type: count_distinct
    sql: ${sid} ;;
    filters: [later_season: "Yes"]
  }

  dimension: skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.skid ;;
  }

  dimension: tid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tid ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: is_sketch {
    type: yesno
    sql: ${skid} IS NOT NULL ;;
  }

  measure: sketch_count {
    type: number
    sql: CASE WHEN ${is_sketch} THEN ${count} ELSE NULL END;;
  }
}
