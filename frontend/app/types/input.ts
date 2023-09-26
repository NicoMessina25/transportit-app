import { ReadonlySignal } from "@preact/signals-react";
import { ChangeEventHandler, FocusEventHandler } from 'react';

export interface InputProps {
    className?: string;
    label?: string;
    error?: string|undefined;
    placeholder?: string;
    required?: boolean; 
}