import { ChangeEventHandler, FocusEventHandler, forwardRef } from 'react';
import { ReadonlySignal } from '@preact/signals-react'

type TextInputProps = {
  name: string;
  className?: string;
  type: 'text' | 'email' | 'tel' | 'password' | 'url' | 'date';
  label?: string;
  placeholder?: string;
  value: ReadonlySignal<string | undefined>;
  error: ReadonlySignal<string>;
  required?: boolean;
  onChange: ChangeEventHandler<HTMLInputElement>;
  onBlur: FocusEventHandler<HTMLInputElement>;
};

export const TextInput = forwardRef<HTMLInputElement, TextInputProps>(
  ({ label, value, error, name, required, className, ...props }, ref) => {
    return (
      <div>
        {label && (
          <label htmlFor={name}>
            {label} {required && <span>*</span>}
          </label>
        )}
        <input
          {...props}
          ref={ref}
          id={name}
          className={`${className} w-full border-none rounded focus:border-none`}
          value={value.value ?? ''}
          aria-invalid={!!error.value}
          aria-errormessage={`${name}-error`}
        />
        {error.value && <div id={`${name}-error`}>{error}</div>}
      </div>
    );
  }
);
