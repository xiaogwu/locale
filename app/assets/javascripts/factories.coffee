factoriesModule = angular.module('WDI.factories', [])

factoriesModule.factory "Post", ["$resource", ($resource) ->
  $resource("/posts/:id", {id: "@id"},{
    update: {method: "PUT"}
  })
]

factoriesModule.factory "Comment", ["$resource", ($resource) ->
  $resource("/posts/:id/comments/:id", {id: "@id"},{
    update: {method: "PUT"}
  })
]
