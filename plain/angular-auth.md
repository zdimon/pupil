##Angular authorization

https://medium.com/opinionated-angularjs/techniques-for-authentication-in-angularjs-applications-7bbf0346acec#.4wxiawhk6


https://www.sitepoint.com/implementing-authentication-angular-applications/



    <form name="loginForm" ng-controller="LoginController"
          ng-submit="login(credentials)" novalidate>
      <label for="username">Username:</label>
      <input type="text" id="username"
             ng-model="credentials.username">
      <label for="password">Password:</label>
      <input type="password" id="password"
             ng-model="credentials.password">
      <button type="submit">Login</button>
    </form>


Note that we’re passing the credentials as an argument rather than relying on $scope.credentials, this makes the function easier to unit-test and avoids coupling between the function and it’s surrounding scope. 


    .controller('LoginController', function ($scope, $rootScope, AUTH_EVENTS, AuthService) {
      $scope.credentials = {
        username: '',
        password: ''
      };
      $scope.login = function (credentials) {
        AuthService.login(credentials).then(function (user) {
          $rootScope.$broadcast(AUTH_EVENTS.loginSuccess);
          $scope.setCurrentUser(user);
        }, function () {
          $rootScope.$broadcast(AUTH_EVENTS.loginFailed);
        });
      };
    })


###Constant

    .constant('AUTH_EVENTS', {
      loginSuccess: 'auth-login-success',
      loginFailed: 'auth-login-failed',
      logoutSuccess: 'auth-logout-success',
      sessionTimeout: 'auth-session-timeout',
      notAuthenticated: 'auth-not-authenticated',
      notAuthorized: 'auth-not-authorized'
    })



A nice thing about constants is that they can be injected like services, which makes them easy to mock in your unit tests. It also allows you to easily rename them (change the values) later without having to change a bunch of files. The same trick is used for user roles:

    .constant('USER_ROLES', {
      all: '*',
      admin: 'admin',
      editor: 'editor',
      guest: 'guest'
    })




