factoriesModule = angular.module('Locale.factories', [])

factoriesModule.factory "Post", ["$resource", ($resource) ->
  $resource("/posts/:id", {id: "@id"},{
    update: {method: "PUT"}
  })
]
