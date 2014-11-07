class DriverService
  constructor: ($http, $q) ->
    @http = $http
    @q = $q
    #nothing

  getDriverInfo: (id) =>
    defer = @q.defer()
    @http.get('drivers/'+id + '.json').success(
      (responseData) ->
        console.info(responseData)
        defer.resolve(responseData)
    ).error((responseData, status) ->
        defer.reject(responseData.error)
    )
    defer.promise


angular.module('xeom').service('driverSrv', ['$http', '$q', DriverService ])