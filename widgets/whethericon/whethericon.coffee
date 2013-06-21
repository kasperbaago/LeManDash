class Dashing.Whethericon extends Dashing.Widget

  whetherIcon = null;

  ready: ->
    # This is fired when the widget is done being rendered
  whetherIcon = $(@node).find('#whetherIcon');

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    data = JSON.parse(data.data);
    icon = data.currently.icon;

    $(whetherIcon).attr('class', '');
    $(whetherIcon).addClass(icon);
