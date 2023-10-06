import { gql } from '@apollo/client'

export const ROUTE_MAPS = gql`
    query getAllRouteMaps{
        routeMaps{
            routeMapId,
            
        }
    }`

export const GET_ROUTE_MAP = gql`
    query getRouteMapById($id: ID!){
        routeMap(routeMapId: $id){
            routeMapId
            
        }
    }
`

export const SAVE_ROUTE_MAP = gql`
    mutation saveRouteMap($routeMap: RouteMapRequest!){
        saveRouteMap(routeMapRequest:$routeMap) {
            success,
            message
        }
    }

`
export const UPDATE_ROUTE_MAP = gql`
    mutation updateRouteMap($routeMap: RouteMapRequest!){
        updateRouteMap(routeMapRequest:$routeMap) {
            success,
            message
        }
    }
`

export const DELETE_ROUTE_MAP = gql`
    mutation deleteRouteMap($id: ID!){
        deleteRouteMap(routeMapId: $id) {
            success,
            message
        }
    }
`