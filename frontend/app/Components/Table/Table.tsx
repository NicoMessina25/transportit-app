"use client"

import {
  CellContext,
  ColumnDef,
  flexRender,
  getCoreRowModel,
  useReactTable,
} from "@tanstack/react-table"

import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import { Icon } from "@iconify/react/dist/iconify.js"

interface DataTableProps<TData, TValue> {
  columns: ColumnDef<TData, TValue>[]
  data: TData[]
  onEdit?: (item:TData)=> void
  onDelete?: (item:TData) => void,
  className?: string
}

export interface Cell<TData,TValue = unknown> extends CellContext<TData,TValue> {
}



export function DataTable<TData, TValue>({
  columns,
  data,
  onDelete,
  onEdit,
  className = ""
}: DataTableProps<TData, TValue>) {
  const table = useReactTable({
    data,
    columns,
    getCoreRowModel: getCoreRowModel(),
  })

  return (
    <div className={`rounded-md border ${className}`}>
      <Table>
        <TableHeader>
          {table.getHeaderGroups().map((headerGroup) => (
            <TableRow key={headerGroup.id}>
              {headerGroup.headers.map((header) => {
                return (
                  <TableHead key={header.id}>
                    {header.isPlaceholder
                      ? null
                      : flexRender(
                          header.column.columnDef.header,
                          header.getContext()
                        )}
                  </TableHead>
                )
              })}
            </TableRow>
          ))}
        </TableHeader>
        <TableBody>
          {table.getRowModel().rows?.length ? (
            table.getRowModel().rows.map((row) => (
              <TableRow
                key={row.id}
                data-state={row.getIsSelected() && "selected"}
              >
                {row.getVisibleCells().map((cell) => (
                  <TableCell key={cell.id} >
                    {flexRender(cell.column.columnDef.cell, cell.getContext())}
                  </TableCell>
                ))}
                {onEdit && <TableCell><Icon icon={'material-symbols:edit'} onClick={()=> onEdit(row.original)} className='w-7 h-7 p-1 rounded transition-all hover:text-cyan-300 hover:bg-cyan-50/10 cursor-pointer' /></TableCell>}
                {onDelete && <TableCell><Icon icon={'mdi:trash'} onClick={()=> onDelete(row.original)} className='w-7 h-7 p-1 rounded transition-all hover:text-cyan-300 hover:bg-cyan-50/10 cursor-pointer' /></TableCell>}
              </TableRow>
            ))
          ) : (
            <TableRow>
              <TableCell colSpan={columns.length} className="h-24 text-center">
                No results.
              </TableCell>
            </TableRow>
          )}
        </TableBody>
      </Table>
    </div>
  )
}
