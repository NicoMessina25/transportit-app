"use client"

import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import DriverForm from '../../../Components/Forms/driverForm';
import { Driver } from '@/app/types/driver';
import { CustomResponse } from '@/app/types/serverResponse';
import { useMutation } from '@apollo/client';
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { DRIVERS, SAVE_DRIVER } from '@/app/graphql/driver/driverQueries';
import useDriversCont from '@/app/hooks/controllers/driver/useDriversCont';


export default function DriverAddView() {
    const router:AppRouterInstance = useRouter();
    const {save:{saveEntity}} = useDriversCont({onSave:()=>{
        router.back();
    }})
    return <DriverForm onSubmit={saveEntity} />        

}