import GenericCRUD from '@/app/Components/GenericCRUD/GenericCRUD'
import { DELETE_PACKAGE, PACKAGES } from '@/app/graphql/_package/packageQueries'
import React from 'react'

export default function PackageCRUD() {

    return <GenericCRUD getQuery={{name: "packages", query: PACKAGES}} deleteMutation={{name:"deletePackage", mutation:DELETE_PACKAGE}} entityIdField='packageid' columns={[

    ]} />
}
