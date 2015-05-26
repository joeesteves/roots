app = angular.module('cajas', []);
app.directive('cajas', function(){
	return {
		restrict: 'E',
		templateUrl: 'cajas.html',
		controller: ['$rootScope','$scope', '$http', function($rootScope, $scope, $http ){
			$scope.reset = function(){
				angular.forEach($rootScope.cuentas_egresos, function(cuenta) {
					cuenta.activo = false;
				});
			};
			$scope.vaciar_formulario = function() {
				 $scope.importe = undefined;
				 $scope.desc = undefined;
			};
			$scope.apretar_boton = function(cuenta) {
				if (cuenta.activo == true & $scope.importe != undefined) {
					obj = {'caja_id': $rootScope.cuenta_caja.id, 'cuenta_id': cuenta.id, 'importe': $scope.importe, 'desc': $scope.desc};
					$http.post("http://rba.herokuapp.com/api/rba/cajas", obj).
					success(function() {
						$rootScope.get_cuenta_caja();
						$scope.reset();
						$scope.vaciar_formulario();
					}).
					error(function() {
						alert("Problema Interno");
					});
				};
				$scope.reset();
				cuenta.activo = !cuenta.activo
			};

		}]
	};
});
