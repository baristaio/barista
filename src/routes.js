import * as controller from './controller';

export const routes = [
    {
        path: '/hello',
        method: 'get',
        controller: controller.sayHelloController
    }
];