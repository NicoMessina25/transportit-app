import { gql } from "@apollo/client";

export const PACKAGES = gql`
    query{
        packages{
            packageId,
            weight,
            size,
            price,
            recipientdocument,
            recipientfirstname
        }
    }
`

export const GET_PACKAGE = gql`
query($id: ID){
    package(id: $id){
        packageid,
        weight,
        size,
        price
        state
        shippingRequestId
        routeMapId
        feePricingId
        recipientdocument
        recipientfirstname
        cityFeeCoefficient
    }
}
`


export const SAVE_PACKAGE = gql`
    mutation($package: PackageRequest){
        savePackage(packageRequest:$package) {
            success,
            message
        }
    }

`
export const UPDATE_PACKAGE = gql`
    mutation($id: ID!, $package: PackageRequest!){
        updatePackage(id: $id, packageRequest:$package) {
            success,
            message
        }
    }
`

export const DELETE_PACKAGE = gql`
    mutation($id: ID!){
        deletePackage(id: $id) {
            success,
            message
        }
    }
`