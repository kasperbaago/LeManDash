class Dashing.Flag extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.

    data = JSON.parse(data.data);
    flagStatus = data[0][1];
    console.log(flagStatus);
    flags = ['', 'yellowFlagStatus', 'greenFlagStatus', 'redFlagStatus', 'chkFlagStatus'];

    if data[0][2] == "1"
      flagStatus = "safetyCarStatus";
     else
      flagstatus = flags[flagStatus];
    $(@node).find('.flag').attr('data-flagStatus', flagStatus);