angular.module("petShelterApp")
  .directive "taglist",  () ->
    {
      restrict: "E"
      scope: {
        tags: "=tags"
      }
    templateUrl: '/components/taglist/tags.html'
    link : (scope) ->
      scope.addTag = (tag) ->
        if tag?.length and (scope.tags.indexOf(tag) == -1)
          scope.tags.push tag;
        scope.currentTag = '';

      scope.removeTag = (tagIndex) ->
        scope.tags.splice tagIndex, 1;
    }

