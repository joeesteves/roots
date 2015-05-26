app = angular.module('sesion', []);
app.directive('sesion', function(){
	return {
		restrict: 'E',
		templateUrl: 'sesion.html',
		controller: ['$rootScope','$scope', '$http', '$cookies', function($rootScope, $scope, $http, $cookies){
			$rootScope.get_cuentas_egresos = function() {
				$http.get('http://rba.herokuapp.com/api/rba/cajas/egresos').
				success(function(data, status, headers, config) {
					$rootScope.cuentas_egresos = data;
					$rootScope.velo = false;
				});
			};
			$rootScope.get_cuenta_caja = function() {
				$http.get('http://rba.herokuapp.com/api/rba/cajas/caja').
				success(function(data, status, headers, config) {
					$rootScope.cuenta_caja = data;
					$rootScope.tiene_saldo 
				});
			};	
			if ($cookies.usuario_nombre) {
				$rootScope.logueado=true;
				$rootScope.get_cuenta_caja();
				$rootScope.get_cuentas_egresos();
				$rootScope.velo = true;
			};
			$scope.log_in = function(){
				$http.post('http://rba.herokuapp.com/api/rba/sesiones', {usuario: $scope.usuario, password: $scope.password, empresagrupo: 1}, {withCredentials: true}).
				success(function(data, status, headers, config) {
					$rootScope.velo = true;
					$rootScope.logueado=true;
					$rootScope.get_cuenta_caja();
					$rootScope.get_cuentas_egresos();

				}).
				error(function(data, status, headers, config) {
					alert("fallo");
				});
			};
			$scope.log_out = function(){
				$http.get('http://rba.herokuapp.com/api/rba/sesiones/salir').
				success(function(data, status, headers, config) {
					$rootScope.logueado=false
				}).
				error(function(data, status, headers, config) {
					alert("fallo");
				});
			};
		}]
	};
});