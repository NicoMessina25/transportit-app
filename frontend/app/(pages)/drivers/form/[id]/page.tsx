"use client"

import React from 'react'
import { EditProps } from '@/app/types/form';
import GenericEditEntityView from '@/app/Components/GenericEditEntityView/GenericEditEntityView';
import DriverForm from '../../../../Components/Forms/driverForm';
import useDrivers from '@/app/hooks/fetchers/driver/useDrivers';
import useDriversCont from '@/app/hooks/controllers/driver/useDriversCont';

export default function DriverUpdateForm({params}:EditProps) {
    return <GenericEditEntityView formComponent={DriverForm} useFetcher={useDrivers} useEntityCont={useDriversCont}  params={params} />    

}
