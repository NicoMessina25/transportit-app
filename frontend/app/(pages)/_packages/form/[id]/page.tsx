"use client"

import { GET_PACKAGE, PACKAGES, UPDATE_PACKAGE } from '@/app/graphql/_package/packageQueries';
import { EditProps } from '@/app/types/form';
import React from 'react'
import PackageForm from '../../../../Components/Forms/packageForm';
import GenericEdit from '@/app/Components/GenericEdit/GenericEdit';

export default function PackageEdit({params}:EditProps) {

    return <GenericEdit formComponent={PackageForm} getByIdQuery={{name: "package", query:GET_PACKAGE}} updateMutation={{name: "updatePackage", mutation:UPDATE_PACKAGE}} params={params} entityName='package' queryToRefetch={PACKAGES} entityIdField='packageid' />

}
