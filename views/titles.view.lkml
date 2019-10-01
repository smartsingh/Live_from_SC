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
}
