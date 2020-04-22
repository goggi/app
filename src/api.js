import { SDK } from '@directus/sdk-js/dist/esm/index.js';

const path = window.location.pathname;
const parts = path.split('/');
const adminIndex = parts.indexOf('admin');
let apiRootPath = parts.slice(0, adminIndex).join('/') + '/';
//apiRootPath = apiRootPath + 'api/';

const client = new SDK({
	mode: 'cookie',
	url: apiRootPath
});

export default client;
