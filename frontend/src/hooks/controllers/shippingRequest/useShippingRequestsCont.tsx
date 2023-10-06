import { useMutation } from '@apollo/client';
import useQueryMutHandler from '../../useQueryMutHandler';
import { DELETE_SHIPPING_REQUEST, SAVE_SHIPPING_REQUEST, SHIPPING_REQUESTS, UPDATE_SHIPPING_REQUEST } from '@/src/graphql/shippingRequest/shippingRequestQueries';
import { CustomResponse } from '@/src/types/serverResponse';
import { ControllerInterface, ControllerProps } from '@/src/types/controller';
import { ShippingRequest } from '@/src/types/shippingRequest';

export default function useShippingRequestsCont({onSave, onUpdate, onDelete}:ControllerProps): ControllerInterface {

    const [saveShippingRequest, saveShippingRequestResult] = useMutation<{saveShippingRequest: CustomResponse}>(SAVE_SHIPPING_REQUEST,{refetchQueries: [{query:SHIPPING_REQUESTS}]});
    const [updateShippingRequest, updateShippingRequestResult] = useMutation<{updateShippingRequest: CustomResponse}>(UPDATE_SHIPPING_REQUEST, { refetchQueries: [ {query:SHIPPING_REQUESTS}]});
    const [deleteShippingRequest, deleteShippingRequestResult] = useMutation<{deleteShippingRequest: CustomResponse}>(DELETE_SHIPPING_REQUEST, { refetchQueries: [ {query: SHIPPING_REQUESTS}]});

    useQueryMutHandler<{deleteShippingRequest: CustomResponse}>({result:deleteShippingRequestResult, queryMutName: "deleteShippingRequest", onSuccess: onDelete})
    useQueryMutHandler<{updateShippingRequest: CustomResponse}>({result:updateShippingRequestResult, queryMutName: "updateShippingRequest", onSuccess: onUpdate})
    useQueryMutHandler<{saveShippingRequest: CustomResponse}>({result: saveShippingRequestResult, queryMutName:"saveShippingRequest", onSuccess:onSave})

    function saveEntity(e:ShippingRequest){
        saveShippingRequest({variables:{shippingRequest: e}});
    }

    function deleteEntity(e:ShippingRequest){
        deleteShippingRequest({variables:{id: e.requestId}});
    }

    function updateEntity(e:ShippingRequest, id:number){
        updateShippingRequest({variables:{shippingRequest: {...e, requestId: id}}});
    }


    return {delete: {deleteEntity, 
                    result: {data: deleteShippingRequestResult.data?.deleteShippingRequest, 
                            error: { error: !!deleteShippingRequestResult.error, 
                                    message: deleteShippingRequestResult.error?.message }, 
                            loading: deleteShippingRequestResult.loading}}, 
            update: {updateEntity, 
                    result: {data: updateShippingRequestResult.data?.updateShippingRequest, 
                            error: { error: !!updateShippingRequestResult.error, 
                                    message: updateShippingRequestResult.error?.message }, 
                            loading: updateShippingRequestResult.loading}},
            save: {saveEntity,
                    result: {data: saveShippingRequestResult.data?.saveShippingRequest, 
                            error: { error: !!saveShippingRequestResult.error, 
                                    message: saveShippingRequestResult.error?.message }, 
                            loading: saveShippingRequestResult.loading}}
        }
}
