import { gql } from "@apollo/client";

export const SHIPPING_REQUESTS = gql`
    query{
        shippingRequests{
            requestid
            price,
            state,
            requesDate
            cityFrom{
                cityid,
                name
            }
            cityTo{
                cityid,
                name
            }
            customer {
                customerid,
                firstname,
                lastname
            }
            packages {
                packageid,
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
        requestid
            price,
            state,
            requesDate
            cityFrom{
                cityid,
                name
            }
            cityTo{
                cityid,
                name
            }
            customer {
                customerid,
                firstname,
                lastname
            }
            packages {
                packageid,
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
    mutation($id: ID!, $shippingRequest: ShippingRequest!){
        updateShippingRequest(id: $id, shippingRequestRequest:$shippingRequest) {
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