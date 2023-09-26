import GenericEditEntityView from '@/app/Components/GenericEditEntityView/GenericEditEntityView'
import React from 'react'
import ShippingRequestForm from '../../../../Components/Forms/shippingRequestForm'
import { GET_SHIPPING_REQUEST, SHIPPING_REQUESTS, UPDATE_SHIPPING_REQUEST } from '@/app/graphql/shippingRequest/shippingRequestQueries'
import { EditProps } from '@/app/types/form'

export default function ShippingRequestEdit({params}:EditProps) {
  return <></> /* <GenericEdit formComponent={ShippingRequestForm} getByIdQuery={{name:"shippingRequest", query: GET_SHIPPING_REQUEST}} updateMutation={{name:"updateShippingRequest", mutation: UPDATE_SHIPPING_REQUEST}} entityName='shippingRequest' params={params} queryToRefetch={SHIPPING_REQUESTS} entityIdField='requestId' /> */
}
