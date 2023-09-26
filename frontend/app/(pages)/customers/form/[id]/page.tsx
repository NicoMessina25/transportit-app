"use client"

import React from 'react'
import CustomerForm from '../../../../Components/Forms/customerForm';
import { EditProps } from '@/app/types/form';
import GenericEditEntityView from '@/app/Components/GenericEditEntityView/GenericEditEntityView';
import useCustomersCont from '@/app/hooks/controllers/customer/useCustomersCont';
import useCustomers from '@/app/hooks/fetchers/customer/useCustomers';

export default function CustomerEdit({params}:EditProps) {
    return <GenericEditEntityView formComponent={CustomerForm} useFetcher={useCustomers} useEntityCont={useCustomersCont} params={params} />    
}
