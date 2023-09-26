export default interface JwtUser {
    userId?: number,
    username: string,
    email: string|null,
    password: string,
    accessToken:string
    tokenEndDate:Date
  }