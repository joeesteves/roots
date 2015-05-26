angular.module('rtcajas', ['ngCookies',
	'sesion', 'cajas']).config(["$httpProvider", function($httpProvider) {
		$httpProvider.defaults.withCredentials = true }]);