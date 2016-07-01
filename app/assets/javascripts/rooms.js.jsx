// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Messages = React.createClass({
  render: function(){
    return(
      <h1>Hey</h1>
    )
  }
})

var reactRun = function(){
  ReactDOM.render(<Messages/>,document.getElementById('messages'));
};