"use client"

import React from 'react'
import { EditProps } from '@/app/types/form';
import GenericEdit from '@/app/Components/GenericEdit/GenericEdit';
import DriverForm from '../driverForm';
import { DRIVERS, GET_DRIVER, UPDATE_DRIVER } from '@/app/graphql/driver/driverQueries';

export default function DriverUpdateForm({params}:EditProps) {

    return <GenericEdit formComponent={DriverForm} getByIdQuery={{name: "driver", query: GET_DRIVER}} updateMutation={{name:"updateDriver", mutation:UPDATE_DRIVER}} entityName='driver' params={params} queryToRefetch={DRIVERS} entityIdField={"driverId"} />    
  

}
