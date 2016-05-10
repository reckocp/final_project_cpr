var UserSearch = React.createClass({

    getInitialState: function(){
      return {
        allUsers: [],
        filteredUsers: [],
        search: ""
      };
    },

    filterList: function(e){
       var searchReturn = this.state.allUsers.filter(function (user) {
         return (user.username.toLowerCase().indexOf(e.target.value.toLowerCase()) !== -1 ||
                 user.party.toLowerCase().indexOf(e.target.value.toLowerCase()) !== -1);
       });
       this.setState({
         filteredUsers: searchReturn,
         search: e.target.value
       });
     },


    componentDidMount: function () {
      $.ajax({
        url: '/users/',
        dataType: 'JSON',
        method: 'get'
      }).done(function (response) {
        this.setState({
          allUsers: response,
          filteredUsers: response
        });
      }.bind(this));
    },

    render: function() {
      return (
        <section>
          <div>
            <input className='form-control' type='text'
              onChange={this.filterList} value={this.state.search}
              placeholder='Who are you looking for?' />
          </div>
          {this.state.filteredUsers.map(function (user) {
            return (
              <div key={user.id} >
                <p><a href={'/users/' + user.id}> {user.username} </a></p>
                <p>{user.party}</p>
              </div>
            );
          })}
        </section>
      );
    },
});
