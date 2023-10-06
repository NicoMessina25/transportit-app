 

import { EditProps } from '@/app/types/form';
import React from 'react'
import GenericEditEntityView from '@/app/Components/GenericEditEntityView/GenericEditEntityView';
import PackageForm from '../../../../Components/Forms/packageForm';
import usePackages from '@/app/hooks/fetchers/package/usePackages';
import usePackagesCont from '@/app/hooks/controllers/package/usePackagesCont';

export default function PackageEdit({params}:EditProps) {

    return <GenericEditEntityView formComponent={PackageForm} useFetcher={usePackages} useEntityCont={usePackagesCont}  params={params} />    

}
