angular.module('xeom').directive( 'xeomDirective1' ,['driverSrv', (driverService) ->
  {
    template: '<div>Directive1</div>',
    restrict: 'E',
    link: ($scope, $element, $attrs) ->
      $scope.loadDriver = () ->
        driverService.getDriverInfo($attrs.driverId)
  }
])