import { GET_PACKAGE, UPDATE_PACKAGE } from '@/app/graphql/_package/packageQueries';
import { EditProps } from '@/app/types/form';
import { Package } from '@/app/types/package';
import { CustomResponse } from '@/app/types/serverResponse';
import { useMutation, useQuery } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useRouter } from 'next/navigation';
import React from 'react'
import PackageForm from '../packageForm';
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import GenericEdit from '@/app/Components/GenericEdit/GenericEdit';

export default function PackageEdit({params}:EditProps) {

    return <GenericEdit formComponent={PackageForm} getByIdQuery={{name: "package", query:GET_PACKAGE}} updateMutation={{name: "updatePackage", mutation:UPDATE_PACKAGE}} params={params} entityName='package' />

}
