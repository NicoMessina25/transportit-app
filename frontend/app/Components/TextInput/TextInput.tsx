"use client"

import { InputProps } from '@/app/types/input';
import { Input } from '@/components/ui/input';
import { forwardRef, ForwardedRef } from 'react';
import { Label } from '../Labels/Label/Label';
import ErrorLabel from '../Labels/ErrorLabel/ErrorLabel';

interface TextInputProps extends InputProps {
  type?: 'text' | 'password' | 'email' | "tel" | "number"
  value: string | number | null | undefined
}

export const TextInput = forwardRef<HTMLInputElement, TextInputProps>(
  ({ label, error, name, required, inputClassName, className, type="text", value, ...props }, ref) => {
    

    return (
      <div className={className + " my-2"}>
        {label && (
          <Label htmlFor={name} className='font-semibold' text={label} required={required} />
        )}
        <Input
          {...props}
          value={value ?? ""}
          ref={ref}
          type={type}
          step={"any"}
          id={name}
          className={`${inputClassName} text-zinc-300 ${error? "border-red-500 border-2":""} w-full rounded focus:outline-0 px-2 py-1`}
          aria-invalid={!!error}
          aria-errormessage={`${name}-error`}
        />
        <ErrorLabel error={!!error} text={error} htmlFor={name} />
      </div>
    );
  }
);

TextInput.displayName = 'TextInput'