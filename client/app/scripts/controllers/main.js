'use strict';

/**
 * @ngdoc function
 * @name messangerApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the messangerApp
 */
angular.module('messangerApp')
  .controller('MainCtrl', function () {
    this.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];

    var dispatcher = new WebSocketRails('localhost:3000/websocket');

    $scope.hello = function () {
      dispatcher.trigger('hello_act');
    };
  });
