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
                 user.city.toLowerCase().indexOf(e.target.value.toLowerCase()) !== -1 ||
                 user.state.toLowerCase().indexOf(e.target.value.toLowerCase()) !== -1 ||
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
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th><strong>Username</strong></th>
                  <th><strong>City</strong></th>
                  <th><strong>State</strong></th>
                  <th><strong>Political Affiliation</strong></th>
                </tr>
              </thead>
              <tbody>
                {this.state.filteredUsers.map(function (user) {
                  return (
                    <tr key={user.id} >
                      <td><a href={'/users/' + user.id}> {user.username} </a></td>
                      <td>{user.city}</td>
                      <td>{user.state}</td>
                      <td>{user.party}</td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </section>
      );
    },
});
