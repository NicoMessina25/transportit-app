import GenericEdit from '@/app/Components/GenericEdit/GenericEdit'
import React from 'react'
import ShippingRequestForm from '../shippingRequestForm'
import { GET_SHIPPING_REQUEST, UPDATE_SHIPPING_REQUEST } from '@/app/graphql/shippingRequest/shippingRequestQueries'
import { EditProps } from '@/app/types/form'

export default function ShippingRequestEdit({params}:EditProps) {
  return <GenericEdit formComponent={ShippingRequestForm} getByIdQuery={{name:"shippingRequest", query: GET_SHIPPING_REQUEST}} updateMutation={{name:"updateShippingRequest", mutation: UPDATE_SHIPPING_REQUEST}} entityName='shippingRequest' params={params} />
}
