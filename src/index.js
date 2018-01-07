"use strict";

import 'babel-polyfill';

const espresso = require('espresso');

import { routes } from './routes';


const localServiceDescriptor = {
    barista: '',
    port: 3000,
    name: 'My Super Service',
    description: 'the test service',
    routes: routes,
    env: 'local'
};

const service = espresso.getService(localServiceDescriptor);
const stop = service.start();

// stop the service after 1 minute
setTimeout( ()=> {
    service.stop('Time expired');
}, 60* 1000);


