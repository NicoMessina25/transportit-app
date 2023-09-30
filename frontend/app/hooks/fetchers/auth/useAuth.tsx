import { authenticate } from '@/app/services/authServices'
import React, { useState } from 'react'

export default function useAuth() {    
    return {authenticate}
}
