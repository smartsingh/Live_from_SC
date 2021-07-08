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
    link: {
      label: "IMDB page"
      url: "https://www.imdb.com/find?q={{value}}"
      icon_url: "https://ia.media-imdb.com/images/M/MV5BMTczNjM0NDY0Ml5BMl5BcG5nXkFtZTgwMTk1MzQ2OTE@._V1_.png"
    }
    link: {
      label: "Host Dashboard"
      url: "/dashboards/437?Actor%20Name={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
    suggest_persist_for: "1 second"
  }

  dimension: epid {
    type: number
    value_format_name: id
    sql: ${TABLE}.epid ;;
  }

  dimension: occupation {
    type: string
    sql: CASE WHEN UPPER(${TABLE}.occupation) LIKE "%COMEDIAN%" OR UPPER(${TABLE}.occupation) LIKE "%COMIC%" THEN "Comedian"
    WHEN UPPER(${TABLE}.occupation) LIKE "%FOOTBALL%" OR UPPER(${TABLE}.occupation) LIKE "%BASKETBALL%" OR
    UPPER(${TABLE}.occupation) LIKE "%HOCKEY%" OR UPPER(${TABLE}.occupation) LIKE "%BASEBALL%" OR
    UPPER(${TABLE}.occupation) LIKE "%OLYMPIC%" OR UPPER(${TABLE}.occupation) LIKE "%ATHLETE%"
    OR UPPER(${TABLE}.occupation) LIKE "%BOXER%" OR UPPER(${TABLE}.occupation) LIKE "%RACING%"
    OR UPPER(${TABLE}.occupation) LIKE "%SKATER%" OR UPPER(${TABLE}.occupation) LIKE "%SWIMMER%"
    OR UPPER(${TABLE}.occupation) LIKE "%TENNIS%" OR UPPER(${TABLE}.occupation) LIKE "%CYCLIST%"
    OR UPPER(${TABLE}.occupation) LIKE "%WRESTLER%" THEN "Athlete"
    WHEN UPPER(${TABLE}.occupation) LIKE "%PRESIDENT%" AND UPPER(${TABLE}.occupation) NOT LIKE "%SCREEN%"
    OR UPPER(${TABLE}.occupation) LIKE "%POLITICIAN%" OR UPPER(${TABLE}.occupation) LIKE "%ACTIVIST%"
    OR UPPER(${TABLE}.occupation) LIKE "%MAYOR%" OR UPPER(${TABLE}.occupation) LIKE "%SECRETARY%" THEN "Politician"
    WHEN UPPER(${TABLE}.occupation) LIKE "%ACTOR%" OR UPPER(${TABLE}.occupation) LIKE "%ACTRESS%"
    OR UPPER(${TABLE}.occupation) LIKE "%SOCIALITE%" OR UPPER(${TABLE}.occupation) LIKE "%DESIGNER%" THEN "Actor"
    WHEN UPPER(${TABLE}.occupation) LIKE "%MUSICIAN%" OR UPPER(${TABLE}.occupation) LIKE "%RAPPER%"
    OR UPPER(${TABLE}.occupation) LIKE "%SINGER%" OR UPPER(${TABLE}.occupation) LIKE "%BAND%"
    OR UPPER(${TABLE}.occupation) LIKE "%RECORD%" THEN "Musician"
    WHEN UPPER(${TABLE}.occupation) LIKE "%HOST%" OR UPPER(${TABLE}.occupation) LIKE "%CASTER%"
    OR UPPER(${TABLE}.occupation) LIKE "%ANCHOR%" OR UPPER(${TABLE}.occupation) LIKE "%PROPRIETOR%"
    THEN "Radio/TV Host"
    WHEN UPPER(${TABLE}.occupation) LIKE "%PRODUCER%" OR UPPER(${TABLE}.occupation) LIKE "%PUBLISHER%"
    OR UPPER(${TABLE}.occupation) LIKE "%EXEC%" THEN "Executive"
    ELSE ${TABLE}.occupation END;;
  }

  dimension: raw_occupation {
    type: string
    sql: ${TABLE}.occupation ;;
  }
#
#   dimension: host_cohort {
#     type: string
#     sql:
#       CASE WHEN ${raw_occupation} LIKE CONCAT("%",(
# SELECT MAX(CASE WHEN ${aid} = {% parameter derived_casts.cohort_member %} THEN occupation END)
# FROM snl_db.hosts
# LEFT JOIN UNNEST(SPLIT(REPLACE(REPLACE(${raw_occupation}, ",",""), "and", ""), " ")) AS occupation
# WHERE ${raw_occupation} NOT IN ("-","")
# ),"%")
# THEN ${raw_occupation} END;;
#   }

  measure: count {
    type: count
    drill_fields: [episodes.airdate, aid, episode_ratings.score, episode_ratings.female_score, episode_ratings.male_score]
    html: {% if value >= 50 %}
    <p style="color: red;">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black;">{{rendered_value}}</p>
    {% endif %};;
  }
}
