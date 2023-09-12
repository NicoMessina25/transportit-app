import { ChangeEventHandler, FocusEventHandler, forwardRef } from 'react';
import { ReadonlySignal } from '@preact/signals-react'

type TextInputProps = {
  name: string;
  className?: string;
  inputClassName?:string;
  type: 'text' | 'email' | 'tel' | 'password' | 'url' | 'date' | 'number';
  label?: string;
  placeholder?: string;
  value: ReadonlySignal<string | number | undefined>;
  error: ReadonlySignal<string>;
  required?: boolean;
  onChange: ChangeEventHandler<HTMLInputElement>;
  onBlur: FocusEventHandler<HTMLInputElement>;
}

const TextInput = forwardRef<HTMLInputElement, TextInputProps>(
  ({ label, value, error, name, required, inputClassName, className, ...props }, ref) => {
    return (
      <div className={className}>
        {label && (
          <label htmlFor={name} className='font-semibold'>
            {label} {required && <span>*</span>}
          </label>
        )}
        <input
          {...props}
          ref={ref}
          id={name}
          className={`${inputClassName} text-zinc-300 bg-blue-900 ${error.value? "border-red-400 border-2":""} w-full rounded focus:outline-0 px-2 py-1`}
          value={value.value ?? ''}
          aria-invalid={!!error.value}
          aria-errormessage={`${name}-error`}
        />
        {error.value && <div id={`${name}-error`} className='text-red-400'>{error}</div>}
      </div>
    );
  }
);

TextInput.displayName = "TextInput";

export {TextInput}