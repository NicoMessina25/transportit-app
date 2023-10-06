import { useMutation } from '@apollo/client';
import useQueryMutHandler from '../../useQueryMutHandler';
import { ControllerInterface, ControllerProps } from '@/src/types/controller';
import { CustomResponse } from '@/src/types/serverResponse';
import { DELETE_ROUTE_MAP, ROUTE_MAPS, SAVE_ROUTE_MAP, UPDATE_ROUTE_MAP } from '@/src/graphql/routeMap/routeMapQueries';
import { RouteMap } from '@/src/types/routeMap';

export default function useRouteMapsCont({onSave, onUpdate, onDelete}:ControllerProps): ControllerInterface {

    const [saveRouteMap, saveRouteMapResult] = useMutation<{saveRouteMap: CustomResponse}>(SAVE_ROUTE_MAP,{refetchQueries: [{query:ROUTE_MAPS}]});
    const [updateRouteMap, updateRouteMapResult] = useMutation<{updateRouteMap: CustomResponse}>(UPDATE_ROUTE_MAP, { refetchQueries: [ {query:ROUTE_MAPS}]});
    const [deleteRouteMap, deleteRouteMapResult] = useMutation<{deleteRouteMap: CustomResponse}>(DELETE_ROUTE_MAP, { refetchQueries: [ {query: ROUTE_MAPS}]});

    useQueryMutHandler<{deleteRouteMap: CustomResponse}>({result:deleteRouteMapResult, queryMutName: "deleteRouteMap", onSuccess: onDelete})
    useQueryMutHandler<{updateRouteMap: CustomResponse}>({result:updateRouteMapResult, queryMutName: "updateRouteMap", onSuccess: onUpdate})
    useQueryMutHandler<{saveRouteMap: CustomResponse}>({result: saveRouteMapResult, queryMutName:"saveRouteMap", onSuccess:onSave})

    function saveEntity(e:RouteMap){
        saveRouteMap({variables:{routeMap: e}});
    }

    function deleteEntity(e:RouteMap){
        deleteRouteMap({variables:{id: e.routeMapid}});
    }

    function updateEntity(e:RouteMap, id:number){
        updateRouteMap({variables:{routeMap: {...e, routeMapId: id}}});
    }


    return {delete: {deleteEntity, 
                    result: {data: deleteRouteMapResult.data?.deleteRouteMap, 
                            error: { error: !!deleteRouteMapResult.error, 
                                    message: deleteRouteMapResult.error?.message }, 
                            loading: deleteRouteMapResult.loading}}, 
            update: {updateEntity, 
                    result: {data: updateRouteMapResult.data?.updateRouteMap, 
                            error: { error: !!updateRouteMapResult.error, 
                                    message: updateRouteMapResult.error?.message }, 
                            loading: updateRouteMapResult.loading}},
            save: {saveEntity,
                    result: {data: saveRouteMapResult.data?.saveRouteMap, 
                            error: { error: !!saveRouteMapResult.error, 
                                    message: saveRouteMapResult.error?.message }, 
                            loading: saveRouteMapResult.loading}}
        }
}
