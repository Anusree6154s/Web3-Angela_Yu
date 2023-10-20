# Errors #


1. `Cannot write file '/home/anu6154s/ic-projects/6. opend-starting/opend/src/declarations/nft/index.js' because it would overwrite input file.`
    - Add following to tsconfig.jon file
        ````
         "exclude": [ 
        "src/declarations/**/*.did.js",
        "src/declarations/**/index.js"
        ],
        ````

  2. `[webpack-cli] TypeError: cli.isMultipleCompiler is not a function at Command`
   
     - update  "webpack-cli": "4.10.0" in dependencies or higher version

  3. `for web3 related projects`
    
        - Internet Computer Website assistance AI Bot is very helpful for errors

  4. `couldnt find did.js file`
     - changed scripts in package.json to this
        ``` "scripts": {
        "build": "webpack",
        "start": "webpack serve --mode development --env development",
        "prebuild": "dfx generate",
        "deploy:local": "dfx deploy --network=local",
        "deploy:ic": "dfx deploy --network=ic"
         },
        ```

5. `zone.identifier issue`

    - in ubuntu
        >find . -name "*Zone.Identifier" -type f -delete 

6. `Code: 504 (Gateway Timeout)`
    ```
    index.js:205 Uncaught (in promise) Error: Server returned an error:
    Code: 504 (Gateway Timeout)
    ```
    - try re-installing webpack-cli 4.10.0 again.

7. `css not being applied?`
    - paste following in index.jsx.
        >import "../assets/main.css"; 
    - still not working? refer https://internetcomputer.org/docs/current/developer-docs/frontend/add-stylesheet thoroughly

8. ` ingress_expiry not within expeted range`
    - in ubuntu 
        >sudo hwclock -s
    - or
        >sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
9.  `Connection refused (os error 111)`
    ```ERROR icx_proxy_dev::proxy: Internal Error during request:
    error trying to connect: tcp connect error: Connection refused (os error 111)
    2023-10-18T12:33:34.485630Z ERROR tower_http::trace::on_failure: response failed classification=Status code: 500 Internal Server Error latency=0 ms```
        
10. `Bad request (500)`

11. `Error: Failed to get frontend address.os error 98`
    ```
    Error: Failed to get frontend address.
    Caused by: Failed to get frontend address.
      Failed to find reusable socket address
        Failed to set socket of tcp builder to 127.0.0.1:4943.
          Address already in use (os error 98)
    ```
    - This error message indicates that the port 4943 on your local machine is already in use by another process. This can happen if you have a local canister execution environment running in the background or in a separate terminal that was not properly terminated.

        1. To see which process is listening to the 4943 port if you are using the default binding to localhost:
            >lsof -i tcp:4943
        2. Run the following command to terminate any orphan processes:
            >killall dfx replica  
        3. If you get 
            ```
            dfx: no process found
            replica: no process found
            ``` 
            and `COMMAND` is `icx-proxy`, you can try to kill it using the kill command with the `PID (Process ID)` that you got from the `lsof` command. Suppose your PID is `16471`, then:
            >kill -9 **16471**
        4. Close the current terminal and open a new terminal window.
        5. In the new terminal, run the following command to run the local canister execution environment in a clean state:
            >dfx start --clean --background  

    - For more information, you can refer to the [Internet Computer Troubleshooting Guide](https://internetcomputer.org/docs/current/developer-docs/backend/troubleshooting).


12. `500 (Internal Server Error)`

13. `Uncaught (in promise) TypeError`
    ```
    Uncaught (in promise) TypeError: _declarations_opend__WEBPACK_IMPORTED_MODULE_5__.opend.getListedNFTs is not a function
    at getNFTs (Header.jsx:16:41)
    ```
    - comes after you change the backend even after deployment
    - need to restart pc and the whole project (dont know why), but works!
    - only dfx start --clean doesn't help
        
14. `WebSocket connection to 'ws://localhost:8080/ws' failed`

    ```
    WebSocketClient.js:13 WebSocket connection to 'ws://localhost:8080/ws' failed: 
    WebSocketClient @ WebSocketClient.js:13
    initSocket @ socket.js:27
    (anonymous) @ socket.js:51
    index.js:493 [webpack-dev-server] Event {isTrusted: true, type: 'error', target: WebSocket, currentTarget: WebSocket, eventPhase: 2, …}
    ```
    - dfx start is not run

15. `[webpack-cli] Failed to load '/home/anu6154s/ic-projects/6. opend-starting/opend/webpack.config.js' config`
    ```
    [webpack-cli] Failed to load '/home/anu6154s/ic-projects/6. opend-starting/opend/webpack.config.js' config
    [webpack-cli] TypeError: Cannot convert undefined or null to object
    at Function.entries (<anonymous>)
    at initCanisterEnv (/home/anu6154s/ic-projects/6. opend-starting/opend/webpack.config.js:30:17)
    at Object.<anonymous> (/home/anu6154s/ic-projects/6. opend-starting/opend/webpack.config.js:37:30)
    at Module._compile (node:internal/modules/cjs/loader:1198:14)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1252:10)
    at Module.load (node:internal/modules/cjs/loader:1076:32)
    at Function.Module._load (node:internal/modules/cjs/loader:911:12)
    at Module.require (node:internal/modules/cjs/loader:1100:19)
    at require (node:internal/modules/cjs/helpers:119:18)
    at WebpackCLI.tryRequireThenImport (/home/anu6154s/ic-projects/6. opend-starting/opend/node_modules/webpack-cli/lib/webpack-cli.js:204:22)
    ```
    - dfx deploy or equivalent deployment is not run before npm start



16. `Uncaught (in promise) Error: Impossible to convert undefined to Principal.`
    ```
    index.js:29 Uncaught (in promise) Error: Impossible to convert undefined to Principal.
    at Principal.from (index.js:29:1)
    at caller (actor.js:153:34)
    at CanisterActor.handler [as getOwnedNFTs] (actor.js:195:1)
    at getNFTs (Header.jsx:13:39)
    at Header.jsx:21:1
    at invokePassiveEffectCreate (react-dom.development.js:23487:1)
    at HTMLUnknownElement.callCallback (react-dom.development.js:3945:1)
    at Object.invokeGuardedCallbackDev (react-dom.development.js:3994:1)
    at invokeGuardedCallback (react-dom.development.js:4056:1)
    at flushPassiveEffectsImpl (react-dom.development.js:23574:1)
    ```
    - restart the laptop and the project completely (but idk what solved it!)
    - only dfx start --clean doesn't help

17. `Invalid Principal Argument Error`
![Invalid Principal Argument Error](/Errors%20Images/Screenshot%202023-10-20%20154850.png)
    
    - in Minter.jsx, remove toText() from 
    ```
         return (
          <div className="minter-container">
            <h3 className="Typography-root makeStyles-title-99 Typography-h3 form-Typography-gutterBottom">
              Minted!
            </h3>
            <div className="horizontal-center">
              <Item id={nftPrincipal} />
            </div>
          </div>
        );
    ```
18. `IC0503: Canister bd3sg-teaaa-aaaaa-qaaba-cai trapped explicitly`
    ```
    Uncaught (in promise) Error: Call failed: Canister: bd3sg-teaaa-aaaaa-qaaba-cai Method: getOriginalOwner (query) 
    "Status": "rejected" 
    "Code": "CanisterError" 
    "Message": "IC0503: Canister bd3sg-teaaa-aaaaa-qaaba-cai trapped explicitly: RTS error: blob_of_principal: principal too short" 
    
    at caller (actor.js:158:1) at async loadNFT (Item.jsx:49:1) 
    ```
    - `getOriginalOwner` function is returning an empty string as a Principal when there's no listing found for the given id, which is not a valid Principal. You should return a valid Principal instead. For example, you could use the management canister’s Principal `"aaaaa-aa"` or the anonymous Principal `"2vxsx-fae"`, but you can use any valid principal you like.
        ```
        public query func getOriginalOwner(id : Principal) : async Principal {
          var listing : Listing = switch (mapOfListings.get(id)) {
            case null return Principal.fromText("aaaaa-aa"); // or any other valid Principal
            case (?result) result;
          };
          return listing.itemOwner;
        };
        ```

    - Refer  [forum discussion](https://forum.dfinity.org//t/16439) for more details.

19. `dfx version related issues`
    - remove dfx version from dfx.json file completely. the project will adjust automatically

20. `Failed to install wasm module to canister 'nft'`
    ```
    Error: Failed while trying to deploy canisters.
        Caused by: Failed while trying to deploy canisters.
          Failed while trying to install all canisters.
            Failed to install wasm module to canister 'nft'.
              Failed during wasm installation call: The replica returned a replica error: reject code DestinationInvalid, reject message Canister bkyz2-fmaaa-aaaaa-qaaaq-cai not found, error code Some("IC0301")
    ```
    - dfx start related issue.
    - try dfx start --clean. still not working, then delete dist folders and try again.
