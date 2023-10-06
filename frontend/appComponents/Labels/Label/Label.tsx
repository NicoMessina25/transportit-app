import { Label as LabelShadcn } from "@/components/ui/label"

interface LabelProps{
    text?:string,
    htmlFor?:string,
    required?:boolean,
    className?:string
}

export function Label({htmlFor, text = "", required,className=""}:LabelProps) {
  return <LabelShadcn htmlFor={htmlFor} className={`text-slate-300 ${className}`}>{text} {required ? <span>*</span>:<></>}</LabelShadcn>


}
