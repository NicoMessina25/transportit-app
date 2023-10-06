import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import {
  Popover as PopoverUI,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover"

export interface PopoverProps{
    children: React.ReactNode,
    text:string,
    className?:string
}

export function Popover({children, text,className=""}:PopoverProps) {
  return (
    <PopoverUI>
      <PopoverTrigger asChild className={className}>
        <Button variant="outline">{text}</Button>
      </PopoverTrigger>
      <PopoverContent className="w-fit dark">
        {children}
      </PopoverContent>
    </PopoverUI>
  )
}
