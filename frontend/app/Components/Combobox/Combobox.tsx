"use client"

import * as React from "react"
import { Check, ChevronsUpDown } from "lucide-react"

import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import {
  Command,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
} from "@/components/ui/command"
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover"
import { Indexable } from "../Table/Table"
import { Label } from "../Labels/Label/Label"
import ErrorLabel from "../Labels/ErrorLabel/ErrorLabel"
import { InputProps } from "@/app/types/input"

interface ComboboxProps<TItem extends Indexable> extends InputProps{
  items: TItem[],
  optionLabel:keyof TItem,
  keyField: keyof TItem,
  notFoundText:string,
  value: TItem | undefined,
  onChange: (i:TItem|undefined) => void,
}

export function Combobox<TItem extends Indexable>({items,placeholder = "",optionLabel,keyField,label,notFoundText,onChange,error,value}:ComboboxProps<TItem>) {
  const [open, setOpen] = React.useState(false)
  return (
    <Popover open={open} onOpenChange={setOpen}>
      {label && <Label text={label} className="my-1" />}
      <PopoverTrigger asChild>
        <Button
          variant="outline"
          role="combobox"
          aria-expanded={open}
          className={`w-full justify-between my-2 py-2 text-zinc-300 ${error? "border-red-500 border-2":""}`}
        >
          {value
            ? items.find((item) => item[keyField] === value[keyField])?.[optionLabel]
          : placeholder}
          <ChevronsUpDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
        </Button>
      </PopoverTrigger>
      <ErrorLabel error={!!error} text={error} />
      <PopoverContent className="w-full p-0 h-[300px]">
        <Command>
          <CommandInput placeholder={placeholder} />
          <CommandEmpty>{notFoundText}</CommandEmpty>
          <CommandGroup className="overflow-y-auto">
            {items.map((item) => (
              <CommandItem
                key={item[keyField] as React.Key}
                onSelect={(labelItemSelected:string) => {
                  console.log(labelItemSelected);
    
                  const itemSelected:TItem | null = items.find(i=>i[optionLabel].toLowerCase()===labelItemSelected) ?? null
          
                  if(itemSelected?.[keyField] === value?.[keyField]){
                    onChange(undefined)
                  }  
                  else if(itemSelected) {
                    onChange(itemSelected)
                  } 
                  
                  setOpen(false)
                }}
              >
                <Check
                  className={cn(
                    "mr-2 h-4 w-4",
                    value?.[keyField] === item[keyField] ? "opacity-100" : "opacity-0"
                  )}
                />
                {item[optionLabel]}
              </CommandItem>
            ))}
          </CommandGroup>
        </Command>
      </PopoverContent>
    </Popover>
  )
}
