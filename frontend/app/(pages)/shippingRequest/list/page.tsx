import GenericCRUDView from '@/app/Components/GenericCRUDView/GenericCRUDView'
import { DELETE_SHIPPING_REQUEST, GET_SHIPPING_REQUEST } from '@/app/graphql/shippingRequest/shippingRequestQueries'
import React from 'react'

export default function ShippingRequestCRUD() {
  return <GenericCRUDView getQuery={{name: "shippingRequests", query: GET_SHIPPING_REQUEST}} deleteMutation={{name:"deleteShippingRequest", mutation:DELETE_SHIPPING_REQUEST}} entityIdField='requestid' columns={[

  ]} />
}
