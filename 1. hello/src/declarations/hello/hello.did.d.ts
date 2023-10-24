import type { Principal } from '@dfinity/principal';

//declare an interface that defines a contract or shape for an object. In this case, it defines an interface called `_SERVICE`.
export interface _SERVICE { 'greet' : (arg_0: string) => Promise<string> }
