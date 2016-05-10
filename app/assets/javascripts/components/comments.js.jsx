var Comments = React.createClass({
  getInitialState: function() {
    return {
      postComments: [],
      _mounted: true
    };
  },
  fetchComments: function() {
    $.ajax({
      url: '/posts/' + this.props.postID,
      dataType: 'JSON',
      method: 'get'
    }).done(function (response) {
      if (this.state['_mounted'] === true) {
        this.setState({
          postComments: response,
        });
      }
    }.bind(this));
  },
  componentDidMount: function() {
    this.interval = setInterval(this.fetchComments, 2000);
  },
  componentWillUnmount: function() {
    if (this.interval) {
      clearInterval(this.interval);
      this.interval = null;
    }
    this.setState({
      postComments: [],
      _mounted: false
    });
  },
  render: function() {
    return (
      <div>
      {this.state.postComments.map(function(comment){
        return (
          <ul key={comment.id}>
            <li><p>{comment.body}</p>
            <p>by: {comment.user.username}</p>
            <p><a href={'/users/' + comment.user.id}>Profile</a></p></li>
          </ul>
        );
      })}
      </div>
    );
  }
});
