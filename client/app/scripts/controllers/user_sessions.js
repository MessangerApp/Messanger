// client/app/scripts/controllers/user_sessions.js

'use strict';

/**
 * @ngdoc function
 * @name messangerApp.controller:UserSessionsCtrl
 * @description
 * # UserSessionsCtrl
 * Controller of the messangerApp
 */
angular.module('messangerApp')
  .controller('UserSessionsCtrl', ['$scope', function ($scope) {
    $scope.$on('auth:login-error', function(ev, reason){
      $scope.error = reason.errors[0];
    });
  }]);
