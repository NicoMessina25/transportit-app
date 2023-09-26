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
    query getCustomerById($customerId: ID){
        customer(customerid: $customerId){
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
        deleteCustomer(customerId: $id) {
            success,
            message
        }
    }
`