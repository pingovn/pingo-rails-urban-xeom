class DriverService
  constructor: ($http, $q) ->
    @http = $http
    @q = $q
    #nothing

  getDriverInfo: (id) =>
    @http.get('drivers/'+id + '.json').success(
      (responseData) ->
        console.info(responseData)
    ).error((responseData, status) ->
        console.info(responseData)
        console.info(status)
    )


angular.module('xeom').service('driverSrv', ['$http', '$q', DriverService ])