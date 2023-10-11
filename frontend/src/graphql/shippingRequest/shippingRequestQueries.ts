import { gql } from "@apollo/client";

export const SHIPPING_REQUESTS = gql`
    query{
        shippingRequests{
            requestId
            price,
            state,
            requestDate
            cityFrom{
                cityId,
                name
            }
            cityTo{
                cityId,
                name
            }
            customer {
                customerid,
                firstname,
                lastname
            }
            packages {
                packageId,
                weight,
                size,
                price
            }
        }
    }
`

export const GET_SHIPPING_REQUEST = gql`
query($id: ID){
    shippingRequest(id: $id){
        requestId
            price,
            state,
            requestDate
            cityFrom{
                cityId,
                name
            }
            cityTo{
                cityId,
                name
            }
            customer {
                customerid,
                firstname,
                lastname
            }
            packages {
                packageId,
                weight,
                size,
                price
            }
    }
}
`


export const SAVE_SHIPPING_REQUEST = gql`
    mutation($shippingRequest: ShippingRequest){
        saveShippingRequest(shippingRequest:$shippingRequest) {
            success,
            message
        }
    }

`
export const UPDATE_SHIPPING_REQUEST = gql`
    mutation($shippingRequest: ShippingRequest!){
        updateShippingRequest(shippingRequestRequest:$shippingRequest) {
            success,
            message
        }
    }
`

export const DELETE_SHIPPING_REQUEST = gql`
    mutation($id: ID!){
        deleteShippingRequest(id: $id) {
            success,
            message
        }
    }
`