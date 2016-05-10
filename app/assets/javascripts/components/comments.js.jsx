var Comments = React.createClass({
  getInitialState: function() {
    return {
      comments: []
    };
  },
  tick: function() {
    var that = this;
    $.ajax({
      url: '/posts/' + this.props.postID + '/comments.json',
      dataType: 'JSON',
      method: 'get'
    }).done(function (response) {
      this.setState({
        comments: response,
      });
    }.bind(this));
  },
  componentDidMount: function() {
    this.interval = setInterval(this.tick, 1000);
  },
  componentWillUnmount: function() {
    clearInterval(this.interval);
  },
  render: function() {
    return (
      <div>
      {this.state.comments.map(function(comment){
        {console.log(comment.body)}
          return (
            <Comments
              key={comment.id}
              username={comment.user.username}
              body={comment.body}
              />
          );
      })}
      </div>
    );
  }
});
