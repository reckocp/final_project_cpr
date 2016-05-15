

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
            <div key={comment.id}>
              <p><strong>{comment.body}</strong></p>
              <p>posted by <a href={'/users/' + comment.user.id}>{comment.user.username}</a></p>
            </div>
        );
      })}
      </div>
    );
  }
});
