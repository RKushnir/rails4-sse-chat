$(document).ready ->
  setTimeout ->
    source = new EventSource(window.location.pathname + '/messages')
    source.addEventListener 'newMessage', (e) ->
      message = JSON.parse(e.data).message

      console.log message

      $("<li>").attr
        id: "message_" + message.id
        class: "message"
      .text("#{message.time} #{message.author_email} > #{message.body}")
      .appendTo("#messages")
