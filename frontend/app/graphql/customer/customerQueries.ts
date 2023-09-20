import { gql } from '@apollo/client'

export const CUSTOMERS = gql`
    query{
        customers{
            customerid,
            firstname,
            lastname,
            document,
            address
        }
    }`

export const GET_CUSTOMER = gql`
    query($id: ID){
        customer(id: $id){
            customerid,
            firstname,
            lastname,
            document,
            address
        }
    }
`

export const SAVE_CUSTOMER = gql`
    mutation($customer: CustomerRequest){
        saveCustomer(customerRequest:$customer) {
            success,
            message
        }
    }

`
export const UPDATE_CUSTOMER = gql`
    mutation updateCustomer($customer: CustomerRequest!){
        updateCustomer(customerRequest:$customer) {
            success,
            message
        }
    }
`

export const DELETE_CUSTOMER = gql`
    mutation($id: ID!){
        deleteCustomer(id: $id) {
            success,
            message
        }
    }
`