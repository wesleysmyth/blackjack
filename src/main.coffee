$(->
  window.game = new Game();
  new AppView(model: window.game).$el.appendTo 'body'
);

