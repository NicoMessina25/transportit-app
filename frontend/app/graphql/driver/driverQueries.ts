import { gql } from '@apollo/client'

export const DRIVERS = gql`
    query getAllDrivers{
        drivers{
            driverId,
            firstname,
            lastname,
            document,
            phone
            address,
            currentcity{
                name
            }
        }
    }`

export const GET_DRIVER = gql`
    query getDriverById($id: ID!){
        driver(driverId: $id){
            driverId
            firstname
            lastname
            document
            phone,
            city
            province
            address
            fee {
                feeId
                kmprice
                kgprice
                endDate
            }
            currentcity {
                cityId
                name
            }
            trucks {
                truckId
                registration
                maxweight
            }
        }
    }
`

export const SAVE_DRIVER = gql`
    mutation saveDriver($driver: DriverRequest!){
        saveDriver(driverRequest:$driver) {
            success,
            message
        }
    }

`
export const UPDATE_DRIVER = gql`
    mutation updateDriver($driver: DriverRequest!){
        updateDriver(driverRequest:$driver) {
            success,
            message
        }
    }
`

export const DELETE_DRIVER = gql`
    mutation deleteDriver($id: ID!){
        deleteDriver(driverId: $id) {
            success,
            message
        }
    }
`