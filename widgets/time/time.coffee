class Dashing.Time extends Dashing.Widget
  h = 0;
  m = 0;
  s = 0;
  oldChecksum = 0;

  ready: ->
    # This is fired when the widget is done being rendered
    setInterval(@updateClock, 1000);

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.

    if data.md5 != oldChecksum
      data = JSON.parse(data.data);
      timeData =  data[0][10].split(":");
      console.log(data);

      h = timeData[0].trim();
      m = timeData[1].trim();
      s = timeData[2].trim();
      oldChecksum = data.md5

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

    s = @formatTime(s);
    m = @formatTime(m);

    @set('time', h + ":" + m + ":" + s);

  formatTime: (i) ->
    if i.toString().length < 2 then "0" + i else i

