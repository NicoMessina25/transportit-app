import React, { useState } from 'react'
import { authenticate } from '@/src/services/authServices'

export default function useAuth() {    
    return {authenticate}
}
