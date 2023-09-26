import JwtUser from "../types/jwtUser";

export function authenticate(username:string, password:string){
    return fetch("http://localhost:8080/auth/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ username, password }),
        mode: "cors",
      })
        .then((response) => response.json())
        .then((data) => {            
          if (data.accessToken) {
            localStorage.setItem("user", JSON.stringify(data));
          }
          return data;
        })
        .catch((error) => {
          console.error("Error:", error);
        });
}

export function getUserFromLocalStrg():JwtUser|undefined{
  const userStr = localStorage.getItem("user");
  let user:JwtUser|undefined = undefined;
  if (userStr)
    user = JSON.parse(userStr);

  return user
}


export function isLogged(){
  const user = getUserFromLocalStrg()
  return !((!user || new Date(user.tokenEndDate) < new Date()) && !location.pathname.includes('/login'))
}

