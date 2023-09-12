import GenericCRUD from '@/app/Components/GenericCRUD/GenericCRUD'
import { DELETE_SHIPPING_REQUEST, GET_SHIPPING_REQUEST } from '@/app/graphql/shippingRequest/shippingRequestQueries'
import React from 'react'

export default function ShippingRequestCRUD() {
  return <GenericCRUD getQuery={{name: "shippingRequests", query: GET_SHIPPING_REQUEST}} deleteMutation={{name:"deleteShippingRequest", mutation:DELETE_SHIPPING_REQUEST}} entityIdField='requestid' columns={[

  ]} />
}
