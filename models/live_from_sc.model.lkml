connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "/views/**/*.view"

datagroup: live_from_sc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: live_from_sc_default_datagroup

explore: actors {
}

explore: appearances {

  join: episodes {
    type: inner
    relationship: many_to_one
    sql_on: ${appearances.epid} = ${episodes.epid} ;;
  }

  join: actors {
    type: inner
    relationship: many_to_one
    sql_on: ${appearances.aid} = ${actors.aid} ;;
  }

  join: seasons {
    type: inner
    relationship: many_to_one
    sql_on: ${appearances.sid} = ${seasons.sid} ;;
  }

  join: impressions {
    type: inner
    relationship: many_to_one
    sql_on: ${appearances.impid} = ${impressions.impid} ;;
  }

  join: characters {
    type: inner
    relationship: many_to_one
    sql_on: ${appearances.charid} = ${characters.charid} ;;
  }

  join: episode_ratings {
    type: inner
    relationship: one_to_one
    sql_on: ${episodes.epno} = ${episode_ratings.epno} AND ${episodes.sid} = ${episode_ratings.sid} ;;
  }

  join: hosts {
    type: inner
    relationship: one_to_many
    sql_on: ${actors.aid} = ${hosts.aid} ;;
  }

  join: titles {
    type: inner
    sql: ${titles.tid} = ${appearances.tid} ;;
    relationship: many_to_one
  }
}

explore: casts {
  hidden: yes
}

explore: characters {  hidden: yes}

explore: episode_ratings {  hidden: yes}

explore: episodes {  hidden: yes}

explore: hosts {
  join: actors {
    type: inner
    relationship: one_to_one
    sql_on: ${actors.aid} = ${hosts.aid} ;;
  }
}

explore: impressions {  hidden: yes}

explore: seasons {  hidden: yes}

explore: sketches {  hidden: yes}

explore: tenure {  hidden: yes}

explore: titles {  hidden: yes}

explore: writers {}
