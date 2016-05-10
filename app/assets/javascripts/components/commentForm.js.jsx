
var CommentForm = React.createClass({
  propTypes: {
    postID: React.PropTypes.number,
  },

  getInitialState: function () {
    return {
      commentText: ''
    };
  },
  handleChange: function (event) {
    this.setState({
      commentText: event.target.value
    });
  },

  handlePostComment: function () {
    var that = this;
    $.ajax({
      method: "POST",
      url: '/posts/' + this.props.postID + '/comments.json',
      data: {
        comment: {
          body: this.state.commentText,
          user_id: this.props.userID
        }
      }
    }).done(function(response){
      that.setState({
        commentText: ''
      });
    });
  },

  render: function(){
    return (
      <div>
        <label><p>New Comment:</p>
          <textarea row={40} cols={40}
                 className="form-control-100"
                 placeholder="Type here.."
                 value={this.state.commentText}
                 onChange={this.handleChange}/>
        </label><br/>
        <label>
          <input type="button"
                 className="btn btn-primary"
                 value="Post Comment"
                 onClick={this.handlePostComment} />
        </label>
      </div>
    );
  }
});
