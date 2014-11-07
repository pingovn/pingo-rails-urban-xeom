angular.module('xeom').directive( 'xeomDirective1' ,['driverSrv', (driverService) ->
  {
    templateUrl: '/driver.html',
    restrict: 'E',
    link: ($scope, $element, $attrs) ->
      $scope.driver = {}
      $scope.loadDriver = () ->
        getDriverPromise = driverService.getDriverInfo($attrs.driverId)
        getDriverPromise.then(
          (data) ->
            $scope.driver = data

        ,
          (reason) ->
            alert(reason)
        )
  }
])