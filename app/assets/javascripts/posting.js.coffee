WDI = WDI || {}

WDI.app = angular.module("Poster", ["ngResource", 'WDI.factories'])

WDI.app.directive "ngFocus", ["$parse", ($parse) ->
  (scope, element, attr) ->
    fn = $parse(attr["ngFocus"])
    element.bind "focus", (event) ->
      scope.$apply ->
        fn scope,
          $event: event
]

@PostingCtrl = ["$scope", "Post", "$http", ($scope, Post, $http) ->
  $scope.posts = Post.query()

  $scope.addPost = ->
    $scope.newPost.lat = $scope.lat
    $scope.newPost.lng = $scope.lng
    post = Post.save($scope.newPost)
    $scope.posts.push(post)
    $scope.newPost = {}

  $scope.addComment = (post_id, text) ->
    console.log post_id
    $http.post("/posts/" + post_id + "/comments", text).success ->
      $scope.posts = Post.query()
      # $http.get("/posts").success ->

  $scope.getGPS = () ->
    savePosition = (position) ->
      $scope.lat = position.coords.latitude
      $scope.lng = position.coords.longitude

      console.log position.coords.latitude
      console.log position.coords.longitude
      cookie_val = position.coords.latitude + "|" + position.coords.longitude
      document.cookie = "lat_lng_post=" + escape(cookie_val)

    if navigator.geolocation
      navigator.geolocation.getCurrentPosition savePosition
    else
      alert "Geolocation is not supported by this browser."

  $scope.noPosts = () ->
    $scope.posts.length == 0   
]

@CommentingCtrl = ["$scope", "Comment", "$http", ($scope, Comment, $http) ->
  # $scope.comments = Comment.query({post_id: @post_id, id: @id})

  # $scope.addComment = (post_id, text) ->
  #   console.log post_id
  #   $http.post("/posts/" + post_id + "/comments", text).success ->
  #     console.log "success!"
  #     # $http.get("/posts").success ->
  #     #   console.log "good"
]
