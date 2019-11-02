view: musical_guests {
  derived_table: {
    explore_source: appearances {
      column: aid {}
      column: epid {}
      filters: {
        field: appearances.capacity
        value: "music"
      }
    }
  }

  dimension: aid {}

  dimension: epid {
    value_format_name: "id"
    type: number
  }
}
