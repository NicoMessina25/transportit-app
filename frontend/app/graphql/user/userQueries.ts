import { gql } from '@apollo/client'

export const AUTHENTICATE = gql`
    query authenticate($username: String!, $password: String!){
        authenticate(userRequest: {username: $username, password: $password})
    }`


