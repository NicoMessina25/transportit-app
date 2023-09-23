"use client"

import React from 'react'
import { EditProps } from '@/app/types/form';
import GenericEdit from '@/app/Components/GenericEdit/GenericEdit';
import DriverForm from '../../../../Components/Forms/driverForm';
import { DRIVERS, GET_DRIVER, UPDATE_DRIVER } from '@/app/graphql/driver/driverQueries';
import useDrivers from '@/app/hooks/fetchers/driver/useDrivers';
import useDriversCont from '@/app/hooks/controllers/driver/useDriversCont';

export default function DriverUpdateForm({params}:EditProps) {
    return <GenericEdit formComponent={DriverForm} useFetcher={useDrivers} useEntityCont={useDriversCont}  params={params} />    

}
