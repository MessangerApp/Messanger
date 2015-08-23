"use strict"

angular.module('messangerApp').controller('ConversationsCtrl', ['$scope', '$auth', function($scope, $auth){
  client.subscribe('/conversations', function(payload) {
    //$scope.conversations = payload.conversations;
    console.log(payload);
  });
}]);
