import { useMutation } from '@apollo/client';
import useQueryMutHandler from '../../useQueryMutHandler';
import { ControllerInterface, ControllerProps } from '@/src/types/controller';
import { CustomResponse } from '@/src/types/serverResponse';
import { DELETE_PACKAGE, PACKAGES, SAVE_PACKAGE, UPDATE_PACKAGE } from '@/src/graphql/_package/packageQueries';
import { Package } from '@/src/types/package';

export default function usePackagesCont({onSave, onUpdate, onDelete}:ControllerProps): ControllerInterface {

    const [savePackage, savePackageResult] = useMutation<{savePackage: CustomResponse}>(SAVE_PACKAGE,{refetchQueries: [{query:PACKAGES}]});
    const [updatePackage, updatePackageResult] = useMutation<{updatePackage: CustomResponse}>(UPDATE_PACKAGE, { refetchQueries: [ {query:PACKAGES}]});
    const [deletePackage, deletePackageResult] = useMutation<{deletePackage: CustomResponse}>(DELETE_PACKAGE, { refetchQueries: [ {query: PACKAGES}]});

    useQueryMutHandler<{deletePackage: CustomResponse}>({result:deletePackageResult, queryMutName: "deletePackage", onSuccess: onDelete})
    useQueryMutHandler<{updatePackage: CustomResponse}>({result:updatePackageResult, queryMutName: "updatePackage", onSuccess: onUpdate})
    useQueryMutHandler<{savePackage: CustomResponse}>({result: savePackageResult, queryMutName:"savePackage", onSuccess:onSave})

    function saveEntity(e:Package){
        savePackage({variables:{package: e}});
    }

    function deleteEntity(e:Package){
        deletePackage({variables:{id: e.packageId}});
    }

    function updateEntity(e:Package, id:number){
        updatePackage({variables:{package: {...e, packageId: id}}});
    }


    return {delete: {deleteEntity, 
                    result: {data: deletePackageResult.data?.deletePackage, 
                            error: { error: !!deletePackageResult.error, 
                                    message: deletePackageResult.error?.message }, 
                            loading: deletePackageResult.loading}}, 
            update: {updateEntity, 
                    result: {data: updatePackageResult.data?.updatePackage, 
                            error: { error: !!updatePackageResult.error, 
                                    message: updatePackageResult.error?.message }, 
                            loading: updatePackageResult.loading}},
            save: {saveEntity,
                    result: {data: savePackageResult.data?.savePackage, 
                            error: { error: !!savePackageResult.error, 
                                    message: savePackageResult.error?.message }, 
                            loading: savePackageResult.loading}}
        }
}
