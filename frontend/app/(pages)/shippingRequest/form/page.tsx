"use client"

import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import ShippingRequestForm from '../../../Components/Forms/shippingRequestForm';
import useShippingRequestsCont from '@/app/hooks/controllers/shippingRequest/useShippingRequestsCont';
import useRouter from '@/app/hooks/useRouter';
import useLoader from '@/app/hooks/useLoader';


export default function ShippingRequestAddView() {
    const router:AppRouterInstance = useRouter();
    const {save:{saveEntity}} = useShippingRequestsCont({onSave:()=>{
        router.back();
    }})
    useLoader()

    return <ShippingRequestForm onSubmit={saveEntity} />        

}