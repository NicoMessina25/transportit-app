import { CUSTOMERS, DELETE_CUSTOMER, GET_CUSTOMER, SAVE_CUSTOMER, UPDATE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import { ControllerInterface, ControllerProps } from '@/app/types/controller';
import { CustomResponse } from '@/app/types/serverResponse';
import { useMutation } from '@apollo/client';
import React from 'react'
import useQueryMutHandler from '../../useQueryMutHandler';
import { Customer } from '@/app/types/customer';

export default function useCustomersCont({onSave, onUpdate, onDelete}:ControllerProps): ControllerInterface {

    const [saveCustomer, saveCustomerResult] = useMutation<{saveCustomer: CustomResponse}>(SAVE_CUSTOMER,{refetchQueries: [{query:CUSTOMERS}]});
    const [updateCustomer, updateCustomerResult] = useMutation<{updateCustomer: CustomResponse}>(UPDATE_CUSTOMER, { refetchQueries: [ {query:CUSTOMERS}]});
    const [deleteCustomer, deleteCustomerResult] = useMutation<{deleteCustomer: CustomResponse}>(DELETE_CUSTOMER, { refetchQueries: [ {query: CUSTOMERS}]});

    useQueryMutHandler<{deleteCustomer: CustomResponse}>({result:deleteCustomerResult, queryMutName: "deleteCustomer", onSuccess: onDelete})
    useQueryMutHandler<{updateCustomer: CustomResponse}>({result:updateCustomerResult, queryMutName: "updateCustomer", onSuccess: onUpdate})
    useQueryMutHandler<{saveCustomer: CustomResponse}>({result: saveCustomerResult, queryMutName:"saveCustomer", onSuccess:onSave})

    function saveEntity(e:Customer){
        saveCustomer({variables:{customer: e}});
    }

    function deleteEntity(e:Customer){
        deleteCustomer({variables:{id: e.customerid}});
    }

    function updateEntity(e:Customer, id:number){
        updateCustomer({variables:{customer: {...e, customerid: id}}});
    }


    return {delete: {deleteEntity, 
                    result: {data: deleteCustomerResult.data?.deleteCustomer, 
                            error: { error: !!deleteCustomerResult.error, 
                                    message: deleteCustomerResult.error?.message }, 
                            loading: deleteCustomerResult.loading}}, 
            update: {updateEntity, 
                    result: {data: updateCustomerResult.data?.updateCustomer, 
                            error: { error: !!updateCustomerResult.error, 
                                    message: updateCustomerResult.error?.message }, 
                            loading: updateCustomerResult.loading}},
            save: {saveEntity,
                    result: {data: saveCustomerResult.data?.saveCustomer, 
                            error: { error: !!saveCustomerResult.error, 
                                    message: saveCustomerResult.error?.message }, 
                            loading: saveCustomerResult.loading}}
        }
}
