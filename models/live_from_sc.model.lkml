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

  join: casts {
    type: inner
    relationship: many_to_one
    sql_on: ${casts.aid} = ${appearances.aid} ;;
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
    sql_on: ${episodes.epid} = ${hosts.epid} ;;
  }

  join: titles {
    type: inner
    sql_on: ${appearances.tid} = ${titles.tid} ;;
    relationship: many_to_one
  }

  join: sketches {
    type: inner
    sql_on: ${titles.skid} = ${sketches.skid} ;;
    relationship: many_to_one
  }

  join: derived_casts {
    type: inner
    sql_on: ${appearances.aid} = ${derived_casts.casts_aid} ;;
    relationship: many_to_one
  }
}

explore: casts {
  hidden: yes

  join: appearances {
    type: inner
    relationship: many_to_many
    sql_on: ${casts.aid} = ${appearances.aid} ;;
  }

  join: episodes {
    type: inner
    relationship: one_to_many
    sql_on: ${episodes.epid} = ${appearances.epid} ;;
  }

  join: derived_casts {
    type: inner
    sql_on: ${derived_casts.casts_aid} = ${casts.aid} ;;
    relationship: one_to_many
  }
}

explore: characters {  hidden: yes}

explore: episode_ratings {  hidden: yes}

explore: episodes {
  conditionally_filter: {
    filters: {
      field: sid
      value: "8"
    }
  }
  hidden: yes
  fields: [ALL_FIELDS*, -episodes.actor_episodes]

  join: hosts {
    sql_on: ${hosts.epid} = ${episodes.epid} ;;
    type: inner
    relationship: one_to_one
  }

  join: appearances {
    type: inner
    sql_on: ${appearances.epid} = ${episodes.epid} ;;
    relationship: many_to_one
  }

  join: derived_casts {
    type: inner
    sql_on: ${derived_casts.casts_aid} = ${appearances.aid} ;;
    relationship: one_to_many
  }
  }

explore: derived_casts {

  join: appearances {
    type: inner
    sql_on: ${derived_casts.casts_aid} = ${appearances.aid} ;;
    relationship: one_to_many
  }

  join: episodes {
    type: inner
    sql_on: ${episodes.epid} = ${appearances.epid} ;;
    relationship: one_to_many
  }

  }

explore: hosts {

  join: actors {
    type: inner
    relationship: one_to_one
    sql_on: ${actors.aid} = ${hosts.aid} ;;
  }

  join: derived_casts {
    type: left_outer
    relationship: one_to_many
    sql_on: ${derived_casts.casts_aid} = ${hosts.aid} ;;
  }

  join: episodes {
    type: inner
    sql_on: ${episodes.epid} = ${hosts.epid} ;;
    relationship: one_to_many
  }

  join: appearances {
    type: inner
    sql_on: ${appearances.epid} = ${episodes.epid} ;;
    relationship: many_to_one
  }

  join: episode_ratings {
    type: inner
    relationship: one_to_one
    sql_on: ${episodes.epno} = ${episode_ratings.epno} AND ${episodes.sid} = ${episode_ratings.sid} ;;
  }
}

explore: impressions {  hidden: yes}

explore: chemistry {

  join: episodes {
    type: inner
    sql_on: ${episodes.epid} = ${chemistry.epid} ;;
    relationship: one_to_many
  }

  join: episode_ratings {
    type: inner
    relationship: one_to_one
    sql_on: ${episodes.epno} = ${episode_ratings.epno} AND ${episodes.sid} = ${episode_ratings.sid} ;;
  }

  join: appearances {
    type: inner
    relationship: many_to_many
    sql_on: ${chemistry.epid} = ${appearances.epid} ;;
  }

  join: derived_casts {
    type: inner
    relationship: one_to_many
    sql_on: ${derived_casts.casts_aid} = ${chemistry.aid} ;;
  }

}

explore: seasons {
  hidden: yes

  join: appearances{
    type: inner
    sql_on: ${appearances.sid} = ${seasons.sid};;
    relationship: many_to_one
  }

  }

explore: sketches {  hidden: yes

  join: titles {
    type: inner
    relationship: one_to_many
    sql_on: ${sketches.skid} = ${titles.skid} ;;
  }

  join: episodes {
    type: inner
    sql_on: ${episodes.epid} = ${titles.epid} ;;
    relationship: many_to_many
  }

  join: appearances {
    type: inner
    sql_on: ${appearances.epid}=${episodes.epid} ;;
    relationship: many_to_many
  }

  }

explore: tenure {  hidden: yes}

explore: musical_guests {

  join: hosts {
    type: inner
    relationship: one_to_one
    sql_on: ${hosts.epid} = ${musical_guests.epid};;
  }

#   join: appearances {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${appearances.epid} = ${musical_guests.epid} ;;
#   }
#
#   join: episodes {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${episodes.epid} = ${musical_guests.epid} ;;
#   }
#
#   join: episode_ratings {
#     type: inner
#     relationship: one_to_one
#     sql_on: ${episodes.epno} = ${episode_ratings.epno} AND ${episodes.sid} = ${episode_ratings.sid} ;;
#   }

}

explore: titles {

  join: appearances {
    type: inner
    relationship: one_to_many
    sql_on: ${appearances.tid} = ${titles.tid} ;;
  }

  join: episodes {
    type: inner
    relationship: one_to_many
    sql_on: ${episodes.epid} = ${titles.epid} ;;
  }

  join: episode_ratings {
    type: inner
    relationship: one_to_one
    sql_on: ${episodes.epno} = ${episode_ratings.epno} AND ${episodes.sid} = ${episode_ratings.sid} ;;
  }

  join: hosts {
    type: inner
    relationship: one_to_many
    sql_on: ${episodes.epid} = ${hosts.epid} ;;
  }

  hidden: yes}

explore: writers {}
