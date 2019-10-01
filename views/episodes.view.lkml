view: episodes {
  sql_table_name: snl_db.episodes ;;

  dimension: aired {
    type: date
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
    sql: ${aired} ;;
  }

  measure: Last_Episode {
    type: max
    sql: ${aired} ;;
  }
}
