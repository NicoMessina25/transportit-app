"use client"

import { CUSTOMERS, GET_CUSTOMER, UPDATE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import React from 'react'
import CustomerForm from '../../../../Components/Forms/customerForm';
import { EditProps } from '@/app/types/form';
import GenericEdit from '@/app/Components/GenericEdit/GenericEdit';
import useCustomersCont from '@/app/hooks/controllers/customer/useCustomersCont';
import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import useCustomers from '@/app/hooks/fetchers/customer/useCustomers';

export default function CustomerEdit({params}:EditProps) {
    return <GenericEdit formComponent={CustomerForm} useFetcher={useCustomers} useEntityCont={useCustomersCont} params={params} />    
}
