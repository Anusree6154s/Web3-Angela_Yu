import ReactDOM from 'react-dom'
import React from 'react'
import App from "./components/App";
import { AuthClient } from '../../../node_modules/@dfinity/auth-client/lib/cjs/index';

const init = async () => {

  const authclient = await AuthClient.create();

  if (await authclient.isAuthenticated()) {
    // console.log("logged in");
    handleAuthenticated(authclient)
  } else {
    await authclient.login({
      identityProvider: "https://identity.ic0.app/#authorize",
      onSuccess: () => {
        ReactDOM.render(<App />, document.getElementById("root"));
      }
    });
  }


}

async function handleAuthenticated(authclient) {
  const identity = await authclient.getIdentity();
  const userPrincipal = identity._principal.toString();
  console.log(userPrincipal);
  ReactDOM.render(<App loggedInPrincipal={userPrincipal}/>, document.getElementById("root"));
}

init();


