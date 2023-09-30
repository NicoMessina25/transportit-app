import React, { useState } from 'react'

import ClipLoader from "react-spinners/ClipLoader";

export interface SpinnerProps {
    size?: number
}

export default function Spinner({size=150}:SpinnerProps) {

    return (
         <ClipLoader
            color={"ffffff"}
            loading={true}
            size={size}
            aria-label="Loading Spinner"
            data-testid="loader"
        />
    );
}
