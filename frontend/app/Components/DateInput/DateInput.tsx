"use client"

import * as React from "react"
import { format, min } from "date-fns"
import { Calendar as CalendarIcon } from "lucide-react"

import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Calendar } from "@/components/ui/calendar"
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover"
import { InputProps } from "@/app/types/input"
import { Label } from "../Labels/Label/Label"

interface DateInputProps extends InputProps {
    value: Date | undefined
    onChange: (d: Date | undefined) => void
    maxDate?: Date,
    minDate?: Date
}

export function DateInput({value, onChange, placeholder = "", label, maxDate, minDate}:DateInputProps) {

  return (
    <Popover>
      {label && <Label text={label} className="my-1" />}
      <PopoverTrigger asChild>
        <Button
          variant={"outline"}
          className={cn(
            "w-full justify-start text-left font-normal",
            !value && "text-muted-foreground"
          )}
        >
          <CalendarIcon className="mr-2 h-4 w-4" />
          {value ? format(value, "PPP") : <span>{placeholder}</span>}
        </Button>
      </PopoverTrigger>
      <PopoverContent className="w-auto p-0">
        <Calendar
          mode="single"
          selected={value}
          onSelect={onChange}
          initialFocus
          toDate={maxDate}
          fromDate={minDate}
        />
      </PopoverContent>
    </Popover>
  )
}
