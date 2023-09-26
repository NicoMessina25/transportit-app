import { authenticate } from '@/app/services/authServices'
import React, { useState } from 'react'

export default function useAuth() {
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(false)
    
    return {authenticate,loading,error}
}
