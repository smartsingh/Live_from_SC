view: hosts {
  sql_table_name: snl_db.hosts ;;

  dimension: pk {
    hidden: yes
    type: string
    sql: CONCAT(${aid},CAST(${epid} AS STRING)) ;;
    primary_key: yes
  }

  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
  }

  dimension: epid {
    type: number
    value_format_name: id
    sql: ${TABLE}.epid ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}.occupation ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
