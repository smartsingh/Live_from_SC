view: actors {
  sql_table_name: snl_db.actors ;;

  filter: name {
    type: string
    suggest_dimension: aid
    default_value: "Adam Sandler"
  }


  dimension: aid {
    type: string
    sql: ${TABLE}.aid ;;
    primary_key: yes
    link: {
      label: "SNL Archives"
      url: "http://www.snlarchives.net{{ url._value }}"
    }
  }

  dimension: gender {
    type: string
    sql: CASE
    WHEN ${TABLE}.gender = "andy" THEN 'male'
    WHEN ${TABLE}.gender = "unknown" THEN 'female'
    ELSE ${TABLE}.gender
    END ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    #html: {% assign seconds = -7 | times: 24 | times: 60 | times: 60 %}
    #http://www.looker.com/{{ 'now' | date: "%s" | plus: seconds | date: '%m-%d-%y' }} ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
