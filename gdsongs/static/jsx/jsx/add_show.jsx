var Venue = React.createClass({
	render: function() {
		var choices = COUNTRIES.map(function(country) {
			return(<option value={country}>{country}</option>);
		});
	
		return(
			<div className="col-lg-12 form-group">
				<label htmlFor="show-date">Choose a venue</label>
				<div className="form-inline">
					<select id="country-select" className="form-control" name="country">
						{choices}
					</select>
					<select id="state-select" className="form-control" name="state" />
					<select id="city-select" className="form-control" name="city" />
					<select id="venue-select" className="form-control" name="venue" />
					<button id="add-venue" className="btn btn-std pull-right">Add New Venue</button>
				</div>
			</div>
		);
}});

React.render(<Venue />, document.getElementById('add-show-component'));

