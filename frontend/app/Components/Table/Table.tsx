import React from 'react'
import { PencilIcon, TrashIcon } from '@heroicons/react/24/solid'

export type Column = {
  field: string;
  header: string;
}

export type Item = {
  [key: string]:any;
}

export type TableProps<T> = {
  columns: Column[], 
  items:T[],
  itemsKeyField: string;
  onEdit?: (item:T)=> void
  onDelete?: (item:T) => void
}

export default function Table<T extends Item>({columns, items, itemsKeyField, onEdit, onDelete}:TableProps<T>) {
  return (
    <table className="table-auto hover:table-fixed">
    <thead>
      <tr>
        {columns.map((c)=><th key={c.field}>{c.header}</th>)}
        {onEdit && <th>Editar</th>}
        {onDelete && <th>Eliminar</th>}
      </tr>
    </thead>
    <tbody>
      {items.map((i)=><tr key={i[itemsKeyField]}>
        {columns.map((c)=><td key={c.field + i[itemsKeyField]}>
            {c.field in i ? i[c.field] : c.field}
        </td>)}
        {onEdit && <td className='cursor-pointer'><PencilIcon onClick={()=> onEdit(i)} className='w-5 h-5' /></td>}
        {onDelete && <td className='cursor-pointer'><TrashIcon onClick={()=> onDelete(i)} className='w-5 h-5' /></td>}
      </tr>)}
    </tbody>
  </table>
  )
}
