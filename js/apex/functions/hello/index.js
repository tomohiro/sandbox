exports.handle = function(event, context) {
  context.succeed('Hello, ' + event.name + '!')
}
