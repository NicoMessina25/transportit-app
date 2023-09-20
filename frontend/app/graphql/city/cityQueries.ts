import { gql } from "@apollo/client";

export const CITIES = gql`
    query getCities{
        cities {
            cityId,
            name
        }
    }
`