class_name NavigationConstants

enum Domain {
    AIR,
    TERRAIN,
}

const DOMAIN_TO_GROUP_MAPPING = {
    Domain.AIR: "air_navigation_input",
    Domain.TERRAIN: "terrain_navigation_input",
}