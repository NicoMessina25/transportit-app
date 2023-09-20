import { ReadonlySignal } from "@preact/signals-react";
import { ChangeEventHandler, FocusEventHandler } from 'react';

export interface InputProps {
    name?: string;
    className?: string;
    inputClassName?:string;
    label?: string;
    placeholder?: string;
    error?: string|undefined;
    required?: boolean;
    onChange: ChangeEventHandler<HTMLInputElement>;
    onBlur?: FocusEventHandler<HTMLInputElement>;
}