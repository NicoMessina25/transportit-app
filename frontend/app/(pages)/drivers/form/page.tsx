"use client"

import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import DriverForm from './driverForm';
import { Driver } from '@/app/types/driver';
import { CustomResponse } from '@/app/types/serverResponse';
import { useMutation } from '@apollo/client';
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { DRIVERS, SAVE_DRIVER } from '@/app/graphql/driver/driverQueries';


export default function DriverAddView() {
    const router:AppRouterInstance = useRouter();

    const [saveDriver, saveDriverMutation] = useMutation<{saveDriver: CustomResponse}>(SAVE_DRIVER,{refetchQueries: [{query:DRIVERS}]});
    
    useQueryMutHandler<{saveDriver: CustomResponse}>({result: saveDriverMutation, queryMutName:"saveDriver", onSuccess:()=>{
        router.push("./list");
    }})

    return <DriverForm onSubmit={(d:Driver)=>{
                saveDriver({variables:{driver: d}})
        }} />        

}