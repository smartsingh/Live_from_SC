view: chemistry {
  derived_table: {
    sql: WITH chemistry AS (
      SELECT
        hosts.epid  AS hosts_epid,
        titles.tid  AS titles_tid,
        hosts.aid AS hosts_aid
      FROM snl_db.appearances  AS appearances
      INNER JOIN snl_db.actors  AS actors ON appearances.aid = actors.aid
      INNER JOIN snl_db.hosts  AS hosts ON actors.aid = hosts.aid
      INNER JOIN snl_db.titles  AS titles ON appearances.tid = titles.tid

      GROUP BY 1,2,3
      )

      SELECT
        titles.tid  AS titles_tid,
        episode_ratings.Average_All  AS episode_ratings_score,
        appearances.aid  AS appearances_aid,
        episodes.epid  AS episodes_epid,
        hosts.aid  AS hosts_aid
      FROM snl_db.appearances  AS appearances
      INNER JOIN snl_db.episodes  AS episodes ON appearances.epid = episodes.epid
      INNER JOIN snl_db.episode_ratings  AS episode_ratings ON episodes.epno = (episode_ratings.epno + 1) AND episodes.sid = episode_ratings.sid
      INNER JOIN snl_db.hosts  AS hosts ON episodes.epid = hosts.epid
      INNER JOIN snl_db.titles  AS titles ON appearances.tid = titles.tid
      INNER JOIN chemistry ON chemistry.hosts_epid = episodes.epid AND chemistry.titles_tid = titles.tid AND chemistry.hosts_aid = hosts.aid

      WHERE appearances.aid != hosts.aid

      GROUP BY 1,2,3,4,5
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: pk {
    type: string
    sql: CONCAT(CAST(${tid} AS STRING),"-",CAST(${aid} AS STRING)) ;;
  }

  dimension: tid {
    type: number
    value_format_name: id
    sql: ${TABLE}.titles_tid ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.episode_ratings_score ;;
  }

  dimension: aid {
    type: string
    sql: ${TABLE}.appearances_aid ;;
  }

  dimension: epid {
    type: number
    value_format_name: id
    sql: ${TABLE}.episodes_epid ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}.hosts_aid ;;
  }

  set: detail {
    fields: [tid, score, aid, epid, host]
  }
}
