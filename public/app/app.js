var app = angular.module('QuizMaster', 
['ui.materialize']
);
app.factory('dataService', function($http) {
    var getData = function() {
            return $http({
                method: 'GET',
                url: 'http://localhost:3000/api/v1/questions'})
            .then(function (response) {
                // console.log(JSON.stringify(response.data));
                return response.data;
            });
    };

    return {getData: getData};
});

app.controller('MainCtrl', [
'$scope','dataService',
    function($scope, dataService){
        $scope.questions = {};
        $scope.isComplete = false;
        $scope.answer = {
            value: '',
            goodAnswers: 0,
            isOnGoing: false
        };

        $scope.getData = function() {
            var httpPromise = dataService.getData();
            httpPromise.then(function(result) {
                $scope.questions = result;
                $scope.currentQuestion = 0;
                $scope.totalQuestions = $scope.questions.length;
                $scope.isComplete = true;
            });
        }
        $scope.getData();

        $scope.validateAnswer = function() {
            if ($scope.answer.value === $scope.questions[$scope.currentQuestion].answer) {
                Materialize.toast('Good answer!', 4000);
                $scope.currentQuestion++;
                $scope.answer.goodAnswers++;
            } else {
                Materialize.toast('Wrong answer!', 4000);
            }
            $scope.answer = {
                value: ''
            };
            $scope.answer.isOnGoing = (($scope.currentQuestion + 1) === $scope.totalQuestions);
        }

        $scope.retryQuiz = function() {
            $scope.answer = {
                value: '',
                goodAnswers: 0,
                isOnGoing: false
            };
            $scope.currentQuestion = 0;
            $scope.getData();
            $scope.isComplete = true;
        }     
    }]
);