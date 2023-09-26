import { ControllerInterface, ControllerProps } from '@/app/types/controller';
import { CustomResponse } from '@/app/types/serverResponse';
import { useMutation } from '@apollo/client';
import useQueryMutHandler from '../../useQueryMutHandler';
import { DELETE_DRIVER, DRIVERS, SAVE_DRIVER, UPDATE_DRIVER } from '@/app/graphql/driver/driverQueries';
import { Driver } from '@/app/types/driver';

export default function useDriversCont({onSave, onUpdate, onDelete}:ControllerProps): ControllerInterface {

    const [saveDriver, saveDriverResult] = useMutation<{saveDriver: CustomResponse}>(SAVE_DRIVER,{refetchQueries: [{query:DRIVERS}]});
    const [updateDriver, updateDriverResult] = useMutation<{updateDriver: CustomResponse}>(UPDATE_DRIVER, { refetchQueries: [ {query:DRIVERS}]});
    const [deleteDriver, deleteDriverResult] = useMutation<{deleteDriver: CustomResponse}>(DELETE_DRIVER, { refetchQueries: [ {query: DRIVERS}]});

    useQueryMutHandler<{deleteDriver: CustomResponse}>({result:deleteDriverResult, queryMutName: "deleteDriver", onSuccess: onDelete})
    useQueryMutHandler<{updateDriver: CustomResponse}>({result:updateDriverResult, queryMutName: "updateDriver", onSuccess: onUpdate})
    useQueryMutHandler<{saveDriver: CustomResponse}>({result: saveDriverResult, queryMutName:"saveDriver", onSuccess:onSave})

    function saveEntity(e:Driver){
        saveDriver({variables:{driver: e}});
    }

    function deleteEntity(e:Driver){
        deleteDriver({variables:{id: e.driverId}});
    }

    function updateEntity(e:Driver, id:number){
        updateDriver({variables:{driver: {...e, driverId: id}}});
    }


    return {delete: {deleteEntity, 
                    result: {data: deleteDriverResult.data?.deleteDriver, 
                            error: { error: !!deleteDriverResult.error, 
                                    message: deleteDriverResult.error?.message }, 
                            loading: deleteDriverResult.loading}}, 
            update: {updateEntity, 
                    result: {data: updateDriverResult.data?.updateDriver, 
                            error: { error: !!updateDriverResult.error, 
                                    message: updateDriverResult.error?.message }, 
                            loading: updateDriverResult.loading}},
            save: {saveEntity,
                    result: {data: saveDriverResult.data?.saveDriver, 
                            error: { error: !!saveDriverResult.error, 
                                    message: saveDriverResult.error?.message }, 
                            loading: saveDriverResult.loading}}
        }
}
