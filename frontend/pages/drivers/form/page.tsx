 

import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import DriverForm from '../../../Components/Forms/driverForm';
import useDriversCont from '@/app/hooks/controllers/driver/useDriversCont';
import useRouter from '@/app/hooks/useRouter';
import useLoader from '@/app/hooks/useLoader';


export default function DriverAddView() {
    const router:AppRouterInstance = useRouter();
    const {save:{saveEntity}} = useDriversCont({onSave:()=>{
        router.back();
    }})
    useLoader()

    return <DriverForm onSubmit={saveEntity} />        

}