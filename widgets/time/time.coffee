class Dashing.Time extends Dashing.Widget
  h = 0;
  m = 0;
  s = 0;

  ready: ->
    # This is fired when the widget is done being rendered
    setInterval(@updateClock, 1000);

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    data = JSON.parse(data.data);
    console.log(data);

    timeData =  data[0][10].split(":");

    h = timeData[0];
    m = timeData[1];
    s = timeData[2];

  updateClock: =>
    if h <= 0
      s--
    else
      s++;

    if s < 0
      s = 59
      m--;

    if s > 59
      s = 0;
      m++;


    if m < 0
      m = 59
      h--

    if m > 59
      m = 0;
      h++

    if h > 23
      h = 0

    @set('time', h + ":" + m + ":" + s);
    h;

  formatTime: (i) ->
    if i < 10 then "0" + i else i

