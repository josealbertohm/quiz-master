angular.module('appServices')
.factory('QuestionService', ['$http'], function($http) {
    return {
        getQuestions: function() {
            var params = {}
            $http.get('http://localhost:3000/api/v1/questions')
            .success(function (data, status, headers, config) {
                console.log(JSON.stringify(data));
                return data;
            })
            .error(function (data, status, headers, config) {
                console.log("Error getting questions data!");
                return null;
            });
        }
    }
});