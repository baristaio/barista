"use strict";

import 'babel-polyfill';

const espresso = require('@baristaio/espresso');

import { routes } from './routes';

const PORT = process.env.PORT || 80;
console.log('Port =>', PORT);

const localServiceDescriptor = {
    barista: '',
    port: PORT,
    name: 'My Super Service',
    description: 'the test service',
    routes: routes
};

const service = espresso.getService(localServiceDescriptor);
const stop = service.start();

// // stop the service after 1 minute
// setTimeout( ()=> {
//     service.stop('Time expired');
// }, 60* 1000*10);


