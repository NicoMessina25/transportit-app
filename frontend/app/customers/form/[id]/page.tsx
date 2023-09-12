"use client"

import { GET_CUSTOMER, UPDATE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import { Customer } from '@/app/types/customer';
import { CustomResponse } from '@/app/types/serverResponse';
import { useMutation, useQuery } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useRouter } from 'next/navigation';
import React, {useEffect} from 'react'
import CustomerForm from '../customerForm';
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { EditProps } from '@/app/types/form';
import GenericEdit from '@/app/Components/GenericEdit/GenericEdit';

export default function CustomerEdit({params}:EditProps) {

    return <GenericEdit formComponent={CustomerForm} getByIdQuery={{name: "customer", query: GET_CUSTOMER}} updateMutation={{name:"updateCustomer", mutation:UPDATE_CUSTOMER}} entityName='customer' params={params} />    
  

}
