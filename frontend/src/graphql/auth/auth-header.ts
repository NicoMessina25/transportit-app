import JwtUser from "@/src/types/jwtUser";

export default function authHeader() {
    const userStr = localStorage.getItem("user");
    let user:JwtUser|undefined = undefined;
    if (userStr)
      user = JSON.parse(userStr);
  
    if (user?.accessToken) {
      return { Authorization: 'Bearer ' + user.accessToken }; // for Spring Boot back-end
    } else {
      return { Authorization: '' }; // for Spring Boot back-end
    }
  }