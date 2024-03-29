view: derived_casts {
  derived_table: {
    sql: SELECT
        casts.aid  AS casts_aid,
        MIN(CAST(PARSE_DATE('%Y%m%d', CAST(episodes.epid AS STRING))  AS DATE)) AS episodes_first_episode_1,
        MAX(CAST(PARSE_DATE('%Y%m%d', CAST(episodes.epid AS STRING))  AS DATE)) AS episodes_last_episode_1,
        casts.update_anchor AS update_anchor
      FROM snl_db.casts  AS casts
      INNER JOIN snl_db.appearances  AS appearances ON casts.aid = appearances.aid AND casts.sid = appearances.sid
      INNER JOIN snl_db.episodes  AS episodes ON episodes.epid = appearances.epid

      GROUP BY 1,4
      ORDER BY 2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: casts_aid {
    label: "aid"
    type: string
    sql: ${TABLE}.casts_aid ;;
    primary_key: yes
    link: {
      label: "Cast Dashboard"
      url: "/dashboards/440?Cast%20Member={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
    link: {
      label: "IMDB page"
      url: "https://www.imdb.com/find?q={{value}}"
      icon_url: "https://ia.media-imdb.com/images/M/MV5BMTczNjM0NDY0Ml5BMl5BcG5nXkFtZTgwMTk1MzQ2OTE@._V1_.png"
    }
  }

  dimension: episodes_first_episode_1 {
    label: "First Episode"
    type: date
    datatype: date
    sql: ${TABLE}.episodes_first_episode_1 ;;
  }

  dimension: episodes_last_episode_1 {
    label: "Last Episode"
    type: date
    datatype: date
    sql: ${TABLE}.episodes_last_episode_1 ;;
  }

  dimension: update_anchor {
    type: yesno
    sql: ${TABLE}.update_anchor ;;
  }

  filter: cohort_member {
    type: string
    suggest_dimension: casts_aid
  }

  dimension: cohort {
    type: string
    sql:
  CASE WHEN ${episodes_first_episode_1} = (SELECT MAX(CASE WHEN ${casts_aid} = {% parameter cohort_member %} THEN
  ${episodes_first_episode_1} END) FROM ${TABLE}) THEN ${casts_aid} END;;
  }

  set: detail {
    fields: [casts_aid, episodes_first_episode_1, episodes_last_episode_1]
  }
}
