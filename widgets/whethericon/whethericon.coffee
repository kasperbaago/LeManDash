class Dashing.Whethericon extends Dashing.Widget

  whetherIcon = null;

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    icon = data.data.icon;
    icon = "." + icon;

    temp = data.data.temperature;
    temp = (temp - 32) * 5/9;
    temp = Math.round(temp);
    @set('degrees', temp);

    $(@node).find('.whetherstatusShow').removeClass('whetherstatusShow');
    $(@node).find(icon).addClass('whetherstatusShow');
